import 'package:flutter/material.dart';
import 'package:paylync/util/app_util.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({Key? key}) : super(key: key);

  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  final List<Map<String, String>> softwareList = [
    {'name': 'Card Connect', 'image': 'assets/images/cardconnect.png'},
    {'name': 'Paypal', 'image': 'assets/images/paypal.png'},
    {'name': 'Stripe', 'image': 'assets/images/stripe.png'},
    {'name': 'NMI', 'image': 'assets/images/nmi.png'},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: List.generate(softwareList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: SoftwareCard(
              name: softwareList[index]['name']!,
              image: softwareList[index]['image']!,
              isSelected: index == selectedIndex,
            ),
          );
        }),
      ),
    );
  }
}

class SoftwareCard extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;

  const SoftwareCard({
    Key? key,
    required this.name,
    required this.image,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Adjust the width as needed for responsiveness
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.red : Colors.black,
                width: isSelected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Image.asset(image, width: 150, height: 100), // Use Image.asset
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
