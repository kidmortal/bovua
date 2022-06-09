import 'package:bovua/models/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final instance = FirebaseFirestore.instance;

  Future<FirestoreTrips> getUserTrips(String userId) async {
    final Response = await instance.collection('users').doc(userId).get();
    FirestoreTrips trips = FirestoreTrips.fromJson(Response.data() ?? {});
    return trips;
  }

  addTripToUser(String userId, FirestoreTrip trip) async {
    final Response = await instance.collection('users').doc(userId).get();
    if (Response.exists) {
      await instance.collection('users').doc(userId).update({
        'trips': FieldValue.arrayUnion([trip.toJson()]),
      });
    } else {
      await instance.collection('users').doc(userId).set({
        'trips': FieldValue.arrayUnion([trip.toJson()]),
      });
    }
  }

  deleteTrip(String userId, FirestoreTrip trip) async {
    await instance.collection('users').doc(userId).update({
      'trips': FieldValue.arrayRemove([trip.toJson()]),
    });
  }
}
