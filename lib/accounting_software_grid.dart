import 'package:flutter/material.dart';

class AccountingSoftwareGrid extends StatefulWidget {
  const AccountingSoftwareGrid({super.key});

  @override
  _AccountingSoftwareGridState createState() => _AccountingSoftwareGridState();
}

class _AccountingSoftwareGridState extends State<AccountingSoftwareGrid> {
  final List<Map<String, String>> softwareList = [
    {'name': 'QuickBooks Online', 'image': 'assets/images/quickbook.png'},
    {'name': 'QuickBooks Desktop', 'image': 'assets/images/quickbook.png'},
    {'name': 'Sage', 'image': 'assets/images/sage.png'},
    {'name': 'FreshBooks', 'image': 'assets/images/freshbook.png'},
    {'name': 'Xero', 'image': 'assets/images/xero.png'},
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: softwareList.length,
                itemBuilder: (context, index) {
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
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class SoftwareCard extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;

  const SoftwareCard({
    super.key,
    required this.name,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.red : Colors.black,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image, height: 50),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
