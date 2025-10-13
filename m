Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA263093C3
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364918; cv=none; b=ZhJdw16bX9ZZn8GoTbG1N4ROPt8ivXNKiDsVK7ICyHR5F2VAo2l/JPDy67hableMzIM6MFGwXd/KN8TRdAjIpknO1e3CoFalyandV0QyO1mdIy6oSeQv7KwgEH46x899UStZbuVfAC7jDl+TVg5S3XF/LP53MxfmiPHJWN3ekwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364918; c=relaxed/simple;
	bh=8RLalehrPbI0nVV069+gt8p26w3tCNH5+ujATmPll/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUnsoDxEgDKLjLsJVTqiRtkBGnBXcq5yUZv1JHUIoWudjy4oEL9MZDLTPnbJky5gyNxstghPfMsl0yQYCuoi4cXJWcDgg/5IpFoBkSu66AR5QS7uo6xn2OMoPSXYIqFOGrYk2NtbG1xoJD2mOCPRyiKQ91DnCpsUsPHdvO5XdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HTQAFEjm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HTQAFEjm"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-36a6a39752bso40631201fa.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=HTQAFEjmYex4PkoeZ6ONl61cb0hs1/d9ZvCMY/HfPGuwiLGMCWF7Ohc9cdPODXUa7w
         ta/gBGNmg/WFjMUYml/v8qCC2zHUaLCFv1PuzpI9ceYprD4gHk9L4pzMJjSwSKqaWAas
         OTCL49IipZ6ZUZ2got+GYn+aj7C9YRdUjXubM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=WG6Y5816iHnPaGGggt9AcOpBC2z6yJSE+zFmxt2gJpR/DZKFSo4M0MeRuxSs4FrnJK
         D5jKUJHkMvmi/aEDR65ZHKLQ+A6sXm9QHRwWTlH+TIIIQ+wUDT/CzqoRxz3dwRC2ksyZ
         3HqbMuhTTOiJnfMLSIBMcETQfEB3MZp4jvTFN/lCaaBHoHwguvwkCN/Q0ySMWQkJnO5I
         W2nwDIqzneOiUTS/KToIV6V9THrJBDH0QDwwKHKCVdlHMiYBm/Zt6fAA4yvehXiq4jXU
         sk0LP/vGOtG+GuVafH5fAQZV9hH4G6tnvyz3I66+KqkI+VqXA3JY/JhAkWdSnW8Ea0ri
         sf7w==
X-Forwarded-Encrypted: i=1; AJvYcCWE7C45PsR5OaGc5gsoEvu4zXMMoD3VXZvpEZunrpvm8h6LEsLXjqyTbnMcEwtPRuB45Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMnDtiTiwNn9WoGs0WCB6nLVqWbb3GqcavIfPJDHlwf8hoZXu/
	hoqYe3biduSukaQuVAmIcVbZ98+c/xLfOfPJRqc15EmCWw8HATPUOKG5grzasaO4Hg==
X-Gm-Gg: ASbGncufEGBOK/1hrqvpzv5mRuXK/MxZz6tBQGW81b5KsX4GSAkDQtRlEvkAi8za0KL
	t4D7LzpYPnyFUngCbhGZfNeB+5UdJW1C2XxmIsWeMFbsBNu3Jii1kOxbvsqCqHGBkIkOy1KotTb
	t471b5Cx4juIYb7tw2j8zvz05b4B0uvoLHH3MQz2DttOKI6hB1hwfDpPkFAOGyQtSDSuZZGBB/k
	QngpTIZGE4fvqbKXXlNFHF9OL/tQSufof5Rn2lGQ1/vdA8IdqIwgobGSJkqQshw0hEet0ZI3StV
	sJcCjOU59DRFVRzO0irzrphSLFt10YyY4HIZ81zBZ1kwmC8c9P5XUOio9kDZwgedojiTbDxk5Z3
	QBXFwpy3QFDDR/Q9abyhpwrJrgrghZzyaYW4osgM7o6+5pV8ndfu20OodpvbubRjYu0ek79/PQY
	TZcI//Dpwg3tYRUckCWFp51t2L+OUGHp1N+qzn60U=
X-Google-Smtp-Source: AGHT+IHaXYtEGcC0lCeqZAPaJ1Eba36sEUnGMYsHL1RWVLLcW4i0NjVadIfSh/QN3FLm+/VJwSwBng==
X-Received: by 2002:a05:651c:3617:b0:36d:501:76d8 with SMTP id 38308e7fff4ca-37609e5e0b9mr54139201fa.31.1760364901230;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:00 +0000
Subject: [PATCH 20/32] media: i2c: st-mipid02: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-20-2c5efbd82952@chromium.org>
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
./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 41ae25b0911f02517f137d6b5307d13154266e07..4675181af5fb00df837c8b796fc32d50e077a480 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -747,8 +747,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
-		dev_err(&client->dev, "fail to register asd to notifier %ld",
-			PTR_ERR(asd));
+		dev_err(&client->dev, "fail to register asd to notifier %pe",
+			asd);
 		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;

-- 
2.51.0.760.g7b8bcc2412-goog

