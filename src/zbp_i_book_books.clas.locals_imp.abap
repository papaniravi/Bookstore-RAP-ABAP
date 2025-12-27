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
    result = VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        %delete = if_abap_behv=>auth-allowed
                        %update = if_abap_behv=>auth-allowed
                        %action-addstock = if_abap_behv=>auth-allowed
                        %action-changepublishdate = if_abap_behv=>auth-allowed
                        %action-changestatus = if_abap_behv=>auth-allowed ) ).
  ENDMETHOD.

  METHOD addstock.
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        FIELDS ( stock )
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( stock )
        WITH VALUE #( FOR book IN books
                      ( %tky = book-%tky
                        stock = book-stock + 10 ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

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
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( publishedat )
        WITH VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        publishedat = key-%param-newdate ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

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
    READ ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(books).

    MODIFY ENTITIES OF zi_book_books IN LOCAL MODE
      ENTITY books
        UPDATE FIELDS ( statuscode )
        WITH VALUE #( FOR key IN keys
                      ( %tky = key-%tky
                        statuscode = key-%param-newstatus ) )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

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
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
