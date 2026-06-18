import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/login_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state.submitError != null) {
          await showDialog<void>(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('thong bao'),
                content: const Text('Thong tin khong hop le'),
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    icon: const Icon(Icons.close),
                  ),
                ],
              );
            },
          );

          context.read<LoginBloc>().add(const LoginSubmitErrorCleared());
        }
      },

      builder: (context, state) {
        final loginBloc = context.read<LoginBloc>();

        return Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),

                /// TAX
                const Text(
                  'Ma so thue',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.tax,
                  onChanged: (value) =>
                      loginBloc.add(LoginTaxChanged(value)),
                  decoration: InputDecoration(
                    label: const Text('ma so thue'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                if (state.taxError != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      state.taxError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 30),

                /// USERNAME
                const Text(
                  'Tai khoan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.userName,
                  onChanged: (value) =>
                      loginBloc.add(LoginUserNameChanged(value)),
                  decoration: InputDecoration(
                    label: const Text('tai khoan'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                if (state.nameError != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      state.nameError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 30),

                /// PASSWORD
                const Text(
                  'Mat khau',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.passWord,
                  onChanged: (value) =>
                      loginBloc.add(LoginPassWordChanged(value)),
                  decoration: InputDecoration(
                    label: const Text('mat khau'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                if (state.passWordError != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      state.passWordError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 30),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 81,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: () =>
                        loginBloc.add(const LoginSubmitRequested()),
                    child: const Text(
                      'Dang nhap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}