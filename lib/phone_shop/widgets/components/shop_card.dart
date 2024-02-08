import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final String title;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String category;
  final String image;

  const ShopCard({
    super.key,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xFFFFFFFF),
      shadowColor: Colors.black.withOpacity(0.04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _Image(image: image),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Title(title: title),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Category(category: category),
                            const SizedBox(height: 4),
                            _Stars(rating: rating),
                            const SizedBox(height: 4),
                            _Stock(stock: stock),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _Discount(discountPercentage: discountPercentage),
                          const SizedBox(height: 6),
                          _Price(price: price),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final double price;

  const _Price({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${price.toStringAsFixed(2)} \$',
      textAlign: TextAlign.right,
      style: const TextStyle(
        color: Color(0xFFE33434),
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
  }
}

class _Discount extends StatelessWidget {
  final double discountPercentage;

  const _Discount({
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '-${discountPercentage.toStringAsFixed(2)}%',
      textAlign: TextAlign.right,
      style: const TextStyle(
        color: Color(0xFF43C16E),
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
  }
}

class _Stock extends StatelessWidget {
  final int stock;

  const _Stock({
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'On stock: $stock',
      style: const TextStyle(
        color: Color(0xFF4A4949),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final String category;

  const _Category({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: const TextStyle(
        color: Color(0xFF34A4E3),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Color(0xFF121212),
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: 'Inter',
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final double rating;

  const _Stars({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$rating',
          style: const TextStyle(
            color: Color(0xFFFFC046),
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(width: 4),
        ...List.generate(
          5,
          (index) => Icon(
            index < rating.ceil() ? Icons.star : Icons.star_border,
            color: index < rating.floor()
                ? const Color(0xFFFFC046)
                : const Color(0xFFC0C0C0),
            size: 10,
          ),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79,
      height: 79,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFF3F3F3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}