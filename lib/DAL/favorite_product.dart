class FavoriteProduct {
  int _id;
  bool _liked;

  FavoriteProduct(this._id, this._liked);

  int get id => _id;
  bool get liked => _liked;

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      json["id"] as int,
      json["liked"] as String == "true" ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": _id,
    "liked": _liked.toString(),
  };

  void changeLiked() {
    _liked = !_liked;
  }
}