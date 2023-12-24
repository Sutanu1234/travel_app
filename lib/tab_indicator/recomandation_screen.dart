class RecommendedModel{
  String name;
  String image;


  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name']!, item['image']!))
    .toList();

var recommendationsData = [
  {
    "name": "Raja Ampat,    Indonesia",
    "image": "assets/n4.jpeg",
  },
  {
    "name": "Bali,    Indonesia",
    "image": "assets/n5.jpg"
  },
  {
    "name": "Garden the Bay,    Singapore",
    "image": "assets/n6.jpg"
  },
  {
    "name": "Green Trees and Red \nand Brown House,   Indonesia",
    "image": "assets/n7.jpg",
  },
];

