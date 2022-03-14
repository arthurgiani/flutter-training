abstract class ProfileEvent {}

class GetProfilesEvent implements ProfileEvent {
  final String searchText;

  GetProfilesEvent({required this.searchText});
}
