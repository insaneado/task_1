import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 792),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Reviews Form',
          theme: ThemeData(
            colorScheme: ColorScheme.light().copyWith(
              primary: const Color(0xFFFFE8D7),
            ),
            fontFamily: 'General Sans Variable',
          ),
          home: const ReviewForm(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  int _currentStep = 0;
  String? _selectedShop = 'Books Shop';
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep = 0;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write your reviews',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2E2F31),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'Step ${_currentStep + 1} / 2',
                    style: TextStyle(
                      fontFamily: 'General Sans Variable',
                      fontSize: 14.sp,
                      color: const Color(0xFF713100),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Progress bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF713100),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color:
                                _currentStep == 1
                                    ? const Color(0xFF713100)
                                    : const Color(0xFFF5F5F5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
            Expanded(child: _currentStep == 0 ? _buildStep1() : _buildStep2()),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentStep == 0) {
                      setState(() {
                        _currentStep = 1;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Complaint submitted!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF713100),
                    foregroundColor: const Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999.r),
                    ),
                  ),
                  child: Text(
                    _currentStep == 0 ? 'Next' : 'Submit Complaint',
                    style: TextStyle(fontFamily: 'Manrope', fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select the space you\'re facing problem in your city.',
            style: TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2E2F31),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '  Shops',
            style: TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 16.sp,
              color: const Color(0xFF676767),
            ),
          ),
          SizedBox(height: 8.h),
          _buildShopOption('Electrical Shops', 'lib/assets/icons/Washing machine.png'),
          SizedBox(height: 8.h),
          _buildShopOption('Books Shop', 'lib/assets/icons/Washroom.png'),
          SizedBox(height: 8.h),
          _buildShopOption('Hardware Shops', 'lib/assets/icons/Watercooler.png'),
          SizedBox(height: 20.h),
          Text('   Food Area',
            style: TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 16.sp,
              color: const Color(0xFF676767),
            ),
          ),
          SizedBox(height: 8.h),
          _buildShopOption('Canteens', 'lib/assets/icons/Canteen.png'),
          SizedBox(height: 8.h),
          _buildShopOption('Juice Corner', 'lib/assets/icons/Juice.png'),
          SizedBox(height: 8.h),
          _buildShopOption('Restaurants', 'lib/assets/icons/Mess.png'),
          SizedBox(height: 90.55.h)
        ],
      ),
    ),
  );
}



 Widget _buildShopOption(String title, String iconPath) {
  final isSelected = _selectedShop == title;

  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedShop = title;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFE8D7) : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: isSelected ? const Color(0xFF713100) : const Color(0xFFC5C5D1),
          width: 2.sp,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF713100) : const Color(0xFFFFFFFF),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset(
                iconPath,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
            ),
          ),
          SizedBox(width: 8.18.w),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF713100) : const Color(0xFF2E2F31),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Give info about the issue you\'re facing',
            style: TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2E2F31),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            ' Short title',
            style: TextStyle(fontWeight:FontWeight.w500,fontSize:16.sp, color:const Color(0xFF2E2F31)),
          ),
          SizedBox(height: 8.h),
          TextField(maxLines: 2,
  controller: _titleController,
  decoration: InputDecoration(
    hintText: 'e.g. No one is giving Luxor pens',
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400, 
      color: const Color(0xFFC5C5D1), 
      fontSize: 14.sp
    ),
    fillColor: const Color(0xFFFFFFFF),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 1.sp,
        color: const Color(0xFFC5C5D1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 1.sp,
        color: const Color(0xFFC5C5D1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 2.sp,
        color: const Color(0xFF713100),
      ),
    ),
    contentPadding: EdgeInsets.only(
      top: 8.h, 
                  left: 12.w,
                  right: 12.w,
                   bottom: 8.h,
    ),
  ),
),
          SizedBox(height: 16.h),
          Text(
            ' Briefly explain your issue',
            style: TextStyle(fontWeight:FontWeight.w500,fontSize:16.sp, color: Color(0xFF2E2F31)),
          ),
          SizedBox(height: 8.h),
          TextField(
           controller: _descriptionController,
           maxLines: 6,
  decoration: InputDecoration(
    hintText: 'Tell us exactly what’s wrong so it can be fixed faster.',
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400, 
      color: const Color(0xFFC5C5D1), 
      fontSize: 14.sp
    ),
    fillColor: const Color(0xFFFFFFFF),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 1.sp,
        color: const Color(0xFFC5C5D1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 1.sp,
        color: const Color(0xFFC5C5D1),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        width: 2.sp,
        color: const Color(0xFF713100),
      ),
    ),
    contentPadding: EdgeInsets.only(
      top: 8.h, 
                  left: 12.w,
                  right: 12.w,
                   bottom: 8.h,
    ),
  ),
),
          SizedBox(height: 8.h),
          TextButton.icon(
            onPressed: () {

            },
            icon: Icon(Icons.add, color: const Color(0xFF713100), size: 18.sp),
            label: Text(
              'Add photos',
              style: TextStyle(fontFamily:'Manrope',color: const Color(0xFF713100), fontSize: 14.sp),
            ),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
          ),
        ],
      ),
    );
  }
}
