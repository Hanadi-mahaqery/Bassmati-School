import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/result_screen/components/result_compnents.dart';
import 'package:school_app/screen/result_screen/data/result_data.dart';

class ResultNd3Screen extends StatelessWidget {
  const ResultNd3Screen({super.key});
  static String routeName= 'ResultNd3Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        children: [
          Container(
            height: 170.0,
            /* child: CustomPaint(
              foregroundPainter: CircularPainter(
                backgroundColor: kPrimaryColor,
                lineColor: kOtherColor,
                width: 50,
              ),
            ),
*/
          ),
          Text('You are Excellent',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w900
            ) ,),
          Text('Fatima',
              style: Theme.of(context).textTheme.bodyMedium),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3)),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: result6.length,
                  itemBuilder: (
                      context , index){
                    return GestureDetector(
                      onTap: (){
                        print("============ rote tapped ==================");
                        print("============ ${result6[index].route} ==================");
                        Navigator.of(context).pushNamed(result6[index].route);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: kDefaultPadding,
                            top: kDefaultPadding
                        ),
                        padding: EdgeInsets.all(kDefaultPadding/2),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(kDefaultPadding),
                            boxShadow:[
                              BoxShadow(
                                color: kTextLightColor,
                                blurRadius: 2.0,

                              )
                            ]


                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  IconButton(onPressed: (){print("------------------------- pressed -------");}, icon: Icon(Icons.add)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(result6[index].route);
                                  }
                                  , child: Text(
                                  result6[index].route,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${result6[index].obtainedMark}/${result6[index].totalMarks}',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: result6[index].totalMarks.toDouble(),
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[700],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(kDefaultPadding),
                                                topRight: Radius.circular(kDefaultPadding),

                                              )
                                          ),
                                        ),
                                        Container(
                                          height: 20.0,
                                          width: result6[index].obtainedMark.toDouble(),
                                          decoration: BoxDecoration(
                                              color: result6[index].grade =='D'
                                                  ? kErrorBorderColor : kOtherColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(kDefaultPadding),
                                                  bottomRight: Radius.circular(kDefaultPadding)
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(result6[index].grade,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w900
                                      ),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),

            ),
          )
        ],
      ),
    );
  }
}
