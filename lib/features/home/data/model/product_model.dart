class ProductModel {
  final String title, price, imgUrl, id, productCategory, percent, quantity;
  final int piece;
  final bool isOnSale;
  final double onsale;

  ProductModel(
      {required this.title,
      required this.price,
      required this.onsale,
      required this.imgUrl,
      required this.piece,
      required this.id,
      required this.productCategory,
      required this.isOnSale,
      required this.percent,
      required this.quantity});

  factory ProductModel.fetchdata(fromjson) {
    return ProductModel(
      title: fromjson["productTitle"],
      price: fromjson["price"],
      onsale: fromjson["priceAfterSale"],
      imgUrl: fromjson["imgUrl"],
      piece: fromjson["isPiece"],
      productCategory: fromjson["productCategory"],
      id: fromjson["id"],
      isOnSale: fromjson["isonsale"],
      percent: fromjson["percent"],
      quantity: fromjson["quantity"],
    );
  }
}
