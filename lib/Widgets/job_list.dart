import 'package:flutter/material.dart';
import 'package:teat_app_pythonmate/Models/jobs.dart';

class JobList extends StatelessWidget {
  const JobList({
    Key? key,
    required this.jobs,
  }) : super(key: key);

  final List<Job> jobs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, idx) {
        var j = jobs.elementAt(idx);
        return Card(
          child: Column(
            children: [
              Text(j.id.toString()),
              Text(j.companyName!),
              Text(j.jobType.toString()),
              Text(j.publicationDate.toString()),
            ],
          ),
          // height: MediaQuery.of(context).size.height * 0.1,
          // color: Colors.red,}
        );
      },
      separatorBuilder: (ctx, idx) => Divider(thickness: 2),
      itemCount: jobs.length,
    );
  }
}
