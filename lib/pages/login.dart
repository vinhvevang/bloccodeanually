import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:practice_login_product_sds/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tax = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String? taxError;
  String? nameError;
  String? passWordError;

  void handleLogin() {
    setState(() {
      taxError = null;
      nameError = null;
      passWordError = null;
      if (tax.text != " 11111") {
        taxError = "can du 5 so ";
      }
      if (userName.text != "demo") {
        nameError = "khong duoc trong";
      }
      if (passWord.text != "123456") {
        passWordError = " 6< password < 50";
      }
      if (tax.text == "11111" &&
          userName.text == "demo" &&
          passWord.text == "123456") {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("thong bao"),
              content: Text("Thong tin khong hop le"),
              actions: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ],
            );
          },
        );
      }
      //     Hive.openBox("loginBox");
      //  final  Box box = Hive.box("loginBox");
      //   box.put("loginBox", '');
      //   box.put("userName", '');
      //   box.put("userName", '');
      //   box.put("passWord", '');
    });
  }

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box("loginBox");
    // box.get("loginBox", defaultValue: true);
    // box.get("userName", defaultValue: '');
    // box.get("userName", defaultValue: '');
    // box.get("passWord", defaultValue: '');
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("Ma so thue", style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: tax,
              decoration: InputDecoration(
                label: Text("ma so thue"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            if (taxError != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(taxError!, style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 30),
            Text("Tai khoan", style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: userName,
              decoration: InputDecoration(
                label: Text("tai khoan"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            if (nameError != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(nameError!, style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 30),
            Text("Mat khau", style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: passWord,
              decoration: InputDecoration(
                label: Text("mat khau"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            if (passWordError != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(passWordError!, style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 81,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: handleLogin,
                child: Text("Dang nhap", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
