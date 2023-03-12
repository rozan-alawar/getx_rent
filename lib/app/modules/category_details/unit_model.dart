class Unit {
  String? unitNo;
  String? unitArea;
  String? unitDirection;
  bool? isReservedForYouth;
  bool? isReservedForFamilies;
  int? numberOfLounges;
  List<Lounges>? lounges;
  int? numberOfBedrooms;
  List<Bedrooms>? bedrooms;
  Kitchen? kitchen;

  Unit({
    this.unitNo,
    this.unitArea,
    this.unitDirection,
    this.isReservedForYouth,
    this.isReservedForFamilies,
    this.numberOfLounges,
    this.lounges,
    this.numberOfBedrooms,
    this.bedrooms,
    this.kitchen,
  });

  Unit.fromJson(Map<String, dynamic> json) {
    unitArea = json['unitArea'];
    unitNo = json['unitNo'];
    unitDirection = json['unitDirection'];
    isReservedForYouth = json['isReservedForYouth'];
    isReservedForFamilies = json['isReservedForFamilies'];
    numberOfLounges = json['numberOfLounges'];
    if (json['lounges'] != null) {
      lounges = <Lounges>[];
      json['lounges'].forEach((v) {
        lounges?.add(Lounges.fromJson(v));
      });
    }
    numberOfBedrooms = json['numberOfBedrooms'];
    if (json['bedrooms'] != null) {
      bedrooms = <Bedrooms>[];
      json['bedrooms'].forEach((v) {
        bedrooms?.add(Bedrooms.fromJson(v));
      });
    }
    kitchen =
        json['kitchen'] != null ? Kitchen?.fromJson(json['kitchen']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['unitArea'] = unitArea;
    data['unitNo'] = unitNo;
    data['unitDirection'] = unitDirection;
    data['isReservedForYouth'] = isReservedForYouth;
    data['isReservedForFamilies'] = isReservedForFamilies;
    data['numberOfLounges'] = numberOfLounges;
    if (lounges != null) {
      data['lounges'] = lounges?.map((v) => v.toJson()).toList();
    }
    data['numberOfBedrooms'] = numberOfBedrooms;
    if (bedrooms != null) {
      data['bedrooms'] = bedrooms?.map((v) => v.toJson()).toList();
    }
    if (kitchen != null) {
      data['kitchen'] = kitchen?.toJson();
    }
    return data;
  }
}

class Lounges {
  String? loungeType;
  bool? isPrivate;
  bool? isIndoor;
  int? numberOfSeats;
  String? loungeFacilities;

  Lounges(
      {this.loungeType,
      this.isPrivate,
      this.isIndoor,
      this.numberOfSeats,
      this.loungeFacilities});

  Lounges.fromJson(Map<String, dynamic> json) {
    loungeType = json['loungeType'];
    isPrivate = json['isPrivate'];
    isIndoor = json['isIndoor'];
    numberOfSeats = json['numberOfSeats'];
    loungeFacilities = json['loungeFacilities'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['loungeType'] = loungeType;
    data['isPrivate'] = isPrivate;
    data['isIndoor'] = isIndoor;
    data['numberOfSeats'] = numberOfSeats;
    data['loungeFacilities'] = loungeFacilities;
    return data;
  }
}

class Bedrooms {
  int? numberOfDoubleBeds;
  int? numberOfSingleBeds;
  int? numberOfSofaBeds;
  List<String>? bedroomFacilities;

  Bedrooms(
      {this.numberOfDoubleBeds,
      this.numberOfSingleBeds,
      this.numberOfSofaBeds,
      this.bedroomFacilities});

  Bedrooms.fromJson(Map<String, dynamic> json) {
    numberOfDoubleBeds = json['numberOfDoubleBeds'];
    numberOfSingleBeds = json['numberOfSingleBeds'];
    numberOfSofaBeds = json['numberOfSofaBeds'];
    bedroomFacilities = json['bedroomFacilities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['numberOfDoubleBeds'] = numberOfDoubleBeds;
    data['numberOfSingleBeds'] = numberOfSingleBeds;
    data['numberOfSofaBeds'] = numberOfSofaBeds;
    data['bedroomFacilities'] = bedroomFacilities;
    return data;
  }
}

class Kitchen {
  bool? hasKitchen;
  bool? isPrivate;
  String? diningTableCapacity;
  List<String>? kitchenFacilities;

  Kitchen(
      {this.hasKitchen,
      this.isPrivate,
      this.diningTableCapacity,
      this.kitchenFacilities});

  Kitchen.fromJson(Map<String, dynamic> json) {
    hasKitchen = json['hasKitchen'];
    isPrivate = json['isPrivate'];
    diningTableCapacity = json['diningTableCapacity'];
    kitchenFacilities = json['kitchenFacilities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hasKitchen'] = hasKitchen;
    data['isPrivate'] = isPrivate;
    data['diningTableCapacity'] = diningTableCapacity;
    data['kitchenFacilities'] = kitchenFacilities;
    return data;
  }
}
