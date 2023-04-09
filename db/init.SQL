CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  is_admin BOOLEAN DEFAULT FALSE,
  notification_settings JSONB
);

CREATE TABLE food_banks (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT NOT NULL
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  food_bank_id INTEGER NOT NULL REFERENCES food_banks(id),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE email_templates (
  id SERIAL PRIMARY KEY,
  subject TEXT NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE notifications ADD FOREIGN KEY (food_bank_id) REFERENCES food_banks(id);

ALTER TABLE notifications ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE notifications ADD FOREIGN KEY (email_template_id) REFERENCES email_templates(id);

ALTER TABLE users ADD FOREIGN KEY (notification_settings_id) REFERENCES notification_settings(id);
