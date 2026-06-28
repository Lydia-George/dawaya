import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawaya/core/constants/app_colors.dart';
import 'package:dawaya/core/constants/app_sizes.dart';
import 'package:dawaya/core/constants/app_strings.dart';
import 'package:dawaya/presentation/cubits/auth/auth_cubit.dart';
import 'package:dawaya/presentation/screens/authentication/login_screen.dart';
import 'package:dawaya/presentation/screens/main_navigation_screen.dart';
import 'package:dawaya/presentation/screens/profile/widgets/logout_button.dart';
import 'package:dawaya/presentation/screens/profile/widgets/theme/theme_selector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: DColors.primaryColorBlue),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(CupertinoIcons.person, color: DColors.primaryColorBlue),
              SizedBox(height: DSizes.spaceBtwItems),
              Text('You are not signed in', style: TextStyle(fontSize: 16)),
              SizedBox(height: DSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
                child: Text(DText.signIn),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: DColors.primaryColorBlue),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.data() as Map<String, dynamic>?;
          final fullName = data?['fullName'] ?? 'No name !';

          return Padding(
            padding: const EdgeInsets.all(DSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    child: Text(
                      fullName.isNotEmpty ? fullName[0].toUpperCase() : '?',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),

                SizedBox(height: DSizes.spaceBtwItems),
                Center(
                  child: Text(
                    fullName,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: DColors.primaryColorBlue,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    user.email ?? '',
                    style: TextStyle(color: DColors.dGrey1),
                  ),
                ),
                SizedBox(height: DSizes.spaceBtwSections),

                /// -- ADDRESS
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Saved Addresses',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .apply(color: DColors.primaryColorBlue),
                        ),
                      ),
                      SizedBox(height: DSizes.spaceBtwItems),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .collection('orders')
                            .orderBy('createdAt', descending: true)
                            .limit(1)
                            .snapshots(),
                        builder: (context, orderSnapShot) {
                          if (!orderSnapShot.hasData ||
                              orderSnapShot.data!.docs.isEmpty) {
                            return const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'No saved addresses yet',
                                style: TextStyle(color: DColors.dGrey1),
                              ),
                            );
                          }

                          final lastOrder =
                              orderSnapShot.data!.docs.first.data();
                          return ListTile(
                            leading: Icon(CupertinoIcons.location),
                            title: Text(lastOrder['address'] ?? ''),
                            subtitle: Text(lastOrder['phone'] ?? ''),
                          );
                        },
                      ),
                    ],
                  ),
                ),


                /// -- THEME SELECTOR
                ThemeSelector(),
                SizedBox(height: DSizes.spaceBtwSections,),
                /// LOGOUT BUTTON
                LogoutButton(
                  onPressed: () async{
                    await context.read<AuthCubit>().logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => MainNavigationScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
