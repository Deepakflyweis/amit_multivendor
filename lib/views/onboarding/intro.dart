class IntroModel {
  String? image;
  String? title;
  String? discription;
  IntroModel({this.image, this.title, this.discription});
}

List<IntroModel> contents = [
  IntroModel(
    title: 'Buy favourite items',
    image: 'lib/assets/asset/on1.png',
    discription: 'find your favourite products that you want to buy easily',
  ),
  IntroModel(
    title: 'Secure payments',
    image: 'lib/assets/asset/on2.png',
    discription: 'pay for the products you buy safely and easily',
  ),
  IntroModel(
    title: 'Product Delivery',
    image: 'lib/assets/asset/on3.png',
    discription: 'your product is delivered to your home safely and securely.',
  )
];
