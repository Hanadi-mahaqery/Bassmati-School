import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: Text('Fee'),
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
                                    FeeDetailRow(
                                      title: 'Status',
                                      statueValue: fee.installStatus == true ? 'Paid' : 'Unpaid',
                                    ),
                                    sizedBox,
                                    FeeDetailRow(
                                      title: 'Payment Date',
                                      statueValue: fee.installDate ?? '',
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
                              FeeButton(
                                title: fee.installStatus == true ? 'Paid' : 'Pay Now',
                                iconData: fee.installStatus == true
                                    ? Icons.download_outlined
                                    : Icons.arrow_forward_outlined,
                                onPress: () {
                                  // Functionality for the button can be added here
                                },
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
