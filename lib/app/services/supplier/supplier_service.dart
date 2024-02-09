
import 'package:cuidapet_leia/app/exceptions/supplier_category_model.dart';

abstract class SupplierService {
  Future<List<SupplierCategoryModel>> getCategories();
}
