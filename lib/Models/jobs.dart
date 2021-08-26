// To parse this JSON data, do
//
//     final jobs = jobsFromJson(jsonString);

import 'dart:convert';

Jobs jobsFromJson(String str) => Jobs.fromJson(json.decode(str));

String jobsToJson(Jobs data) => json.encode(data.toJson());

class Jobs {
  Jobs({
    this.the0LegalNotice,
    this.jobCount,
    this.jobs,
  });

  String? the0LegalNotice;
  int? jobCount;
  List<Job>? jobs;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        the0LegalNotice:
            json["0-legal-notice"] == null ? null : json["0-legal-notice"],
        jobCount: json["job-count"] == null ? null : json["job-count"],
        jobs: json["jobs"] == null
            ? null
            : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "0-legal-notice": the0LegalNotice == null ? null : the0LegalNotice,
        "job-count": jobCount == null ? null : jobCount,
        "jobs": jobs == null
            ? null
            : List<dynamic>.from(jobs!.map((x) => x.toJson())),
      };
}

class Job {
  Job({
    this.id,
    this.url,
    this.title,
    this.companyName,
    this.category,
    this.tags,
    this.jobType,
    this.publicationDate,
    this.candidateRequiredLocation,
    this.salary,
    this.description,
    this.companyLogoUrl,
  });

  int? id;
  String? url;
  String? title;
  String? companyName;
  CategoryKind? category;
  List<dynamic>? tags;
  JobType? jobType;
  DateTime? publicationDate;
  String? candidateRequiredLocation;
  String? salary;
  String? description;
  String? companyLogoUrl;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        title: json["title"] == null ? null : json["title"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        category: json["category"] == null
            ? null
            : categoryValues.map![json["category"]],
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        jobType: json["job_type"] == null
            ? null
            : jobTypeValues.map![json["job_type"]],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        candidateRequiredLocation: json["candidate_required_location"] == null
            ? null
            : json["candidate_required_location"],
        salary: json["salary"] == null ? null : json["salary"],
        description: json["description"] == null ? null : json["description"],
        companyLogoUrl:
            json["company_logo_url"] == null ? null : json["company_logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "title": title == null ? null : title,
        "company_name": companyName == null ? null : companyName,
        "category": category == null ? null : categoryValues.reverse![category],
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "job_type": jobType == null ? null : jobTypeValues.reverse![jobType],
        "publication_date":
            publicationDate == null ? null : publicationDate!.toIso8601String(),
        "candidate_required_location": candidateRequiredLocation == null
            ? null
            : candidateRequiredLocation,
        "salary": salary == null ? null : salary,
        "description": description == null ? null : description,
        "company_logo_url": companyLogoUrl == null ? null : companyLogoUrl,
      };
}

enum CategoryKind { SOFTWARE_DEVELOPMENT }

final categoryValues =
    EnumValues({"Software Development": CategoryKind.SOFTWARE_DEVELOPMENT});

enum JobType { FULL_TIME, CONTRACT, EMPTY, FREELANCE }

final jobTypeValues = EnumValues({
  "contract": JobType.CONTRACT,
  "": JobType.EMPTY,
  "freelance": JobType.FREELANCE,
  "full_time": JobType.FULL_TIME
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
