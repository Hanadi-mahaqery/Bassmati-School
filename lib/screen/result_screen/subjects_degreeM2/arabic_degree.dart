import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

import '../months_result/arabic_degree_data.dart';

class ArabicDegree2 extends StatelessWidget {
  const ArabicDegree2({Key? key}) : super(key: key);

  static String routName = 'ArabicDegree2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arabic Degree'),
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
                rows: List.generate(arabicData2.length, (index) {
                  return DataRow(
                    cells: [

                      DataCell(Text(arabicData2[index].type,
                          style: TextStyle(fontSize: 20, color: kTextBlackColor))),

                      DataCell(Text(arabicData2[index].degree,
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
                      itemCount: resultComment2.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            resultComment2[index].comment,
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