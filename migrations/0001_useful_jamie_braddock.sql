-- Enable pgvector (run once)
CREATE EXTENSION IF NOT EXISTS vector;

-- Create documents table
CREATE TABLE IF NOT EXISTS documents (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  embedding VECTOR(1536)
);

-- Drop old index if it exists
DROP INDEX IF EXISTS "embeddingIndex";

-- Create vector index (ivfflat is safest on Neon)
CREATE INDEX "embeddingIndex"
ON documents
USING ivfflat (embedding vector_cosine_ops);
