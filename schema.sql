CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE COLLATE NOCASE,
  salt TEXT NOT NULL,
  pass_hash TEXT NOT NULL,
  fails INTEGER NOT NULL DEFAULT 0,
  locked_until INTEGER NOT NULL DEFAULT 0,
  created INTEGER NOT NULL
);
CREATE TABLE sessions (
  token_hash TEXT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  expires INTEGER NOT NULL
);
CREATE TABLE scores (
  user_id INTEGER NOT NULL,
  board TEXT NOT NULL,
  value INTEGER NOT NULL,
  updated INTEGER NOT NULL,
  PRIMARY KEY (user_id, board)
);
CREATE INDEX scores_board ON scores (board, value);
