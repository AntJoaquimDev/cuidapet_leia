part of '../home_page.dart';

// ignore: unused_element
class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;

  const _HomeCategoriesWidget({
    required HomeController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    //final categories = _controller.listCategories;
    return SizedBox(
        height: 130,
        child: Observer(
          builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _controller.listCategories.length,
              itemBuilder: (context, index) {
                final category = _controller.listCategories[index];
                return _CategoriItem(category, _controller);
              },
            );
          },
        ));
  }
}

class _CategoriItem extends StatelessWidget {
  final SupplierCategoryModel _categoryModel;
  final HomeController _controller;

  const _CategoriItem(this._categoryModel, this._controller);

  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
    'D': Icons.store_mall_directory,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _controller.filterSupplierCategory(_categoryModel),
     
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return CircleAvatar(
                  backgroundColor:
                      _controller.supplierCategoryFilterSelected?.id ==
                              _categoryModel.id
                          ? context.primaryColor
                          : context.primaryLight,
                  radius: 30,
                  child: Icon(
                    categoriesIcons[_categoryModel.type],
                    size: 30,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(_categoryModel.name),
          ],
        ),
      ),
    );
  }
}
