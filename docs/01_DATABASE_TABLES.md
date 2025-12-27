# Step 1: Create Database Tables

Execute these in SE11 or ADT (ABAP Development Tools) in Eclipse.

## Table: ZBOOK_BOOKS
**Description**: Bookstore - Books

```abap
@EndUserText.label : 'Bookstore - Books'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zbook_books {
  key client      : abap.clnt not null;
  key id          : sysuuid_x16 not null;
  title           : abap.char(100);
  author_id       : sysuuid_x16;
  genre_code      : abap.char(20);
  published_at    : abap.dats;
  pages1          : abap.int4;
  price           : abap.dec(9,2);
  currency_code   : abap.cuky;
  stock           : abap.int4;
  status_code     : abap.char(1);
  created_at      : timestampl;
  created_by      : abap.char(12);
  modified_at     : timestampl;
  modified_by     : abap.char(12);
}
```

## Table: ZBOOK_AUTHORS
**Description**: Bookstore - Authors

```abap
@EndUserText.label : 'Bookstore - Authors'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zbook_authors {
  key client      : abap.clnt not null;
  key id          : sysuuid_x16 not null;
  name            : abap.char(100);
  created_at      : timestampl;
  created_by      : abap.char(12);
  modified_at     : timestampl;
  modified_by     : abap.char(12);
}
```

## Table: ZBOOK_CHAPTERS
**Description**: Bookstore - Chapters

```abap
@EndUserText.label : 'Bookstore - Chapters'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zbook_chapters {
  key client      : abap.clnt not null;
  key id          : sysuuid_x16 not null;
  book_id         : sysuuid_x16;
  number1         : abap.int4;
  title           : abap.char(100);
  pages1          : abap.int4;
  created_at      : timestampl;
  created_by      : abap.char(12);
  modified_at     : timestampl;
  modified_by     : abap.char(12);
}
```

## Table: ZBOOK_GENRES
**Description**: Bookstore - Genres (Value Help)

```abap
@EndUserText.label : 'Bookstore - Genres'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zbook_genres {
  key client      : abap.clnt not null;
  key code        : abap.char(20) not null;
  description     : abap.char(100);
}
```

## Table: ZBOOK_STATUS
**Description**: Bookstore - Book Status (Value Help)

```abap
@EndUserText.label : 'Bookstore - Book Status'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zbook_status {
  key client      : abap.clnt not null;
  key code        : abap.char(1) not null;
  display_text    : abap.char(40);
  criticality     : abap.int4;
}
```

## Foreign Keys

After creating tables, add foreign keys:

### ZBOOK_BOOKS Foreign Keys:
1. **AUTHOR_ID** → ZBOOK_AUTHORS-ID
2. **GENRE_CODE** → ZBOOK_GENRES-CODE
3. **STATUS_CODE** → ZBOOK_STATUS-CODE

### ZBOOK_CHAPTERS Foreign Keys:
1. **BOOK_ID** → ZBOOK_BOOKS-ID

---

## Initial Data for Value Help Tables

### ZBOOK_GENRES Data:
```
CODE          | DESCRIPTION
--------------|--------------------------
Fiction       | Fictional stories
Science       | Science and technology
Cooking       | Cooking and recipes
Fantasy       | Fantasy and magic
Hobby         | Hobbies and crafts
Adventure     | Adventure stories
Self-Help     | Self-help and motivation
Non-Fiction   | Non-fictional content
Art           | Visual and creative arts
Children      | Children's books
```

### ZBOOK_STATUS Data:
```
CODE | DISPLAY_TEXT  | CRITICALITY
-----|---------------|-------------
A    | Available     | 3
L    | Low Stock     | 2
U    | Unavailable   | 1
```

---

## SQL Scripts for Initial Data

### Insert Genres:
```sql
INSERT INTO ZBOOK_GENRES (CLIENT, CODE, DESCRIPTION) VALUES
  ('100', 'Fiction', 'Fictional stories'),
  ('100', 'Science', 'Science and technology'),
  ('100', 'Cooking', 'Cooking and recipes'),
  ('100', 'Fantasy', 'Fantasy and magic'),
  ('100', 'Hobby', 'Hobbies and crafts'),
  ('100', 'Adventure', 'Adventure stories'),
  ('100', 'Self-Help', 'Self-help and motivation'),
  ('100', 'Non-Fiction', 'Non-fictional content'),
  ('100', 'Art', 'Visual and creative arts'),
  ('100', 'Children', 'Children books');
```

### Insert Book Status:
```sql
INSERT INTO ZBOOK_STATUS (CLIENT, CODE, DISPLAY_TEXT, CRITICALITY) VALUES
  ('100', 'A', 'Available', 3),
  ('100', 'L', 'Low Stock', 2),
  ('100', 'U', 'Unavailable', 1);
```

---

**Next Step**: Create CDS Views (see 02_CDS_VIEWS.md)
