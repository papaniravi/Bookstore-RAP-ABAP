# Step 2: Create CDS Views

Create these CDS views in ADT (ABAP Development Tools).

## 1. Interface View: ZI_BOOK_GENRES

**File**: ZI_BOOK_GENRES.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Genres Value Help'
define view entity ZI_BOOK_GENRES
  as select from zbook_genres
{
  key code        as Code,
      description as Description
}
```

## 2. Interface View: ZI_BOOK_STATUS

**File**: ZI_BOOK_STATUS.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Book Status Value Help'
define view entity ZI_BOOK_STATUS
  as select from zbook_status
{
  key code         as Code,
      display_text as DisplayText,
      criticality  as Criticality
}
```

## 3. Interface View: ZI_BOOK_AUTHORS

**File**: ZI_BOOK_AUTHORS.ddls

```abap
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bookstore - Authors'
define root view entity ZI_BOOK_AUTHORS
  as select from zbook_authors
  association [0..*] to ZI_BOOK_BOOKS as _Books on $projection.Id = _Books.AuthorId
{
  key id          as Id,
      name        as Name,
      @Semantics.systemDateTime.createdAt: true
      created_at  as CreatedAt,
      @Semantics.user.createdBy: true
      created_by  as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      modified_at as ModifiedAt,
      @Semantics.user.lastChangedBy: true
      modified_by as ModifiedBy,

      _Books
}
```

## 4. Interface View: ZI_BOOK_CHAPTERS

**File**: ZI_BOOK_CHAPTERS.ddls

```abap
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bookstore - Chapters'
define view entity ZI_BOOK_CHAPTERS
  as select from zbook_chapters
  association to parent ZI_BOOK_BOOKS as _Book on $projection.BookId = _Book.Id
{
  key id          as Id,
      book_id     as BookId,
      number      as Number,
      title       as Title,
      pages       as Pages,
      @Semantics.systemDateTime.createdAt: true
      created_at  as CreatedAt,
      @Semantics.user.createdBy: true
      created_by  as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      modified_at as ModifiedAt,
      @Semantics.user.lastChangedBy: true
      modified_by as ModifiedBy,

      _Book
}
```

## 5. Interface View: ZI_BOOK_BOOKS

**File**: ZI_BOOK_BOOKS.ddls

```abap
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bookstore - Books'
define root view entity ZI_BOOK_BOOKS
  as select from zbook_books
  composition [0..*] of ZI_BOOK_CHAPTERS as _Chapters
  association [0..1] to ZI_BOOK_AUTHORS  as _Author   on $projection.AuthorId = _Author.Id
  association [0..1] to ZI_BOOK_GENRES   as _Genre    on $projection.GenreCode = _Genre.Code
  association [0..1] to ZI_BOOK_STATUS   as _Status   on $projection.StatusCode = _Status.Code
  association [0..1] to I_Currency       as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key id            as Id,
      title         as Title,
      author_id     as AuthorId,
      genre_code    as GenreCode,
      published_at  as PublishedAt,
      pages         as Pages,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price         as Price,
      currency_code as CurrencyCode,
      stock         as Stock,
      status_code   as StatusCode,
      @Semantics.systemDateTime.createdAt: true
      created_at    as CreatedAt,
      @Semantics.user.createdBy: true
      created_by    as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      modified_at   as ModifiedAt,
      @Semantics.user.lastChangedBy: true
      modified_by   as ModifiedBy,

      _Chapters,
      _Author,
      _Genre,
      _Status,
      _Currency
}
```

## 6. Consumption View: ZC_BOOK_GENRES

**File**: ZC_BOOK_GENRES.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Genres (Consumption)'
@Metadata.allowExtensions: true
define view entity ZC_BOOK_GENRES
  as projection on ZI_BOOK_GENRES
{
  key Code,
      Description
}
```

## 7. Consumption View: ZC_BOOK_STATUS

**File**: ZC_BOOK_STATUS.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Book Status (Consumption)'
@Metadata.allowExtensions: true
define view entity ZC_BOOK_STATUS
  as projection on ZI_BOOK_STATUS
{
  key Code,
      DisplayText,
      Criticality
}
```

## 8. Consumption View: ZC_BOOK_AUTHORS

**File**: ZC_BOOK_AUTHORS.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Authors (Consumption)'
@Metadata.allowExtensions: true
define root view entity ZC_BOOK_AUTHORS
  provider contract transactional_query
  as projection on ZI_BOOK_AUTHORS
{
  key Id,
      Name,
      CreatedAt,
      CreatedBy,
      ModifiedAt,
      ModifiedBy,

      _Books : redirected to ZC_BOOK_BOOKS
}
```

## 9. Consumption View: ZC_BOOK_CHAPTERS

**File**: ZC_BOOK_CHAPTERS.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Chapters (Consumption)'
@Metadata.allowExtensions: true
define view entity ZC_BOOK_CHAPTERS
  as projection on ZI_BOOK_CHAPTERS
{
  key Id,
      BookId,
      Number,
      Title,
      Pages,
      CreatedAt,
      CreatedBy,
      ModifiedAt,
      ModifiedBy,

      _Book : redirected to parent ZC_BOOK_BOOKS
}
```

## 10. Consumption View: ZC_BOOK_BOOKS

**File**: ZC_BOOK_BOOKS.ddls

```abap
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Books (Consumption)'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_BOOK_BOOKS
  provider contract transactional_query
  as projection on ZI_BOOK_BOOKS
{
  key Id,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      Title,
      AuthorId,
      GenreCode,
      PublishedAt,
      Pages,
      Price,
      CurrencyCode,
      Stock,
      StatusCode,
      CreatedAt,
      CreatedBy,
      ModifiedAt,
      ModifiedBy,

      _Chapters : redirected to composition child ZC_BOOK_CHAPTERS,
      _Author   : redirected to ZC_BOOK_AUTHORS,
      _Genre,
      _Status,
      _Currency
}
```

---

**Next Step**: Create Behavior Definitions (see 03_BEHAVIOR_DEFINITIONS.md)
