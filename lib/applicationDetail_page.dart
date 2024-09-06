// import 'package:flutter/material.dart';

// class ApplicationDetailPage extends StatefulWidget {
//   final String applicationId;

//   ApplicationDetailPage({required this.applicationId});

//   @override
//   _ApplicationDetailPageState createState() => _ApplicationDetailPageState();
// }

// class _ApplicationDetailPageState extends State<ApplicationDetailPage> {
//   late Future<Map<String, String>> applicationDetails;

//   @override
//   void initState() {
//     super.initState();
//     applicationDetails = _fetchApplicationDetails();
//   }

//   Future<Map<String, String>> _fetchApplicationDetails() async {
//     // Simulating a backend call
//     await Future.delayed(Duration(seconds: 2));
//     // Mock data - replace with actual API call data
//     return {
//       'id': widget.applicationId,
//       'name': 'John Doe',
//       'passportNumber': 'A12345678',
//       'status': 'Pending',
//       'submittedOn': '2024-09-06',
//       'nationality': 'USA',
//       'dateOfBirth': '1985-05-15',
//       'travelDate': '2024-10-01',
//       'returnDate': '2024-10-20',
//       'contactNumber': '+1-555-123456',
//       'emailAddress': 'johndoe@example.com',
//       'travelHistory': 'Visited Canada, UK in the last 5 years',
//       'birthCertificate': 'Uploaded',
//       'passport': 'Uploaded',
//       'flightTicket': 'Uploaded',
//       'bankAccountStatement': 'Uploaded',
//     };
//   }

//   void _approveApplication() async {
//     try {
//       // Fetch the current application details
//       final details = await applicationDetails;

//       // Update the status
//       setState(() {
//         applicationDetails = Future.value({...details, 'status': 'Approved'});
//       });

//       // Add logic to send API call to approve the application
//       _sendEmailNotification('Approved');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application Approved')));
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to approve application')));
//     }
//   }

//   void _rejectApplication() async {
//     try {
//       // Fetch the current application details
//       final details = await applicationDetails;

//       // Update the status
//       setState(() {
//         applicationDetails = Future.value({...details, 'status': 'Rejected'});
//       });

//       // Add logic to send API call to reject the application
//       _sendEmailNotification('Rejected');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application Rejected')));
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to reject application')));
//     }
//   }

//   void _sendEmailNotification(String status) {
//     // Logic to send email notification to the applicant based on status update
//     // This is a placeholder for the actual email sending functionality
//     print('Email sent to applicant with status: $status');
//   }

//   Future<void> _checkInterpol() async {
//     // Add logic to check the applicant against the Interpol API
//     // This is a placeholder for actual API integration
//     bool isBlacklisted = false; // Assume false, replace with actual check

//     if (isBlacklisted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Applicant is blacklisted by Interpol.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('No blacklist record found for the applicant.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Application Details'),
//       ),
//       body: FutureBuilder<Map<String, String>>(
//         future: applicationDetails,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error loading application details.'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No application details found.'));
//           } else {
//             final details = snapshot.data!;
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildDetailField('Full Name', details['name']),
//                   _buildDetailField('Passport Number', details['passportNumber']),
//                   _buildDetailField('Nationality', details['nationality']),
//                   _buildDetailField('Date of Birth', details['dateOfBirth']),
//                   _buildDetailField('Planned Travel Date', details['travelDate']),
//                   _buildDetailField('Return Date', details['returnDate']),
//                   _buildDetailField('Contact Number', details['contactNumber']),
//                   _buildDetailField('Email Address', details['emailAddress']),
//                   _buildDetailField('Status', details['status']),
//                   _buildDetailField('Submitted On', details['submittedOn']),
//                   _buildDetailField('Travel History', details['travelHistory']),
//                   _buildDetailField('Birth Certificate', details['birthCertificate']),
//                   _buildDetailField('Passport', details['passport']),
//                   _buildDetailField('Flight Ticket', details['flightTicket']),
//                   _buildDetailField('Bank Account Statement', details['bankAccountStatement']),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: _approveApplication,
//                         icon: Icon(Icons.check),
//                         label: Text('Approve'),
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: _rejectApplication,
//                         icon: Icon(Icons.close),
//                         label: Text('Reject'),
//                         style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     onPressed: _checkInterpol,
//                     icon: Icon(Icons.search),
//                     label: Text('Check Interpol'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildDetailField(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: TextFormField(
//         initialValue: value ?? '',
//         readOnly: true,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDetailPage extends StatefulWidget {
  final String applicationId;

  ApplicationDetailPage({required this.applicationId});

  @override
  _ApplicationDetailPageState createState() => _ApplicationDetailPageState();
}

