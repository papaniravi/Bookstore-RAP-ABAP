-- =================================================================
-- Sample Data for Bookstore RAP Application
-- Execute these SQL statements in SAP SQL Console or SE16N
-- =================================================================

-- Step 1: Insert Genres (Value Help)
-- =================================================================
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fiction', 'Fictional stories');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Science', 'Science and technology');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Cooking', 'Cooking and recipes');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Fantasy', 'Fantasy and magic');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Hobby', 'Hobbies and crafts');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Adventure', 'Adventure stories');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Self-Help', 'Self-help and motivation');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Non-Fiction', 'Non-fictional content');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Art', 'Visual and creative arts');
INSERT INTO ZBOOK_GENRES VALUES ('100', 'Children', 'Children books');

-- Step 2: Insert Book Status (Value Help)
-- =================================================================
INSERT INTO ZBOOK_STATUS VALUES ('100', 'A', 'Available', 3);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'L', 'Low Stock', 2);
INSERT INTO ZBOOK_STATUS VALUES ('100', 'U', 'Unavailable', 1);

-- Step 3: Insert Sample Authors
-- =================================================================
INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'8F7CB3C19A524E638B7BFCF4E2A0D234',
  'John Smith',
  '20241231100000.0000000',
  'SYSTEM',
  '20241231100000.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'C2EE8F8A07BB4272BC4B9F6A52FB114D',
  'Jane Williams',
  '20241231100500.0000000',
  'SYSTEM',
  '20241231100500.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'A5D9EB734F7A49B29515FBC9F91CB9ED',
  'Robert Brown',
  '20241231101000.0000000',
  'SYSTEM',
  '20241231101000.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'FA33A1E1914144579B010F01DD7A2FF9',
  'Emily Davis',
  '20241231101500.0000000',
  'SYSTEM',
  '20241231101500.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_AUTHORS VALUES (
  '100',
  X'4FBD2DF0EDF54DF0BC3727FB07C36A1A',
  'Michael Johnson',
  '20241231102000.0000000',
  'SYSTEM',
  '20241231102000.0000000',
  'SYSTEM'
);

-- Step 4: Insert Sample Books
-- =================================================================

-- Book 1: The Silent Forest
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'577679157D3643C3A8751D5E711D536B',
  'The Silent Forest',
  X'8F7CB3C19A524E638B7BFCF4E2A0D234',
  'Fiction',
  '20180412',
  340,
  49.99,
  'USD',
  25,
  'A',
  '20250101090000.0000000',
  'SYSTEM',
  '20250101090000.0000000',
  'SYSTEM'
);

-- Book 2: A Brief History of Space
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'8B1D4B6D2C5F4C1CAC20E6A6E022F5B8',
  'A Brief History of Space',
  X'C2EE8F8A07BB4272BC4B9F6A52FB114D',
  'Science',
  '20210901',
  280,
  69.99,
  'USD',
  8,
  'L',
  '20250101090500.0000000',
  'SYSTEM',
  '20250101090500.0000000',
  'SYSTEM'
);

-- Book 3: Cooking with Fire
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'B3C97C1F2E824C5D9F6345DE1C72BB7D',
  'Cooking with Fire',
  X'A5D9EB734F7A49B29515FBC9F91CB9ED',
  'Cooking',
  '20200217',
  220,
  39.99,
  'USD',
  0,
  'U',
  '20250101091000.0000000',
  'SYSTEM',
  '20250101091000.0000000',
  'SYSTEM'
);

-- Book 4: Winds of the North
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'C4F874439B2D4B6EA1E1A65D6F47A6C5',
  'Winds of the North',
  X'FA33A1E1914144579B010F01DD7A2FF9',
  'Fantasy',
  '20191103',
  410,
  59.90,
  'USD',
  15,
  'A',
  '20250101091500.0000000',
  'SYSTEM',
  '20250101091500.0000000',
  'SYSTEM'
);

-- Book 5: Gardening for Beginners
INSERT INTO ZBOOK_BOOKS VALUES (
  '100',
  X'2F0E3A28290240BF9A19E0BFF621ADFB',
  'Gardening for Beginners',
  X'4FBD2DF0EDF54DF0BC3727FB07C36A1A',
  'Hobby',
  '20220622',
  180,
  34.50,
  'USD',
  5,
  'L',
  '20250101092000.0000000',
  'SYSTEM',
  '20250101092000.0000000',
  'SYSTEM'
);

-- Step 5: Insert Sample Chapters
-- =================================================================

-- Chapters for Book 1 (The Silent Forest)
INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'1A2B3C4D5E6F7A8B9C0D1E2F3A4B5C6D',
  X'577679157D3643C3A8751D5E711D536B',
  1,
  'The Beginning',
  25,
  '20250101100000.0000000',
  'SYSTEM',
  '20250101100000.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'2B3C4D5E6F7A8B9C0D1E2F3A4B5C6D7E',
  X'577679157D3643C3A8751D5E711D536B',
  2,
  'Into the Woods',
  30,
  '20250101100100.0000000',
  'SYSTEM',
  '20250101100100.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'3C4D5E6F7A8B9C0D1E2F3A4B5C6D7E8F',
  X'577679157D3643C3A8751D5E711D536B',
  3,
  'The Dark Path',
  35,
  '20250101100200.0000000',
  'SYSTEM',
  '20250101100200.0000000',
  'SYSTEM'
);

-- Chapters for Book 2 (A Brief History of Space)
INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'4D5E6F7A8B9C0D1E2F3A4B5C6D7E8F9A',
  X'8B1D4B6D2C5F4C1CAC20E6A6E022F5B8',
  1,
  'The Cosmos Begins',
  28,
  '20250101100300.0000000',
  'SYSTEM',
  '20250101100300.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'5E6F7A8B9C0D1E2F3A4B5C6D7E8F9A0B',
  X'8B1D4B6D2C5F4C1CAC20E6A6E022F5B8',
  2,
  'Stars and Galaxies',
  32,
  '20250101100400.0000000',
  'SYSTEM',
  '20250101100400.0000000',
  'SYSTEM'
);

-- Chapters for Book 4 (Winds of the North)
INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'6F7A8B9C0D1E2F3A4B5C6D7E8F9A0B1C',
  X'C4F874439B2D4B6EA1E1A65D6F47A6C5',
  1,
  'The Northern Kingdom',
  40,
  '20250101100500.0000000',
  'SYSTEM',
  '20250101100500.0000000',
  'SYSTEM'
);

INSERT INTO ZBOOK_CHAPTERS VALUES (
  '100',
  X'7A8B9C0D1E2F3A4B5C6D7E8F9A0B1C2D',
  X'C4F874439B2D4B6EA1E1A65D6F47A6C5',
  2,
  'The Quest Begins',
  38,
  '20250101100600.0000000',
  'SYSTEM',
  '20250101100600.0000000',
  'SYSTEM'
);

-- =================================================================
-- Verification Queries
-- =================================================================

-- Check data was inserted:
-- SELECT COUNT(*) FROM ZBOOK_GENRES;     -- Should return 10
-- SELECT COUNT(*) FROM ZBOOK_STATUS;     -- Should return 3
-- SELECT COUNT(*) FROM ZBOOK_AUTHORS;    -- Should return 5
-- SELECT COUNT(*) FROM ZBOOK_BOOKS;      -- Should return 5
-- SELECT COUNT(*) FROM ZBOOK_CHAPTERS;   -- Should return 8
