enum PaymentType {
  card,
  account,
  phone,
  kakao,
  naver,
}

class PaymentMethod {
  final PaymentType type;
  final String name;
  final String icon;
  final bool isDefault;

  const PaymentMethod({
    required this.type,
    required this.name,
    required this.icon,
    this.isDefault = false,
  });
}
