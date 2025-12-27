// import '../models/product_model.dart';
// import '../providers/api_provider.dart';

// class ProductRepository {
//   final ApiProvider apiProvider;

//   ProductRepository(this.apiProvider);

//   Future<List<ProductModel>> fetchProducts() async {
//     final response = await apiProvider.getProducts();

//     final List list = response.data['data'];

//     return list.map((e) => ProductModel.fromJson(e)).toList();
//   }
// }
