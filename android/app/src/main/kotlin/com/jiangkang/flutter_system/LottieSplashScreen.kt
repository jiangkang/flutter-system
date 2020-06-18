package com.jiangkang.flutter_system

import android.content.Context
import android.os.Bundle
import android.view.View
import com.airbnb.lottie.LottieAnimationView
import com.airbnb.lottie.LottieDrawable
import io.flutter.embedding.android.SplashScreen
import kotlin.random.Random

/**
 * A Splash Screen based lottie animation
 */
class LottieSplashScreen : SplashScreen{

    private val lottieRawIds = arrayOf(
            R.raw.lottie1,
            R.raw.lottie2,
            R.raw.lottie3,
            R.raw.lottie4,
            R.raw.lottie5,
            R.raw.lottie6,
            R.raw.lottie7,
            R.raw.lottie8
    )

    override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? {
        val lottieView = LottieAnimationView(context)
        lottieView.apply {
            repeatMode = LottieDrawable.RESTART
            repeatCount = LottieDrawable.INFINITE
            setAnimation(lottieRawIds[Random(System.currentTimeMillis()).nextInt(0,lottieRawIds.size)])
        }.playAnimation()
        return lottieView
    }

    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        onTransitionComplete.run()
    }
}