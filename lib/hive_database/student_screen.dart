// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// import 'student_model.dart';
//
// class StudentScreen extends StatefulWidget {
//   const StudentScreen({super.key});
//
//   @override
//   State<StudentScreen> createState() => _StudentScreenState();
// }
//
// class _StudentScreenState extends State<StudentScreen> {
//   // Get the box (like opening your database)
//   late Box<Student> studentBox;
//
//   // Controllers for form inputs
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController gradeController = TextEditingController();
//
//   // For editing
//   String? editingId;
//
//   @override
//   void initState() {
//     super.initState();
//     // Open the box
//     studentBox = Hive.box<Student>('studentsBox');
//   }
//
//   @override
//   void dispose() {
//     // Clean up controllers
//     nameController.dispose();
//     ageController.dispose();
//     gradeController.dispose();
//     super.dispose();
//   }
//
//   // 📝 CREATE: Add a new student
//   void addStudent() {
//     if (nameController.text.isEmpty || ageController.text.isEmpty) {
//       _showMessage('Please fill all fields');
//       return;
//     }
//
//     final newStudent = Student(
//       id: DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
//       name: nameController.text,
//       age: int.parse(ageController.text),
//       grade: gradeController.text,
//     );
//
//     // Add to Hive (like INSERT in SQL)
//     studentBox.put(newStudent.id, newStudent);
//
//     _clearForm();
//     _showMessage('✅ Student added successfully!');
//   }
//
//   // 📖 READ: Display all students (handled by ValueListenableBuilder)
//
//   // ✏️ UPDATE: Edit existing student
//   void editStudent(Student student) {
//     // Fill the form with student's data
//     editingId = student.id;
//     nameController.text = student.name;
//     ageController.text = student.age.toString();
//     gradeController.text = student.grade;
//
//     // Change button to "Update"
//     setState(() {});
//   }
//
//   void updateStudent() {
//     if (editingId == null) return;
//
//     final updatedStudent = Student(
//       id: editingId!,
//       name: nameController.text,
//       age: int.parse(ageController.text),
//       grade: gradeController.text,
//     );
//
//     // Update in Hive (same as put - overwrites existing)
//     studentBox.put(editingId!, updatedStudent);
//
//     _clearForm();
//     _showMessage('✏️ Student updated successfully!');
//   }
//
//   // 🗑️ DELETE: Remove a student
//   void deleteStudent(String id) {
//     // Show confirmation dialog
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: const Text('Delete Student'),
//         content: const Text('Are you sure?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(ctx),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Delete from Hive
//               studentBox.delete(id);
//               Navigator.pop(ctx);
//               _showMessage('🗑️ Student deleted!');
//             },
//             child: const Text('Delete', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _clearForm() {
//     nameController.clear();
//     ageController.clear();
//     gradeController.clear();
//     editingId = null;
//     setState(() {});
//   }
//
//   void _showMessage(String message) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Manager'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           // 📝 INPUT FORM
//           Container(
//             padding: const EdgeInsets.all(16),
//             color: Colors.grey[100],
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Student Name',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: ageController,
//                   decoration: const InputDecoration(
//                     labelText: 'Age',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.numbers),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: gradeController,
//                   decoration: const InputDecoration(
//                     labelText: 'Grade (e.g., A, B+)',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.school),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: editingId == null
//                             ? addStudent
//                             : updateStudent,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                         child: Text(
//                           editingId == null ? 'ADD STUDENT' : 'UPDATE STUDENT',
//                         ),
//                       ),
//                     ),
//                     if (editingId != null) const SizedBox(width: 10),
//                     if (editingId != null)
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: _clearForm,
//                           child: const Text('CANCEL'),
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           // 📖 LIST OF STUDENTS
//           Expanded(
//             child: ValueListenableBuilder(
//               // Listen to changes in the box (auto-refreshes UI)
//               valueListenable: studentBox.listenable(),
//               builder: (context, Box<Student> box, _) {
//                 if (box.isEmpty) {
//                   return const Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.people_outline,
//                           size: 64,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'No students yet!\nTap ADD to get started.',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//
//                 return ListView.builder(
//                   itemCount: box.length,
//                   itemBuilder: (context, index) {
//                     // Get each student
//                     final studentId = box.keys.elementAt(index);
//                     final student = box.get(studentId);
//
//                     return Card(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 4,
//                       ),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundColor: Colors.blue,
//                           child: Text(student!.age.toString()),
//                         ),
//                         title: Text(
//                           student.name,
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text('Grade: ${student.grade}'),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Edit button
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.edit,
//                                 color: Colors.orange,
//                               ),
//                               onPressed: () => editStudent(student),
//                             ),
//                             // Delete button
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => deleteStudent(student.id),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
