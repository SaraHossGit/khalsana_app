// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khalsana_app/style/colors.dart';
import 'package:khalsana_app/view/deals/add_deal.dart';

import '../../shared/component/components.dart';
import '../register_screen.dart';

class DealsPopUp extends StatelessWidget {
  var medicineController = TextEditingController();
  var dateController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var notesController = TextEditingController();
  bool isPassword = true;
  IconData suffix = Icons.visibility_off_sharp;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                customizedHeader(title: "Sara Hossam"),

                //Title
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Add Deal",
                      style: TextStyle(
                        color: TextColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),

                //Deals Form
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name of the medicine
                      Text(
                        'Name of the medicine',
                        style: TextStyle(
                          color: TextColor1,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      customizedField(
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Medicine name must not be empty';
                          }
                        },
                        controller: medicineController,
                        hint: 'ex: Panadol Extra',
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Expiration Date
                      Text(
                        'Expiration Date',
                        style: TextStyle(
                          color: TextColor1,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      customizedField(
                        tapMethod: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2030-12-30'))
                              .then((value) {
                            dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Medicine name must not be empty';
                          }
                        },
                        controller: dateController,
                        hint: 'ex: 30-12-2030',
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Quanitity
                      Text(
                        'Quanitity',
                        style: TextStyle(
                          color: TextColor1,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      customizedField(
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Quantity must not be empty';
                          }
                        },
                        controller: quantityController,
                        hint: 'ex: 3, 2, etc.',
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Price
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Actual Price',
                                  style: TextStyle(
                                    color: TextColor1,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                customizedField(
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'can not be empty';
                                    }
                                  },
                                  controller: priceController,
                                  hint: '25.5',
                                  keyboard: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Discounted Price',
                                  style: TextStyle(
                                    color: TextColor1,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 60.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Center(
                                      child: Text(
                                    '12.75',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Notes
                      Text(
                        'Notes',
                        style: TextStyle(
                          color: TextColor1,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      customizedField(
                        validate: (value) {},
                        controller: notesController,
                        hint: 'Write any comments you have',
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Submit Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: buttonColor1,
                        ),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              var res = await addDeal(
                                  medicineController.text,
                                  dateController.text,
                                  quantityController.text,
                                  priceController.text,
                                  notesController.text,
                                  'null');
                            }
                          },
                          child: Text(
                            'Add Deal',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
