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
}