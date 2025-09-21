import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:libs_e_commerce_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            StreamBuilder(
              stream:
                  Provider.of<AuthProvider>(context, listen: false).getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong!'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: CachedNetworkImageProvider(
                            "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png",
                          ),
                        ),
                        Text(
                          user['name'],
                          style: TextStyle(
                            fontSize: 20,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(user['email'], style: TextStyle(height: 0.5)),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No products found!'));
                }
              },
            ),
            SizedBox(height: 20),
            Divider(),
            GestureDetector(
              onTap: () async {
                await Provider.of<AuthProvider>(
                  context,
                  listen: false,
                ).signOut().then((value) {
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushNamed(context, 'login_screen');
                });
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app, size: 30),
                title: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
