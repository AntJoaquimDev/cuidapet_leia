part of '../address_page.dart';

class _AddresItem extends StatelessWidget {
  const _AddresItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(Icons.location_on,color: Colors.black,),
        ),
        title: Text('Av. Pinheiro Machadi 2023'),
        subtitle: Text('complemento XX'),
      ),
    );
  }
}
