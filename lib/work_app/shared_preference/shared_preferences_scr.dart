import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workapp/work_app/shared_preference/shared_preferences_con.dart';

class SharedPreferencesScr extends StatelessWidget {
  const SharedPreferencesScr({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesController controller = Get.put(
      SharedPreferencesController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display stored data
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📦 Stored Data:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('👤 Name: ${controller.userName.value}'),
                      Text(
                        '🎂 Age: ${controller.userAge.value == 0 ? 'Not set' : controller.userAge.value}',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CRUD Buttons
              const Text(
                'CRUD Operations:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // CREATE Button
              ElevatedButton.icon(
                onPressed: () => controller.showNameDialog(isUpdate: false),
                icon: const Icon(Icons.add),
                label: const Text('CREATE: Add Name'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                ),
              ),

              const SizedBox(height: 10),

              // READ is automatic (shown in the card above)

              // UPDATE Button
              ElevatedButton.icon(
                onPressed: () {
                  if (controller.userName.value != 'Not set') {
                    controller.showNameDialog(isUpdate: true);
                  } else {
                    controller.showSnackBar('Please create a name first!');
                  }
                },
                icon: const Icon(Icons.edit),
                label: const Text('UPDATE: Update Name'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.orange,
                ),
              ),

              const SizedBox(height: 10),

              // Additional CREATE for Age
              ElevatedButton.icon(
                onPressed: controller.showAgeDialog,
                icon: const Icon(Icons.calendar_today),
                label: const Text('CREATE/UPDATE: Add/Update Age'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.green,
                ),
              ),

              const SizedBox(height: 10),

              // DELETE Button
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clear Name Data?'),
                      content: const Text(
                        'This will remove name from saved preferences.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.clearName();
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                label: const Text('DELETE: Name'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(height: 10),

              // DELETE Button
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clear Age Data?'),
                      content: const Text(
                        'This will remove age from the saved preferences.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.clearAge();
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                label: const Text('DELETE: Age'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(height: 10),

              // DELETE Button
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Clear All Data?'),
                      content: const Text(
                        'This will remove all saved preferences.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.clearAllData();
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                label: const Text('DELETE: Clear All Data'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: Colors.red,
                ),
              ),

              const SizedBox(height: 20),

              // Explanation Card
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📚 Key Concepts:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text('• CREATE: setString(), setInt(), setBool()'),
                      const Text('• READ: getString(), getInt(), getBool()'),
                      const Text('• UPDATE: Same as CREATE (overwrites)'),
                      const Text('• DELETE: remove() or clear()'),
                      const Text('• Data persists after app restart'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
