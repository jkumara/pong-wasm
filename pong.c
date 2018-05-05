#include <stdbool.h>

#define WIDTH 800
#define HEIGHT 600
#define WALL_SIZE 16
#define LINE_WIDTH 8
#define PADDLE_WIDTH 16
#define PADDLE_HEIGHT 64
#define PADDLE_VELOCITY 400.0 /* px/s */
#define BALL_SIZE 16
#define BALL_INITIAL_VELOCITY 150.0 /* px/s */
#define BALL_VELOCITY_INCREMENT 25.0 /* px/s */
#define FONT_SIZE 64

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

typedef struct Ball {
  Rect sphere; /* ironic naming */
  Vec2 dir;
  float velocity;
} Ball;

extern void fillRect(int x, int y, int width, int height);
extern void clearRect(int x, int y, int width, int height);
extern void setFillStyle(int r, int g, int b);
extern void setStrokeStyle(int r, int g, int b);
extern void setLineWidth(int width);
extern void setLineDash(int dashLength, int spaceLength);
extern void drawLine(int x0, int y0, int x1, int y1);
extern void fillText(int text, int x, int y);
extern void setTextSize(int size);

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

bool isInBounds(Vec2 point, Rect box) {
  return point.x > box.x && point.x < (box.x + box.width) && point.y > box.y && point.y < (box.y + box.height);
}

bool doesCollide(Rect a, Rect b) {
  Vec2 corners[4] = {
    {a.x, a.y},
    {a.x + a.width, a.y},
    {a.x + a.width, a.y + a.height},
    {a.x, a.y + a.height}
  };

  for (int i = 0; i < 4; i++) {
    if (isInBounds(corners[i], b)) {
      return true;
    }
  }

  return false;
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

Ball ball = {
  {WIDTH/2 - BALL_SIZE/2, WALL_SIZE, BALL_SIZE, BALL_SIZE},
  {1, 1},
  BALL_INITIAL_VELOCITY
};

void movePlayer(Player *player, int direction, float delta) {
  int curY = (*player).paddle.y;
  float deltaY = (delta / 1000 * PADDLE_VELOCITY);
  int newY = curY + (int)deltaY * direction;
  (*player).paddle.y = clamp(newY, (*player).paddle.height, WALL_SIZE, HEIGHT - WALL_SIZE);
}

void moveBall(Ball *ball, float delta) {
  int curX = (*ball).sphere.x;
  int curY = (*ball).sphere.y;

  float deltaPos = delta / 1000 * (*ball).velocity;
  int newX = curX + (int)deltaPos * (*ball).dir.x;
  int newY = curY + (int)deltaPos * (*ball).dir.y;

  (*ball).sphere.x = newX;
  (*ball).sphere.y = newY;
}

void drawObject(Rect o) {
  setFill(white);
  fillRect(o.x, o.y, o.width, o.height);
}

void drawScores() {
  setTextSize(FONT_SIZE);
  fillText(player1.score, WIDTH/2 - FONT_SIZE * 1.5, FONT_SIZE*1.25);
  fillText(player2.score, WIDTH/2 + FONT_SIZE, FONT_SIZE*1.25);
}

void resetGame(Player *winner, Ball *ball, int xDir) {
  (*winner).score++;
  (*ball).sphere.x = WIDTH/2 - BALL_SIZE/2;
  (*ball).sphere.y = WALL_SIZE;
  (*ball).dir.x = xDir;
  (*ball).dir.y = 1;
  (*ball).velocity = BALL_INITIAL_VELOCITY;
}

void drawCourt() {
  setFill(black);
  fillRect(0, 0, WIDTH, HEIGHT);

  setFill(white);

  int length = sizeof(walls) / sizeof(Rect);
  for (int i = 0; i < length; i++) {
    drawObject(walls[i]);
  }

  setStroke(white);
  setLineDash(LINE_WIDTH, LINE_WIDTH);
  setLineWidth(LINE_WIDTH);
  drawLine(line.x, line.y, line.width, line.height);  
}

void checkCollisions(Ball *ball, int player1dir, int player2dir) {
  int length = sizeof(walls) / sizeof(Rect);
  for (int i = 0; i < length; i++) {
    if (doesCollide((*ball).sphere, walls[i])) {
      (*ball).dir.y = (*ball).dir.y * -1;
    }
  }

  bool collideWithPlayer1 = doesCollide((*ball).sphere, player1.paddle);
  bool collideWithPlayer2 = doesCollide((*ball).sphere, player2.paddle);

  if (collideWithPlayer1 || collideWithPlayer2) {
    (*ball).dir.x = (*ball).dir.x * -1;
    (*ball).velocity = (*ball).velocity + BALL_VELOCITY_INCREMENT;
    
    if (collideWithPlayer1 && (player1dir != 0)) {
      (*ball).dir.y = (*ball).dir.y * player1dir;
    }

    if (collideWithPlayer2 && (player2dir != 0)) {
      (*ball).dir.y = (*ball).dir.y * player2dir;
    }    
  }

  if ((*ball).sphere.x < 0) {
    resetGame(&player2, ball, 1);
  } else if (((*ball).sphere.x + (*ball).sphere.width) > WIDTH) {
    resetGame(&player1, ball, -1);
  }
}

void tick(float delta, int player1dir, int player2dir) {
  drawCourt();
  drawScores();
 
  checkCollisions(&ball, player1dir, player2dir);

  movePlayer(&player1, player1dir, delta);
  movePlayer(&player2, player2dir, delta);
  moveBall(&ball, delta);

  drawObject(ball.sphere);
  drawObject(player1.paddle);
  drawObject(player2.paddle);
}