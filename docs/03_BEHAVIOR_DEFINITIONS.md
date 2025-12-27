# Step 3: Create Behavior Definitions

Create these behavior definitions in ADT.

## 1. Behavior Definition: ZI_BOOK_BOOKS

**File**: ZI_BOOK_BOOKS.bdef

```abap
managed implementation in class zbp_i_book_books unique;
strict ( 2 );
with draft;

define behavior for ZI_BOOK_BOOKS alias Books
persistent table zbook_books
draft table zbook_books_d
etag master ModifiedAt
lock master total etag ModifiedAt
authorization master ( global )
{
  field ( readonly )
    Id,
    CreatedAt,
    CreatedBy,
    ModifiedAt,
    ModifiedBy;

  field ( mandatory )
    Title;

  create;
  update;
  delete;

  draft action Edit;
  draft action Activate optimized;
  draft action Discard;
  draft action Resume;
  draft determine action Prepare;

  action addStock result [1] $self;
  action changePublishDate parameter ZD_ChangeDate result [1] $self;
  action changeStatus parameter ZD_ChangeStatus result [1] $self;

  association _Chapters { create; with draft; }

  mapping for zbook_books
  {
    Id = id;
    Title = title;
    AuthorId = author_id;
    GenreCode = genre_code;
    PublishedAt = published_at;
    Pages = pages;
    Price = price;
    CurrencyCode = currency_code;
    Stock = stock;
    StatusCode = status_code;
    CreatedAt = created_at;
    CreatedBy = created_by;
    ModifiedAt = modified_at;
    ModifiedBy = modified_by;
  }
}

define behavior for ZI_BOOK_CHAPTERS alias Chapters
persistent table zbook_chapters
draft table zbook_chap_d
etag master ModifiedAt
lock dependent by _Book
authorization dependent by _Book
{
  field ( readonly )
    Id,
    BookId,
    CreatedAt,
    CreatedBy,
    ModifiedAt,
    ModifiedBy;

  field ( mandatory )
    Title,
    Number;

  update;
  delete;

  association _Book { with draft; }

  mapping for zbook_chapters
  {
    Id = id;
    BookId = book_id;
    Number = number;
    Title = title;
    Pages = pages;
    CreatedAt = created_at;
    CreatedBy = created_by;
    ModifiedAt = modified_at;
    ModifiedBy = modified_by;
  }
}
```

## 2. Behavior Definition: ZC_BOOK_BOOKS

**File**: ZC_BOOK_BOOKS.bdef

```abap
projection;
strict ( 2 );
use draft;

define behavior for ZC_BOOK_BOOKS alias Books
use etag
{
  use create;
  use update;
  use delete;

  use action Edit;
  use action Activate;
  use action Discard;
  use action Resume;
  use action Prepare;

  use action addStock;
  use action changePublishDate;
  use action changeStatus;

  use association _Chapters { create; with draft; }
}

define behavior for ZC_BOOK_CHAPTERS alias Chapters
use etag
{
  use update;
  use delete;

  use association _Book { with draft; }
}
```

## 3. Behavior Definition: ZI_BOOK_AUTHORS

**File**: ZI_BOOK_AUTHORS.bdef

```abap
managed implementation in class zbp_i_book_authors unique;
strict ( 2 );

define behavior for ZI_BOOK_AUTHORS alias Authors
persistent table zbook_authors
etag master ModifiedAt
lock master
authorization master ( global )
{
  field ( readonly )
    Id,
    CreatedAt,
    CreatedBy,
    ModifiedAt,
    ModifiedBy;

  field ( mandatory )
    Name;

  create;
  update;
  delete;

  association _Books;

  mapping for zbook_authors
  {
    Id = id;
    Name = name;
    CreatedAt = created_at;
    CreatedBy = created_by;
    ModifiedAt = modified_at;
    ModifiedBy = modified_by;
  }
}
```

## 4. Behavior Definition: ZC_BOOK_AUTHORS

**File**: ZC_BOOK_AUTHORS.bdef

```abap
projection;
strict ( 2 );

define behavior for ZC_BOOK_AUTHORS alias Authors
use etag
{
  use create;
  use update;
  use delete;

  use association _Books;
}
```

## 5. Create Abstract Entities for Action Parameters

### ZD_ChangeDate (Abstract Entity)

**File**: ZD_CHANGE_DATE.ddls

```abap
@EndUserText.label: 'Change Publish Date Parameter'
define abstract entity ZD_ChangeDate
{
  newDate : abap.dats;
}
```

### ZD_ChangeStatus (Abstract Entity)

**File**: ZD_CHANGE_STATUS.ddls

```abap
@EndUserText.label: 'Change Status Parameter'
define abstract entity ZD_ChangeStatus
{
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_BOOK_STATUS', element: 'Code' } }]
  newStatus : abap.char(1);
}
```

## 6. Create Draft Tables

Execute in SE11 or let RAP create them automatically:

### ZBOOK_BOOKS_D (Draft Table for Books)
```abap
@EndUserText.label : 'Draft table for ZBOOK_BOOKS'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zbook_books_d {
  key mandt       : abap.clnt not null;
  key id          : sysuuid_x16 not null;
  title           : abap.char(100);
  author_id       : sysuuid_x16;
  genre_code      : abap.char(20);
  published_at    : abap.dats;
  pages           : abap.int4;
  price           : abap.dec(9,2);
  currency_code   : abap.cuky;
  stock           : abap.int4;
  status_code     : abap.char(1);
  created_at      : timestampl;
  created_by      : abap.char(12);
  modified_at     : timestampl;
  modified_by     : abap.char(12);
  "%admin"        : include sych_bdl_draft_admin_inc;
}
```

### ZBOOK_CHAP_D (Draft Table for Chapters)
```abap
@EndUserText.label : 'Draft table for ZBOOK_CHAPTERS'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zbook_chap_d {
  key mandt       : abap.clnt not null;
  key id          : sysuuid_x16 not null;
  book_id         : sysuuid_x16;
  number          : abap.int4;
  title           : abap.char(100);
  pages           : abap.int4;
  created_at      : timestampl;
  created_by      : abap.char(12);
  modified_at     : timestampl;
  modified_by     : abap.char(12);
  "%admin"        : include sych_bdl_draft_admin_inc;
}
```

---

**Next Step**: Create Behavior Implementation Classes (see 04_BEHAVIOR_IMPLEMENTATION.md)
