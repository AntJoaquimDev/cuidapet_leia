import 'package:cuidapet_leia/app/core/database/sqlite_connection_factory.dart';
import 'package:cuidapet_leia/app/core/life_cycle/page_life_cicle_state.dart';
import 'package:cuidapet_leia/app/core/mixins/location_mixin.dart';
import 'package:cuidapet_leia/app/models/place_model.dart';
import 'package:cuidapet_leia/app/modules/address/address_controller.dart';
import 'package:cuidapet_leia/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter/material.dart';

import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places/google_places.dart';
import 'package:mobx/mobx.dart';

part 'widgets/addres_item.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState
    extends PageLifeCycleState<AddressController, AddressPage>with LocationMixin {
final reactionDiposers = <ReactionDisposer>[];
       @override
  
  void initState() {
    
    super.initState();
    final reactionService =
        reaction<bool>((_) => controller.locationServiceUnavailable,
            (locationServiceUnavailable) {
      if (locationServiceUnavailable) {
        showDialogLocationServiceUnavailable();
      }
    });



    final reactionLocationPermission = reaction<LocationPermission?>(
        (_) => controller.locationPermission, (locationPermission) {
      if (locationPermission != null &&
          locationPermission == LocationPermission.denied) {
        showDialogLocationDenied(tryAgain: () => controller.myLocation());
      } else if (locationPermission != null &&
          locationPermission == LocationPermission.deniedForever) {
        showDialogLocationDeniedForever();
      }
    });

    reactionDiposers.addAll([reactionService, reactionLocationPermission]);
  }
  @override
  Widget build(BuildContext context) {
    Modular.get<SqliteConnectionFactory>().openConnection();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Text(
                'Adicione ou escolha um endereço',
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
             
              Observer(
                  builder: (_) {

                      return _AddressSearchWidget(
                        key: UniqueKey(),
                              addressSelectedCallback: (place) {
                                controller.goToAddressDetail(place);
                              }, 
                              placeModel: controller.placeModel,
                            );
                  },
              ),
             
              const SizedBox(height: 20),
               ListTile(
                onTap: ()=> controller.myLocation(),
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Localização atual.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                
              ),
              const SizedBox(height: 20),
              Observer(builder: (_) {
                return Column(
                    children: controller.addresses
                        .map((a) => _ItemTile(address: a.address,onTap: () {
                          controller.selectAddress(a);
                        },))
                        .toList());
              }),
              
            ],
          ),
        ),
      ),
    );
  }
}
