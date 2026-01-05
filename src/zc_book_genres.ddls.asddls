@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Genres (Consumption)'
@Metadata.allowExtensions: true
define view entity ZC_BOOK_GENRES
  as projection on ZI_BOOK_GENRES
{
  key Code,
      Description
}

