import 'package:fin_track/app/widgets/background_container.dart';
import 'package:fin_track/features/transaction/presentation/pages/your_transaction_list_page.dart';
import 'package:fin_track/features/transaction/presentation/widgets/bar_chart.dart';
import 'package:fin_track/features/transaction/presentation/widgets/transaction_header_text.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isIncomeSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                const TransactionHeaderText(),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.06,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isIncomeSelected = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isIncomeSelected
                                  ? Colors.green
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(width * 0.05),
                            ),
                            child: Center(
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isIncomeSelected = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isIncomeSelected
                                  ? Colors.red
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(width * 0.05),
                            ),
                            child: Center(
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                const MyChart(),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => YourTransactionListPage())),
                  child: Container(
                    height: height * 0.09,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Show all the Transaction",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: width * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
