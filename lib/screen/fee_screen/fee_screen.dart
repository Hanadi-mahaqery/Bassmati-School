import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/fee_screen/widgets/fee_widgets.dart';
import 'package:school_app/blocs/intallment_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});
  static String routName = 'FeeScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<InstallmentBloc>(context);

    // جلب البيانات عند تحميل الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(LoadInstallmentData());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Fee',style: TextStyle(color: Colors.white),),
      ),
      body: BlocBuilder<InstallmentBloc, InstallmentState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            return Column(
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
                      itemCount: state.items.length,
                      itemBuilder: (context, int index) {
                        var fee = state.items[index];
                        DateTime installDate = DateTime.parse(fee.installDate!);
                        // تنسيق التاريخ لعرض اليوم والشهر فقط
                        String formattedDate = DateFormat('dd MMM').format(installDate);
                        return Container(
                          margin: EdgeInsets.only(bottom: kDefaultPadding),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(kDefaultPadding),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(kDefaultPadding),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kTextLightColor,
                                      blurRadius: 2.0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    FeeDetailRow(
                                      title: 'Receipt No.',
                                      statueValue: fee.installNo?.toString() ?? '',
                                    ),
                                    SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                    // FeeDetailRow(
                                    //   title: 'Status',
                                    //   statueValue: fee.installStatus == true ? 'Paid' : 'Unpaid',
                                    // ),
                                    sizedBox,
                                    FeeDetailRow(
                                      title: 'Payment Date',
                                      statueValue: formattedDate,
                                    ),
                                    sizedBox,
                                    FeeDetailRow(
                                      title: 'Amount Due',
                                      statueValue: fee.amountDue.toString() ?? '',
                                    ),
                                    SizedBox(
                                      height: kDefaultPadding,
                                      child: Divider(
                                        thickness: 1.0,
                                      ),
                                    ),
                                    FeeDetailRow(
                                      title: 'Amount Paid',
                                      statueValue: fee.amountPaid.toString() ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(8.0), // تصغير الـ padding
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(8.0), // تصغير نصف القطر
                                  ),
                                  color: fee.installStatus == true ? Colors.green : Colors.red,
                                ),
                                child: Text(
                                  fee.installStatus == true ? 'Paid' : 'Unpaid',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0, // تصغير حجم النص إذا رغبت
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No Fee Data Found'));
          }
        },
      ),
    );
  }
}