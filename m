Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27612279903
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364924; cv=none; b=MGT/9Ic0r2HxnJ2uhIkAC8bpwr43KD24z56YcPBbv1dmzxZOUFfYLm1/i/DER9mEaHoYdCYXg1Bnm8cr3O9blWp4P8JAvMyiM1Wz7ZmNsJt6gDICEXLahmRSJ1+LwWYIuC414BAGdoag6n7n/3/Tmxa8SE5Hg32GJP7wWIEPHrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364924; c=relaxed/simple;
	bh=ERfT447rtvaR+wf88k95vj4wStZVfwDMtZt0ytTxV+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auhHyqmmX7sPZjFRK7170qPIUFitL8H6qBh/+ZOj9WQzjSzfAve1LXHBfLQBzjR6Rl8AWG+OlNSWevodgu0ZJFEVwAoS7vL2cazz+bAKKS5mcwsngH//JzH5J7Mi22EE4kW2G9l4ygeIUzMcNmSRBBpg+e1R7s39IBl6K0WH2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UkPXKQah; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UkPXKQah"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711764e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=UkPXKQahFgfzGvZN8mW987sZFA3izgSE9o2oyEvLHIQqz9KLG3EozgkL2sQHbg4iGr
         k7Z2pf96zSlwiY/PMG8m0u3vI6fhBee0ksE6vLRv3opHYV/gY4wvncLttwiOYhk0snJh
         mV6X8Ly+RFkwInK9hbwdaPjzmaTAFJPZu8zF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPyzKdSQgEFTOs6vrnV72MjIpSFJDGoFOT83Au3htUM=;
        b=OV87LwLYpFusPcXBm6wWpwJcy5qON2LtwV4k67CnaFoJzFFzzPWwwMJREGZzDtTtfs
         rdifReqFx27/WsBlyhnw8OQR6nBY8K43BQm5i2Y+X/cwP6zlA4j/eCBn2Xw6irwuqtFE
         D3oUzBMJVlj+hiH7tJv3urt3aH3SOFVQXYegE4NMUfREmzNoKxC1H8Yi5++OwJXc1zLl
         dtq45gbE0mjssAIXH+AKedcC+ogRFAolDPPh4EWyfl8ppIXCKGfPO72gy4ynMN+TLA8J
         45QGH11MMEtjkBuuMWlHvW3lVhZ3qfjPVtWjwiRQevEAtPN+2GM4XsFYu7liJ3AHbvlw
         /1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUjlC8UlcVfNW7MlZjDUzooULAE9TzC+oAYBdZoNexM/N4MJIyzVKbKFdQoj7mgId6gb7M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2w03ilYKFHktU5dHgLvyTurmxR6uBHGBXmYbYZK0rv51MPCDY
	94PYbGfv7T+QLqg0CNyJI2a1nnEA+ZFEt0+kI1oyNNtLSQFjqYb+HeHpd16WrhUySA==
X-Gm-Gg: ASbGncvA/+VTK6hamL4HzMjVigKzw+7tXdUD0yKox0kkyuiVXdJ1kti45YSK1eZ+ykO
	pWWLaFpZd2aX0lStdO2mKG991M78ByBD5LyWuZqjuNZI4qxANGNMJtGVPGaO6rCf06lcGguO4R4
	lbnTV8mGc9T0C7cJomulDsBwuGl4AuLlUJ0c/uCVnfQMJUoRlRiniyqsKF4GNmNKIPlywhnolGM
	xC8k0drteuT4feVE/QNQFQziVEZbPqyfYzRZ8GWTgzpP7c4ObXthPOiOJrWHFoZ/1vw6IkrEEWH
	rCAOwFvsWvbn7NIclBS2Kn86nEe3z7SLKZnyN3oOvYlFCDbJ1GHRMyckxtism+QB75UKtcNUkHZ
	776CqxUIjo7MZZLmr9H34gXDqp9SbICO4R2lKhV9NIPeQN11CRWflgZtWZbHwXO7lNSRxgLotWB
	nhECrGuGABu5vPAii5p8fhP8K/XWVX
X-Google-Smtp-Source: AGHT+IHCybNyNMb0drsyz0aREmcwI4Uni6luvsP458rJiLZIzoW/QcUDGoAA5wmoQMp1unUYu7EgCQ==
X-Received: by 2002:a05:6512:2c06:b0:58a:92cc:581d with SMTP id 2adb3069b0e04-5906dafd171mr5060480e87.50.1760364904884;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:06 +0000
Subject: [PATCH 26/32] media: platform: rzg2l-cru: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-26-2c5efbd82952@chromium.org>
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
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:307:30-37: WARNING: Consider using %pe to print PTR_ERR()
./platform/renesas/rzg2l-cru/rzg2l-csi2.c:726:30-37: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 1520211e74185fea3bca85f36239254f6b4651db..0fbdae280fdc49f963269a4bdaea38ff2e51884e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -303,8 +303,8 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 
@@ -722,8 +722,8 @@ static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
 	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
-			csi2->remote_source->name, PTR_ERR(remote_pad));
+		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
+			csi2->remote_source->name, remote_pad);
 		return PTR_ERR(remote_pad);
 	}
 	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,

-- 
2.51.0.760.g7b8bcc2412-goog

