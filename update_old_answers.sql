-- Update existing answers without status to 'completed'
UPDATE interview_answers 
SET status = 'completed' 
WHERE status IS NULL;
