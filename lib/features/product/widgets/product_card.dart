import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final GestureTapCallback? onTap;

  const ProductCard({Key? key, required this.product, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Image section
            Text(
              product.category?.emoji ?? '🍽️',
              style: AppTextStyles().emojiCategory,
            ),
            const SizedBox(width: 16),
            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe title
                  Text(
                    product.description ?? product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        product.brand ?? 'Unknown',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        " ${product.amount ?? ''}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}