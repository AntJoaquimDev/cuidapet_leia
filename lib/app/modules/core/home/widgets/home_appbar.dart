
import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/modules/core/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends SliverAppBar {
  HomeAppBar(HomeController controller,{super.key}):super(
          expandedHeight: 100,
          collapsedHeight: 100,
          elevation: 0,
          flexibleSpace: _CuidapetAppBar(controller: controller),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          pinned: true,
        );


}
  class _CuidapetAppBar extends StatelessWidget {
  final HomeController controller;
  
  const _CuidapetAppBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text('Cuidapet-Leia'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            controller.goToAddressPage();
          },
          icon: const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
      ],
      flexibleSpace: Stack(
        children: [
          Container(
            height: 110.h,
            color: context.primaryColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: .9.sw,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(25),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey,
                    ),
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
