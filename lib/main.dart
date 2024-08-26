import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LowercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Chỉ cho phép chữ thường
    String lowercaseText = newValue.text.toLowerCase();
    //Chỉ cho phép nhập chữ cái, không cho phép nhập số
    String newTextInt = newValue.text.replaceAll(RegExp(r'\d'), '');
    //Không cho phép nhập ký tự @ và số, chỉ cho phép nhập chữ cái
    String NewTextSpecial=newValue.text.replaceAll('@','');
    //Không cho phép nhập ký tự @, số và ký tự đặc biệt, chỉ cho phép nhập chữ cái
    String newTextSpecial = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
    // Kiểm tra nếu người dùng gõ ký tự không phải chữ thường, số, ký tự @ và ký tự đặc biệt thì không cho hiển thị
    if (newValue.text != lowercaseText||newValue.text!=newTextInt||newValue.text!=NewTextSpecial||newValue.text!=newTextSpecial) {
      return oldValue; // Giữ nguyên giá trị cũ
    }

    return newValue; // Cập nhật giá trị mới nếu hợp lệ
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Text Input Demo',
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          inputFormatters: [LowercaseTextInputFormatter()],
          decoration: InputDecoration(
            labelText: 'Input Text',
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Validate Input',
    debugShowCheckedModeBanner: false,
    home: MyTextField(),
  ));
}
