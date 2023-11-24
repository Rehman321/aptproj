class DataModel{
  String name;
  String description;
  String img;
  String location;
  int price;
  int people;
  int stars;

  DataModel({
    required this.name,
    required this.description,
    required this.img,
    required this.location,
    required this.price,
    required this.people,
    required this.stars,
  });
  factory DataModel.fromjson(Map<String, dynamic> json ){
    return DataModel(name: json["name"],
    description: json["description"],
  img: json["img"],
  location: json["location"],
  price: json["price"],
  people: json["people"],
  stars: json["stars"]);
  }
}