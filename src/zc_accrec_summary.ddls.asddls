@EndUserText.label: 'Accounts Receivable Summary Report'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_AR_SUMMARY_LOGIC'
@Metadata.allowExtensions: true
define custom entity ZC_ACCREC_SUMMARY

{
//      @Consumption.filter : { mandatory: true, multipleSelections: false }
  key RBUKRS              : abap.char(4);    // Company Code
  key BP_GR               : abap.char(10);   // Business Partner Group
  key BP                  : abap.char(10);   // Business Partner (Customer)
  key AccountNumber       : abap.char(10); // Account Number
      //      @Consumption.filter : { multipleSelections: true }
  key RHCUR               : abap.cuky; // transaction Currency
      BP_GR_TITLE         : abap.char(40);   // BP Group Title
      BP_NAME             : abap.char(80);   // BP Name
//      @Consumption.filter : { mandatory: true, multipleSelections: false }
      companyname         : abap.char(255); // Company Name
      companyaddr         : abap.char(255); // Company Address
      COMPANYCODECURRENCY : abap.cuky; // Company Code Currency COMPANYCODECURRENCY
      TransactionCurrency : abap.cuky;
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      OPEN_DEBIT          : abap.curr(23,2); // Opening Debit in company code currency
      @Semantics.amount.currencyCode: 'RHCUR'
      OPEN_DEBIT_TRAN     : abap.curr(23,2); // Opening Debit in Transaction Currency
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      OPEN_CREDIT         : abap.curr(23,2); // Opening Credit in company code currency
      @Semantics.amount.currencyCode: 'RHCUR'
      OPEN_CREDIT_TRAN    : abap.curr(23,2); // Opening Credit in transaction currency
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TOTAL_DEBIT         : abap.curr(23,2); // Total Debit In Company Code Currency
      @Semantics.amount.currencyCode: 'RHCUR'
      TOTAL_DEBIT_TRAN    : abap.curr(23,2); // Total Debit In TRAnsaction Currency
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TOTAL_CREDIT        : abap.curr(23,2); // Total Credit In Company Code Currency
      @Semantics.amount.currencyCode: 'RHCUR'
      TOTAL_CREDIT_TRAN   : abap.curr(23,2); // Total Credit In TRAnsaction Currency
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      END_DEBIT           : abap.curr(23,2); // Ending Debit IN Company Code Currency
      @Semantics.amount.currencyCode: 'RHCUR'
      END_DEBIT_TRAN      : abap.curr(23,2); // Ending Debit IN Transaction Currency
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      END_CREDIT          : abap.curr(23,2); // Ending Credit IN Company Code Currency
      @Semantics.amount.currencyCode: 'RHCUR'
      END_CREDIT_TRAN     : abap.curr(23,2); // Ending Credit IN Transaction Currency
      @Consumption.filter : { mandatory: true, multipleSelections: false }
      p_start_date        : abap.dats;
      @Consumption.filter : { mandatory: true, multipleSelections: false }
      p_end_date          : abap.dats;
}
