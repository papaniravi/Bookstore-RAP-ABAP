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

