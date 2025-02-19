import 'package:flutter/material.dart';
import 'package:paylync/util/app_util.dart';

class SubscriptionPlans extends StatefulWidget {
  const SubscriptionPlans({super.key});

  @override
  _SubscriptionPlansState createState() => _SubscriptionPlansState();
}

class _SubscriptionPlansState extends State<SubscriptionPlans> {
  int selectedPlanIndex = 0; // Default selection

  final List<Map<String, dynamic>> plans = [
    {
      'title': 'LITE PLAN',
      'price': '\$1.00',
      'features': [
        '10 text payments every month',
        'Branded checkout page',
        'Unlimited payment links',
        'Invoice clicked/viewed notifications',
        'Keep your own gateway',
      ],
    },
    {
      'title': 'PRO PLAN',
      'price': '\$29.95',
      'features': [
        '25 text payments every month',
        'Branded checkout page',
        'Unlimited payment links',
        'Invoice clicked/viewed notifications',
        'Keep your own gateway',
        'Surcharging',
        'PayLync Extension',
        'Customer Portal',
        'Batch Payments',
        'Payment Reminders',
      ],
    },
  ];

  void selectPlan(int index) {
    setState(() {
      selectedPlanIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaSize(context).width > 600 ? 600 : 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 300;
            return isWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      plans.length,
                      (index) => GestureDetector(
                        onTap: () => selectPlan(index),
                        child: PlanCard(
                          plan: plans[index],
                          isSelected: selectedPlanIndex == index,
                        ),
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      plans.length,
                      (index) => GestureDetector(
                        onTap: () => selectPlan(index),
                        child: PlanCard(
                          plan: plans[index],
                          isSelected: selectedPlanIndex == index,
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final Map<String, dynamic> plan;
  final bool isSelected;

  const PlanCard({super.key, required this.plan, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.red : Colors.black,
          width: isSelected ? 3 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            plan['title'],
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
          ),
          SizedBox(height: 8),
          Text(
            plan['price'],
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: plan['features'].map<Widget>((feature) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                        child: Text(feature, style: TextStyle(fontSize: 14))),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
