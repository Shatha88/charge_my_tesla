
class StationModel {
  String? id;
  String? name;
  String? location;
  String? providerID;
  String? workTime;
  String? imageUrl;

  StationModel(
      {this.id,
      this.name,
      this.location,
      this.providerID,
      this.workTime,
      this.imageUrl,});


      factory StationModel.fromJson({required Map json}) {
       return StationModel(
        id: json["id"],
        name: json['name'],
        location: json["location"],
        providerID: json["providerID"],
        workTime: json["workTime"],
        imageUrl: json['imageUrl'],
       );
  }

  
  toMap() {
    final jsonMap = {
      "id":id,
      "name": name ?? 'Guest',
      "location": location,
      "providerID": providerID,
      "workTime": workTime,
      "imageUrl": imageUrl,
    };

    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }

  
}

