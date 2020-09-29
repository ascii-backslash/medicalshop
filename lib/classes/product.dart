//  Класс для хранения данных о продукте. Содержит необходимые поля и
//  простой конструктор.

class Product
{
  int _id;
  String companyName;
  String productName;
  String description;
  String note;
  String size;
  String image;
  double cost;

  Product(
      this._id,
      this.companyName,
      this.productName,
      this.description,
      this.note,
      this.size,
      this.image,
      this.cost
      );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json["id"] as int,
        json["companyName"] as String,
        json["productName"] as String,
        json["description"] as String,
        json["note"] as String,
        json["size"] as String,
        json["image"] as String,
        json["cost"] as double
    );
  }

  int get id => _id;
}