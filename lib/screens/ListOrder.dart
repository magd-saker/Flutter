import 'package:flutter/material.dart';
import 'package:syrital/main.dart';
import 'package:syrital/model/orders.dart';
import 'package:syrital/network/OrdersService.dart';

import 'ListProduct.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  List<Orders> _orders = [];

  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  _getOrders() {
    OrdersService.getOrders().then((orders) {
      if (mounted) {
        setState(() {
          _orders = orders;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcf2f2),
      appBar: AppBar(
        title: const Text('List Order'),
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
                // Note: Replace with the correct widget for listing orders
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
              Expanded(child: _buildOrdersTable()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersTable() {
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
            _buildTableHeader('Order Date'),
            _buildTableHeader('Order Number'),
            _buildTableHeader('Customer Name'),
            _buildTableHeader('Total Amount'),
          ],
        ),
        for (Orders order in _orders)
          TableRow(
            children: [
              _buildTableCell(order.orderDate),
              _buildTableCell(order.orderNumber),
              _buildTableCell('${order.customer.firstName} ${order.customer.lastName}'),
              _buildTableCell(order.totalAmount),
            ],
          ),
      ],
    );
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
