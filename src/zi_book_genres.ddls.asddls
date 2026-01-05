@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Genres Value Help'
define view entity ZI_BOOK_GENRES
  as select from zbook_genres
{
  key code        as Code,
      description as Description
}

