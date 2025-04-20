import 'package:fin_track/app/widgets/background_container.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory;

  final List<String> _categories = [
    'Food',
    'Transport',
    'Shopping',
    'Health',
    'Other'
  ];

  void _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Category',
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.018),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      SizedBox(width: width * 0.03),
                      Text(
                        _selectedDate == null
                            ? 'Pick a Date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_amountController.text.isNotEmpty &&
                        _selectedCategory != null &&
                        _selectedDate != null) {
                      // Submit logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Expense Added')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please complete all fields')),
                      );
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Expense"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
