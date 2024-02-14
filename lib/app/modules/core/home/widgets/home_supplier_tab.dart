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
                duration: const Duration(microseconds: 400),
                child: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? const _HomeSupplierList()
                    : const _HomeSupplierGrid(),
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
  const _HomeTabHeader({
    required this.homeController,
  });

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
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
            return InkWell(
              onTap: () =>
                  homeController.changeTabSupplier(SupplierPageType.grid),
              child: Icon(
                Icons.view_comfy,
                color: homeController.supplierPageTypeSelected ==
                        SupplierPageType.grid
                    ? Colors.black
                    : Colors.grey,
              ),
            );
          },
        )
      ],
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) =>Text('Suplier Grid') ,)
        ),
      ],
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  const _HomeSupplierList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => _HomeSupplierListItemWidget() ,)
        ),
      ],
    );
  }



  
  
}
class _HomeSupplierListItemWidget extends StatelessWidget {
  const _HomeSupplierListItemWidget();

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
                    margin:const EdgeInsets.only(left: 50),
                    child:const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Clinica central ABC",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                         SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                          Flexible(child: Text("1.34 km de distancia"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child:const Icon(
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
            margin:const EdgeInsets.only(top: 5),
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
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/26/97/04/269704fb8eb42f30b21ade69d78c2c7c.jpg'),
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
