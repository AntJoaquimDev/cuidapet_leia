part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final controler=Modular.get<LoginControllerBase>();


@override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextformField(
              label: 'email',
              obscureText: false,
              controller: _emailEC,
              validator: Validatorless.multiple([
                Validatorless.required('Login obrigatório.'),
                Validatorless.email('Email inválido.')
              ])
                
          ),
          const SizedBox(height: 20),
          CustomTextformField(
            label: 'senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatoria'),
              Validatorless.min(6,'Senha deve conter no minimo 6 caracteres'),
            ])

          ),
          const SizedBox(height: 20),
          CustomButom(
            onPressed: () async{
              final formValid=_formKey.currentState?.validate()??false;
              if (formValid) {
              await  controler.login( _emailEC.text,_passwordEC.text);
              }
            },
            borderRadius: 15,
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
