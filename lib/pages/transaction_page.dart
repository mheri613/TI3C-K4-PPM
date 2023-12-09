import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:ti3c_k4_ppm/models/database.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final AppDb database = AppDb();
  bool isExpense = true;
  late int type;
  List<String> itemList = ["makan dan jajan", "transportasi", "isi kuota"];
  late String dropDownValue = itemList.first;
  DateTime? pickedDate; // Deklarasikan variabel di sini
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Category? selectedCategory;
  Future insert(
      int amount, DateTime date, String description, int categoryId) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.transactions).insertReturning(
        TransactionsCompanion.insert(
            description: description,
            category_id: categoryId,
            transaction_date: date,
            amount: amount,
            created_at: now,
            updated_at: now));
    print('Apa ini:' + row.toString());
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  @override
  void initState() {
    // TODO: implement initState
    type = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Transaction")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Switch(
                    value: isExpense,
                    onChanged: (bool value) {
                      setState(() {
                        isExpense = value;
                        type = (isExpense) ? 2 : 1;
                        selectedCategory = null;
                      });
                    },
                    inactiveTrackColor: Colors.green[200],
                    inactiveThumbColor: Colors.green,
                    activeColor: isExpense ? Colors.red : Colors.blue,
                  ),
                  Text(
                    isExpense ? 'Expense' : 'Income',
                    style: GoogleFonts.montserrat(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Amount",
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "category",
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ),
              FutureBuilder<List<Category>>(
                  future: getAllCategory(type),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        if (snapshot.data!.length > 0) {
                          selectedCategory = snapshot.data!.first;
                          print('Apanih:' + snapshot.toString());
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButton<Category>(
                                value: (selectedCategory == null)
                                    ? snapshot.data!.first
                                    : selectedCategory,
                                isExpanded: true,
                                icon: Icon(Icons.arrow_downward),
                                items: snapshot.data!.map((Category item) {
                                  return DropdownMenuItem<Category>(
                                    value: item,
                                    child: Text(item.name),
                                  );
                                }).toList(),
                                onChanged: (Category? value) {
                                  setState(() {
                                    selectedCategory = value;
                                  });
                                }),
                          );
                        } else {
                          return Center(
                            child: Text("Data kosong"),
                          );
                        }
                      } else {
                        return Center(
                          child: Text("Tidak ada data"),
                        );
                      }
                    }
                  }),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: "Enter Date"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(
                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(
                          formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        dateController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Deskripsi",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        insert(
                            int.parse(amountController.text),
                            DateTime.parse(dateController.text),
                            descriptionController.text,
                            selectedCategory!.id);
                      },
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
