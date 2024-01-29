import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/result_screen/total_screen/data/total_data.dart';

class TotalScreen extends StatelessWidget {
  const TotalScreen({super.key});
  static String routeName = 'TotalScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultPadding * 1),
              topRight: Radius.circular(kDefaultPadding * 1)),
          color: kOtherColor,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 2, top: 15),
              child: DataTable(
                headingRowHeight: 10,
                dataRowHeight: 20,
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: OverflowBox(
                        maxWidth: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text('Subject', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: OverflowBox(
                        maxWidth: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text('1st Semester', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: OverflowBox(
                        maxWidth: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text('2nd Semester', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: OverflowBox(
                        maxWidth: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text('Total', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ],
                rows: List.generate(result.length, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text(result[index].subjectName,
                          style: TextStyle(fontSize: 16, color: kTextBlackColor))),
                      DataCell(Text(result[index].firstSemester,
                          style: TextStyle(fontSize: 13, color: kTextBlackColor))),
                      DataCell(Text(result[index].secondSemester,
                          style: TextStyle(fontSize: 13, color: kTextBlackColor))),
                      DataCell(Text(result[index].total,
                          style: TextStyle(fontSize: 13, color: kTextBlackColor))),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Text('Total Result',
                          style: TextStyle(fontSize: 16, color: kOtherColor)),
                      Text('500',
                          style: TextStyle(fontSize: 16, color: kOtherColor)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),


                  child: Column(
                    children: [
                      Text('Grade',
                          style: TextStyle(fontSize: 16, color: kOtherColor)),
                      Text('B',
                          style: TextStyle(fontSize: 16, color: kOtherColor)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
