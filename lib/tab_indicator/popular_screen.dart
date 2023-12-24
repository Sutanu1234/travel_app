class PopularModel{
  String name;
  String image;
  //String color;

  PopularModel(this.name, this.image);
}

List<PopularModel> populars = popularsData
    .map((item) => PopularModel(item['name']!, item['image']!))
    .toList();

var popularsData = [
  {
    "name": "Beaches",
    "image": "assets/beach.png",
    //"color": "0xFFDAA3"
  },
  {
    "name": "Mountains",
    "image": "assets/mountain.png",
    //"color": "0xB5E0FF"
  },
  {
   "name": "Lakes",
    "image": "assets/pond.png",
    //"color": "0xFFB5EA"
  },
  {
    "name": "Forests",
    "image": "assets/forest.png",
    //"color": "0xBBFFB5"
  },
];