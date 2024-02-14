part of '../home_page.dart';

// ignore: unused_element
class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;
  const _HomeCategoriesWidget({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = _controller.listCategories;
    return SizedBox(
      height: 130,
      child: Observer(
          builder: (_) {
              return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                final category = categories[index];
                return _CategoriItem(
                  categoryModel: category,
                );
              },
            );
          },
      )
    );
  }
}

class _CategoriItem extends StatelessWidget {
  final SupplierCategoryModel _categoryModel;
  const _CategoriItem({
    Key? key,
    required SupplierCategoryModel categoryModel,
  }) : _categoryModel = categoryModel;
  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColor,
            radius: 30,
            child: Icon(
              categoriesIcons[_categoryModel.type],
              size: 30,
              color: Colors.black,
            ),
          ),
          Text(_categoryModel.name),
        ],
      ),
    );
  }
}
