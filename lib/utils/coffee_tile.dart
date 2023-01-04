import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({
    Key? key,
    required this.imageUrl,
    required this.coffeeName,
    required this.coffeePrice,
  }) : super(key: key);

  final String imageUrl;
  final String coffeeName;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //coffee image
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    width: 180,
                    height: 140,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 8,
              ),

              // coffee name

              Text(
                coffeeName,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'with almond milk',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
              ),

              const SizedBox(
                height: 12,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ $coffeePrice'),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
