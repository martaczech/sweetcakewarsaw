part of 'places_cubit.dart';

@immutable
class PlacesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const PlacesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
