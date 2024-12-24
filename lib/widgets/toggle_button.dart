import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final bool isFirstSelected;
  final VoidCallback onFirstPressed;
  final VoidCallback onSecondPressed;

  const ToggleButton({
    super.key,
    required this.isFirstSelected,
    required this.onFirstPressed,
    required this.onSecondPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onFirstPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isFirstSelected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '이 집 맛있어요! 🔥',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isFirstSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onSecondPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isFirstSelected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '방금 옆집에서 시킨 집! 📈',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !isFirstSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
