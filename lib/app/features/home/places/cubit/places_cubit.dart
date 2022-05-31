import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit()
      : super(
          const PlacesState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const PlacesState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('places')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        PlacesState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          PlacesState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
