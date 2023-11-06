part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final emailEC = TextEditingController();
  final sehnhaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextformField(
              label: 'login',
              obscureText: false,
              controller: emailEC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'valor inavlido';
                }
                return null;
              }),
          const SizedBox(height: 20),
          CustomTextformField(
            label: 'senha',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          CustomButom(
            onPressed: () {
              //formKey.currentState?.validate();
            },
            borderRadius: 15,
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
