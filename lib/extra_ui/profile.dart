import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project3/Auth/Auth_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0.4,
        title: Text(
          'Profile',
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return provider.loggedUser == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(children: [
                Container(
                  height: 180,
                  color: Colors.pink,
                ),
                Container(
                  margin: EdgeInsets.only(top: 115, left: 130),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60,
                    child: GestureDetector(
                      onTap: () {
                        provider.uploadNewFile();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.grey,
                        child: provider.loggedUser?.imageUrl == null
                            ? const Center(
                                child: Icon(Icons.camera),
                              )
                            : Image.network(
                                (provider.loggedUser?.imageUrl)!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 250, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(provider.loggedUser!.userName,
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          Text('Edit', style: TextStyle(fontSize: 17))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email ',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(provider.loggedUser!.email,
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                          Text('Edit', style: TextStyle(fontSize: 17))
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color.fromARGB(255, 201, 199, 199),
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Phone',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 17),
                              ),
                              Text(provider.loggedUser!.phoneNumber,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                          Text('Edit', style: TextStyle(fontSize: 17))
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        color: Color.fromARGB(255, 201, 199, 199),
                        height: 50,
                      ),
                    ],
                  ),
                )
              ]);
      }),
    );
  }
}
