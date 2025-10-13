Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821193081C0
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364909; cv=none; b=dOkN5Q8QwJgmSHCTOhFdIp1e2GbhZsSfSV1fCUaepaJ+rx6iN+/pi6o0B4+31Ya2yHZByQJ+iFIq86kn+Vs35JxPKgTjWG/xCRUoZUvvOFT7FDNdhdz0jFsP/LtfRzCrEJBCsS/vA2l1pMNLgAnqThrNtYVBZHHnqPrdkcAqMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364909; c=relaxed/simple;
	bh=PoPtHLGESxHSet6DKhSq32L4rnbboY4bB4TsHRSTKBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmtMtacXsqc2PHyaS/lGsxoiH5/y2DIp6LobQG8H9/+F3tP058PPRffhAb3/JVtWTtZ8Z+QekYUrAQ0KN5rkVudLasdKKGEwrhXvMco0Wt0deDODFl92548nf3qtx3U9KCoGCRSOFtJDQiA3ClSiRcTYIS09TammZaFY+GtOhUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RrNX6rs0; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RrNX6rs0"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4681828e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364898; x=1760969698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=RrNX6rs0RDcGzgCcePDNgKWTwCiyq24wY4Anw0rnZ/eWyd/477ngTFXnZmfHbrYxyY
         Y3xLrBw3aoHuQCWLXw55OH8w+aOmvUuKHnF1r0iuBi94J7LBJcHOQlQv/0xPcphoFBcT
         S4agInTSfQCj7NBjQey02tpkAPYdUEGAOAFb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364898; x=1760969698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/KkfbsbDFUpgpWR/Q+1n2e+SsZd/m2BbfBCG6Meudo=;
        b=bPi339K5COQmH4fLg46WcBIKp2kPJXmpV0AMkCsgYud3I82gg7yaJqmpmkLk7d+gGM
         vguniZIiERt614AKPptSU26p/LMaE5zGgX4/JFfX2cXH9XcG5Y1qd0AvIC+10NzZOiBs
         aR/7m0C0a0p7kmlZZeqvV7rEFlwQvBJ/0d56TXfpdxMQr30jrt4wfLRnxhVJP+WahS8z
         N7yQX4rtiqwbP/9vSyGmMWq3rNTV4xjPqP1/IbXRDNfVKXyC2wLOz1ZeRdW8GTGvV1jN
         0Pla6cCb91p4qCkx/LCG+dABIR9CsU4zbVqDuWejCcaP7ZHcBEuYNeTXxyFxCDUGtIwR
         iJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu15gqI19Ay7+yZkMrEOwZJTQWnjD4aoeWliJ7HGlXyIAnNaxF2UTNtDpHwPSkaj/cGUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzZGw3utWVQRGDHZgweykTRLgguOLN6qO46qtaTqo28wleTSw8
	FvinZx/M4ysM8nye9kAyhEM+ueyN2YPLa2OIkZSn+E584HVava6tJ3QPDzxUNXZjMw==
X-Gm-Gg: ASbGncsGghR7tWFp6dhsF0gDwwjGB1Mrb9JzQJc1F0sCb83lxWWbWhA7cLy40kTKSLI
	YqhKcwPAr1SooNGt+TCDMw/qoQWuICuKcEr3t3U4EKAu7mJ3zT1Ba4IYOfehTmK2BJ9kQkEZ8Xe
	7LLw2HEsRxIVn/Svg5AiO+LuzfTupWVmLeyrq3cw9FUgJC3NWt7GNos2iBrY8LGuqtCCfuRHxMv
	1yMtuF+2deCAl2+kLO6U9NNuj/nEvavFi85OZks2+/aLj+Dgk4/RmEfgVNwNUCLtN7ef5sSkUHk
	1K0k2RzwysSSDovYGAPQSbb4J/8lSe08tsGrhEhaoh33/vr0mS2xlFMQ1KfIKug2/QwVblAT+5D
	/cf9UTELLSufsF2CF3JjtdpgF3gKf3lhSp74HHH3O64GW+bkzWWZiwaz9g8LejZY/SZTlODP3L8
	S4ZHvo9mMEjaU0IhXm/RspkwJvaMFg
X-Google-Smtp-Source: AGHT+IHydw0CVPv6HxiK0rxt7/F7rhhFXqFXXsY7vFrPuGUIbADwLidmgxRKInXX5MSWX37dI8vbkg==
X-Received: by 2002:a05:6512:3d17:b0:57d:9f0b:fd4b with SMTP id 2adb3069b0e04-5906db0ccd1mr6079921e87.6.1760364897595;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:53 +0000
Subject: [PATCH 13/32] media: i2c: max96717: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-13-2c5efbd82952@chromium.org>
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
./i2c/max96717.c:653:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max96717.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index c8ae7890d9fa87a78084df1f3be631004acbf57b..71ec4fdb8e3d96dddc23ab090a63b23b1d093fd4 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -650,7 +650,7 @@ static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

