part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(homeController: homeController),
        Expanded(
          child: Observer(
            builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(microseconds: 500),
                child: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? _HomeSupplierList(homeController)
                    : _HomeSupplierGrid(homeController),
              );
            },
          ),
        )
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;
  const _HomeTabHeader({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Estabelecimentos'),
        const Spacer(),
        InkWell(
          onTap: () => homeController.changeTabSupplier(SupplierPageType.list),
          child: Observer(
            builder: (_) {
              return Icon(
                Icons.view_headline,
                color: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? Colors.black
                    : Colors.grey,
                    size: 40,
              );
            },
          ),
        ),
        InkWell(
          onTap: () =>
              homeController.changeTabSupplier(SupplierPageType.grid),
          child: Observer(
              builder: (_) {
                  return Icon(
                      Icons.view_comfy,
                      color: homeController.supplierPageTypeSelected ==
                              SupplierPageType.grid
                          ? Colors.black
                          : Colors.grey,
                          size: 40,
                    );
              },
          )
        )
      ],
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  final HomeController controller;
  const _HomeSupplierList(this.controller);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Observer(
          builder: (_) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: controller.listSupplierByAddress.length,
                  (context, index) {
                final supplier = controller.listSupplierByAddress[index];
                return _HomeSupplierListItemWidget(supplier);
              }),
            );
          },
        )
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplier;
  const _HomeSupplierListItemWidget(this.supplier);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          supplier.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            Flexible(
                                child: Text(
                                    "${supplier.disance.toStringAsFixed(2)} km de distancia"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade100,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  100,
                ),
                image: DecorationImage(
                  image: NetworkImage(supplier.logo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  final HomeController controller;
  const _HomeSupplierGrid(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
              childCount: controller.listSupplierByAddress.length,
              (context, index) {
            final supplier = controller.listSupplierByAddress[index];
            return _HomeSupplierCardItemWidget(supplier);
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierCardItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplir;
  const _HomeSupplierCardItemWidget(this.supplir,{super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, right: 10, left: 10, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                   supplir.name,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${supplir.disance.toStringAsFixed(2)}km de distancia',
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
          ),
        ),
         Positioned(
          top: 4,
          left: 0,
          right: 0,
          child: Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
              supplir.logo),
            ),
          ),
        ),
      ],
    );
  }
}
