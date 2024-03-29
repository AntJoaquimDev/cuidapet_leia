
// part of '../../address_page.dart';
// typedef AddressSelectedCallback = void Function(PlaceModel);

// class _AddressSearchWidget extends StatefulWidget {
//   final AddressSelectedCallback addressSelectedCallback;
//   final PlaceModel? place;

//   const _AddressSearchWidget({
//      Key? key,
//     required this.addressSelectedCallback,
//     required this.place, 
//     //required UniqueKey key,
//   });

//   @override
//   State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
// }

// class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
//   final searchAddressEC = TextEditingController();
//   final searchAddressFN = FocusNode();
//   final controller = Modular.get<AddressSearchController>();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.place != null) {
//       searchAddressEC.text = widget.place?.address ?? '';
//       searchAddressFN.requestFocus();
//     }
//   }

//   @override
//   void dispose() {
//     searchAddressEC.dispose();
//     searchAddressFN.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final border = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20),
//       borderSide: const BorderSide(
//         style: BorderStyle.none,
//         color: Colors.black,
//       ),
//     );
//     return Material(
//       elevation: 10,
//       borderRadius: BorderRadius.circular(20),
//       child: TypeAheadFormField<PlaceModel>(
//         textFieldConfiguration: TextFieldConfiguration(
//           controller: searchAddressEC,
//           focusNode: searchAddressFN,
//           decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.location_on),
//             hintText: 'Inserir um endereço',
//             border: border,
//             disabledBorder: border,
//             enabledBorder: border,
//           ),
//         ),
//         itemBuilder: (_, item) {
//           return _ItemTile(item.address);
//         },
//         onSuggestionSelected: _onSuggestionSelected,
//         suggestionsCallback: _suggestionsCallbac,
//       ),
//     );
//   }

//   Future<List<PlaceModel>> _suggestionsCallbac(String pattern) async {
//     if (pattern.isNotEmpty) {
//       return controller.searchAddress(pattern);
//     }

//     return <PlaceModel>[];
//   }

//   void _onSuggestionSelected(PlaceModel suggestion) {
//     searchAddressEC.text = suggestion.address;
//     widget.addressSelectedCallback(suggestion);
//   }


// @override
// List<Object?> get props => [
//   searchAddressEC, 
//   searchAddressFN,
//    controller,];
// }

// // ignore: must_be_immutable
// class _ItemTile extends StatelessWidget {
//   String address;
//   _ItemTile(this.address);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.location_on),
//       title: Text(address),
//     );
//   }
// }
