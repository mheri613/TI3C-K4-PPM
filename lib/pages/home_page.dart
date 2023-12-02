import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              const Icon(Icons.download, color: Colors.green),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Income",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rp 3.000.000",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.upload, color: Colors.red),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Outcome",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rp 3.000.000",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ]),
            ),
          ),
          // teks transaksi
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Transaksi",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // list transaksi
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 10,
              child: ListTile(
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
                title: const Text("Rp. 20.000"),
                subtitle: const Text("Makan Siang"),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.upload, color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
                title: const Text("Rp. 2.000.000"),
                subtitle: const Text("Kiriman"),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.download, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
