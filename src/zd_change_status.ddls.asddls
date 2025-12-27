@EndUserText.label: 'Change Status Parameter'
define abstract entity ZD_CHANGE_STATUS
{
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_BOOK_STATUS', element: 'Code' } }]
  newStatus : abap.char(1);
}
