CREATE INDEX `post_id_created_at_idx` ON `comments` (`post_id`, `created_at` DESC);
CREATE INDEX `created_at_idx` ON `comments` (`created_at` DESC);
CREATE INDEX `created_at_idx` ON `posts` (`created_at` DESC);
