import 'package:flutter/material.dart';

class Charity {
  const Charity(this.name, this.description, this.logoUrl);

  final String name;
  final String description;
  final String logoUrl;
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    theme: ThemeData(
      primaryColor: Color(0xFFE64A19), // Custom primary color
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xFF3F51B5), // Custom accent color
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2.0, // Custom letter spacing
        ),
        // Add more custom text styles as needed
      ),
    ),
  ));
}

// Rest of the code remains the same...

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _showText = false;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _showText = true;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _showButton = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3F51B5), // Custom background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                'Uplift360',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0, // Increased letter spacing
                ),
              ),
            ),
            SizedBox(height: 30),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 2.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: AnimationController(
                    vsync: this,
                    duration: Duration(milliseconds: 500),
                  ),
                  curve: Curves.easeInOut,
                ),
              ),
              child: _showButton
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Start Donating',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE64A19),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _login(context),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Charity App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Hero section
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'https://marketplace.canva.com/EAFKSMYnnic/1/0/1600w/canva-beige-and-green-simple-charity-community-logo-5j6Le4zu7bo.jpg'), // Replace with your hero image
                  fit: BoxFit.cover,
                ),
              ),
              height: 300, // Adjust the height as needed
              child: Center(
                child: Text(
                  'Welcome to Uplift360',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffe85858),
                    letterSpacing: 2.0, // Increased letter spacing
                  ),
                ),
              ),
            ),

            // Featured content section (Example: Blog post)
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Content',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE64A19), // Custom text color
                    ),
                  ),
                  SizedBox(height: 20),
                  // Add your featured content here (e.g., latest blog post)
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(
                        'Latest Blog Post Title',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Short description of the blog post...',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        // Navigate to the full blog post
                      },
                    ),
                  ),
                  // Add more featured content here as needed
                ],
              ),
            ),

            // START DONATING Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharitiesScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'START DONATING',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE64A19),
              ),
            ),

            // Testimonials
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Testimonials',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE64A19), // Custom text color
                    ),
                  ),
                  // Add testimonials here
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(
                        'Testimonial 1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(
                        'Testimonial 2',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  // Add more testimonials here
                ],
              ),
            ),

            // Blog feed (Latest posts)
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest Blog Posts',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE64A19), // Custom text color
                    ),
                  ),
                  // Add a live feed of your latest blog posts here
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(
                        'Blog Post 1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Short description of the blog post...',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        // Navigate to the full blog post
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      title: Text(
                        'Blog Post 2',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Short description of the blog post...',
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        // Navigate to the full blog post
                      },
                    ),
                  ),
                  // Add more blog posts here
                ],
              ),
            ),

            // Team section
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Team',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE64A19), // Custom text color
                    ),
                  ),
                  // Add team member profiles here
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/team_member1.jpg'),
                        radius: 30,
                      ),
                      title: Text(
                        'ABC',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Co-Founder & CEO',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(20),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/team_member2.jpg'),
                        radius: 30,
                      ),
                      title: Text(
                        'XYZ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Head of Operations',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  // Add more team members here
                ],
              ),
            ),

            // Contact form (Example)
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE64A19), // Custom text color
                    ),
                  ),
                  SizedBox(height: 20),
                  // Example contact form (customize as needed)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.message),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your contact form submission logic here
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Send Message',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE64A19),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharitiesScreen extends StatelessWidget {
  final List<Charity> charities = const [
    Charity(
      'Animal Welfare groups',
      'This is a description of Animal Welfare groups.',
      'https://marketplace.canva.com/EAFKSMYnnic/1/0/1600w/canva-beige-and-green-simple-charity-community-logo-5j6Le4zu7bo.jpg',
    ),
    Charity(
      'Childcare organizations',
      'This is a description of Childcare organizations.',
      'https://marketplace.canva.com/EAFKSMYnnic/1/0/1600w/canva-beige-and-green-simple-charity-community-logo-5j6Le4zu7bo.jpg',
    ),
    Charity(
      'Community sheds',
      'This is a description of Community sheds.',
      'https://marketplace.canva.com/EAFKSMYnnic/1/0/1600w/canva-beige-and-green-simple-charity-community-logo-5j6Le4zu7bo.jpg',
    ),
  ];

  void _donateToCharity(BuildContext context, Charity charity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DonationScreen(charity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Charities',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: charities.length,
        itemBuilder: (context, index) {
          final charity = charities[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(charity.logoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                charity.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                charity.description,
                style: TextStyle(fontSize: 18),
              ),
              trailing: GestureDetector(
                onTap: () => _donateToCharity(context, charity),
                child: Icon(
                  Icons.arrow_forward,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DonationScreen extends StatelessWidget {
  final Charity charity;

  DonationScreen(this.charity);

  final _amountController = TextEditingController();

  void _submitDonation(BuildContext context) {
    final double donationAmount =
        double.tryParse(_amountController.text) ?? 0.0;
    // Use the donationAmount as needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          charity.name,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(charity.logoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              charity.name,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              charity.description,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Donation Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitDonation(context),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Donate',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE64A19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
