import 'package:fin_track/app/widgets/background_container.dart';
import 'package:fin_track/features/add_expenses/presentation/widgets/date_picker_container.dart';
import 'package:fin_track/features/add_expenses/presentation/widgets/expense_add_box.dart';
import 'package:fin_track/features/add_expenses/presentation/widgets/purpose_dropsown_list.dart';
import 'package:flutter/material.dart';

class AddExpensesPage extends StatefulWidget {
  const AddExpensesPage({super.key});

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? selectedCategory;

  final List<String> categories = [
    'Food',
    'Transport',
    'Shopping',
    'Health',
    'Bills',
    'Entertainment',
    'Others',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final fontSize = screenWidth * 0.08;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expenses'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: BackgroundContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.09),
            child: Column(
              children: [
                ExpenseAddBox(controller: _amountController),
                SizedBox(height: screenHeight * 0.03),
                CustomDropdownList(
                  selectedItem: selectedCategory,
                  items: categories,
                  hintText: 'Select Category',
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                DatePickerContainer(
                  dateController: _dateController,
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Add Expense",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize * 0.6,
                        fontWeight: FontWeight.bold,
                      ),
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
