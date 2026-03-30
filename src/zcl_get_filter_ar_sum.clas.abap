CLASS zcl_get_filter_ar_sum DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     TYPES: BEGIN OF ty_range_option,
             sign   TYPE c LENGTH 1,
             option TYPE c LENGTH 2,
             low    TYPE string,
             high   TYPE string,
           END OF ty_range_option,

           tt_range TYPE TABLE OF ty_range_option,

           BEGIN OF ty_page_info,
             paging           TYPE REF TO if_rap_query_paging,
             page_size        TYPE int8,
             offset           TYPE int8,
             requested_fields TYPE if_rap_query_request=>tt_requested_elements,
             sort_order       TYPE if_rap_query_request=>tt_sort_elements,
             ro_filter        TYPE REF TO if_rap_query_filter,
             entity_id        TYPE string,
           END OF ty_page_info,

           st_page_info TYPE ty_page_info.

    CLASS-DATA mo_instance TYPE REF TO zcl_get_filter_ar_sum.

    CLASS-METHODS get_instance
      RETURNING VALUE(ro_instance) TYPE REF TO zcl_get_filter_ar_sum.

    CLASS-METHODS get_fillter_app
      IMPORTING io_request      TYPE REF TO if_rap_query_request
                io_response     TYPE REF TO if_rap_query_response
      EXPORTING
                wa_page_info    TYPE st_page_info.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GET_FILTER_AR_SUM IMPLEMENTATION.


  METHOD get_fillter_app.

    wa_page_info-paging           = io_request->get_paging( ).
    wa_page_info-page_size        = io_request->get_paging( )->get_page_size( ).
    wa_page_info-offset           = io_request->get_paging( )->get_offset( ).
    wa_page_info-requested_fields = io_request->get_requested_elements( ).
    wa_page_info-sort_order       = io_request->get_sort_elements( ).
    wa_page_info-ro_filter        = io_request->get_filter( ).
    wa_page_info-entity_id        = io_request->get_entity_id( ).

    TRY.
        DATA(lr_ranges) = wa_page_info-ro_filter->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
    ENDTRY.

*    LOOP AT lr_ranges INTO DATA(ls_ranges).
*      CASE ls_ranges-name.
*        WHEN 'BUKRS'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_bukrs.
*        WHEN 'POSTING_DATE'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_posting_date.
*        WHEN 'INVOICE_DATE'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_invoice_date.
*        WHEN 'DOCNUM'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_docnum.
*        WHEN 'PRCTR'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_prctr.
*        WHEN 'GJAHR'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_fiscalyear. dsd
*        WHEN 'KYHIEU_HD'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_symbol.
*        WHEN 'MASOTHUE'.
*          MOVE-CORRESPONDING ls_ranges-range TO ir_tax.
*        WHEN OTHERS.
*      ENDCASE.
*    ENDLOOP.
  ENDMETHOD.


  METHOD get_instance.
    mo_instance = ro_instance = COND #( WHEN mo_instance IS BOUND THEN mo_instance ELSE NEW #( ) ).
  ENDMETHOD.
ENDCLASS.
