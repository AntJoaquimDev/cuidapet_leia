
part of '../../address_page.dart';
typedef AddressSelectedCallback = void Function(PlaceModel);

class _AddressSearchWidget extends StatefulWidget {
   final AddressSelectedCallback addressSelectedCallback;
  final PlaceModel? placeModel;

  const _AddressSearchWidget({
     super.key,
     required this.addressSelectedCallback,
     required this.placeModel, 
   // required UniqueKey key,
  });

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  final searchAddressEC = TextEditingController();
  final searchAddressFN = FocusNode();
  final controller = Modular.get<AddressSearchController>();

  @override
  void initState() {
    super.initState();
    if (widget.placeModel != null) {
      searchAddressEC.text = widget.placeModel?.address ?? '';
      searchAddressFN.requestFocus();
    }
  }

  @override
  void dispose() {
    searchAddressEC.dispose();
    searchAddressFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        style: BorderStyle.none,
        color: Colors.black,
      ),
    );
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TypeAheadFormField<PlaceModel>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchAddressEC,
          focusNode: searchAddressFN,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.location_on),
            hintText: 'Insera um endereço.',
            border: border,
            disabledBorder: border,
            enabledBorder: border,
          ),
        ),
        itemBuilder: (_, item) {
          return _ItemTile(address: item.address,);
        },
        onSuggestionSelected: _onSuggestionSelected,
        suggestionsCallback: _suggestionsCallbac,
      ),
    );
  }

  Future<List<PlaceModel>> _suggestionsCallbac(String pattern) async {
    if (pattern.isNotEmpty) {
      return controller.searchAddress(pattern);
    }
 
    return <PlaceModel>[];
  }

  void _onSuggestionSelected(PlaceModel suggestion) {
    searchAddressEC.text = suggestion.address;
    widget.addressSelectedCallback(suggestion);
 
  }


// @override
// List<Object?> get props => [
//   searchAddressEC, 
//   searchAddressFN,
//    controller,
//    ];
}

// ignore: must_be_immutable
class _ItemTile extends StatelessWidget {
  
   String address;
   final VoidCallback? onTap;
  _ItemTile({
    required this.address,this.onTap
  });
 
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
