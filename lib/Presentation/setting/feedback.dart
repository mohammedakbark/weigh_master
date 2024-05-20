import 'package:flutter/material.dart';

class FeedbackModel {
  final String name;
  final String email;
  final String experience;
  final String mood;
  final DateTime date;

  FeedbackModel({
    required this.name,
    required this.email,
    required this.experience,
    required this.mood,
    required this.date,
  });
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  List<FeedbackModel> feedbacks = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  String _selectedMood = '😊';

  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Full name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Full Name'),
                  hintText: 'Enter Full Name',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, 
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, 
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              // email
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'Enter Email',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, 
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, 
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Text('How was your experience?'),
              Wrap(
                children: [
                  _buildMoodEmoji('😢'),
                  _buildMoodEmoji('😕'),
                  _buildMoodEmoji('😐'),
                  _buildMoodEmoji('😊'),
                  _buildMoodEmoji('😄'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Choose Your Experience',
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  controller: _experienceController,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your experience';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Suggest anything we can improve..',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    contentPadding: EdgeInsets.all(8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitFeedback();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text('Submit Feedback'),
              ),

              SizedBox(height: 16.0),
              Text(
                'Recent Feedback',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 100, 
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, 
                  itemCount: feedbacks.length,
                  itemBuilder: (context, index) {
                    FeedbackModel feedback = feedbacks[index];
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            feedback.experience,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                              '${feedback.name} • ${feedback.email} • ${feedback.mood}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodEmoji(String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = emoji;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedMood == emoji ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  void _submitFeedback() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String experience = _experienceController.text.trim();
    if (name.isNotEmpty && email.isNotEmpty && experience.isNotEmpty) {
      setState(() {
        feedbacks.add(FeedbackModel(
          name: name,
          email: email,
          experience: experience,
          mood: _selectedMood,
          date: DateTime.now(),
        ));
        _nameController.clear();
        _emailController.clear();
        _experienceController.clear();
        _selectedMood = '😊'; 
      });
    }
  }
}
