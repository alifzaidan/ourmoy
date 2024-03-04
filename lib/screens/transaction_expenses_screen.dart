import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourmoy/models/categories_model.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

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
            placeholder: '20.000',
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
            keyboardType: TextInputType.number,
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
      height: 330,
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
                'Category',
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 240,
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                final Categories category = categoriesList[index];

                return Container(
                  // padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category.icon,
                        color: Color(0xFF000000),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        category.name,
                        style: GoogleFonts.golosText(
                          fontSize: 12,
                        ),
                      ),
                    ],
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5478F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alif',
                            style: GoogleFonts.golosText(
                              fontSize: 18,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.checkmark_circle_fill,
                            color: Color(0xFFFFFFFF),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rp. 2.560.000',
                        style: GoogleFonts.golosText(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
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
      margin: const EdgeInsets.only(top: 16, bottom: 62),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CupertinoButton(
        color: const Color(0xFFFCB226),
        borderRadius: BorderRadius.circular(10),
        onPressed: () {},
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
