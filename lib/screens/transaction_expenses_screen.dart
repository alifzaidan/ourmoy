import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourmoy/models/categories_model.dart';
import 'package:ourmoy/models/transactions_model.dart';
import 'package:ourmoy/services/accounts_services.dart';
import 'package:ourmoy/services/transactions_services.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String _selectedAccount = "";
  String _selectedCategory = "";
  int _accountBalance = 0;
  String _nameAccount = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _inputNominalAndDesc(),
        _categories(),
        _accounts(),
        _saveButton(),
      ],
    );
  }

  Container _inputNominalAndDesc() {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          CupertinoTextField(
            controller: _nominalController,
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
            controller: _descController,
            placeholder: 'Description Item',
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

  Container _accounts() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Accounts',
                style: GoogleFonts.golosText(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                CupertinoIcons.plus_circle_fill,
                color: Color(0xFF000000),
                size: 25,
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: DbAccounts.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot accounts = snapshot.data!.docs[index];

                      final formatter = NumberFormat.currency(
                          locale: 'id_ID', symbol: 'Rp. ');
                      String formattedBalance =
                          formatter.format(accounts.get('balance'));

                      return Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(int.parse(accounts.get('color'))),
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/card_effect.png'),
                            alignment: Alignment.bottomRight,
                            opacity: 0.8,
                          ),
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          pressedOpacity: 1.0,
                          onPressed: () {
                            setState(() {
                              _selectedAccount = accounts.id;
                              _accountBalance = accounts.get('balance');
                              _nameAccount = accounts.get('shortName');
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    accounts.get('shortName'),
                                    style: GoogleFonts.golosText(
                                      fontSize: 18,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Icon(
                                    _selectedAccount == accounts.id.toString()
                                        ? CupertinoIcons.checkmark_circle_fill
                                        : CupertinoIcons.circle,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                formattedBalance,
                                style: GoogleFonts.golosText(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
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
          if (_nominalController.text.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Nominal cannot be empty'),
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
          } else if (_descController.text.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Description cannot be empty'),
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
          } else if (_selectedAccount.isEmpty) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Error'),
                  content: const Text('Please select an account first!'),
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
            final newTransaction = TransactionsModel(
              nominal: int.parse(_nominalController.text),
              description: _descController.text,
              category: _selectedCategory,
              account: _selectedAccount,
              datetime: DateTime.now().toString(),
            );
            // DbTransactions.addData(itemtransactions: newTransaction);
            DbTransactions.addDataByDate(itemtransactions: newTransaction);
            DbAccounts.updateBalance(
              id: _selectedAccount,
              balance: _accountBalance - int.parse(_nominalController.text),
              lastTransaction: DateTime.now().toString(),
            );
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Success'),
                  content: Text(
                      'Withdraw money for ${_descController.text} from $_nameAccount'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _nominalController.clear();
                          _descController.clear();
                          _selectedAccount = "";
                          _selectedCategory = "";
                          _accountBalance = 0;
                          _nameAccount = "";
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
