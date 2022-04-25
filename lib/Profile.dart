import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/profile_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    context.read<ProfileProvider>().fetchProfileData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Provider.of<ProfileProvider>(context, listen: true).loading
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(context.read<ProfileProvider>().user.user_name),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(

                          children: [
                            CircleAvatar(child: Icon(Icons.account_circle,size: 40,),),
                            SizedBox(width: 20,),
                            Text('Profile Info',style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('Name', style: TextStyle(fontSize: 18)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(context.read<ProfileProvider>().user.first_name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(context.read<ProfileProvider>().user.email, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone NUmber',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(context.read<ProfileProvider>().user.mobile_num, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
