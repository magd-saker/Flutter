import 'package:flutter/material.dart';
import 'package:syrital/main.dart';
import 'package:syrital/model/products.dart';
import 'package:syrital/network/ProductsService.dart';
import 'ListOrder.dart';



class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  String name = '';
  List<Products> _products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  _getProducts() {
    ProductsService.getProducts().then((product) {
      if (mounted) {
        setState(() {
          _products = product;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcf2f2),
      appBar: AppBar(
        title: const Text('ListProduct'),
        backgroundColor: const Color(0x61C58989),
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Syriatel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );

              },
            ),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListProduct()),
                );

              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListOrder()),
                );
              },

            ),
            // Add more list tiles for other sidebar options
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 24),

              // const SizedBox(height: 12),
              Expanded(child: _buildProductsTable()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsTable() {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 4,
          color: Colors.white,
        ),
      ),
      children: [
        TableRow(
          children: [
            // _buildTableHeader('ID'),
            _buildTableHeader('productName'),
            _buildTableHeader('UnitPrice'),
          ],
        ),
        for (Products product in _products)
          TableRow(
            children: [
              // _buildTableHeader(product.id.toString()),
              _buildTableCell(_checkValue(product.productName)),
              _buildTableCell(_checkValue(product.unitPrice)),
            ],
          ),
      ],
    );
  }

  String _checkValue(dynamic value) {
    if (value == null || (value is String && value.isEmpty)) {
      print('Warning: Value is null or empty');
      return 'N/A'; // or any default value you want
    } else {

      return value.toString();
    }
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(text),
    );
  }


}
