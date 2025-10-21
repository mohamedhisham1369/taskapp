
import 'package:dio/dio.dart';

void addFakeData() async{
    final dio = Dio(BaseOptions(
      baseUrl: 'https://68f6b896f7fb897c661366d7.mockapi.io/api/v1'));
  String getRandomNote(int index) {
    final notes = [
      "Deliver before noon",
      "Call before delivery",
      "Fragile items - handle with care",
      "Leave at reception",
      "Requires signature",
      "Perishable goods - keep refrigerated",
      "Ground floor delivery only",
      "Contact customer 30 mins before arrival",
      "Use back entrance",
      "No delivery after 6 PM",
      "Ring bell twice",
      "Leave with neighbor if not home",
      "Do not leave in sun",
      "Customer will be waiting",
      "Park in designated area only"
    ];
    return notes[index % notes.length];
  }

  List<Map<String, dynamic>> getRandomItems(int index) {
    final itemSets = [
      [
        {"name": "Fresh Apples", "qty": index % 3 + 1, "weight": "2kg"},
        {"name": "Organic Potatoes", "qty": index % 5 + 2, "weight": "5kg"}
      ],
      [
        {"name": "Tomatoes", "qty": index % 4 + 2, "weight": "3kg"},
        {"name": "Onions", "qty": index % 3 + 1, "weight": "2kg"},
        {"name": "Garlic", "qty": index % 2 + 1, "weight": "1kg"}
      ],
      [
        {"name": "Oranges", "qty": index % 6 + 5, "weight": "10kg"},
        {"name": "Lemons", "qty": index % 4 + 2, "weight": "3kg"}
      ],
      [
        {"name": "Carrots", "qty": index % 5 + 3, "weight": "4kg"},
        {"name": "Cucumbers", "qty": index % 4 + 2, "weight": "3kg"},
        {"name": "Bell Peppers", "qty": index % 3 + 1, "weight": "2kg"}
      ],
      [
        {"name": "Strawberries", "qty": index % 4 + 1, "weight": "1.5kg"},
        {"name": "Blueberries", "qty": index % 3 + 1, "weight": "1kg"},
        {"name": "Raspberries", "qty": index % 2 + 1, "weight": "0.5kg"}
      ],
      [
        {"name": "Lettuce", "qty": index % 3 + 2, "weight": "1.5kg"},
        {"name": "Spinach", "qty": index % 4 + 1, "weight": "1kg"},
        {"name": "Broccoli", "qty": index % 2 + 1, "weight": "1.2kg"}
      ]
    ];
    return itemSets[index % itemSets.length];
  }

  String getRandomAvatar(int index) {
    final avatars = [
      "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?w=150&h=150&fit=crop&crop=face",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face"
    ];
    return avatars[index % avatars.length];
  }

  // Define different statuses with distribution
  final statuses = ['PENDING', 'ACCEPTED', 'PICKED_UP', 'DELIVERED'];

  // Define cities in Egypt
  final cities = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Shubra El-Kheima',
    'Port Said',
    'Suez',
    'Luxor',
    'Mansoura',
    'Tanta',
    'Asyut'
  ];

  // Real Egyptian names
  final firstNames = [
    'Ahmed',
    'Mohamed',
    'Mahmoud',
    'Hassan',
    'Ibrahim',
    'Omar',
    'Youssef',
    'Khaled',
    'Ali',
    'Mostafa',
    'Tarek',
    'Hany',
    'Wael',
    'Amr',
    'Sherif',
    'Karim',
    'Fatma',
    'Mona',
    'Nour',
    'Aya',
    'Sarah',
    'Mariam',
    'Hana',
    'Dina',
    'Nadia',
    'Rania',
    'Samira',
    'Laila',
    'Hala',
    'Yasmin',
    'Reem',
    'Sara'
  ];

  final lastNames = [
    'El-Sayed',
    'Ali',
    'Hassan',
    'Ibrahim',
    'Mohamed',
    'Mahmoud',
    'Kamel',
    'Farag',
    'Abdallah',
    'Soliman',
    'Rashad',
    'Salem',
    'Nasr',
    'Fouad',
    'Zaki',
    'Mansour',
    'El-Masry',
    'El-Shafei',
    'El-Gazzar',
    'El-Khatib',
    'El-Banna',
    'El-Sherif',
    'El-Naggar',
    'El-Touny',
    'El-Shenawy',
    'El-Dessouky',
    'El-Badry',
    'El-Gendy'
  ];

  for (int i = 1; i <= 40; i++) {
    // Distribute statuses: 40% PENDING, 25% ACCEPTED, 20% PICKED_UP, 15% DELIVERED
    String status;
    if (i <= 16) {
      status = 'PENDING'; // First 16 items (40%)
    } else if (i <= 26) {
      status = 'ACCEPTED'; // Next 10 items (25%)
    } else if (i <= 34) {
      status = 'PICKED_UP'; // Next 8 items (20%)
    } else {
      status = 'DELIVERED'; // Last 6 items (15%)
    }

    // Create realistic dates (spread over the last 30 days)
    final createdAt = DateTime.now().subtract(Duration(days: (i % 30)));
    final eta = createdAt
        .add(Duration(days: 2 + (i % 5))); // ETA 2-7 days after creation

    // For delivered jobs, set delivered date
    final deliveredAt =
        status == 'DELIVERED' ? eta.subtract(Duration(hours: (i % 12))) : null;

    // Generate real Egyptian name
    final firstName = firstNames[i % firstNames.length];
    final lastName = lastNames[i % lastNames.length];
    final customerName = '$firstName $lastName';

    await dio.post('/job', data: {
      "code": "JB-${i.toString().padLeft(4, '0')}",
      "customerName": customerName,
      "address": "${cities[i % cities.length]}, District ${(i % 8) + 1}, Egypt",
      "price": (80 + i * 2).toDouble(),
      "status": status,
      "createdAt": createdAt.toIso8601String(),
      "eta": eta.toIso8601String(),
      "deliveredAt": deliveredAt?.toIso8601String(),
      "notes": getRandomNote(i),
      "truckType": i % 3 == 0
          ? "Large Truck"
          : (i % 3 == 1 ? "Medium Truck" : "Small Van"),
      "items": getRandomItems(i),
      "priority": i % 5 == 0 ? "HIGH" : (i % 5 == 1 ? "MEDIUM" : "LOW"),
      "contactPhone": "+20${1000000000 + i * 1234567}",
      "avatar": getRandomAvatar(i)
    });
  }

}