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
      Pages1,
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
