class FeeData{
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatues;
  final String totalAmount;
  final String btnStatues;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatues, this.totalAmount, this.btnStatues);

}
List<FeeData> Fee = [
  FeeData('98889', 'May', '1-May-2023', 'pending', '900\$', 'Pay Now'),
  FeeData('98888', 'June', '1-June-2023', 'paid', '600\$', 'Download'),
  FeeData('98887', 'July', '1-July-2023', 'paid', '300\$', ' Download'),
];