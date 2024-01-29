import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  static String routeName = 'ForgetPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نسيت كلمة المرور'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'أدخل عنوان البريد الإلكتروني المرتبط بحسابك لإعادة تعيين كلمة المرور.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'عنوان البريد الإلكتروني'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // تنفيذ إجراء عند النقر على زر إعادة تعيين كلمة المرور
                if (emailController.text.isNotEmpty) {
                  // يمكنك هنا إضافة رمز لإرسال رابط إعادة تعيين كلمة المرور إلى البريد الإلكتروني
                  print('تم إرسال رابط إعادة تعيين كلمة المرور إلى: ${emailController.text}');
                } else {
                  // إذا كان البريد الإلكتروني فارغًا
                  print('يرجى إدخال عنوان بريد إلكتروني صحيح.');
                }
              },
              child: Text('إعادة تعيين كلمة المرور'),
            ),
          ],
        ),
      ),
    );
  }
}



































/*
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  static String routeName = 'ForgetPassword';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نسيت كلمة المرور'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'أدخل عنوان البريد الإلكتروني المرتبط بحسابك لإعادة تعيين كلمة المرور.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
            //  controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'عنوان البريد الإلكتروني'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // تنفيذ إجراء عند النقر على زر إعادة تعيين كلمة المرور
                // if (emailController.text.isNotEmpty) {
                //   // يمكنك هنا إضافة رمز لإرسال رابط إعادة تعيين كلمة المرور إلى البريد الإلكتروني
                //   print('تم إرسال رابط إعادة تعيين كلمة المرور إلى: ${emailController.text}');
                // } else {
                //   // إذا كان البريد الإلكتروني فارغًا
                //   print('يرجى إدخال عنوان بريد إلكتروني صحيح.');
                // }
              },
              child: Text('إعادة تعيين كلمة المرور'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
