import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/providers/product_provider.dart';
import 'package:meal_ai/features/product/widgets/novascore_widget.dart';
import 'package:meal_ai/features/product/widgets/nutriscore_widget.dart';

class ProductDetail extends ConsumerStatefulWidget {
  final ProductModel? product;
  final String? ean;

  static const name = 'product-detail';

  const ProductDetail({
    Key? key,
    this.product,
    this.ean,
  }) : super(key: key);

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetail> {
  late ProductModel product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeProduct();
  }

  Future<void> _initializeProduct() async {
    if (widget.product != null) {
      product = widget.product!;
    } else if (widget.product == null && widget.ean != null) {
      product = await ref
          .read(productProviderProvider.notifier)
          .getProductFromEan(ean: widget.ean!);
    }
    setState(() {
      isLoading = false; // Update state after product is initialized
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLoading ? 'Loading...' : product.name),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.picture != null)
                Center(
                  child: Image.network(
                    product.picture!,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Row(
                children:[
                  product.nutriscore != null ? NutriScoreWidget(score: product.nutriscore!) : Container(),
                  product.novaGroup != null ? NovaScoreWidget(group: product.novaGroup!,) : Container(),
                ]
              ),
              const SizedBox(height: 16),
              if (product.description != null)
                Text(
                  product.description!,
                  style: TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 16),
              // Brand, Amount, and Category in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (product.brand != null)
                    Text(
                      product.brand!,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey),
                    ),
                  if (product.amount != null)
                    Text(
                      product.amount!,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey),
                    ),
                  if (product.category != null)
                    Text(
                      product.category?.name ?? "",
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              // Ingredients
              if (product.ingredients != null)
                _buildSectionTitle("Ingredients"),
              if (product.ingredients != null)
                Text(
                  product.ingredients!,
                  style: TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 16),
              // Indicators (like Contains, Environment)
              _buildSectionTitle("Contains"),
              _buildIndicatorRow([
                _buildIndicator(
                    "Palm Oil",
                    product.ingredients?.contains("Palm Oil") ?? false),
                _buildIndicator("Gluten Free",
                    product.allergens?.contains("Gluten") == false),
                _buildIndicator("Vegetarian",
                    product.tags?.contains("Vegetarian") ?? false),
                _buildIndicator("May not be vegan",
                    product.tags?.contains("Vegan") == false),
              ]),
              const SizedBox(height: 16),
              _buildSectionTitle("Environment"),
              _buildIndicatorRow([
                _buildIndicator("Ultra processed",
                    product.tags?.contains("Ultra processed") ?? false),
                _buildIndicator("High in sugar",
                    product.tags?.contains("High in sugar") ?? false),
                _buildIndicator("Low in salt",
                    product.tags?.contains("Low in salt") ?? false),
              ]),
              const SizedBox(height: 16),
              if (product.lastUpdate != null)
                Text(
                  'Last Update: ${product.lastUpdate}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildIndicatorRow(List<Widget> indicators) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: indicators,
    );
  }

  Widget _buildIndicator(String label, bool isGood) {
    return Row(
      children: [
        Icon(
          isGood ? Icons.check_circle : Icons.cancel,
          color: isGood ? Colors.green : Colors.red,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
