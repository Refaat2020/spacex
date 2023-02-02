import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


/// Details about a specific launch, performed by a Falcon rocket,
/// including launch & landing pads, rocket & payload information...
class LaunchModel  {
  final String ?patchUrl;
  final List<String?> ?links;
  final List<String>? photos;
  final DateTime? staticFireDate;
  final bool? success;
  final String? details;
  final int ?flightNumber;
  final String ?name;
  final DateTime? launchDate;
  final String? datePrecision;
  final bool? upcoming;
  final String? id;
  final String ?rocket;
  final String ?launchpad;
  final List? payloads;
  const LaunchModel({
    this.patchUrl,
    this.links,
    this.photos,
    this.staticFireDate,
    this.success,
    this.details,
    this.name,
    this.launchDate,
    this.datePrecision,
    this.upcoming,
    this.id,
    this.flightNumber,
    this.rocket,
    this.launchpad,
    this.payloads,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      launchpad: json['launchpad']??"NO info about rocket",
      rocket: json['rocket']??"NO info about rocket",
      payloads: json['payloads']??[],
      patchUrl: json['links']['patch']['small'],
      links: [
        json['links']['webcast'],
        json['links']['presskit']
      ],
      photos: (json['links']['flickr']['original'] as List).cast<String>(),
      staticFireDate: json['static_fire_date_utc'] != null
          ? DateTime.tryParse(json['static_fire_date_utc'])
          : null,
      success: json['success'],
      details: json['details'],
      flightNumber: json['flight_number'],
      name: json['name'],
      launchDate:
      json['date_utc'] != null ? DateTime.tryParse(json['date_utc']) : null,
      datePrecision: json['date_precision'],
      upcoming: json['upcoming'],
      id: json['id'],
    );
  }




  DateTime? get localLaunchDate => launchDate?.toLocal();

  DateTime ?get localStaticFireDate => staticFireDate?.toLocal();

  String ?get getNumber => '#${NumberFormat('00').format(flightNumber)}';

  bool ?get hasPatch => patchUrl != null;

  bool? get hasVideo => links?[0] != null;

  String? get getVideo => links?[0];

  bool ?get tentativeTime => datePrecision != 'hour';
  String getRemainTime(){

    return"${launchDate!.difference(DateTime.now()).inDays}   ${launchDate!.difference(DateTime.now()).inHours}  ${launchDate!.difference(DateTime.now()).inMinutes}";
  }
  String getDetails(BuildContext context) =>
      details ?? "No description";

  String ?get getTentativeDate {
    switch (datePrecision) {
      case 'hour':
        return DateFormat.yMMMMd().format(localLaunchDate!);
      case 'day':
        return DateFormat.yMMMMd().format(localLaunchDate!);
      case 'month':
        return DateFormat.yMMMM().format(localLaunchDate!);
      case 'quarter':
        return DateFormat.yQQQ().format(localLaunchDate!);
      case 'half':
        return 'H${localLaunchDate!.month < 7 ? 1 : 2} ${localLaunchDate?.year}';
      case 'year':
        return DateFormat.y().format(localLaunchDate!);
      default:
        return 'date error';
    }
  }

  String? get getShortTentativeTime => DateFormat.Hm().format(localLaunchDate!);

  String ?get getTentativeTime =>
      '$getShortTentativeTime ${localLaunchDate!.timeZoneName}';

  bool ?get isDateTooTentative =>
      datePrecision != 'hour' && datePrecision != 'day';

  String getStaticFireDate(BuildContext context) => staticFireDate == null
      ? "unknown"
      : DateFormat.yMMMMd().format(localStaticFireDate!);

  String? get year => localLaunchDate!.year.toString();

  bool ?get hasPhotos => photos!.isNotEmpty;

  bool ?get avoidedStaticFire => !upcoming! && staticFireDate == null;

}

