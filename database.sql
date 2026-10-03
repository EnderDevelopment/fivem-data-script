CREATE TABLE IF NOT EXISTS fivemscript_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    data TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO fivemscript_data (player_id, data) VALUES (1, 'default_data');