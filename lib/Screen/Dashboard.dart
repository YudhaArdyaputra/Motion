import 'package:flutter/material.dart';
import 'package:motion/Screen/History.dart';
import 'package:intl/intl.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100], // Ubah warna latar belakang
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, Yudha!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Sisa uang: Rp 1.500.000',
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Ringkasan Transaksi:',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  TransactionItem(
                    title: 'Uang Masuk',
                    amount: 'Rp 2.000.000',
                    color: Colors.green,
                  ),
                  TransactionItem(
                    title: 'Uang Keluar',
                    amount: 'Rp 500.000',
                    color: Colors.red,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CatatTransaksiScreen()),
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Text('Catat Transaksi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const TransactionItem({
    Key? key,
    required this.title,
    required this.amount,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class CatatTransaksiScreen extends StatefulWidget {
  @override
  _CatatTransaksiScreenState createState() => _CatatTransaksiScreenState();
}

class _CatatTransaksiScreenState extends State<CatatTransaksiScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catat Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih jenis transaksi:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              items: <String>['Pemasukan', 'Pengeluaran']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle your value change here
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pilihan',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onTap: () => _selectDate(context),
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tanggal Transaksi',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              controller: TextEditingController(text: DateFormat('dd/MM/yyyy').format(selectedDate)),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Keterangan Transaksi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nominal Transaksi',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()),);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
