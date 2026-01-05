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

