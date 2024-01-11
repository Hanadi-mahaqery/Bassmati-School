import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/fee_screen/widgets/fee_widgets.dart';

import 'data/fee_data.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});
  static String routName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kDefaultPadding),
                      topLeft: Radius.circular(kDefaultPadding),
                    ),
                    color: kOtherColor,
                  ),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(kDefaultPadding),
                      itemCount: Fee.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: kDefaultPadding),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(kDefaultPadding)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: kTextLightColor,
                                          blurRadius: 2.0)
                                    ]),
                                child: Column(
                                  children: [
                                    FeeDetailRow(
                                        title: 'Receipt No.',
                                        statueValue: Fee[index].receiptNo),
                                    SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                    FeeDetailRow(
                                        title: 'Month',
                                        statueValue: Fee[index].month),
                                    sizedBox,
                                    FeeDetailRow(
                                        title: 'Payment Date',
                                        statueValue: Fee[index].date),
                                    sizedBox,
                                    FeeDetailRow(
                                        title: 'Status',
                                        statueValue: Fee[index].paymentStatues),
                                    SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                    FeeDetailRow(
                                        title: 'Total Amount',
                                        statueValue: Fee[index].totalAmount),
                                  ],
                                ),
                              ),
                              FeeButton(
                                  title: Fee[index].btnStatues,
                                  iconData: Fee[index].btnStatues == 'paid'
                                      ? Icons.download_outlined
                                      : Icons.arrow_forward_outlined,
                                  onPress: () {})
                            ],
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}
