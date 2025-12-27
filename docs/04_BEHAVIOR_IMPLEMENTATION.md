# Step 4: Create Behavior Implementation Classes

Create these ABAP classes in ADT.

## 1. Behavior Implementation: ZBP_I_BOOK_BOOKS

**Class**: ZBP_I_BOOK_BOOKS

### Global Class Definition:
```abap
CLASS zbp_i_book_books DEFINITION
  PUBLIC
  ABSTRACT
  FINAL FOR BEHAVIOR OF zi_book_books.
ENDCLASS.

CLASS zbp_i_book_books IMPLEMENTATION.
ENDCLASS.
```

### Local Types (in Local Types tab):
```abap
CLASS lhc_books DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR books RESULT result.

    METHODS addstock FOR MODIFY
      IMPORTING keys FOR ACTION books~addstock RESULT result.

    METHODS changepublishdate FOR MODIFY
      IMPORTING keys FOR ACTION books~changepublishdate RESULT result.

    METHODS changestatus FOR MODIFY
      IMPORTING keys FOR ACTION books~changestatus RESULT result.
ENDCLASS.

CLASS lhc_books IMPLEMENTATION.

  METHOD get_instance_authorizations.
    " Default: all operations allowed
    result = VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        %delete = if_abap_behv=>auth-allowed
                        %update = if_abap_behv=>auth-allowed
                        %action-addstock = if_abap_behv=>auth-allowed
                        %action-changepublishdate = if_abap_behv=>auth-allowed
                        %action-changestatus = if_abap_behv=>auth-allowed ) ).
  ENDMETHOD.

  METHOD addstock.
    " Read current book data
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        FIELDS ( stock )
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    " Increase stock by 10
    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( stock )
        WITH VALUE #( FOR book IN books
                      ( %tky = book-%tky
                        stock = book-stock + 10 ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

    " Read modified books
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT books.

    result = VALUE #( FOR book IN books
                      ( %tky   = book-%tky
                        %param = book ) ).
  ENDMETHOD.

  METHOD changepublishdate.
    " Read current books
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    " Update publish date
    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( publishedat )
        WITH VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        publishedat = key-%param-newdate ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

    " Read modified books
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT books.

    result = VALUE #( FOR book IN books
                      ( %tky   = book-%tky
                        %param = book ) ).
  ENDMETHOD.

  METHOD changestatus.
    " Read current books
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    " Update status
    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( statuscode )
        WITH VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        statuscode = key-%param-newstatus ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

    " Read modified books
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT books.

    result = VALUE #( FOR book IN books
                      ( %tky   = book-%tky
                        %param = book ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_book_books DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.
ENDCLASS.

CLASS lsc_zi_book_books IMPLEMENTATION.

  METHOD save_modified.
    " No additional save logic needed - handled by managed scenario
  ENDMETHOD.

  METHOD cleanup_finalize.
    " No cleanup needed
  ENDMETHOD.

ENDCLASS.
```

## 2. Behavior Implementation: ZBP_I_BOOK_AUTHORS

**Class**: ZBP_I_BOOK_AUTHORS

### Global Class Definition:
```abap
CLASS zbp_i_book_authors DEFINITION
  PUBLIC
  ABSTRACT
  FINAL FOR BEHAVIOR OF zi_book_authors.
ENDCLASS.

CLASS zbp_i_book_authors IMPLEMENTATION.
ENDCLASS.
```

### Local Types:
```abap
CLASS lhc_authors DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR authors RESULT result.
ENDCLASS.

CLASS lhc_authors IMPLEMENTATION.

  METHOD get_instance_authorizations.
    " Default: all operations allowed
    result = VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        %delete = if_abap_behv=>auth-allowed
                        %update = if_abap_behv=>auth-allowed ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zi_book_authors DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.
ENDCLASS.

CLASS lsc_zi_book_authors IMPLEMENTATION.

  METHOD save_modified.
    " No additional save logic needed
  ENDMETHOD.

  METHOD cleanup_finalize.
    " No cleanup needed
  ENDMETHOD.

ENDCLASS.
```

---

**Next Step**: Create Service Definition and Binding (see 05_SERVICE_DEFINITION.md)
