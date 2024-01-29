import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/result_screen/months_result/science_degree_data.dart';


class ScienceDegree4 extends StatelessWidget {
  const ScienceDegree4({Key? key}) : super(key: key);

  static String routName = 'ScienceDegree4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Degree'),
      ),
      body: Column(
        children: [
          Container(

            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 3),
                  topRight: Radius.circular(kDefaultPadding * 3),
                  bottomLeft: Radius.circular(kDefaultPadding * 3),
                  bottomRight: Radius.circular(kDefaultPadding * 3),
                ),

                color: kOtherColor
            ),
            child: Center(
              child: DataTable(
                columnSpacing: 8.0,
                columns: [
                  DataColumn(
                    label: Text('الدرجة'),
                  ),
                  DataColumn(
                    label: Text('النوع'),
                    numeric: true, // تحديد العمود كعمود رقمي
                  ),
                ],
                rows: List.generate(scienceData4.length, (index) {
                  return DataRow(
                    cells: [

                      DataCell(Text(scienceData4[index].type,
                          style: TextStyle(fontSize: 20, color: kTextBlackColor))),

                      DataCell(Text(scienceData4[index].degree,
                          style: TextStyle(fontSize: 18, color: kPrimaryColor))),

                    ],
                  );
                }),
                // يمكنك إضافة المزيد من البيانات حسب الحاجة

              ),

            ),
          ),
          SizedBox(height: kDefaultPadding,),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 8,
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 3),
                topRight: Radius.circular(kDefaultPadding * 3),
                bottomLeft: Radius.circular(kDefaultPadding * 3),
                bottomRight: Radius.circular(kDefaultPadding * 3),
              ),
              color: kOtherColor,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'ملاحظات المعلم',
                    style: TextStyle(fontSize: 18, color: kTextBlackColor),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: scienceResultComment4.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          scienceResultComment4[index].comment,
                          style: TextStyle(fontSize: 16, color: kPrimaryColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

          ),


        ],


      ),
    );
  }
}