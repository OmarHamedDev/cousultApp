import 'package:better_player_plus/better_player_plus.dart';
import 'package:consult_app/core/constance/constance.dart';
import 'package:consult_app/core/utils/functions/handle_state/handle_state.dart';
import 'package:consult_app/dependency_injection/di.dart';
import 'package:consult_app/src/presentation/reels/view_model/reels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key}); // شلنا الـ reelsUrls لأنها هتيجي من الـ Cubit

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  late PageController _pageController;
  int _currentPage = 0;
  final reelsCubit = getIt.get<ReelsCubit>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reelsCubit..getAllReels(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ReelsCubit, ReelsState>(
          builder: (context, state) {
            if (state is GetAllReelsLoadingState) {
              return HandleState.loading();
            } else if (state is GetAllReelsErrorState) {
              return HandleState.error(message: state.message);
            }

            if (reelsCubit.reels.isEmpty) {
              return const Center(child: Text("لا توجد فيديوهات حالياً", style: TextStyle(color: Colors.white)));
            }

            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: reelsCubit.reels.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final reel = reelsCubit.reels[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // مشغل الفيديو
                    BetterReelItem(
                      url: reel.videoUrl,
                      isActive: _currentPage == index,
                    ),

                    const _BottomGradientOverlay(),

                    // بيانات الدكتور الحقيقية من الـ Entity
                    _buildDoctorInfo(
                      name: reel.consultantName,
                      avatar: reel.consultantAvatar,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildDoctorInfo({required String name, required String avatar}) {
    return Positioned(
      bottom: 40.h,
      left: 20.w,
      right: 20.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.white24,
                backgroundImage: NetworkImage("${AppConstance.urlImage}$avatar"),
                // في حالة فشل تحميل الصورة، نعرض أيقونة الشخص
                onBackgroundImageError: (_, __) {},
                child: avatar.isEmpty ? Icon(Icons.person, color: Colors.white, size: 20.sp) : null,
              ),
              SizedBox(width: 10.w),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "مستشارك متاح دائماً للإجابة على استفساراتك.. #استشير",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 13.sp,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BetterReelItem extends StatefulWidget {
  final String url;
  final bool isActive;

  const BetterReelItem({super.key, required this.url, required this.isActive});

  @override
  State<BetterReelItem> createState() => _BetterReelItemState();
}

class _BetterReelItemState extends State<BetterReelItem> {
  BetterPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    BetterPlayerConfiguration config = BetterPlayerConfiguration(
      aspectRatio: 9 / 16,
      fit: BoxFit.cover,
      autoPlay: widget.isActive,
      looping: true,
      handleLifecycle: true,
      // معالجة الخطأ 404 أو تعطل الرابط
      errorBuilder: (context, errorMessage) => const Center(
        child: Icon(Icons.videocam_off_outlined, color: Colors.white24, size: 40),
      ),
      placeholder: const Center(
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white24),
      ),
      controlsConfiguration: const BetterPlayerControlsConfiguration(showControls: false),
    );

    _controller = BetterPlayerController(
      config,
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "${AppConstance.urlImage}${widget.url}",
        cacheConfiguration: const BetterPlayerCacheConfiguration(
          useCache: true,
          maxCacheSize: 15 * 1024 * 1024,
          maxCacheFileSize: 5 * 1024 * 1024,
        ),
      ),
    );

    _controller!.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        if (mounted) setState(() => _isInitialized = true);
      }
    });
  }

  @override
  void didUpdateWidget(covariant BetterReelItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller != null && _isInitialized) {
      widget.isActive ? _controller!.play() : _controller!.pause();
    }
  }

  @override
  void dispose() {
    _controller?.pause();
    _controller?.dispose(forceDispose: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: _controller != null
          ? BetterPlayer(controller: _controller!)
          : const SizedBox.shrink(),
    );
  }
}

class _BottomGradientOverlay extends StatelessWidget {
  const _BottomGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            stops: const [0.0, 0.35],
          ),
        ),
      ),
    );
  }
}