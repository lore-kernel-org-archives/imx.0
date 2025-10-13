Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082F2BEC34
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364926; cv=none; b=nA+oZdZJp9b2hwmwipJNO9Fu/YHSV5NU0uGyqnHV6PWeka3k+eiOkasPxpG/wYpjmm+5lVM95oeZh/0aAMudizsIegZhZFlz6GfGt8wvkkDiCoBPpNZWKdvuhOK2QSYdGZ1M0WloJaKfwyadg4qyL03wCCNaAGUBWp5vpsEV8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364926; c=relaxed/simple;
	bh=GaYybwTc4NMu8YoQTyNOoa9jWFCzwJu0zC9otJ25O90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiHNEXWRlnErvdRpMBAlTnAnjoITMmL2cNq8gX1pnXwqGRyU9mjDHG+a2U9JwHV+WCw+eEbDejDkHpQ5jm3/faHUaA1PNJ9nG000wsTBWhubkiIAgcdbdkRltUDgEvYRLQvoxStFb7N5NiQV5eDzXB7+Okvokpxc5HTgojPAC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hApkJG5p; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hApkJG5p"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so5098517e87.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=hApkJG5pbrb738EUfkSVEdFvYIt08Qekt40Soy6NYsxbuZidp9YzmODC8eyvnaGLmL
         bM2A7j4EGitA9kNrN2eftpthyIABatYVEMWuvkKNoW2U4UprEuIz9focl6MkXie8U6KM
         t7EhrAfMH1bq05AKzXbDN5l95vEMUqV55mUkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVsYamtIjQUiQyb/41UVrEZvV/AHr8CKvvGfsgypkrk=;
        b=kxCTpc+hv8qoc1kC34taIAHBJ29Q7xSD1WUMio4GH49+t1c5QG84C0kHvO8fZbiHXc
         VDuDSmA6jKGxa9Hm4dH+U31WoDa9vxV+eEdeGFbny9kqHxVJWLOwaiHljJ5V746aRGgP
         kj26kCRZXO3cEp0oFIhk0asYByv49T+CLhTBx9P07YB0XbzwPVbSKM7sd9jaoZ2Ul0hs
         2CK2D7L+9pQAqf+mpN3b00Axm0Kkn/G+m4TJ3wkbOCYyh4HcnqxFPYLin5Mr48gpIO/T
         GYDxnuPyqNojcKLZXaMfCIFg+sMhDahkukfTaqJpIgDVE20hfHA5YxZJpVwbeuuDcaQ9
         CGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6CM/ayN1H78i9Of5ZPRKIed9oP3EoPBZVCYqgRLtOqVp385KY+xIfL7vuD1iXQZfmETw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBiqAk/IRWiSZLGB/HBdQYPctdD2HEdCaRnplxZwrTEcb8gn6/
	aBZF3PrX3V0AG8Mk4QHib3dcoywOZzbevxgrWpswh5vfc3cv90y+FoU4BM9kBRtwxA==
X-Gm-Gg: ASbGnct9a0lj/D7qDVsEPevC5SA4QTb1QidbKGoIRv8TMRuAGx9kwl+2Vp9rc/IjaT2
	IIri2L5qiXK4z9I5Wlxz2XLhX7aP5FPMVdhJA/eAJaob60uY3mKPtCLJu2U9ivg+ZXkHQ6DpGkE
	+umhx+ZWWOPHMkGF3RT6rfkKqpp86lBANPm9jvs5L79Wzo3B/FeIrp0BhHoGdkb+UQjrlyH5CBm
	vBMXP41Ltho3S6DoVMTh01/f8I+S+RmYK+6OB7oNT6D3PXDZ3sE84dKLc7RgyOavwW1o21cdvk3
	pqfvLhFW1L1JT8LSJI8IucvFtl5roeSMUM2HxHS3p0vVyUsZtdvBeJFDppJBz87QoV/Kbwy4sfr
	Z01hMamZnwmgFtMDcu/K8gmIfvqbkN43oS43p42gtJMohPWtW/2KenlKAQoYnwyGyIORJl1MQMA
	/uVXKeQk9Yb2LQT73vWj3KZTehZ/Tf
X-Google-Smtp-Source: AGHT+IHnTH3divp7fqt3s0C0bL0Y26kzFRRxIkA6dzGRmTI5xBy5IO/jgX2PIUsKvH8Kkie5THLlbg==
X-Received: by 2002:a05:6512:63d9:b0:590:9a11:9c23 with SMTP id 2adb3069b0e04-5909a119ec4mr1624042e87.55.1760364907731;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:11 +0000
Subject: [PATCH 31/32] media: staging: ipu3-imgu: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-31-2c5efbd82952@chromium.org>
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
./ipu3/ipu3.c:534:5-12: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index e22a9c0921957ef2fbf7b8a11fab28e6d78c60eb..bdf5a457752b24bf35e38491d63fc1e059a1e058 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -530,8 +530,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 		if (IS_ERR(b)) {
 			if (PTR_ERR(b) != -EBUSY)	/* All done */
 				dev_err(&imgu->pci_dev->dev,
-					"failed to dequeue buffers (%ld)\n",
-					PTR_ERR(b));
+					"failed to dequeue buffers (%pe)\n", b);
 			break;
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog

