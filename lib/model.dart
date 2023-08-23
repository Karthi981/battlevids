
class Model{
  String? image;
  String? text;
  Model(this.image,this.text);
}
List lis = modelData.map((e) => Model(e["image"],e["text"])).toList();

var modelData = [
  {"image":"assets/sana.jpg","text":"Twice"},
  {"image":"assets/mv1.jpg","text":"Viking Siege"},
  {"image":"assets/mv2.jpg","text":"John Wick 1"},
  {"image":"assets/mv.jpg","text":"John Wick 2"},
  {"image":"assets/mv4.jpg","text":"John Wick 3"},
  {"image":"assets/mv5.jpg","text":"John Wick 4"},
  {"image":"assets/jy.jpg","text":"JeongYeon"},
  {"image":"assets/mv4.jpg","text":"John Wick 4"},
];
