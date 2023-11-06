part of '../login_page.dart';

class _LoginRegisterButtom extends StatelessWidget {
  const _LoginRegisterButtom();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      spacing: 2,
      runSpacing: 2,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            CuidapetIcons.facebook,
            color: Color(0xFF4267B3),
          ),
          label: Text(
            'Facebook',
            style: TextStyle(
              fontSize: .05.sw,
              color: const Color(0xFF4267B3),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            CuidapetIcons.google,
            color: const Color(0xFFE15031),
            weight: .42.sw,
          ),
          label: Text(
            'Google',
            style: TextStyle(
              fontSize: .05.sw,
              color: const Color(0xFFE15031),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/auth/register');
          },
          icon: Icon(
            Icons.email,
            color: context.primaryDark,
            weight: .42.sw,
          ),
          label: Text(
            'Cadastre-se',
            style: TextStyle(fontSize: .05.sw, color: context.primaryDark),
          ),
        ),
      ],
    );
  }
}
