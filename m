Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654992374C;
	Sun, 14 Apr 2024 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713088535; cv=none; b=q4he24DDLQYW5v5TCuf9VTfApCCHF8Hi/KutMbtXOuH1Go9+TsyhvSkcoKnRa2Xt+maNRB+ibE04ahWN/wQ+txxBmtbvY3m/zYPzIDmJrnDMmlodLGY5BdF8OecbiQxg1v4MjyecB95zL9jPfgJKIRmXlg8jXksUBPsrYwM1M5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713088535; c=relaxed/simple;
	bh=b3tnisE5mCthW2dJBswBPlSIzQlrQrLbNhzUABTmHY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXQoc0gDwrwvpnm0aZFGXOcP64IAD0xgWSBYV7n9T4iln8Bnu0eO4XS0o0si2Z20T9gAymKsMcqqDOaKuRXTWOjgr2mxOinJrjPqu8uG+bO2PwhNpcSgYo+ps5RsTZswDtDiztj6Q1i6AluxzmB9ea2bG57pSm9VF7om28nWnZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cpsl8ocR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cpsl8ocR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d487659bso2818750e87.2;
        Sun, 14 Apr 2024 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713088531; x=1713693331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAW8FE3757+N73ozBr48CQyvPZHQOC5ywYwUdbEQp2A=;
        b=Cpsl8ocRgpwHLtddM2MeGfBVeExFoZtRlyIjiryVtkxNh0/eReOzfPNxqnbsRBBXb1
         azWcJQtWm8HsjRjXMmAkIbDRdAUMs9mCOtc7Sb184NL5FzuIFJNyR8cGfNEerk0ddPgN
         AKo8dcsSHwSj1WOeYfj/qE2BFkh41njpPVJE/4EVGoWyPUsqVXjJjsXklaCO1UJ/oSEO
         3T+xgnJkTVAwsf1XouztuA1WnicIDTJ747xUxRsyNg3gcf44Ob+8RFbueJzIfqwwgtvR
         k2WVqAN6VxdtdSBMCm+P5tQY3+8xeaNrbI9SR9uAEhM7hopI4yTuaBj3g/QCWHZIO5pj
         IseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713088531; x=1713693331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAW8FE3757+N73ozBr48CQyvPZHQOC5ywYwUdbEQp2A=;
        b=cYaTRuPfrvVNwAG3gJfi/GU25RibhN6XU90Maan5cQBNJRuRyZaITh4znq/trnxOmv
         VNFzgmB2DLHNxzlAM4VVk81aXUk3iuB2fWcefx/D9g6LwhKq0dQuFE22yarVeTuZF06i
         I+QWhK4G+3uRLuWOTR8JMUu1O5YumCVQNdrT9pwUVWVlkyhq/3sM5XwAdHv0BMH6iGtC
         387OYIQSV4KFUY5Cg+aLrTNXRhbMIRkSQKge6JcU8kYn9/rnzxBPNKS+cPBSwa6FvD8H
         L77y1UX+jPWTW/dLXN5RUNzWl7PeK5Qa0m4YsKXoygjA7zZnmP1QWYurdsWpEDXfTDt1
         ShVA==
X-Forwarded-Encrypted: i=1; AJvYcCWokiNItaJFBCDRWJfKUGmU98417bt58Ql0sW3vh5wbD6KIzn7Pe2kybqPS4oyy9GH/zN7wxI1TXTaj1LRYOo/Wbz+ExIMlh/lcTY56GCJ4fJcvGd1FIDyJ0REHcEIo+LI=
X-Gm-Message-State: AOJu0YyebtGimk3wlte7II7aEFyUAjlieojIWDOelRzTp9x6u1MHt6gB
	pyDfUo63TTltNCFzB97EvMiypOBIOLb5EAZaO5PH4n5bRhuBB/Au
X-Google-Smtp-Source: AGHT+IEEKoM/iDTJCuznVR9HiQN/AVCO8Nii+pEgbCzxUMbS3kxqr5wisBFEtwUu4Hozxm6Lwg6jLw==
X-Received: by 2002:ac2:51b7:0:b0:516:c099:e785 with SMTP id f23-20020ac251b7000000b00516c099e785mr4409977lfk.20.1713088531265;
        Sun, 14 Apr 2024 02:55:31 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net. [46.123.252.50])
        by smtp.gmail.com with ESMTPSA id f10-20020a056000128a00b003436a3cae6dsm8677094wrx.98.2024.04.14.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 02:55:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/7] ARM: configs: sunxi: Enable DRM_DW_HDMI
Date: Sun, 14 Apr 2024 11:55:27 +0200
Message-ID: <3289340.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
References:
 <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-5-afbc4a835c38@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 3. april 2024 ob 12:56:23 CEST je Maxime Ripard napisal(a):
> Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
> module") turned the DRM_DW_HDMI dependency of DRM_SUN8I_DW_HDMI into a
> depends on which ended up disabling the driver in the defconfig. Make
> sure it's still enabled.
> 
> Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/configs/sunxi_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
> index bddc82f78942..a83d29fed175 100644
> --- a/arch/arm/configs/sunxi_defconfig
> +++ b/arch/arm/configs/sunxi_defconfig
> @@ -108,10 +108,11 @@ CONFIG_DRM_SUN4I_HDMI_CEC=y
>  CONFIG_DRM_SUN8I_DW_HDMI=y
>  CONFIG_DRM_PANEL_LVDS=y
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_PANEL_EDP=y
>  CONFIG_DRM_SIMPLE_BRIDGE=y
> +CONFIG_DRM_DW_HDMI=y
>  CONFIG_DRM_LIMA=y
>  CONFIG_FB_SIMPLE=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y
>  CONFIG_BACKLIGHT_PWM=y
>  CONFIG_SOUND=y
> 
> 




