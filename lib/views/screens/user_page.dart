import 'package:flutter/material.dart';
import 'package:homework_46/controllers/user_controller.dart';
import 'package:homework_46/views/widgets/drawer_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Users",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: userController.getUsers(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapShot.hasData) {
            return const Center(
              child: Text("Apidan malumot yoq"),
            );
          }
          if (snapShot.hasError) {
            return Center(
              child: Text(snapShot.error.toString()),
            );
          }

          final userData = snapShot.data;
          return userData == null || userData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: userController.list.length,
                  itemBuilder: (context, i) {
                    final user = userData[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text(
                          user.name,
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          user.email,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
