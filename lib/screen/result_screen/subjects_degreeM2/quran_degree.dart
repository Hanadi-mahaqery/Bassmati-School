import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/result_screen/months_result/quran_degree_data.dart';

class QuranDegree2 extends StatelessWidget {
  const QuranDegree2({super.key});
  static String routName = 'QuranDegree2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Degree'),
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
                rows: List.generate(quranData2.length, (index) {
                  return DataRow(
                    cells: [

                      DataCell(Text(quranData2[index].type,
                          style: TextStyle(fontSize: 20, color: kTextBlackColor))),

                      DataCell(Text(quranData2[index].degree,
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
                    itemCount: quranResultComment2.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          quranResultComment2[index].comment,
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
