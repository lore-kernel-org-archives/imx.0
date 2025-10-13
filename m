Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37230AABC
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364930; cv=none; b=esqRtW5WQc81kit/VsIR6XKIMQvXA6yZIJulHDtKsNBf79JMG2uScQgZ+MMr+57HXM6VvTPlnogNcpy+ww9bDHwbU1tpiI8wY73bTL3Ie7IsJNXdok2cSyYP7zhyyEm80Mz9la0TFZcH+IkudmV8Ag3MCbPn8FDqfa3haI/UmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364930; c=relaxed/simple;
	bh=c9Kb2b0T3BLAmckMzo48k+Ue6UmlyuOLb1cyxCq4tlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDrb2sJRkfkZ8ASxMzl6zer6dEDL5/AtKjbZxRoF7eVbBr620J7cvRJahpLZcrD0K4AVVBjgluEdsBoW0RfiZfOw8RSYE0T0dUIX9PBdIFzifqe6G4Zwwj+QMmsBVwgFVBQtGja8AT9fsyEiA5FuF/UB5/0tX5HgghAHi6+SET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zw01FyRk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zw01FyRk"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649838e87.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=Zw01FyRk3JMx2ezfu8rT6cyUz2+BIiSc7/XHkiaeI1DIMDQR8s+FY550xKGVfShSra
         qhIc1DA+7oP13bRpfcdLJjZQlPMwx/E8iA3lRnYMAWUgZOTaiMqcHF9wfe4+ESMINCIw
         qWHSDZS6feIoLDwis7ZKGiy7qCr7gYUenlcP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=jyk6vjqdp9Mdrd+fCh9nGJZGsMEGaHqACm6QvoSbSAs0yFDYLsTZcFIOA9V2mtlrB+
         HbWt/JkevKQQPFoBO8pSbNv26D3K/jFRZq4qt3VgoAb4io4k4gwD/Ax9UgGZ+wgUzqhc
         I4dypaVCnC6pvEBGvuGJabIb38Bk9/Ng5qFtzAK5r41mjEKBhYMDptw/zYTkEzpl9SaZ
         FC021RA/kAF4yEmBUD233vuwo4BKM58AitRhu8LUaN5XmnGpmJ2vAovPWsvOzOI/II2c
         8FcJCNbnwEKxoWU3Ut0kwvZRrYCFGJlrpteT1oKNb54ycMDjwngfMxAqLDP2b75yUlz2
         H5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXm9Qt0ixE+Jf8Xk//oPD+JsGTw7iJO7kJP01rawNCDfJErDGOXhWLyGJuJnE3rJEAc/g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK8aMs36rODqG1LtpRH1Jmft+04WYpX5LsffQYSVzmGcElBSfw
	9NzAWPlCHdRkNjPmYN9Dw/llpx7Tpvgcp6L4YsVUCoaDq1XgSfrnwXJnsSuQDjrocQ==
X-Gm-Gg: ASbGnculOWdlo3KT+F59T9eXert9W4zXRpuyw3+tixajCsBZnTEozDgMHVwQJ7SGKrn
	RgFxxbtp25LxR0cbUqdW1BjuJ/H+1E5i/8JGRRGDPwgRTJmgkMBP2t9tmF9u4bJzaNIVl5OiVHz
	XzCRjiVM4b6K0nSrQsLoKWXx1fwer1lM4W6TDsMBt1iITSuRCsJ9wtDQaVilgLgoWSEdxJ6bh7M
	+Qd4hol9golSDJsfLmZjbzUNIn3JU+evw4G6JTKjVLl9h3KLnRvz61S9zpG9VbWfLZ8DJMZuIrc
	1XiGhL2JB9KDPWD5ecvXy/2WBXj9acCqT7MdBwU9oA38frmNnXVSwVf/Nr0wJM8MHDHtU5fem/5
	R0CCqWJN0+V0Rj+F79zrq9Aps38sCXKYk9z34nGIk+DhpA7l/PXG/sED6sYOAS5kkgi7UKoFtcG
	+mwdMn3gjLUGSse+TFAA==
X-Google-Smtp-Source: AGHT+IG0XyykaxSpAJZEJBiMkxB//rHuKsliNYYIqdi4qrxeJQYdIviCb9iwNXvzzJnUAUziWI3Chw==
X-Received: by 2002:a05:6512:ea9:b0:585:bc5e:237c with SMTP id 2adb3069b0e04-5906dafca4dmr5906081e87.49.1760364906745;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:09 +0000
Subject: [PATCH 29/32] media: samsung: exynos4-is: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-29-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./platform/samsung/exynos4-is/media-dev.c:1337:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c781853586fd21996105c050e587bf8079cfc095..d6f7601de597e3d3517ef9195d728deb578e74f1 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1333,8 +1333,8 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 		cp->clks[i] = clk_register(NULL, &camclk->hw);
 		if (IS_ERR(cp->clks[i])) {
-			dev_err(dev, "failed to register clock: %s (%ld)\n",
-					init.name, PTR_ERR(cp->clks[i]));
+			dev_err(dev, "failed to register clock: %s (%pe)\n",
+				init.name, cp->clks[i]);
 			ret = PTR_ERR(cp->clks[i]);
 			goto err;
 		}

-- 
2.51.0.760.g7b8bcc2412-goog

