E-Commerce Flutter App
A simple, production-grade e-commerce application built with Flutter. 
It delivers core shopping features—user authentication, product browsing, detailed views, cart management, push notifications, and Stripe payments—all backed by Firebase services.

Features
User Authentication

Email/password sign-up and sign-in via Firebase Auth

Google Sign-In integration

Product Listing

Fetches product catalog from Firestore

Displays images with cached_network_image for efficient loading

Product Details

Detailed view with name, description, price, and image

“Add to Cart” button to queue items for purchase

Cart Functionality

View, update, and remove items

Quantity controls and real-time price calculation

User Profile

View profile information stored in Firestore

Push Notifications

Firebase Cloud Messaging for order updates and promotions

Payment Integration

Secure checkout flow with Stripe

Handles payment intents and confirms orders

Getting Started
Prerequisites
Flutter SDK (>= 3.0.0)

A Firebase project with Authentication, Firestore, Cloud Messaging enabled

A Stripe account with publishable and secret keys

Installation
1 - Clone the repo
2 - Install dependencies
3 - Configure Stripe
	Add your keys
	STRIPE_PUBLISHABLE_KEY=pk_test_XXXX
	STRIPE_SECRET_KEY=sk_test_XXXX
4 - Running the App
5 - Sign up or sign in, browse products, and complete a checkout to see local notifications and push messages


Project Structure
lib/
├─ main.dart           # App entry point
├─ core/               # theme & style and base classes
├─ common/             # Reusable helpers & extensions: generic utilities, data formatters, custom exceptions,
├─ providers/          # State management with ChangeNotifier
├─ services/           # Auth, Stripe,Cart,Product and notification services
├─ services/models     # Data classes (Product, Cart)
├─ pages/              # UI pages (Auth, Home, Details, Cart, Profile)
└─ widgets/            # Reusable UI components

Packages & Plugins
	iconsax: ^0.0.8
  	image_picker: ^1.2.0
  	firebase_core: ^4.1.0
  	firebase_storage: ^13.0.1
  	firebase_messaging: ^16.0.1
  	flutter_local_notifications: ^19.4.2
  	dotted_line: ^3.2.3
  	cached_network_image: ^3.4.1
  	google_fonts: ^6.3.1
  	firebase_auth: ^6.0.2
  	cloud_firestore: ^6.0.1
  	provider: ^6.1.5
  	shared_preferences: ^2.5.3
  	mask_text_input_formatter: ^2.9.0
  	flutter_stripe: ^12.0.2
  	http: ^1.5.0

Contributing
Contributions, issues, and feature requests are welcome! Feel free to open a pull request or issue to improve functionality, add tests, or refine UI/UX.
