// import 'package:flutter/material.dart';
// import 'package:list/classes/profiles.dart';
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   // List<Profile> profiles=[
//   //   Profile("Faysal", 12),
//   //   Profile("Salman", 1),
//   //   Profile("Mahi", 3),
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 150,
//         title: Center(child: Text('All Profiles')),
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: ListView.builder(
//           itemCount: profiles.length,
//           itemBuilder: (context,index){
//             return Card(
//               child: ListTile(
//                 onTap: (){},
//                 title: Text(profiles[index].student_name),
//               ),
//             );
//           },
//         ),
//       ),
//
//
//     );
//   }
// }
