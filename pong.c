#define WIDTH 800
#define HEIGHT 600
#define WALL_SIZE 16
#define LINE_WIDTH 8
#define PADDLE_WIDTH 16
#define PADDLE_HEIGHT 64
#define PADDLE_VELOCITY 150.0 /* Velocity in pixels per second */
#define BALL_SIZE 16

typedef struct RGB {
  int r;
  int g;
  int b;
} RGB;

typedef struct Vec2 {
  float x;
  float y;
} Vec2;

typedef struct Rect {
  int x;
  int y;
  int width;
  int height;
} Rect;

typedef struct Player {
  Rect paddle;
  int score;  
} Player;

extern void fillRect(int x, int y, int width, int height);
extern void clearRect(int x, int y, int width, int height);
extern void setFillStyle(int r, int g, int b);
extern void setStrokeStyle(int r, int g, int b);
extern void setLineWidth(int width);
extern void setLineDash(int dashLength, int spaceLength);
extern void drawLine(int x0, int y0, int x1, int y1);
extern void conlog(int a);

void setFill(RGB color) {
  setFillStyle(color.r, color.g, color.b);
}

void setStroke(RGB color) {
  setStrokeStyle(color.r, color.g, color.b);
}

int clamp(int value, int valueOffset, int min, int max) {
  if (value < min) {
    return min;
  }

  return (value + valueOffset) > max ? max - valueOffset : value;
}

RGB white = {255, 255, 255};
RGB black = {0, 0, 0};

Rect walls[] = {
  {0, 0, WIDTH, WALL_SIZE},
  {0, HEIGHT - WALL_SIZE, WIDTH, WALL_SIZE}
};

Rect line = {WIDTH / 2, 0, WIDTH / 2, HEIGHT};

Player player1 = {
  {0, HEIGHT/2 - PADDLE_HEIGHT/2, PADDLE_WIDTH, PADDLE_HEIGHT},
  0
};

Player player2 = {
  {WIDTH - PADDLE_WIDTH, HEIGHT/2 - PADDLE_HEIGHT/2, PADDLE_WIDTH, PADDLE_HEIGHT},
  0
};

void movePlayer(Player *player, int direction, float delta) {
  int curY = (*player).paddle.y;
  float deltaY = (delta / 1000 * PADDLE_VELOCITY);
  int newY = curY + (int)deltaY * direction;
  (*player).paddle.y = clamp(newY, (*player).paddle.height, WALL_SIZE, HEIGHT - WALL_SIZE);
}

void drawPlayer(Player player) {
  setFill(white);
  Rect p = player.paddle;
  fillRect(p.x, p.y, p.width, p.height);
}

void drawCourt() {
  setFill(black);
  fillRect(0, 0, WIDTH, HEIGHT);

  setFill(white);
  int length = sizeof(walls) / sizeof(Rect);
  for (int i = 0; i < length; i++) {
    Rect r = walls[i];
    fillRect(r.x, r.y, r.width, r.height);
  }

  setStroke(white);
  setLineDash(LINE_WIDTH, LINE_WIDTH);
  setLineWidth(LINE_WIDTH);
  drawLine(line.x, line.y, line.width, line.height);  
}

void tick(float delta, int player1dir, int player2dir) {
  drawCourt();

  movePlayer(&player1, player1dir, delta);
  movePlayer(&player2, player2dir, delta);

  drawPlayer(player1);
  drawPlayer(player2);
}