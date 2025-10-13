Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4F2F83BA
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364902; cv=none; b=JTMWIm0JszDtfmbv6ZBPFBmzq3Wkd7FiuaJ1ddYa7QWNTO3MXdIogL8zrSGvAiSYaLJh2EjSuqdZAGkHzpW7Z8KpCkhfmkUm8fPor/75d0C1mC3ru9WI87pleD5FKyfY6ay9QKd9VI/qAxtKYWmG2HUpyjx0OQBU3Be61Qiv8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364902; c=relaxed/simple;
	bh=v1chswa10XA6p6iwQSk8q4C1sH6EpIjnX5wmdhMAOFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjzryZGaeHduX8b9SmXSIo8/biP5If7JRm6A18hhv5LFCvc6Zcw8LZ4y+X1Y7KbyBhH7evPep6La0eez6BuL+nCPCTuIHQ+xRWduPq2vimBSnM0goY/I9cbjY8M6+Csw8v+djBGv1SiEiHbviMe8mu7CCb3k+S6gi8MmEHoxHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Up0jC7NL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Up0jC7NL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-58b025fce96so3763933e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364894; x=1760969694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=Up0jC7NLZwWuLnhPA2SPc3dTlQbmBEjJr6FPZe9cSWFXFvTC7D519Ac6FyE3Z4CRNA
         wxs8iz62a3b14TNK2DNHWmRGNhAA6nJwNUgfa2fSuDCUfs/IN5CbLyZFMNJIkBdlYNXx
         VwyQHTjEXQBrUbBYoo23V9//gAh2ROvNIdPAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364894; x=1760969694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=E4GZP74hHOFECKUj3MGiQMI0XssvT+wfoU3EtRYno7RADEa0a1CZExkznCsu1C8h9z
         MF5R3Vm6mYCYdWGvIDCIYTE4uSzLL6rIfxpwHY1+3tsLz7ZMFz2RBPHT8WCNNU7vTGiC
         WTyQEZJVa/ajjlw7zRn/0b5OEuiOfsUtYiTi/qt0uTtGQCdU+CTjGyrJIdBUfIhWkMNK
         vj76B0J63BAkQDYRTr5HvM9lXEjDN5rLKe3G0vX/61LjXtYot/iwmuWR6Hr5p0M51+yi
         YvpAg9zgBJM7TqjsehNamrcIxWuhvGjsQwmfK7wEvNxLwrcz4nGaQFgRKHRi1h1QnjWn
         ECsg==
X-Forwarded-Encrypted: i=1; AJvYcCUtlgjYRD6TpkKX2z62K1cGpjJcEaITMDCyBm5IpeEEAk5RP9n2i7L19fvV7ocGgAh9ous=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlbCVEk4y+VTdHtBx3qmGjqTjQyz68P5c9Aki7tnqHnUvJLL6Q
	UTadRHJXCehxmwvFwdP9n2qVEcc8kHUjSCtPa8YpFNnxD1Fxb+0M+dsHZWLQtWQXwA==
X-Gm-Gg: ASbGncuw8ts0fhXF/NvGiPr5EMUlfyIQBrsoBRAEZuCaVtqXP9LiV7NdHX2mBXtshHk
	7RKYoOw5RbR4gt85XlSR5KdXzuf+1exOq070lU70TSq1XDjMfPKt3B0u6y7W3HZ7AYbpz7yyy+4
	kaxgwqrhFts1w2nemLpodk11AfSd/SlSd0+HMhhEVnLVI01i54/L0Bp6MCTbqyPxPJEZg5ygqTL
	qbwD+PECHJSQeJ7Lh0By5968GoZBs8XGOb+l18hHP7hYS1nJZmOwm1TjbCAVmtSpJ/vlVJTE7Um
	EPS8sKuSUi0REuOCTVxC+2+9aNmDd8tLD0NBo7Hk9hpC20NZis+Y34R4VCHWBe2uGCWmHBgzB3Q
	MO5VwG44xPIIHAllEBtkBfIknDcc49h1capkjU9yOIISd5ax4AhgyMgKvyt8ne1fOhSB/5fiwm1
	3GjuQ63Axlf3bE84vwbQ==
X-Google-Smtp-Source: AGHT+IGDBA6vFVbdaAIVk4TqwO+W9UovYsrjETSu90SPXIb8+mEsMg943qVguajtHcsDf6ytgGLF1Q==
X-Received: by 2002:a05:6512:6c3:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-5906dae8090mr6097318e87.49.1760364893949;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:47 +0000
Subject: [PATCH 07/32] media: i2c: ds90ub913: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-7-2c5efbd82952@chromium.org>
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
./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 73150061ea458937ae4ba7a937ea030b0d98bce3..e97e499b04e6c2700d7d433ccb4fdc57ff12b586 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -622,7 +622,7 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

