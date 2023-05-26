// ignore_for_file: file_names

class ProviderModel {
  final int? id;
  final String? name;
  final String? phone;
  final String address;
  final String bankAccount;
  final String email;
  final String idAuth;

  ProviderModel(
      {this.id,
      this.name,
      this.phone,
      required this.email,
      required this.address,
      required this.bankAccount,
      required this.idAuth});

  factory ProviderModel.fromJson({required Map json}) {
    return ProviderModel(
        id: json["id"],
        name: json['name'],
        phone: json["phone"],
        address: json["address"],
        bankAccount: json["bankAccount"],
        email: json['email'],
        idAuth: json['id_auth']);
  }

  toMap() {
    final jsonMap = {
      "name": name ?? 'Guest',
      "phone": phone,
      "address": address,
      "bankAccount": bankAccount,
      "email": email,
      "id_auth": idAuth,
    };

    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}
