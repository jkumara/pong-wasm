#define WASM_EXPORT __attribute__((visibility("default")))

int i = 0;

WASM_EXPORT
int pong() {
  i++;

  if (i % 2 == 0) {
    return 1;
  }
  else {
    return 0;
  }
}