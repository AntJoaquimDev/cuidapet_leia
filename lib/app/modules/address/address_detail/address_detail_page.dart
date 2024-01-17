import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/core/ui/widgets/custom_butom.dart';
import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:cuidapet_leia/app/modules/address/address_detail/address_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

class AddressDetailPage extends StatefulWidget {
  final PlaceModel place;
  const AddressDetailPage({super.key, required this.place});

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  final _additionalEC = TextEditingController();
  //final controller = Modular.get<AddressDetailController>();
  //late final ReactionDisposer addressEntityDisposer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: context.primaryColor),
          elevation: 0,
        ),
        body: Column(
          children: [
            Text(
              'Confirme seu endereço.',
              style: context.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    widget.place.lat,
                    widget.place.lng,
                  ),
                  zoom: 16,
                ),
                markers: {
                  Marker(
                      markerId: MarkerId('AddressId'),
                      position: LatLng(
                        widget.place.lat,
                        widget.place.lng,
                      ),
                      infoWindow: InfoWindow(title: widget.place.address)),
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.place.address,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Complemento',
                  suffixIcon: Icon(Icons.edit),
                ),
              ),
            ),
            
            SizedBox(
              width: .9.sw,
              height: 60.h,
              child: CustomButom(onPressed: () {}, label: 'Salva'),
            ),
           const SizedBox(
               height: 20,
            ),
          ],
        ));
  }
}
