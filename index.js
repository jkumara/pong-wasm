const memory = new WebAssembly.Memory({initial: 256, maximum: 256});

const importObject = {
  env: {
    abortStackOverflow: () => { throw new Error('overflow'); },
    table: new WebAssembly.Table({initial: 0, maximum: 0, element: 'anyfunc'}),
    tableBase: 0,
    memory: memory,
    memoryBase: 1024,
    STACKTOP: 0,
    STACK_MAX: memory.buffer.byteLength,
  }
};

(async () => {  
  const {instance} = await WebAssembly.instantiateStreaming(
    fetch('pong.wasm'),
    importObject
  );
  
  const {_pong} = instance.exports;
  window.utils = {pong: _pong};
})();