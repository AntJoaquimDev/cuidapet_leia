part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

// ignore: deprecated_member_use
class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();
  final controller = Modular.get<RegisterController>();
  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextformField(
            label: 'login',
            obscureText: false,
            controller: _emailEC,
            validator: Validatorless.multiple([
              Validatorless.required('E-mail obrigatório.'),
              Validatorless.email('E-mail inválido.'),
            ]),
          ),
          const SizedBox(height: 20),
          CustomTextformField(
            controller: _passwordEC,
            label: 'Senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatório.'),
              Validatorless.min(6, 'Senha deve conter pelo menos 6 digitos.'),
            ]),
          ),
          const SizedBox(height: 20),
          CustomTextformField(
            label: 'Confirmar Senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Confirma Senha obrigatória.'),
              Validatorless.min(6, 'Senha deve conter pelo menos 6 digitos.'),
              Validator.compare(
                  _passwordEC, 'Senha diferente de confirme a senha')
            ]),
          ),
          const SizedBox(height: 20),
          CustomButom(
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                final email = _emailEC.text;
                final password = _passwordEC.text;
                controller.register(email: email, password: password);
                
                MessageAlert.alert('Usuário cadastrado com sucesso.');
              }
            },
            borderRadius: 15,
            label: 'Cadastrar',
          ),
        ],
      ),
    );
  }
}
