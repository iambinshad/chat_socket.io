import 'package:chatapp_with_socket_io/controller/connection_service.dart';
import 'package:chatapp_with_socket_io/vendor_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorChatListScreen extends StatelessWidget {
  const VendorChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<VendorConnectionService>(context, listen: false)
          .vendorConnection();
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'Vendor Messages',
        ),
      ),
      body: Column(
        children: [
          const ColoredBox(
              color: Color.fromARGB(255, 121, 216, 206),
              child: Padding(
                padding: EdgeInsets.only(right: 13, left: 13, bottom: 5),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                ),
              )),
          Expanded(
            child: Consumer<VendorConnectionService>(
              builder: (context, value, child) => ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VendorMessageScreen(),
                            ));
                      },
                      leading: value.sortedVendors![index].profilePhoto.isEmpty
                          ? const CircleAvatar(backgroundImage: AssetImage(""))
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  value.sortedVendors![index].profilePhoto),
                            ),
                      title: Text(value.sortedVendors![index].fullName),
                    
                      trailing: CircleAvatar(
                        radius: 9,
                        child: Text(
                          '${value.connectionCount![index].count}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: value.sortedVendors?.length,
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
