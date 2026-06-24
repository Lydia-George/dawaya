import 'package:dawaya/core/constants/image_strings.dart';
import 'package:dawaya/data/models/product/product_model.dart';

final List<ProductModel> mockProducts = [

 /// ================= Pain Relief =================
  const ProductModel(
    id: '1',
    name: 'Paracetamol 500mg',
    categoryId: '1',
    description: 'Pain reliever and fever reducer. Take 1 tablet every 6 hours.',
    image: DImageStrings.paracetamol500mg,
    price:  15.0,
    isAvailable: false
  )];
//   const ProductModel(
//     id: '2',
//     name: 'Voltaren Gel',
//     categoryId: '1',
//     description: 'Topical pain relief gel for muscle and joint pain.',
//     image: DImageStrings.voltarenGel, price: 20, isAvailable: true,
//
//   ),
//   const ProductModel(
//     id: '3',
//     name: 'Ibuprofen 400mg',
//     categoryId: '1',
//     description: 'Anti-inflammatory pain relief tablets.',
//     image: DImageStrings.ibuprofen400mg,
//
//   ),
//
//   const ProductModel(
//     id: '4',
//     name: 'Ketofan Gel',
//     categoryId: '1',
//     description: 'Relieves muscle and joint pain.',
//     image: DImageStrings.ketofanGel,
//     prices: {'1': 40.0, '2': 43.0, '3': 38.0, '4': 41.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//
//   /// ================= Antibiotics =================
//   const ProductModel(
//     id: '5',
//     name: 'Amoxicillin 250mg',
//     categoryId: '2',
//     description: 'Antibiotic used to treat bacterial infections.',
//     image: DImageStrings.amoxicillin250mg,
//     prices: {'1': 25.0, '2': 27.0, '3': 24.0, '4': 26.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//   const ProductModel(
//     id: '6',
//     name: 'Azithromycin 500mg',
//     categoryId: '2',
//     description: 'Antibiotic for respiratory and skin infections.',
//     image: DImageStrings.azithromycin500mg,
//     prices: {'1': 55.0, '2': 58.0, '3': 52.0, '4': 56.0},
//     availability: {'1': true, '2': false, '3': true, '4': true},
//   ),
//   const ProductModel(
//     id: '7',
//     name: 'Augmentin 1g',
//     categoryId: '2',
//     description: 'Broad-spectrum antibiotic.',
//     image: DImageStrings.augmentin,
//     prices: {'1': 95.0, '2': 98.0, '3': 92.0, '4': 96.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '8',
//     name: 'Cefixime 400mg',
//     categoryId: '2',
//     description: 'Used to treat bacterial infections.',
//     image: DImageStrings.cefixime,
//     prices: {'1': 80.0, '2': 82.0, '3': 78.0, '4': 81.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//
//   // ================= Vitamins =================
//   const ProductModel(
//     id: '9',
//     name: 'Vitamin C 1000mg',
//     categoryId: '3',
//     description: 'Immune system support, 30 effervescent tablets.',
//     image:DImageStrings.vitaminC1000mg,
//     prices: {'1': 450.0, '2': 1000.0, '3': 520.0, '4': 2648.61},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//   const ProductModel(
//     id: '10',
//     name: 'Vitamin D3 5000IU',
//     categoryId: '3',
//     description: 'Bone health support, 60 capsules.',
//     image: DImageStrings.vitaminD35000IU,
//     prices: {'1': 70.0, '2': 75.0, '3': 68.0, '4': 72.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//   const ProductModel(
//     id: '11',
//     name: 'Omega 3',
//     categoryId: '3',
//     description: 'Supports heart and brain health.',
//     image: DImageStrings.omega3,
//     prices: {'1': 180.0, '2': 185.0, '3': 175.0, '4': 182.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '12',
//     name: 'Multivitamin',
//     categoryId: '3',
//     description: 'Daily nutritional support.',
//     image: DImageStrings.multivitamin,
//     prices: {'1': 220.0, '2': 225.0, '3': 215.0, '4': 222.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   // ================= Respiratory =================
//   const ProductModel(
//     id: '13',
//     name: 'Ventolin Inhaler',
//     categoryId: '4',
//     description: 'Relieves asthma symptoms.',
//     image: DImageStrings.ventolinInhaler,
//     prices: {'1': 85.0, '2': 88.0, '3': 82.0, '4': 86.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '14',
//     name: 'Otrivin Nasal Spray',
//     categoryId: '4',
//     description: 'Fast relief from nasal congestion.',
//     image: DImageStrings.otrivinNasalSpray,
//     prices: {'1': 55.0, '2': 58.0, '3': 52.0, '4': 56.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//
//   const ProductModel(
//     id: '15',
//     name: 'Mucosol Syrup',
//     categoryId: '4',
//     description: 'Helps loosen mucus.',
//     image: DImageStrings.mucosolSyrup,
//     prices: {'1': 42.0, '2': 45.0, '3': 40.0, '4': 43.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '16',
//     name: 'Strepsils',
//     categoryId: '4',
//     description: 'Soothes sore throat.',
//     image: DImageStrings.strepsils,
//     prices: {'1': 35.0, '2': 38.0, '3': 34.0, '4': 36.0},
//     availability: {'1': true, '2': false, '3': true, '4': true},
//   ),
//
//   // ================= Hair Care =================
//   const ProductModel(
//     id: '17',
//     name: 'Panthenol Hair Cream',
//     categoryId: '5',
//     description: 'Moisturizes and nourishes hair.',
//     image: DImageStrings.panthenolHairCream,
//     prices: {'1': 65.0, '2': 68.0, '3': 62.0, '4': 66.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '18',
//     name: 'Vichy Dercos Shampoo',
//     categoryId: '5',
//     description: 'Anti-dandruff shampoo.',
//     image: DImageStrings.vichyDercosShampoo,
//     prices: {'1': 320.0, '2': 330.0, '3': 315.0, '4': 325.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//
//   const ProductModel(
//     id: '19',
//     name: 'Argan Hair Serum',
//     categoryId: '5',
//     description: 'Adds shine and softness.',
//     image: DImageStrings.arganHairSerum,
//     prices: {'1': 135.0, '2': 140.0, '3': 130.0, '4': 138.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   // ================= Skin Care =================
//   const ProductModel(
//     id: '20',
//     name: 'CeraVe Moisturizing Cream',
//     categoryId: '6',
//     description: 'Deep hydration for dry skin.',
//     image: DImageStrings.ceraveMoisturizingCream,
//     prices: {'1': 280.0, '2': 290.0, '3': 275.0, '4': 285.0},
//     availability: {'1': true, '2': true, '3': true, '4': false},
//   ),
//
//   const ProductModel(
//     id: '21',
//     name: 'La Roche Posay Cleanser',
//     categoryId: '6',
//     description: 'Gentle facial cleanser.',
//     image: DImageStrings.laRochePosayCleanser,
//     prices: {'1': 350.0, '2': 360.0, '3': 345.0, '4': 355.0},
//     availability: {'1': true, '2': true, '3': false, '4': true},
//   ),
//
//   const ProductModel(
//     id: '22',
//     name: 'Panthenol Cream',
//     categoryId: '6',
//     description: 'Repairs and soothes skin.',
//     image: DImageStrings.panthenolCream,
//     prices: {'1': 45.0, '2': 48.0, '3': 42.0, '4': 46.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
//
//   const ProductModel(
//     id: '23',
//     name: 'Neutrogena Hydro Boost',
//     categoryId: '6',
//     description: 'Hydrating gel moisturizer.',
//     image: DImageStrings.neutrogenaHydroBoost,
//     prices: {'1': 310.0, '2': 320.0, '3': 305.0, '4': 315.0},
//     availability: {'1': true, '2': true, '3': true, '4': true},
//   ),
// ];