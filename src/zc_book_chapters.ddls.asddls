@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Chapters (Consumption)'
@Metadata.allowExtensions: true
define view entity ZC_BOOK_CHAPTERS
  as projection on ZI_BOOK_CHAPTERS
{
  key Id,
      BookId,
      Number1,
      Title,
      Pages1,
      CreatedAt,
      CreatedBy,
      ModifiedAt,
      ModifiedBy,

      _Book : redirected to parent ZC_BOOK_BOOKS
}

