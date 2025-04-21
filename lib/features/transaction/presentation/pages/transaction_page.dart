import 'package:fin_track/app/widgets/background_container.dart';
import 'package:fin_track/core/constants/my_colors.dart';
import 'package:fin_track/features/transaction/presentation/pages/your_transaction_list_page.dart';
import 'package:fin_track/features/transaction/presentation/widgets/my_chart.dart';
import 'package:fin_track/features/transaction/presentation/widgets/transaction_header_text.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Column(
            children: [
              const TransactionHeaderText(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              MyChart(),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => YourTransactionListPage(),
                  ),
                ),
                child: Container(
                  height: size.height * 0.08,
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                    color: MyColors.homeCardColor,
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Show all the Transaction",
                        style: TextStyle(
                          color: MyColors.whiteColor,
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: MyColors.whiteColor,
                        size: size.width * 0.06,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
