import 'package:flutter/material.dart';

final healthColor = Color.fromARGB(255, 76, 175, 80);
final foodColor = Color.fromARGB(255, 227, 204, 5);
final shoppingColor = Color.fromARGB(255, 33, 150, 243);
final movieRentColor = Color.fromARGB(255, 255, 87, 34);
final utilitiesColor = Color.fromARGB(255, 3, 169, 244);
final transportColor = Color.fromARGB(255, 255, 152, 0);
final subscriptionsColor = Color.fromARGB(255, 156, 39, 176);
final savingsColor = Color.fromARGB(255, 0, 150, 136);


  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Food',
      'subtitle': 'Today',
      'amount': '500',
      'icon': Icons.restaurant,
      'color': foodColor,
    },
    {
      'title': 'Shopping',
      'subtitle': 'Yesterday',
      'amount': '2000',
      'icon': Icons.shopping_cart,
      'color': shoppingColor,
    },
    {
      'title': 'Movie Rent',
      'subtitle': 'Last Week',
      'amount': '800',
      'icon': Icons.movie,
      'color': movieRentColor,
    },
    {
      'title': 'Health',
      'subtitle': 'Yesterday',
      'amount': '1200',
      'icon': Icons.local_hospital,
      'color': healthColor,
    },
    {
      'title': 'Transport',
      'subtitle': 'Today',
      'amount': '150',
      'icon': Icons.directions_car,
      'color': transportColor,
    },
    {
      'title': 'Utilities',
      'subtitle': 'This Month',
      'amount': '700',
      'icon': Icons.water_damage,
      'color': utilitiesColor,
    },
    {
      'title': 'Subscriptions',
      'subtitle': 'Monthly',
      'amount': '500',
      'icon': Icons.subscriptions,
      'color': subscriptionsColor,
    },
    {
      'title': 'Savings',
      'subtitle': 'Deposit',
      'amount': '1000',
      'icon': Icons.savings,
      'color': savingsColor,
    },
  ];


class TransactionHomeList extends StatelessWidget {
  const TransactionHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.8,
      width: size.width,
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: const Color.fromARGB(60, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * 0.04),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return _transactionItems(
                  size: size,
                  circleColor: transaction['color'],
                  icon: transaction['icon'],
                  title: transaction['title'],
                  subtitle: transaction['subtitle'],
                  amount: transaction['amount'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionItems({
    required Size size,
    required Color circleColor,
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.width * 0.05),
      child: Row(
        children: [
          CircleAvatar(
            radius: size.width / 15,
            backgroundColor: circleColor,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: size.width * 0.042,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: size.width * 0.034,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "- ₹$amount",
            style: TextStyle(
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
    );
  }
}
