@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookstore - Book Status Value Help'
define view entity ZI_BOOK_STATUS
  as select from zbook_status
{
  key code         as Code,
      display_text as DisplayText,
      criticality  as Criticality
}

