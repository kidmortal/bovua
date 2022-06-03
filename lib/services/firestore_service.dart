import 'package:bovua/models/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final instance = FirebaseFirestore.instance;

  Future getUserTrips(String userId) async {
    final Response = await instance.collection('users').doc(userId).get();
    Trips trips = Trips.fromJson(Response.data() ?? {});
    return trips;
  }
}
