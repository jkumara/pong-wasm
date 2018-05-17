const DIR = {
  UP: -1,
  DOWN: 1,
  STILL: 0
}
const KEYS = {
  ARROW_UP: 38,
  ARROW_DOWN: 40,
  W: 87,
  S: 83
};
const KEY_CODES = Object.values(KEYS);

// Minimal keyboard "api"

class Keyboard {
  constructor() {
    this._keysDown = [];
    this._keydownHandler = (...args) => this._keyDown(...args);
    this._keyupHandler = (...args) => this._keyUp(...args);

    document.addEventListener('keydown', this._keydownHandler);    
    document.addEventListener('keyup', this._keyupHandler);
  }

  _keyDown({keyCode}) {
    if (KEY_CODES.includes(keyCode) && !this._keysDown.includes(keyCode)) {
      this._keysDown.push(keyCode);
    }
  }

  _keyUp({keyCode}) {
    const index = this._keysDown.indexOf(keyCode);
    if (index >= 0) {
      this._keysDown.splice(index, 1);
    }
  }

  isKeyDown(keyCode) {
    return this._keysDown.includes(keyCode);
  }

  unregister() {
    this._keysDown = [];
    document.removeEventListener('keydown', this._keydownHandler);
    document.removeEventListener('keyup', this._keyupHandler);
  }
}

// Canvas API-wrappers for WASM

const canvas = document.getElementById('canvas')
const ctx = canvas.getContext('2d');

const _setStrokeStyle = (r, g, b) => ctx.strokeStyle = `rgb(${r},${g},${b})`;
const _fillText = (text, x, y) => ctx.fillText(text, x, y);
const _setTextSize = size => ctx.font = `${size}px monospace`;
const _setFillStyle = (r, g, b) => ctx.fillStyle = `rgb(${r},${g},${b})`;
const _setLineWidth = width => ctx.lineWidth = width;
const _setLineDash = (dashLength, spaceLength) => ctx.setLineDash([dashLength, spaceLength]);
const _fillRect = (x, y, width, height) => ctx.fillRect(x, y, width, height);
const _clearRect = (x, y, width, height) => ctx.clearRect(x, y, width, height);
const _drawLine = (x0, y0, x1, y1) => {
  ctx.beginPath();
  ctx.moveTo(x0, y0);
  ctx.lineTo(x1, y1);
  ctx.stroke();
};
const _conlog = a => {
  console.log(a);
}

// EMSDK-related setup

const memory = new WebAssembly.Memory({initial: 256, maximum: 256});

const emsdkEnvironment = {
  abortStackOverflow: () => { throw new Error('overflow'); },
  table: new WebAssembly.Table({initial: 0, maximum: 0, element: 'anyfunc'}),
  tableBase: 0,
  memory: memory,
  memoryBase: 1024,
  STACKTOP: 0,
  STACK_MAX: memory.buffer.byteLength
};

// EMSDK-related setup

const init = async emsdkEnvironment => {
  const env = {
    ...emsdkEnvironment,
    _setStrokeStyle,
    _setFillStyle,
    _setLineWidth,
    _setLineDash,
    _fillRect,
    _clearRect,
    _drawLine,
    _conlog,
    _fillText,
    _setTextSize    
  };

  const {instance: {exports: pong}} = await WebAssembly.instantiateStreaming(
    fetch('pong.wasm'),
    {env}
  );

  const keyboard = new Keyboard();

  let previousTickTime = 0;

  const main = currentTickTime => {
    requestAnimationFrame(main);

    const delta = currentTickTime - previousTickTime;

    const player1dir =
      keyboard.isKeyDown(KEYS.W) ? DIR.UP :
      keyboard.isKeyDown(KEYS.S) ? DIR.DOWN :
      DIR.STILL;

    const player2dir =
      keyboard.isKeyDown(KEYS.ARROW_UP) ? DIR.UP :
      keyboard.isKeyDown(KEYS.ARROW_DOWN) ? DIR.DOWN :
      DIR.STILL;
    
    pong._tick(delta, player1dir, player2dir);
    previousTickTime = currentTickTime;
  };

  requestAnimationFrame(main);
};

init(emsdkEnvironment);