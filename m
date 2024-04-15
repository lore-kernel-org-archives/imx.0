Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A77156675;
	Mon, 15 Apr 2024 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216792; cv=none; b=dmTovIIdRudYZLBzsu7qGFTOI6u8P9ej9y5sNLcLoldEAE4lMVyxaI9lehVE4+Xb4BdJxR+Fbu7KyQMB/xLEFIFecjF57nECCmokwTd9QiFt5DjIgAd+PCmscb8wHEFN1oeB8/CxPX0odwNIvXKgiVqc58gMX6mFHAGREnNeByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216792; c=relaxed/simple;
	bh=4dQXK8rM5riTwBJcZYfqprll9axw8fcL3Iwa1nRYEr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyHHDBYwukDPA+auy87L/CZw/eE5Ylj6GCUCdMfkxNFxCnh2VBa43pVlcYypgfhcFDNRDq+rp4LinnNwQwEmz++rKQJIWIM0z+9Yxj4BVqwQzdshfjQnKA7Ls7oBHfnVULjRYIn5suZhDRwnoXmjiz687h0PhaWWUD17xBHn1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAKzSZz0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAKzSZz0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4187481e384so6888245e9.0;
        Mon, 15 Apr 2024 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713216788; x=1713821588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvC0crxQ4hv14tVfrEC0cLFgOk4kwCtX5f1hXnZbvIs=;
        b=TAKzSZz0ISqKGS1W4Hnko167P+LHTYMPhNy2e/RNZ5qrT8gHtRYdrsaxeR0zWXrspD
         B9NUmtK+KiSAQsrFafEttJg9xNbmsxa4DQo9B5GMXYcXfYJnVNqi0pPDTdEtlJQ/98sh
         kr68WNI+ZdjHP9OKSXoFYaXZO7rQ1og3Dski9S05CEfM0gFq5QuzBQcYYhyiR6AlSdP+
         5GmeUNj3ZC8oukGLtmRZIlF94m4fK73IUwbUFngroDw3x6DSkZNVZnJeDsWa3fk47x4K
         FtK+CSlj2WDIBkSYtgMWaXwI4dTCF8EaSEXBgCtF0iE7wyAbh7PkLqM7rPP/zB0xquLP
         F8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713216788; x=1713821588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvC0crxQ4hv14tVfrEC0cLFgOk4kwCtX5f1hXnZbvIs=;
        b=fPtfAFx3LtRHE6PYD7b8QsuwcOycymSL3xH2o4wXuhRNmSwhB6CAyfCj3x99IowSLc
         FkiJZuHAeN6VkPo0yYwZi+yHYw3MLCu82GvPaXCia16Y1eHt8DrIVxhJGaNV5p3NFEJp
         R7hVFgan97xb/rIksEUvb5dPB98tgcA7odDSttIf9MwN8MWdmxgbuYxaI4KHyJadpgXI
         p37KrFL7tl2i6rl9+wzzN96EisvwHsGAVAzM0NFKKI13i8BK9h7U0t3xSL9KLbaxIXCg
         cNPVd8fYMa+PSYkmwE8i65KPjTWxB11Xw4F2BNxLb3CXICahZRsb0iVMcdJYlZUc/iFw
         RVew==
X-Forwarded-Encrypted: i=1; AJvYcCVb8kp+hBDPMbbalvQfff+i2QODs+SZPK9bEaR+f1NPm0GBa1U/ymt53fDhwZie2OScjMg4Lr6HBqLA3+Fsaj9x5OqMIcdmAIZoAASki0BMei1JJsxUwK6Or5p5FakwOSs=
X-Gm-Message-State: AOJu0YzuPA8JC6DamYbW0XfmyswMyWKHJWN+ouVrVqju63X+JszdU725
	Wsff+olHhGIsHfI74jye518XNjROUyzJlyIyca2j9W7UvNyRdWcr
X-Google-Smtp-Source: AGHT+IGbVwjwj6P/XwJYoeDaKXfrZhxrIYcAxjHA9f44sCvNTZGbYDkW0+pIuu1H7oDt8UlPAumR3w==
X-Received: by 2002:a05:600c:358d:b0:416:b75e:ffbe with SMTP id p13-20020a05600c358d00b00416b75effbemr8521621wmq.32.1713216788218;
        Mon, 15 Apr 2024 14:33:08 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b00416b163e52bsm20901026wmn.14.2024.04.15.14.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:33:07 -0700 (PDT)
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
Date: Mon, 15 Apr 2024 23:33:06 +0200
Message-ID: <8399384.NyiUUSuA9g@jernej-laptop>
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

Dne sreda, 3. april 2024 ob 12:56:23 GMT +2 je Maxime Ripard napisal(a):
> Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
> module") turned the DRM_DW_HDMI dependency of DRM_SUN8I_DW_HDMI into a
> depends on which ended up disabling the driver in the defconfig. Make
> sure it's still enabled.
> 
> Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Applied, thanks!

Best regards,
Jernej