class _ApplicationDetailPageState extends State<ApplicationDetailPage> {
  late Future<Map<String, String>> applicationDetails;

  @override
  void initState() {
    super.initState();
    applicationDetails = _fetchApplicationDetails();
  }

  Future<Map<String, String>> _fetchApplicationDetails() async {
    // Simulating a backend call
    await Future.delayed(Duration(seconds: 2));
    // Mock data - replace with actual API call data
    return {
      'id': widget.applicationId,
      'name': 'John Doe',
      'passportNumber': 'A12345678',
      'status': 'Pending',
      'submittedOn': '2024-09-06',
      'nationality': 'USA',
      'dateOfBirth': '1985-05-15',
      'travelDate': '2024-10-01',
      'returnDate': '2024-10-20',
      'contactNumber': '+1-555-123456',
      'emailAddress': 'johndoe@example.com',
      'travelHistory': 'Visited Canada, UK in the last 5 years',
      'birthCertificate':
          '/home/cykhan27/Documents/Human Trafficking/IOM X Videos on human trafficking.pdf', // URL to the PDF
      'passport': 'https://example.com/passport.pdf', // URL to the PDF
      'flightTicket': 'https://example.com/flight_ticket.pdf', // URL to the PDF
      'bankAccountStatement':
          'https://example.com/bank_statement.pdf', // URL to the PDF
    };
  }

  void _approveApplication() async {
    try {
      final details = await applicationDetails;
      setState(() {
        applicationDetails = Future.value({...details, 'status': 'Approved'});
      });
      _sendEmailNotification('Approved');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Application Approved')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to approve application')));
    }
  }

  void _rejectApplication() async {
    try {
      final details = await applicationDetails;
      setState(() {
        applicationDetails = Future.value({...details, 'status': 'Rejected'});
      });
      _sendEmailNotification('Rejected');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Application Rejected')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to reject application')));
    }
  }

  void _sendEmailNotification(String status) {
    print('Email sent to applicant with status: $status');
  }

  Future<void> _checkInterpol() async {
    bool isBlacklisted = false; // Assume false, replace with actual check

    if (isBlacklisted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Applicant is blacklisted by Interpol.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No blacklist record found for the applicant.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Future<void> _downloadFile(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open the document.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Details'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: applicationDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading application details.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No application details found.'));
          } else {
            final details = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailField('Full Name', details['name']),
                  _buildDetailField(
                      'Passport Number', details['passportNumber']),
                  _buildDetailField('Nationality', details['nationality']),
                  _buildDetailField('Date of Birth', details['dateOfBirth']),
                  _buildDetailField(
                      'Planned Travel Date', details['travelDate']),
                  _buildDetailField('Return Date', details['returnDate']),
                  _buildDetailField('Contact Number', details['contactNumber']),
                  _buildDetailField('Email Address', details['emailAddress']),
                  _buildDetailField('Status', details['status']),
                  _buildDetailField('Submitted On', details['submittedOn']),
                  _buildDetailField('Travel History', details['travelHistory']),
                  _buildDownloadableField(
                      'Birth Certificate', details['birthCertificate']),
                  _buildDownloadableField('Passport', details['passport']),
                  _buildDownloadableField(
                      'Flight Ticket', details['flightTicket']),
                  _buildDownloadableField('Bank Account Statement',
                      details['bankAccountStatement']),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _approveApplication,
                        icon: Icon(Icons.check),
                        label: Text('Approve'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                      ElevatedButton.icon(
                        onPressed: _rejectApplication,
                        icon: Icon(Icons.close),
                        label: Text('Reject'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _checkInterpol,
                    icon: Icon(Icons.search),
                    label: Text('Check Interpol'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        initialValue: value ?? '',
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildDownloadableField(String label, String? url) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          _downloadFile(url);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Icon(Icons.download, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
