-- SQL Script to fix draft table structures
-- The draft tables need to have field names in UPPERCASE without underscores
-- to match SAP's expected naming convention for draft tables

-- Step 1: Drop existing draft tables (if they exist)
-- Run these in SAP GUI using SE11 or SQL Console:
-- DROP TABLE zbook_books_d;
-- DROP TABLE zbook_chap_d;

-- Step 2: Recreate ZBOOK_BOOKS_D with correct field names
-- The draft table must have the SAME field names as the CDS view exposes them
-- (Id, Title, AuthorId, etc.) converted to UPPERCASE

@EndUserText.label : 'Books Draft Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
define table zbook_books_d {
  key id              : sysuuid_x16 not null;
  title               : abap.char(100);
  authorid            : sysuuid_x16;      -- Maps to AuthorId in CDS
  genrecode           : abap.char(20);    -- Maps to GenreCode in CDS
  publishedat         : abap.dats;        -- Maps to PublishedAt in CDS
  pages1              : abap.int4;
  price               : abap.curr(15,2);
  currencycode        : abap.cuky;        -- Maps to CurrencyCode in CDS
  stock               : abap.int4;
  statuscode          : abap.char(1);     -- Maps to StatusCode in CDS
  createdat           : abp_creation_tstmpl;   -- Maps to CreatedAt in CDS
  createdby           : abp_creation_user;     -- Maps to CreatedBy in CDS
  modifiedat          : abp_lastchange_tstmpl; -- Maps to ModifiedAt in CDS
  modifiedby          : abp_lastchange_user;   -- Maps to ModifiedBy in CDS

  -- Draft administrative fields (required by RAP framework)
  include sych_bdl_draft_admin_inc;
}

-- Step 3: Recreate ZBOOK_CHAP_D with correct field names

@EndUserText.label : 'Chapters Draft Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
define table zbook_chap_d {
  key id              : sysuuid_x16 not null;
  bookid              : sysuuid_x16;      -- Maps to BookId in CDS
  number1             : abap.int4;
  title               : abap.char(100);
  pages1              : abap.int4;
  createdat           : abp_creation_tstmpl;   -- Maps to CreatedAt in CDS
  createdby           : abp_creation_user;     -- Maps to CreatedBy in CDS
  modifiedat          : abp_lastchange_tstmpl; -- Maps to ModifiedAt in CDS
  modifiedby          : abp_lastchange_user;   -- Maps to ModifiedBy in CDS

  -- Draft administrative fields (required by RAP framework)
  include sych_bdl_draft_admin_inc;
}

/*
IMPORTANT NOTES:
1. The field names in draft tables MUST match the CDS view element names (in UPPERCASE)
2. For example: "author_id" in the database table becomes "AuthorId" in CDS view,
   so the draft table must have "AUTHORID" (uppercase, no underscore)
3. The include "sych_bdl_draft_admin_inc" adds required RAP draft fields
4. All timestamp fields should use the abp_* data elements for proper draft handling
*/
