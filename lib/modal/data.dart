class Datael {
  String img;
  String tittle;
  String descp;
  Datael({this.img, this.tittle, this.descp});
  void setImageAssetPath(String imagePath) {
    img = imagePath;
  }

  void settitle(String title) {
    tittle = title;
  }

  void setdesc(String desc) {
    descp = desc;
  }

  getImagePath() {
    return img;
  }

  gettitle() {
    return tittle;
  }

  getdesc() {
    return descp;
  }
}

List<Datael> getSlides() {
  List<Datael> slides = [];
  Datael datael = Datael();
  //1
  datael.setImageAssetPath("assets/pic1.jpg");
  datael.settitle("Search");
  datael.setdesc("this ia a flutter projects");
  slides.add(datael);

  datael = Datael();
  //2

  datael.setImageAssetPath("assets/pic2.jpg");
  datael.settitle("Search");
  datael.setdesc(
      "this ia a flutter projects sdsdfcsncmxcnx,nc,xncxn,clskdjcsdc,zxlkcslx,cnslk mz,m");
  slides.add(datael);
  datael = Datael();
  //3

  datael.setImageAssetPath("assets/pic1.jpg");
  datael.settitle("DISCOVERY");
  datael.setdesc("This ia a Discovery Channel");
  slides.add(datael);
  return slides;
}
