import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';




  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Food',
      'subtitle': 'Today',
      'amount': '500',
      'icon': Icons.restaurant,
      'color': MyColors.foodColor,
    },
    {
      'title': 'Shopping',
      'subtitle': 'Yesterday',
      'amount': '2000',
      'icon': Icons.shopping_cart,
      'color': MyColors.shoppingColor,
    },
    {
      'title': 'Movie Rent',
      'subtitle': 'Last Week',
      'amount': '800',
      'icon': Icons.movie,
      'color': MyColors.redColor,
    },
    {
      'title': 'Health',
      'subtitle': 'Yesterday',
      'amount': '1200',
      'icon': Icons.local_hospital,
      'color': MyColors.greenColor,
    },
    {
      'title': 'Transport',
      'subtitle': 'Today',
      'amount': '150',
      'icon': Icons.directions_car,
      'color': MyColors.transportColor,
    },
    {
      'title': 'Utilities',
      'subtitle': 'This Month',
      'amount': '700',
      'icon': Icons.water_damage,
      'color': MyColors.utilitiesColor,
    },
    {
      'title': 'Subscriptions',
      'subtitle': 'Monthly',
      'amount': '500',
      'icon': Icons.subscriptions,
      'color': MyColors.subscriptionsColor,
    },
    {
      'title': 'Savings',
      'subtitle': 'Deposit',
      'amount': '1000',
      'icon': Icons.savings,
      'color': MyColors.savingsColor,
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
        color: MyColors.transactionHomeListColor,
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
                  color: MyColors.whiteColor,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w500,
                  color: MyColors.lightTextColor,
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
              color: MyColors.balckColor,
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
                  color: MyColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: size.width * 0.034,
                  color: MyColors.lightTextColor,
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
              color: MyColors.redColor,
            ),
          )
        ],
      ),
    );
  }
}
