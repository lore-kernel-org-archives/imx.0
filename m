Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE632EA47E
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364920; cv=none; b=CbTQ293CaHlsPC5NoqSMrphUCUjjVBIf5cbr6ENzZJfhjgn8HiA6/Ot+ZXCX0CZVKJxTzIhZQCB+kAm69s7Wtm0jkHvF3wnKh92DBObqQTc7q24J+fO0NAtuQmoCtVMgOwDQ7EJ0u68sSZi5p38mxlBRtWHlhiMBoGkuInaPCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364920; c=relaxed/simple;
	bh=8Y3wF3Ogu1PTCQAe9QDSmk3/csBKQwAsoOPfpiyO1ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3gsImdaLetMRUhSeaApKwcJYME6L1u9QSW8midox5zyOd417QOq4vwYZe/m6LaDesrEqheOYNU4+oJvmik9BBkPcrYAOu7JLSJ+PV+Hf+bZlrModBUswS9Zl3BJnOrIsBv/wmGbqnu2GyAGnkHIp5nc2EAup3Jw24kcnafayjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VIWLo0Ar; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VIWLo0Ar"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322377e87.3
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=VIWLo0ArRkBCOYeoc7G2R0KrnXzAXmTapQGWYzzIC6Flu8nn5K6V6eKbZJAEUIVHfL
         TNnFwJPaDTAD3sHknCWP1gcJW6RC1l0QwYQcpTtWdcDrjzAvgdDbMVYzZn9EK9vztjPI
         yqc8iEPUWZxwG6ZGmUURdmEXruIQ33973b6nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=HzTvlLqynCaBN64aTez2ozwKGGQWsE0fZCgRmwPMkkYbiNAkJXFa/I7b6e7tHbp8CF
         pA1cCSF28vexdsRQ0S2VqzmxpD2boBClPIqh6evtJjD329ooqT8aSyiiKDqzcUJxMK7O
         0wRptcfjbA9fU6qu/jt3oPdFnMReUvMWy5pOMSVEYlhqAvxDfFa0w6msTNVR0rBUsTSI
         TVIBs1ikOgKoXwXlp7UbbIIA2AwBfjUsfGJz+rN7r7IKASL5yfUGhksBClCJ2SPPJZvp
         ZiY0yH9vhq8TrRx79ve0ZC9FoI6FRG2GlQoAgBE9xY0KIPb6CkC6g7t5de2Z5HiuH8n+
         eSDA==
X-Forwarded-Encrypted: i=1; AJvYcCWUX01Ua413oPQPI13rHfvXKWzM9kahkRF+QBqiFOTKAK1aBHcWuGPhj38UVwOOkrlZSW0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhAyRtE5ZTeXL+quqiGLgacpNNDC47vKz5NXfkKB/iKPBEh9Ja
	+vxCNXTTl3dh+jC0oTCqanHVcnKpmdH91M8FSWCWA6BCpZFEJul7LqKjoDE/zoPpSA==
X-Gm-Gg: ASbGncstaYptPOPt0g+U216Hmfa+2K/J5LdeQJb37ySUEjeFEQvuQQKuTlSknl4n6a4
	sTpqYgkLF/+DNfz0MgI77Owk0SSVDPLlwKb9TOV3hb/BYI4JMuo/OS4NlJ9roYuuGLG0tczVYHz
	tHgd+Ui5G3BxQ0+pFyUkKL6vAi986rj7b1z+vMPy/vnLxdFCIOugzFIWBN4DqUSgSKFCfkcChCh
	9Rg0Vh3tLhvyeaJvHqtiNhYXIqOxG6euX3ZXKjWR0fGDxOTAfPl7kwRa6S3RPEEaBM+COW+Wad8
	MFX9zfyAYfMTc02E7ovvXZ8rc447ORvMJzZAuxN99JLTpqtp3A2Aek6EUqXr1VX8iTFReS58kNT
	16qlPEPAX82B+Cg5S8F0r2nVoeunQDGwKS6kmrzmDa0FSVYGrX/cDmdpyoiU1gQGIJndRx2Skf7
	edXkOpX0m421Fb1xE2lg==
X-Google-Smtp-Source: AGHT+IFTTHLDJWS3Dn9Gd32yhET2ji8RYegzhadBkm4NFBADg/24WPxUjewhK5Qa14H7toVcPkN+hQ==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d11f with SMTP id 2adb3069b0e04-5906de88e60mr5677489e87.44.1760364904333;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:05 +0000
Subject: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
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
./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2cda8c44b3ec2a9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
-			sd_state->sd->name, PTR_ERR(src_pad));
+		dev_err(state->dev, "can't get source pad of %s (%pe)\n",
+			sd_state->sd->name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

