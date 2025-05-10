CREATE TABLE users (
  id UUID PRIMARY KEY,
  email TEXT UNIQUE,
  name TEXT,
  role TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE meetings (
  id UUID PRIMARY KEY,
  title TEXT,
  organizer_id UUID REFERENCES users(id),
  start_time TIMESTAMPTZ,
  end_time TIMESTAMPTZ,
  recording_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE participants (
  id UUID PRIMARY KEY,
  meeting_id UUID REFERENCES meetings(id),
  user_id UUID REFERENCES users(id),
  join_time TIMESTAMPTZ,
  leave_time TIMESTAMPTZ
);

CREATE TABLE transcripts (
  id UUID PRIMARY KEY,
  meeting_id UUID REFERENCES meetings(id),
  speaker TEXT,
  start_time FLOAT,
  end_time FLOAT,
  content TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE summaries (
  id UUID PRIMARY KEY,
  meeting_id UUID REFERENCES meetings(id),
  type TEXT,
  content TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE tasks (
  id UUID PRIMARY KEY,
  meeting_id UUID REFERENCES meetings(id),
  content TEXT,
  assignee_id UUID REFERENCES users(id),
  status TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
