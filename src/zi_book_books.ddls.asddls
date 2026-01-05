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
      pages1        as Pages1,
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

