part of '../address_page.dart';

class _AddresItem extends StatelessWidget {
final String address;
final String additional;
final VoidCallback onTap;

  const _AddresItem(
   
    { required this.address,
     required this.additional,
     required this.onTap}
  ) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  ListTile(
        onTap: onTap,
        leading:const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(Icons.location_on,color: Colors.black,),
        ),
        title: Text(address),
        subtitle: Text(additional),
      ),
    );
  }
}
