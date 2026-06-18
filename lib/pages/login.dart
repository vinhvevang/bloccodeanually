import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/login_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.submitError != current.submitError &&
          current.submitError != null,
      listener: (context, state) async {
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
        context.read<LoginCubit>().clearSubmitError();
      },
      builder: (context, state) {
        final loginCubit = context.read<LoginCubit>();

        return Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Ma so thue',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.tax,
                  onChanged: loginCubit.taxChanged,
                  decoration: InputDecoration(
                    label: const Text('ma so thue'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    errorBorder: OutlineInputBorder(
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
                const Text(
                  'Tai khoan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.userName,
                  onChanged: loginCubit.userNameChanged,
                  decoration: InputDecoration(
                    label: const Text('tai khoan'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    errorBorder: OutlineInputBorder(
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
                const Text(
                  'Mat khau',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue: state.passWord,
                  onChanged: loginCubit.passWordChanged,
                  decoration: InputDecoration(
                    label: const Text('mat khau'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    errorBorder: OutlineInputBorder(
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
                SizedBox(
                  width: double.infinity,
                  height: 81,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: loginCubit.submit,
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
