CLASS lhc_authors DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR authors RESULT result.
ENDCLASS.

CLASS lhc_authors IMPLEMENTATION.

  METHOD get_instance_authorizations.
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
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
