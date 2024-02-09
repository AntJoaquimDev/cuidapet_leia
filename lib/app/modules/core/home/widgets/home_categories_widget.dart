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

      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,//categories.length,
        itemBuilder: (_,index){
          //final category=categories[index];
          //return _CategoriItem(categoryModel:category,);
          return _CategoriItem();
        },
      ),
    );
  }
}

class _CategoriItem extends StatelessWidget {
//final SupplierCategoryModel _categoryModel;
  
  @override
  Widget build(BuildContext context) {
   return Container(
    margin: const EdgeInsets.all(20),
    child: 
     Column(
      children: [
        CircleAvatar(
            backgroundColor:context.primaryLight,
            radius: 30,
            child: Icon(
             // categoriesIcons[_categoryModel.type],
             Icons.pets,
              size: 30,
              color: Colors.black,
            ),
          ),
        const Text('Pet-Leia'),
      ],
    ),
    ) ;
  }
}
