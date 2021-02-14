import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list/classes/WeekDayClass.dart';
import 'package:list/classes/notificationClass.dart';
import 'package:list/classes/tutor.dart';

class DatabaseService {
  final CollectionReference tutorStudent =
      Firestore.instance.collection('Tutoring');
  Future updateInfo(
      String name,
      List<bool> values,
      ExampleNumber selectedNumber,
      String time,
      NotificationClass selectedID) async {
    return await tutorStudent.document().setData({
      'name': name,
      'values': values,
      'selectedNumber': selectedNumber,
      'time': time,
      'selectedID': selectedID
    });
  }

  //tutorlist from snapshot
  List<Tutor> _tutorListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Tutor(
          name: doc.data['name'] ?? '',
          values: doc.data['values'] ?? 0,
          selectedNumber: doc.data['selectedNumber'] ?? 0,
          time: doc.data['time'] ?? '0',
          selectedID: doc.data['selectedID'] ?? '0');
    }).toList();
  }

  Stream<List<Tutor>> get tutoring {
    return tutorStudent.snapshots().map(_tutorListFromSnapShot);
  }

  //get user doc stream
  Stream<DocumentSnapshot> get userData {
    return tutorStudent.document().snapshots();
  }
}
