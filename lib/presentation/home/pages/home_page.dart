import 'package:fin_track/presentation/home/widgets/expenses_section.dart';
import 'package:fin_track/presentation/home/widgets/home_background_container.dart';
import 'package:fin_track/presentation/home/widgets/transaction_home_list.dart';
import 'package:fin_track/presentation/home/widgets/user_circle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzOvZIVdARUmeQcynedQ_nAdCA9LkgDOMD5Q&s";
    return Scaffold(
      body: HomeBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserCircle(
                  imageUrl: imageUrl,
                  username: "Amar",
                ),
                SizedBox(
                  height: size.width / 10,
                ),
                ExpensesSection(),
                SizedBox(
                  height: size.width / 10,
                ),
                TransactionHomeList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

