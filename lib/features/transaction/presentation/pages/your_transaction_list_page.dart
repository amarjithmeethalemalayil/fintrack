import 'package:fin_track/core/constants/my_colors.dart';
import 'package:fin_track/features/transaction/presentation/widgets/transaction_box.dart';
import 'package:flutter/material.dart';

class YourTransactionListPage extends StatelessWidget {
  const YourTransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Your Transactions'),
        backgroundColor: MyColors.transparentColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: MyColors.whiteColor,
        ),
        iconTheme: IconThemeData(color: MyColors.whiteColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: MyColors.homeDradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return TransactionBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
