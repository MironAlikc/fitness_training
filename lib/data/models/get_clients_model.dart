class GetClientsModel {
  PaginationResponse? paginationResponse;
  List<Clients>? clients;

  GetClientsModel({this.paginationResponse, this.clients});

  GetClientsModel.fromJson(Map<String, dynamic> json) {
    paginationResponse = json['PaginationResponse'] != null
        ? PaginationResponse.fromJson(json['PaginationResponse'])
        : null;
    if (json['Clients'] != null) {
      clients = <Clients>[];
      json['Clients'].forEach((v) {
        clients!.add(Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paginationResponse != null) {
      data['PaginationResponse'] = paginationResponse!.toJson();
    }
    if (clients != null) {
      data['Clients'] = clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationResponse {
  int? requestedLimit;
  int? requestedOffset;
  int? pageSize;
  int? totalResults;

  PaginationResponse(
      {this.requestedLimit,
      this.requestedOffset,
      this.pageSize,
      this.totalResults});

  PaginationResponse.fromJson(Map<String, dynamic> json) {
    requestedLimit = json['RequestedLimit'];
    requestedOffset = json['RequestedOffset'];
    pageSize = json['PageSize'];
    totalResults = json['TotalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestedLimit'] = requestedLimit;
    data['RequestedOffset'] = requestedOffset;
    data['PageSize'] = pageSize;
    data['TotalResults'] = totalResults;
    return data;
  }
}

class Clients {
  SuspensionInfo? suspensionInfo;
  String? appointmentGenderPreference;
  String? birthDate;
  String? country;
  String? creationDate;
  List<CustomClientFields>? customClientFields;
  ClientCreditCard? clientCreditCard;
  List<ClientIndexes>? clientIndexes;
  List<ClientRelationships>? clientRelationships;
  String? firstAppointmentDate;
  String? firstClassDate;
  String? firstName;
  String? id;
  bool? isCompany;
  bool? isProspect;
  String? lastName;
  Liability? liability;
  bool? liabilityRelease;
  int? membershipIcon;
  int? mobileProvider;
  String? notes;
  String? state;
  int? uniqueId;
  String? lastModifiedDateTime;
  String? redAlert;
  String? yellowAlert;
  String? middleName;
  ProspectStage? prospectStage;
  String? email;
  String? mobilePhone;
  String? homePhone;
  String? workPhone;
  double? accountBalance;
  String? addressLine1;
  Null addressLine2;
  String? city;
  String? postalCode;
  String? workExtension;
  String? referredBy;
  String? photoUrl;
  String? emergencyContactInfoName;
  String? emergencyContactInfoEmail;
  String? emergencyContactInfoPhone;
  String? emergencyContactInfoRelationship;
  String? gender;
  String? lastFormulaNotes;
  bool? active;
  List<SalesReps>? salesReps;
  String? status;
  String? action;
  bool? sendAccountEmails;
  bool? sendAccountTexts;
  bool? sendPromotionalEmails;
  bool? sendPromotionalTexts;
  bool? sendScheduleEmails;
  bool? sendScheduleTexts;
  HomeLocation? homeLocation;
  String? lockerNumber;

  Clients(
      {this.suspensionInfo,
      this.appointmentGenderPreference,
      this.birthDate,
      this.country,
      this.creationDate,
      this.customClientFields,
      this.clientCreditCard,
      this.clientIndexes,
      this.clientRelationships,
      this.firstAppointmentDate,
      this.firstClassDate,
      this.firstName,
      this.id,
      this.isCompany,
      this.isProspect,
      this.lastName,
      this.liability,
      this.liabilityRelease,
      this.membershipIcon,
      this.mobileProvider,
      this.notes,
      this.state,
      this.uniqueId,
      this.lastModifiedDateTime,
      this.redAlert,
      this.yellowAlert,
      this.middleName,
      this.prospectStage,
      this.email,
      this.mobilePhone,
      this.homePhone,
      this.workPhone,
      this.accountBalance,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.postalCode,
      this.workExtension,
      this.referredBy,
      this.photoUrl,
      this.emergencyContactInfoName,
      this.emergencyContactInfoEmail,
      this.emergencyContactInfoPhone,
      this.emergencyContactInfoRelationship,
      this.gender,
      this.lastFormulaNotes,
      this.active,
      this.salesReps,
      this.status,
      this.action,
      this.sendAccountEmails,
      this.sendAccountTexts,
      this.sendPromotionalEmails,
      this.sendPromotionalTexts,
      this.sendScheduleEmails,
      this.sendScheduleTexts,
      this.homeLocation,
      this.lockerNumber});

  Clients.fromJson(Map<String, dynamic> json) {
    suspensionInfo = json['SuspensionInfo'] != null
        ? SuspensionInfo.fromJson(json['SuspensionInfo'])
        : null;
    appointmentGenderPreference = json['AppointmentGenderPreference'];
    birthDate = json['BirthDate'];
    country = json['Country'];
    creationDate = json['CreationDate'];
    if (json['CustomClientFields'] != null) {
      customClientFields = <CustomClientFields>[];
      json['CustomClientFields'].forEach((v) {
        customClientFields!.add(CustomClientFields.fromJson(v));
      });
    }
    clientCreditCard = json['ClientCreditCard'] != null
        ? ClientCreditCard.fromJson(json['ClientCreditCard'])
        : null;
    if (json['ClientIndexes'] != null) {
      clientIndexes = <ClientIndexes>[];
      json['ClientIndexes'].forEach((v) {
        clientIndexes!.add(ClientIndexes.fromJson(v));
      });
    }
    if (json['ClientRelationships'] != null) {
      clientRelationships = <ClientRelationships>[];
      json['ClientRelationships'].forEach((v) {
        clientRelationships!.add(ClientRelationships.fromJson(v));
      });
    }
    firstAppointmentDate = json['FirstAppointmentDate'];
    firstClassDate = json['FirstClassDate'];
    firstName = json['FirstName'];
    id = json['Id'];
    isCompany = json['IsCompany'];
    isProspect = json['IsProspect'];
    lastName = json['LastName'];
    liability = json['Liability'] != null
        ? Liability.fromJson(json['Liability'])
        : null;
    liabilityRelease = json['LiabilityRelease'];
    membershipIcon = json['MembershipIcon'];
    mobileProvider = json['MobileProvider'];
    notes = json['Notes'];
    state = json['State'];
    uniqueId = json['UniqueId'];
    lastModifiedDateTime = json['LastModifiedDateTime'];
    redAlert = json['RedAlert'];
    yellowAlert = json['YellowAlert'];
    middleName = json['MiddleName'];
    prospectStage = json['ProspectStage'] != null
        ? ProspectStage.fromJson(json['ProspectStage'])
        : null;
    email = json['Email'];
    mobilePhone = json['MobilePhone'];
    homePhone = json['HomePhone'];
    workPhone = json['WorkPhone'];
    accountBalance = json['AccountBalance'];
    addressLine1 = json['AddressLine1'];
    addressLine2 = json['AddressLine2'];
    city = json['City'];
    postalCode = json['PostalCode'];
    workExtension = json['WorkExtension'];
    referredBy = json['ReferredBy'];
    photoUrl = json['PhotoUrl'];
    emergencyContactInfoName = json['EmergencyContactInfoName'];
    emergencyContactInfoEmail = json['EmergencyContactInfoEmail'];
    emergencyContactInfoPhone = json['EmergencyContactInfoPhone'];
    emergencyContactInfoRelationship = json['EmergencyContactInfoRelationship'];
    gender = json['Gender'];
    lastFormulaNotes = json['LastFormulaNotes'];
    active = json['Active'];
    if (json['SalesReps'] != null) {
      salesReps = <SalesReps>[];
      json['SalesReps'].forEach((v) {
        salesReps!.add(SalesReps.fromJson(v));
      });
    }
    status = json['Status'];
    action = json['Action'];
    sendAccountEmails = json['SendAccountEmails'];
    sendAccountTexts = json['SendAccountTexts'];
    sendPromotionalEmails = json['SendPromotionalEmails'];
    sendPromotionalTexts = json['SendPromotionalTexts'];
    sendScheduleEmails = json['SendScheduleEmails'];
    sendScheduleTexts = json['SendScheduleTexts'];
    homeLocation = json['HomeLocation'] != null
        ? HomeLocation.fromJson(json['HomeLocation'])
        : null;
    lockerNumber = json['LockerNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (suspensionInfo != null) {
      data['SuspensionInfo'] = suspensionInfo!.toJson();
    }
    data['AppointmentGenderPreference'] = appointmentGenderPreference;
    data['BirthDate'] = birthDate;
    data['Country'] = country;
    data['CreationDate'] = creationDate;
    if (customClientFields != null) {
      data['CustomClientFields'] =
          customClientFields!.map((v) => v.toJson()).toList();
    }
    if (clientCreditCard != null) {
      data['ClientCreditCard'] = clientCreditCard!.toJson();
    }
    if (clientIndexes != null) {
      data['ClientIndexes'] = clientIndexes!.map((v) => v.toJson()).toList();
    }
    if (clientRelationships != null) {
      data['ClientRelationships'] =
          clientRelationships!.map((v) => v.toJson()).toList();
    }
    data['FirstAppointmentDate'] = firstAppointmentDate;
    data['FirstClassDate'] = firstClassDate;
    data['FirstName'] = firstName;
    data['Id'] = id;
    data['IsCompany'] = isCompany;
    data['IsProspect'] = isProspect;
    data['LastName'] = lastName;
    if (liability != null) {
      data['Liability'] = liability!.toJson();
    }
    data['LiabilityRelease'] = liabilityRelease;
    data['MembershipIcon'] = membershipIcon;
    data['MobileProvider'] = mobileProvider;
    data['Notes'] = notes;
    data['State'] = state;
    data['UniqueId'] = uniqueId;
    data['LastModifiedDateTime'] = lastModifiedDateTime;
    data['RedAlert'] = redAlert;
    data['YellowAlert'] = yellowAlert;
    data['MiddleName'] = middleName;
    if (prospectStage != null) {
      data['ProspectStage'] = prospectStage!.toJson();
    }
    data['Email'] = email;
    data['MobilePhone'] = mobilePhone;
    data['HomePhone'] = homePhone;
    data['WorkPhone'] = workPhone;
    data['AccountBalance'] = accountBalance;
    data['AddressLine1'] = addressLine1;
    data['AddressLine2'] = addressLine2;
    data['City'] = city;
    data['PostalCode'] = postalCode;
    data['WorkExtension'] = workExtension;
    data['ReferredBy'] = referredBy;
    data['PhotoUrl'] = photoUrl;
    data['EmergencyContactInfoName'] = emergencyContactInfoName;
    data['EmergencyContactInfoEmail'] = emergencyContactInfoEmail;
    data['EmergencyContactInfoPhone'] = emergencyContactInfoPhone;
    data['EmergencyContactInfoRelationship'] = emergencyContactInfoRelationship;
    data['Gender'] = gender;
    data['LastFormulaNotes'] = lastFormulaNotes;
    data['Active'] = active;
    if (salesReps != null) {
      data['SalesReps'] = salesReps!.map((v) => v.toJson()).toList();
    }
    data['Status'] = status;
    data['Action'] = action;
    data['SendAccountEmails'] = sendAccountEmails;
    data['SendAccountTexts'] = sendAccountTexts;
    data['SendPromotionalEmails'] = sendPromotionalEmails;
    data['SendPromotionalTexts'] = sendPromotionalTexts;
    data['SendScheduleEmails'] = sendScheduleEmails;
    data['SendScheduleTexts'] = sendScheduleTexts;
    if (homeLocation != null) {
      data['HomeLocation'] = homeLocation!.toJson();
    }
    data['LockerNumber'] = lockerNumber;
    return data;
  }
}

class SuspensionInfo {
  bool? bookingSuspended;
  String? suspensionStartDate;
  Null suspensionEndDate;

  SuspensionInfo(
      {this.bookingSuspended,
      this.suspensionStartDate,
      this.suspensionEndDate});

  SuspensionInfo.fromJson(Map<String, dynamic> json) {
    bookingSuspended = json['BookingSuspended'];
    suspensionStartDate = json['SuspensionStartDate'];
    suspensionEndDate = json['SuspensionEndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BookingSuspended'] = bookingSuspended;
    data['SuspensionStartDate'] = suspensionStartDate;
    data['SuspensionEndDate'] = suspensionEndDate;
    return data;
  }
}

class CustomClientFields {
  String? value;
  int? id;
  String? dataType;
  String? name;

  CustomClientFields({this.value, this.id, this.dataType, this.name});

  CustomClientFields.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    id = json['Id'];
    dataType = json['DataType'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Id'] = id;
    data['DataType'] = dataType;
    data['Name'] = name;
    return data;
  }
}

class ClientCreditCard {
  String? address;
  String? cardHolder;
  String? cardNumber;
  String? cardType;
  String? city;
  String? expMonth;
  String? expYear;
  String? lastFour;
  String? postalCode;
  String? state;

  ClientCreditCard(
      {this.address,
      this.cardHolder,
      this.cardNumber,
      this.cardType,
      this.city,
      this.expMonth,
      this.expYear,
      this.lastFour,
      this.postalCode,
      this.state});

  ClientCreditCard.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    cardHolder = json['CardHolder'];
    cardNumber = json['CardNumber'];
    cardType = json['CardType'];
    city = json['City'];
    expMonth = json['ExpMonth'];
    expYear = json['ExpYear'];
    lastFour = json['LastFour'];
    postalCode = json['PostalCode'];
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Address'] = address;
    data['CardHolder'] = cardHolder;
    data['CardNumber'] = cardNumber;
    data['CardType'] = cardType;
    data['City'] = city;
    data['ExpMonth'] = expMonth;
    data['ExpYear'] = expYear;
    data['LastFour'] = lastFour;
    data['PostalCode'] = postalCode;
    data['State'] = state;
    return data;
  }
}

class ClientIndexes {
  int? id;
  int? valueId;

  ClientIndexes({this.id, this.valueId});

  ClientIndexes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    valueId = json['ValueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ValueId'] = valueId;
    return data;
  }
}

class ClientRelationships {
  String? relatedClientId;
  Relationship? relationship;
  String? relationshipName;
  bool? delete;

  ClientRelationships(
      {this.relatedClientId,
      this.relationship,
      this.relationshipName,
      this.delete});

  ClientRelationships.fromJson(Map<String, dynamic> json) {
    relatedClientId = json['RelatedClientId'];
    relationship = json['Relationship'] != null
        ? Relationship.fromJson(json['Relationship'])
        : null;
    relationshipName = json['RelationshipName'];
    delete = json['Delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RelatedClientId'] = relatedClientId;
    if (relationship != null) {
      data['Relationship'] = relationship!.toJson();
    }
    data['RelationshipName'] = relationshipName;
    data['Delete'] = delete;
    return data;
  }
}

class Relationship {
  int? id;
  String? relationshipName1;
  String? relationshipName2;

  Relationship({this.id, this.relationshipName1, this.relationshipName2});

  Relationship.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    relationshipName1 = json['RelationshipName1'];
    relationshipName2 = json['RelationshipName2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RelationshipName1'] = relationshipName1;
    data['RelationshipName2'] = relationshipName2;
    return data;
  }
}

class Liability {
  String? agreementDate;
  bool? isReleased;
  int? releasedBy;

  Liability({this.agreementDate, this.isReleased, this.releasedBy});

  Liability.fromJson(Map<String, dynamic> json) {
    agreementDate = json['AgreementDate'];
    isReleased = json['IsReleased'];
    releasedBy = json['ReleasedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AgreementDate'] = agreementDate;
    data['IsReleased'] = isReleased;
    data['ReleasedBy'] = releasedBy;
    return data;
  }
}

class ProspectStage {
  bool? active;
  String? description;
  int? id;

  ProspectStage({this.active, this.description, this.id});

  ProspectStage.fromJson(Map<String, dynamic> json) {
    active = json['Active'];
    description = json['Description'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Active'] = active;
    data['Description'] = description;
    data['Id'] = id;
    return data;
  }
}

class SalesReps {
  String? firstName;
  int? id;
  String? lastName;
  int? salesRepNumber;
  List<int>? salesRepNumbers;

  SalesReps(
      {this.firstName,
      this.id,
      this.lastName,
      this.salesRepNumber,
      this.salesRepNumbers});

  SalesReps.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    id = json['Id'];
    lastName = json['LastName'];
    salesRepNumber = json['SalesRepNumber'];
    salesRepNumbers = json['SalesRepNumbers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['Id'] = id;
    data['LastName'] = lastName;
    data['SalesRepNumber'] = salesRepNumber;
    data['SalesRepNumbers'] = salesRepNumbers;
    return data;
  }
}

class HomeLocation {
  List<String>? additionalImageURLs;
  String? address;
  String? address2;
  Null amenities;
  Null businessDescription;
  String? city;
  Null description;
  bool? hasClasses;
  int? id;
  double? latitude;
  double? longitude;
  String? name;
  String? phone;
  String? phoneExtension;
  String? postalCode;
  Null siteID;
  String? stateProvCode;
  double? tax1;
  double? tax2;
  double? tax3;
  int? tax4;
  int? tax5;
  int? totalNumberOfRatings;
  int? averageRating;
  int? totalNumberOfDeals;

  HomeLocation(
      {this.additionalImageURLs,
      this.address,
      this.address2,
      this.amenities,
      this.businessDescription,
      this.city,
      this.description,
      this.hasClasses,
      this.id,
      this.latitude,
      this.longitude,
      this.name,
      this.phone,
      this.phoneExtension,
      this.postalCode,
      this.siteID,
      this.stateProvCode,
      this.tax1,
      this.tax2,
      this.tax3,
      this.tax4,
      this.tax5,
      this.totalNumberOfRatings,
      this.averageRating,
      this.totalNumberOfDeals});

  HomeLocation.fromJson(Map<String, dynamic> json) {
    if (json['AdditionalImageURLs'] != null) {
      additionalImageURLs = <String>[];
      json['AdditionalImageURLs'].forEach((v) {
        additionalImageURLs!.add(v.toString(v));
      });
    }
    address = json['Address'];
    address2 = json['Address2'];
    amenities = json['Amenities'];
    businessDescription = json['BusinessDescription'];
    city = json['City'];
    description = json['Description'];
    hasClasses = json['HasClasses'];
    id = json['Id'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    name = json['Name'];
    phone = json['Phone'];
    phoneExtension = json['PhoneExtension'];
    postalCode = json['PostalCode'];
    siteID = json['SiteID'];
    stateProvCode = json['StateProvCode'];
    tax1 = json['Tax1'];
    tax2 = json['Tax2'];
    tax3 = json['Tax3'];
    tax4 = json['Tax4'];
    tax5 = json['Tax5'];
    totalNumberOfRatings = json['TotalNumberOfRatings'];
    averageRating = json['AverageRating'];
    totalNumberOfDeals = json['TotalNumberOfDeals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (additionalImageURLs != null) {
      data['AdditionalImageURLs'] = additionalImageURLs;
    }
    data['Address'] = address;
    data['Address2'] = address2;
    data['Amenities'] = amenities;
    data['BusinessDescription'] = businessDescription;
    data['City'] = city;
    data['Description'] = description;
    data['HasClasses'] = hasClasses;
    data['Id'] = id;
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    data['Name'] = name;
    data['Phone'] = phone;
    data['PhoneExtension'] = phoneExtension;
    data['PostalCode'] = postalCode;
    data['SiteID'] = siteID;
    data['StateProvCode'] = stateProvCode;
    data['Tax1'] = tax1;
    data['Tax2'] = tax2;
    data['Tax3'] = tax3;
    data['Tax4'] = tax4;
    data['Tax5'] = tax5;
    data['TotalNumberOfRatings'] = totalNumberOfRatings;
    data['AverageRating'] = averageRating;
    data['TotalNumberOfDeals'] = totalNumberOfDeals;
    return data;
  }
}
