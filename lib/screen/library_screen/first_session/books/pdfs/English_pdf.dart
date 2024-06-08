import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/pdf_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/models/PdfModel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class EnglishPdfContentScreen extends StatelessWidget {
  final int subjectId;
  final String subjectName;

  const EnglishPdfContentScreen({Key? key, required this.subjectId, required this.subjectName}) : super(key: key);

  static const String routeName = 'EnglishPdfContentScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<PdfBloc>(context);
    _bloc.add(FetchPdfItemsBySubjectId(subjectId: subjectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: BlocBuilder<PdfBloc, PdfState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                var pdf = state.items[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Divider(thickness: 1.0, height: kDefaultPadding),
                      Text(
                        pdf.fileName ?? '',
                        style: const TextStyle(color: kTextBlackColor, fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      ElevatedButton(
                        onPressed: () async {
                          final file = await _createFileFromBase64(pdf.fileData!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFView(
                                filePath: file.path,
                              ),
                            ),
                          );
                        },
                        child: Text(pdf.fileName ?? 'View PDF'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(
              child: Text("Error: ${state.error}"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Future<File> _createFileFromBase64(String base64Str) async {
    final bytes = base64Decode(base64Str);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/temp.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }
}
