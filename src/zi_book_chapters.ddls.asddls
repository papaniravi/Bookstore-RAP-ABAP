@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bookstore - Chapters'
define view entity ZI_BOOK_CHAPTERS
  as select from zbook_chapters
  association to parent ZI_BOOK_BOOKS as _Book on $projection.BookId = _Book.Id
{
  key id          as Id,
      book_id     as BookId,
      number      as Number,
      title       as Title,
      pages       as Pages,
      @Semantics.systemDateTime.createdAt: true
      created_at  as CreatedAt,
      @Semantics.user.createdBy: true
      created_by  as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      modified_at as ModifiedAt,
      @Semantics.user.lastChangedBy: true
      modified_by as ModifiedBy,

      _Book
}
