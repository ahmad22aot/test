class ItemModel {
  final name;
  final title;
  final image;
  final price;
  final id;
  int quantity;

  ItemModel(
      {this.name,
      this.title,
      this.image,
      this.id,
      required this.quantity,
      this.price});
}
