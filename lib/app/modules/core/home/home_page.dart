import 'package:cuidapet_leia/app/core/life_cycle/page_life_cicle_state.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/entities/address_entity.dart';
import 'package:cuidapet_leia/app/exceptions/supplier_category_model.dart';
import 'package:cuidapet_leia/app/models/supplier_nearby_me_model.dart';
import 'package:cuidapet_leia/app/modules/core/home/home_controller.dart';
import 'package:cuidapet_leia/app/modules/core/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'widgets/home_address_widgets.dart';
part 'widgets/home_categories_widget.dart';
part 'widgets/home_supplier_tab.dart';

class HomePage extends StatefulWidget {
   


  const HomePage(
   
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;

  @override
  Map<String, dynamic>? get params => {'testes': 'testes params'};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            HomeAppBar(controller),
            SliverToBoxAdapter(
              child: _HomeAddressWidgets(
                controller: controller,
              ),
            ),
            SliverToBoxAdapter(
              child: _HomeCategoriesWidget(
                controller: controller,
              ),
            ),
          ];
        },
        body:  _HomeSupplierTab(homeController: controller,),
      ),
    );
  }
}
