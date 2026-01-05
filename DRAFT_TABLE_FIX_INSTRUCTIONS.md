# Draft Table Fix Instructions

## Problem
The draft tables `ZBOOK_BOOKS_D` and `ZBOOK_CHAP_D` were created with lowercase field names with underscores (e.g., `author_id`, `genre_code`), but SAP's RAP framework expects the field names to match the CDS view element names in UPPERCASE without underscores (e.g., `AUTHORID`, `GENRECODE`).

## Errors
```
"ZBOOK_BOOKS_D" is not a suitable draft persistency for "ZI_BOOK_BOOKS"
(there is no "AUTHORID" field).
```

## Solution

You need to recreate the draft tables with the correct field names. Here are two options:

### Option 1: Recreate Tables in SE11 (Recommended)

1. Open transaction **SE11** in SAP GUI

2. **Delete existing draft tables:**
   - Enter table name: `ZBOOK_BOOKS_D`
   - Click "Display" → "Delete"
   - Repeat for `ZBOOK_CHAP_D`

3. **Create ZBOOK_BOOKS_D:**
   - Transaction SE11 → Create → Database Table
   - Table name: `ZBOOK_BOOKS_D`
   - Delivery Class: `A` (Application table)
   - Add fields (EXACTLY as shown - UPPERCASE, no underscores):

   ```
   Field Name      | Data Element        | Key | Initial
   ----------------|---------------------|-----|--------
   ID              | SYSUUID_X16         | X   |
   TITLE           | ABAP.CHAR(100)      |     |
   AUTHORID        | SYSUUID_X16         |     |
   GENRECODE       | ABAP.CHAR(20)       |     |
   PUBLISHEDAT     | ABAP.DATS           |     |
   PAGES1          | ABAP.INT4           |     |
   PRICE           | ABAP.CURR(15,2)     |     |
   CURRENCYCODE    | ABAP.CUKY           |     |
   STOCK           | ABAP.INT4           |     |
   STATUSCODE      | ABAP.CHAR(1)        |     |
   CREATEDAT       | ABP_CREATION_TSTMPL |     |
   CREATEDBY       | ABP_CREATION_USER   |     |
   MODIFIEDAT      | ABP_LASTCHANGE_TSTMPL|    |
   MODIFIEDBY      | ABP_LASTCHANGE_USER |     |
   ```

   - Go to menu: **Extras** → **Append Structure**
   - Add include: `.INCLUDE` → `SYCH_BDL_DRAFT_ADMIN_INC` with group name `%ADMIN`
   - Save and activate

4. **Create ZBOOK_CHAP_D:**
   - Same process, fields:

   ```
   Field Name      | Data Element        | Key | Initial
   ----------------|---------------------|-----|--------
   ID              | SYSUUID_X16         | X   |
   BOOKID          | SYSUUID_X16         |     |
   NUMBER1         | ABAP.INT4           |     |
   TITLE           | ABAP.CHAR(100)      |     |
   PAGES1          | ABAP.INT4           |     |
   CREATEDAT       | ABP_CREATION_TSTMPL |     |
   CREATEDBY       | ABP_CREATION_USER   |     |
   MODIFIEDAT      | ABP_LASTCHANGE_TSTMPL|    |
   MODIFIEDBY      | ABP_LASTCHANGE_USER |     |
   ```

   - Add include: `.INCLUDE` → `SYCH_BDL_DRAFT_ADMIN_INC` with group name `%ADMIN`
   - Save and activate

### Option 2: Use SQL Console (Alternative)

If you have access to SQL console in Eclipse ADT or SAP GUI:

```sql
-- Drop existing tables
DROP TABLE zbook_books_d;
DROP TABLE zbook_chap_d;

-- Note: You cannot create tables with includes via SQL
-- You MUST use SE11 to create tables with the SYCH_BDL_DRAFT_ADMIN_INC include
```

## Field Name Mapping Reference

| Database Table Field | CDS View Element | Draft Table Field (REQUIRED) |
|---------------------|------------------|------------------------------|
| id                  | Id               | ID                           |
| title               | Title            | TITLE                        |
| author_id           | AuthorId         | AUTHORID                     |
| genre_code          | GenreCode        | GENRECODE                    |
| published_at        | PublishedAt      | PUBLISHEDAT                  |
| pages1              | Pages1           | PAGES1                       |
| price               | Price            | PRICE                        |
| currency_code       | CurrencyCode     | CURRENCYCODE                 |
| stock               | Stock            | STOCK                        |
| status_code         | StatusCode       | STATUSCODE                   |
| created_at          | CreatedAt        | CREATEDAT                    |
| created_by          | CreatedBy        | CREATEDBY                    |
| modified_at         | ModifiedAt       | MODIFIEDAT                   |
| modified_by         | ModifiedBy       | MODIFIEDBY                   |
| book_id             | BookId           | BOOKID                       |
| number1             | Number1          | NUMBER1                      |

## After Fixing Tables

1. Return to abapGit
2. Click "Advanced" → "Activate Objects"
3. All behavior definition errors should be resolved

## Additional Fix Needed

The behavior definition also has an association error:
- For ZI_BOOK_AUTHORS, the association `_Books` needs to cover all key fields
- The ON condition should be: `$projection.Id = _Books.AuthorId`

This will be fixed in the next step after the draft tables are corrected.
