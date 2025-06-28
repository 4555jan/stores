import 'package:flutter/material.dart';

class Subcat extends StatefulWidget {
  const Subcat({super.key, required this.title});
  final String title;

  @override
  State<Subcat> createState() => _SubcatState();
}

class _SubcatState extends State<Subcat> {
  // Dummy data — you'll later fetch/insert from database
  final List<Map<String, dynamic>> stockData = [
    {
      'size': 'S',
      'stock': '',
      'stockIn': '',
      'stockOut': '',
      'total': '',
      'barcode':89098
    },
    {
      'size': 'M',
      'stock': '',
      'stockIn': '',
      'stockOut': '',
      'total': '',
      'barcode':89098
    },
    {
      'size': 'L',
      'stock': '',
      'stockIn': '',
      'stockOut': '',
      'total': '',
      'barcode':89098
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 237, 243),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(243, 250, 242, 242),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // For overflow safety
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Size')),
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Stock In')),
              DataColumn(label: Text('Stock Out')),
              DataColumn(label: Text('Total Stock')),
               DataColumn(label: Text('barcode')),

            ],
            rows: stockData.map((item) {
              return DataRow(cells: [
                DataCell(Text(item['size'].toString())),
                DataCell(Text(item['stock'].toString())),
                DataCell(Text(item['stockIn'].toString())),
                DataCell(Text(item['stockOut'].toString())),
                DataCell(Text(item['total'].toString())),
                DataCell(Text(item['barcode'].toString())),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
