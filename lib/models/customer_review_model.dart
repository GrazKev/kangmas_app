import '../utils/images.dart';

List<CustomerReviewModel> customerReviews = getCustomerReviews();

class CustomerReviewModel {
  int id;
  String customerName;
  double rating;
  String detailReview;
  String customerImage;

  CustomerReviewModel(this.id, this.customerName, this.rating, this.detailReview, this.customerImage);
}

List<CustomerReviewModel> getCustomerReviews() {
  List<CustomerReviewModel> list = List.empty(growable: true);
  list.add(
    CustomerReviewModel(
      1,
      "Gracias Kevin",
      3,
      "Bagus untukmu dan pengalaman saya sangat menyenangkan, saya menggunakannya setiap hari dan sangat menyukai aplikasi ini",
      contractor,
    ),
  );
  list.add(
    CustomerReviewModel(
      2,
      "Marry jaine",
      4,
      "Bagus untukmu dan pengalaman saya sangat menyenangkan, saya menggunakannya setiap hari dan sangat menyukai aplikasi ini",
      painter,
    ),
  );
  list.add(
    CustomerReviewModel(
      3,
      "Lain Caster",
      5,
      "Bagus untukmu dan pengalaman saya sangat menyenangkan, saya menggunakannya setiap hari dan sangat menyukai aplikasi ini",
      painter1,
    ),
  );
  return list;
}
