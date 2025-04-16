class ProductItemModel {
  String imageUrl;
  String name;
  String description;
  double price;
  int count;

  ProductItemModel({required this.price,required this.imageUrl,required this.description,required this.name,this.count = 0});
}