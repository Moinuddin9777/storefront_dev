import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/auth_controller.dart';
import 'package:storefront/profile/controller/imagepicker_controller.dart';
import 'package:storefront/profile/controller/profile_controller.dart';
import 'package:storefront/profile/view/edit_profile_screen.dart';
import 'package:storefront/utils/theme/controller/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        leading: const Icon(
          Icons.person,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          // Change ThemeMode (dark/light)
          GetBuilder(
            init: ThemeController(),
            builder: (themeController) {
              return IconButton(
                icon: themeController.index == 0
                    ? const Icon(Icons.light_mode, color: Colors.black)
                    : const Icon(Icons.dark_mode, color: Colors.black),
                onPressed: () {
                  themeController.changeTheme();
                },
              );
            },
          ),
          // Edit button
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              Get.to(EditProfileScreen());
            },
          ),
        ],
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder(
          init: ProfileController(),
          builder: (profileController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile image
                  GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Center(
                        child: InkWell(
                          onTap: () async {
                            await controller.pickImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(150),
                                  child: SizedBox(
                                    width: 300,
                                    height: 300,
                                    child: controller.image != null
                                        ? Image.file(controller.image!,
                                            fit: BoxFit.cover)
                                        : Image.asset("assets/profile_img.png",
                                            fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.black.withOpacity(0.7),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    profileController.user == null
                        ? ""
                        : profileController.user!["username"],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    profileController.user == null
                        ? ""
                        : profileController.user!["phonenumber"],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
                  ),

                  // Sign out button routes to sign in page
                  IconButton(
                    onPressed: () {
                      Get.find<AuthController>().signOut();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  Text(
                    "Sign out",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
// profile/view/profile_screen.dart


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:storefront/auth/controller/auth_controller.dart';
// import 'package:storefront/utils/theme/controller/theme_controller.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
//         leading: const Icon(
//           Icons.person,
//           color: Color.fromARGB(255, 0, 0, 0),
//         ),
//         actions: [
//           //change ThemeMode (dark/light)
//           GetBuilder(
//             init: ThemeController(),
//             builder: (themeController) {
//               return IconButton(
//                 icon: themeController.index == 0
//                     ? const Icon(Icons.light_mode, color: Colors.black)
//                     : const Icon(Icons.dark_mode, color: Colors.black),
//                 onPressed: () {
//                   themeController.changeTheme();
//                 },
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//         title: const Text(
//           "Profile",
//           style: TextStyle(
//             color: Color.fromARGB(255, 0, 0, 0),
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           //profile img
//           Center(
//             child: SizedBox(
//               width: 300,
//               child: Image.asset("assets/profile_img.png"),
//             ),
//           ),

//           //user name
//           Center(
//             child: Text(
//               FirebaseAuth.instance.currentUser!.email!.split("@")[0],
//               style: TextStyle(
//                 color: Theme.of(context).colorScheme.onBackground,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),

//           //Signout button Routes to sign in page
//           IconButton(
//             onPressed: () {
//               Get.find<AuthController>().signOut();
//             },
//             icon: Icon(
//               Icons.logout,
//               color: Theme.of(context).colorScheme.onBackground,
//             ),
//           ),
//           Text(
//             "Sign out",
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.onBackground,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
