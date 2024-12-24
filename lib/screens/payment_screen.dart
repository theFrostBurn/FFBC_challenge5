import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:challenge5/providers/cart_provider.dart';
import 'package:challenge5/models/payment_method.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? _selectedMethod;
  bool _isProcessing = false;

  final List<PaymentMethod> _paymentMethods = [
    const PaymentMethod(
      type: PaymentType.card,
      name: '신용/체크카드',
      icon: '💳',
      isDefault: true,
    ),
    const PaymentMethod(
      type: PaymentType.account,
      name: '계좌이체',
      icon: '🏦',
    ),
    const PaymentMethod(
      type: PaymentType.phone,
      name: '휴대폰 결제',
      icon: '📱',
    ),
    const PaymentMethod(
      type: PaymentType.kakao,
      name: '카카오페이',
      icon: '🟡',
    ),
    const PaymentMethod(
      type: PaymentType.naver,
      name: '네이버페이',
      icon: '🟢',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedMethod = _paymentMethods.firstWhere((m) => m.isDefault);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          '결제하기',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      child: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, cart, child) {
            final restaurantId = cart.items.keys.first;
            final items = cart.items[restaurantId]!;

            return SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 결제 수단
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '결제 수단',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CupertinoColors.systemGrey3,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: _paymentMethods.map((method) {
                              return CupertinoListTile(
                                title: Row(
                                  children: [
                                    Text(method.icon),
                                    const SizedBox(width: 8),
                                    Text(method.name),
                                  ],
                                ),
                                trailing: _selectedMethod == method
                                    ? const Icon(
                                        CupertinoIcons.check_mark_circled_solid,
                                        color: CupertinoColors.activeBlue,
                                      )
                                    : null,
                                onTap: () {
                                  setState(() {
                                    _selectedMethod = method;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 주문 내역
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주문 내역',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...items.map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${item.menuItem.name} × ${item.quantity}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                                Text(
                                  '${item.totalPrice}원',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            color: CupertinoColors.systemGrey3,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '배달비',
                              style: TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.black,
                              ),
                            ),
                            Text(
                              '3,000원',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // 결제하기 버튼
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '총 결제금액',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.black,
                              ),
                            ),
                            Text(
                              '${cart.totalAmount + 3000}원',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CupertinoButton(
                            color: CupertinoColors.systemIndigo,
                            borderRadius: BorderRadius.circular(25),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            onPressed: _isProcessing
                                ? null
                                : () async {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    // 결제 처리 중 로딩 표시
                                    showCupertinoDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const CupertinoActivityIndicator(
                                                radius: 14,
                                              ),
                                              const SizedBox(height: 16),
                                              const Text(
                                                '결제 처리 중...',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: CupertinoColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );

                                    // 3초 대기
                                    await Future.delayed(
                                        const Duration(seconds: 2));

                                    // 로딩 다이얼로그 닫기
                                    Navigator.pop(context);

                                    // 결제 완료 다이얼로그 표시
                                    showCupertinoDialog(
                                      context: context,
                                      builder: (context) =>
                                          CupertinoAlertDialog(
                                        title: const Text('결제 완료'),
                                        content: const Text(
                                          '결제가 완료되었습니다.\n어디로 이동하시겠습니까?',
                                        ),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text('목록으로'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context); // 다이얼로그 닫기
                                              Navigator.pop(
                                                  context); // 결제 화면 닫기
                                              Navigator.pop(
                                                  context); // 장바구니 화면 닫기
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            isDefaultAction: true,
                                            child: const Text('홈으로'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context); // 다이얼로그 닫기
                                              Navigator.popUntil(
                                                context,
                                                (route) => route.isFirst,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );

                                    setState(() {
                                      _isProcessing = false;
                                    });
                                  },
                            child: _isProcessing
                                ? const CupertinoActivityIndicator(
                                    color: CupertinoColors.white,
                                  )
                                : const Text(
                                    '결제하기',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
