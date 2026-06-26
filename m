Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB043F7886
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480152; cv=none; b=PFCyipVaDTAwKcwo56NaAuT0608rbMXu5Yys2p4/heKBIwpoferdL4RZm752WLa2ttPM28A/LYvRx7m0sDZT/S/E33FFzrKtxwtEsTNJazxhUzHVRjFJ2/izqdSPoF55HlCcIbn0+0ahckBdq3506LPXDHz+ZtJdn/Q+6pGxQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480152; c=relaxed/simple;
	bh=q2OQEI6d+Tec35kArN+O+0T9NYgl5oyAH46QKy9KqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmjvr2XbNIhdtYLb+hRdSuAGJpSg2/g7Z8keQJUw/6TRxZe8CXGpb/3hDkaMRYuXkSROmvLWxloXWyHlj6bEuI5VnDYqbMr+KrI6yF31eyzFKhBH3F9QAPXFrct27/ECu6sW0bqwFDTPs36usCu9M2yPE5qXnIDwU36fbedxQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8GaxNHm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8GaxNHm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea616f511so85135e87.2
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480146; x=1783084946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=L8GaxNHml6hv0vFle+pGfnK+K5vgAJeKWD18bl0nsDXDVvG04KXLueOgOR9jbb5Byi
         iTb0na5cw+mdovr5vyfcKuw/PRRX13z1tbiQndZYuI1kid6liJ7Vl0jZ91Kacl8QBoKF
         OlaHKGYk8iIGdrbR+a07dXk42Rqc4JqfdXZyHkuL7rhOCEUwWDq2B/nwaM1X/ueY9VGI
         mzGf94thPSLpbz+Koe86Ck5pn5ERlJnDU9rmDpn5nXyZv0Cqpw+rH6rJq7Qrkn3TtRhd
         zVY/gVUTqVfGLB4nxgjbH+uYpEaUjEMml9tI94vGPbUm42/uAV2mRV07gwIacxbeYPGp
         EOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480146; x=1783084946;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=AUyBWv9EIg/zJXspRfStSD6/WgDzP2AauQcBWF9jiPmyLOBUVGqjUC0mvIuStc9kzI
         +ME0x+Ibg0BNpLaZh9lSE+7kIEBSVRoLTb+RUjpBDApj7cUwyVzbiaDNfxXSyYmLer5+
         BxAm4od3PexuAbIegonGHKf63NZe8UeNXTBxf9/PWVdPZfs+/tcTRirfxA2rK9/ea7sC
         FXX5+clkBF2lM9kXR3ubi3uMWWSNYOJfHsXtFqDb5zHVa8WFM+VWzuqRYJDkP3Vkuv86
         j8ffLT24fmq8ia4ZTfcESGxZ3Af0VcFZ0JbzjsQO0y70QGnv5Ap6v5V/HItSQowyTI8e
         KXfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1r6cMGEKyelgMB+wzkpP1U+H2u4lbHQMmoQ+tB15jsTRsHc6iiqdWZbSX4kyxvOY7kE0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV5ZMIZSidLBEnyrb0yw/JhP71ZuDV4A5kfnq3xDyPk9KBCVXR
	YBn1Gif9zWDxJeSyBUpMkrJbrt7s4yS8exJtU69EC3hApjlcJ9rFzKFYNzx/tmkI6BE=
X-Gm-Gg: AfdE7cl0Yp6pL9m8bESnF+wH+FCsv5kipRku230egViHGy3JkAWaCY4ZUkPl2sHfUkM
	YAndrxkUQ/UiE64+pzWJCne8WpM/dL551InJNg6QXaQu5EhZiB2ITYmga0ud5pxLUAG5kAMTqwN
	2MRL6rqJVJiLp/ssgx61wnPpkLA1RguptUM51Zhcy7JCa4iOs1+7U+1WK+buTTG7xYRuyhm16Oq
	jvFOFBJbNhV/a0UL2UP8ljpev4REazFWmkRwlLa0ueDy6mJd8TYB7aWcgCO0U9XuGrxPu5ATUp0
	TNN5inajyzaaprTMS9/F92HLFsetk6/f+RIqtfeBtUONXrGPb4+W7HOE8pvTnJ4q5FshUhlcGWB
	Yq7YDJdouAKWBYY3xqsVvLI4Ln6E6WB7JK0Yh0En20g5AaGzmmhS6qEkyQoobxBx3w8GFsQAdOx
	paWa7RrRjFyeNYK+wUjnO0/nEuze4OLWTUTGRtd7ElLzrykugmNUw7Meb7Ga5oaGuKluQ=
X-Received: by 2002:a05:6512:1252:b0:5ad:4ead:72d7 with SMTP id 2adb3069b0e04-5aea1f630cbmr1249234e87.5.1782480146180;
        Fri, 26 Jun 2026 06:22:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea5195050sm816328e87.83.2026.06.26.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:25 -0700 (PDT)
Message-ID: <eaca986e-81d5-44f7-bc64-8e89e5a1f823@linaro.org>
Date: Fri, 26 Jun 2026 16:22:24 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29f..d79be22108c8 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -701,7 +702,7 @@ camera@10 {
>   		pinctrl-0 = <&cam_mclk3_default>;
>   		pinctrl-names = "default";
>   
> -		orientation = <0>; /* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   		rotation = <270>;
>   
>   		port {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..543fc691fd3c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "sc8280xp.dtsi"
> @@ -682,7 +683,7 @@ camera@10 {
>   
>   		clocks = <&camcc CAMCC_MCLK3_CLK>;
>   
> -		orientation = <0>;	/* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		avdd-supply = <&vreg_l6q>;
>   		dvdd-supply = <&vreg_l2q>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index 0f57b915186b..375b3c0edea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include "sdm670.dtsi"
> @@ -460,7 +461,7 @@ camera@1a {
>   		pinctrl-names = "default";
>   
>   		rotation = <270>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		port {
>   			cam_front_endpoint: endpoint {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
