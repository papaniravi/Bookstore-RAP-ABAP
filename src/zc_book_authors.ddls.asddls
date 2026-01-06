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

