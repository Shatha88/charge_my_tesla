class OrderModel {
  String? id;
  String? date;
  String? price;
  String? assisment;
  String? providerID;
  String? customerID;

  OrderModel(
      {this.id,
      this.date,
      this.price,
      this.assisment,
      this.providerID,
      this.customerID,});

  factory OrderModel.fromJson({required Map json}) {
    return OrderModel(
        id: json['id'],
        date: json['date'],
        price: json['price'],
        assisment: json['assisment'],
        providerID: json['providerID'],
        customerID: json['customerID'],
        );
  }

  toMap() {
    final jsonMap = {
      "id":id,
      "date": date,
      "price": price,
      "assisment": assisment,
      "providerID": providerID,
      "customerID": customerID,
    };

    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}