class PaymentModel {
  final int cardNumber;
  final int cardExpiration;
  final int cardSecurityCode;

  PaymentModel(
      {required this.cardNumber,
      required this.cardExpiration,
      required this.cardSecurityCode});
}
