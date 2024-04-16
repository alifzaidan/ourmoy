import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourmoy/models/categories_model.dart';
import 'package:ourmoy/models/goals_model.dart';
import 'package:ourmoy/services/goals_services.dart';

class AddGoalsScreen extends StatefulWidget {
  const AddGoalsScreen({super.key});

  @override
  State<AddGoalsScreen> createState() => _AddGoalsScreenState();
}

class _AddGoalsScreenState extends State<AddGoalsScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String _selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: const Color(0xFFFFFFFF),
            largeTitle: Text(
              'Add Goals',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'Add Goals',
              style: GoogleFonts.golosText(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            alwaysShowMiddle: false,
            border: Border.all(color: Colors.transparent),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                _inputPriceAndName(),
                _categories(),
                _saveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _inputPriceAndName() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set Your Target 🚀',
            style: GoogleFonts.golosText(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            prefix: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Rp.',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            placeholder: '100.000',
            placeholderStyle: GoogleFonts.golosText(
              fontWeight: FontWeight.w400,
              color: const Color(0xFFAAAAAA),
            ),
            style: GoogleFonts.golosText(
              fontWeight: FontWeight.w500,
            ),
            padding:
                const EdgeInsets.only(top: 20, left: 8, bottom: 20, right: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          CupertinoTextField(
            controller: _nameController,
            placeholder: 'Name Item',
            placeholderStyle: GoogleFonts.golosText(
              fontWeight: FontWeight.w400,
              color: const Color(0xFFAAAAAA),
            ),
            style: GoogleFonts.golosText(
              fontWeight: FontWeight.w500,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Container _categories() {
    return Container(
      height: 280,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Category',
            style: GoogleFonts.golosText(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 180,
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: categoriesList.length - 1,
              itemBuilder: (context, index) {
                final Categories category = categoriesList[index + 1];
                return CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      _selectedCategory = category.name;
                    });
                  },
                  pressedOpacity: 1.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _selectedCategory == category.name
                          ? const Color(0xFF000000)
                          : const Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category.icon,
                          color: _selectedCategory == category.name
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF000000),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          category.name,
                          style: GoogleFonts.golosText(
                            fontSize: 12,
                            color: _selectedCategory == category.name
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _saveButton() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, bottom: 74),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CupertinoButton(
        color: const Color(0xFFFCB226),
        borderRadius: BorderRadius.circular(10),
        onPressed: () {
          if (_priceController.text.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Price cannot be empty'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else if (_nameController.text.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Name item cannot be empty'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else if (_selectedCategory.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Please select a category first!'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            final newGoals = GoalsModel(
              name: _nameController.text,
              price: int.parse(_priceController.text),
              category: _selectedCategory,
              isAchieved: false,
              datetime: DateTime.now().toString(),
            );
            DbGoals.addData(itemgoals: newGoals);
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Success'),
                  content: Text('Goals ${_nameController.text} has been added'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _priceController.clear();
                          _nameController.clear();
                          _selectedCategory = "";
                        });
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text(
          'Save',
          style: GoogleFonts.golosText(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
