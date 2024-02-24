import 'package:cuidapet_leia/app/core/life_cycle/page_life_cicle_state.dart';
import 'package:cuidapet_leia/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/supplier_controller.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/widegts/supplier_detail.dart';
import 'package:cuidapet_leia/app/modules/core/supplier/widegts/supplier_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SupplierPage extends StatefulWidget {
  final _supplierId;

  const SupplierPage({super.key, required int supplierId})
      : _supplierId = supplierId;

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState
    extends PageLifeCycleState<SupplierController, SupplierPage> {
  late ScrollController _scrollController;
  bool sliverCollapsed = false;
  final sliverCollapsedVN = ValueNotifier(false);

  @override
  Map<String, dynamic>? get params => {'supplierId': widget._supplierId};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = true;
      } else if (_scrollController.offset <= 180 &&
          !_scrollController.position.outOfRange) {
        sliverCollapsedVN.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Observer(
          builder: (_) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: controller.totalSelected > 0 ? 1 : 0,
              child: FloatingActionButton.extended(
                label: const Text('Fazer Agendamento'),
                onPressed:(){
                   controller.goToSchedule();
                },
                icon: const Icon(Icons.schedule),
                backgroundColor: context.primaryColor,
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Observer(
          builder: (_) {
            final supplier = controller.supplierModel;
            if (supplier == null) {
              return const Text('Buscando dados do Fornecedor.');
            }
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  title: ValueListenableBuilder<bool>(
                    valueListenable: sliverCollapsedVN,
                    builder: (_, sliverCollapsedValue, child) {
                      return Visibility(
                        visible: sliverCollapsedValue,
                        child: Text(
                          supplier.name,
                        ),
                      );
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle
                    ],
                    background: Image.network(
                      supplier.logo,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox.shrink(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SupplierDetail(supplier: supplier,controller: controller),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Serviços (${controller.totalSelected}) Selecionado${controller.totalSelected > 1 ? 's' : ''} ',
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.supplierListServices.length,
                    (context, index) {
                      final service = controller.supplierListServices[index];
                      return SupplierServiceWidget(
                        service: service,
                        supplierController: controller,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
