Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886B267701
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 23:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092932; cv=none; b=gsxCH0WOjfFz9Z0STH8J7WA7kKGj4zQim5HyDuk2fv2rIqOfCRPHiFNlt2WW7KK7Uk8+FyPukGJXh6HHAFWBpDBoO4TJoSVRJMFpnI5ng6An7Lf6xQpzHrnh619HUkQULE8jNQUsCeICFxCnWXT+mdEc+bb1fKLyswBmiSmtFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092932; c=relaxed/simple;
	bh=zAx5h3CW9uhScVCOaEZGPbZKRppELpmuFuRjU0AzcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VA59lZAso7BVOsBdtfkzibvXSRotesh6CKeRB/7OodEtK23sjSjokvQwT869XenECumZ1fiR2IKzqoHG56eBdEkdzETA+8wJDHJQjXRDJZ2SIt83ifW3//4pUl1alErqmjYKw1+hjHcuppqNjZwBieFYXosLBu0EbCDy/l5moJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+tSg1a3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+tSg1a3"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab771575040so464176266b.1
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 15:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092929; x=1740697729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=W+tSg1a3mEPiw8Upwp/8Q98N4P6ZOVuzxC7yxnbp3xDWgAyFyIWXF4JBva0URKglr5
         xQfN9qWC5lZfqVLkWMXbM8y96qBQXrhcjVsTTz+fdLM0oujlH9lT5F4yYOxuzCKe0G6w
         1O3SnwrPoAqEhNUcrS7AhzA49Mmyt6ruTYpeyi2eNklqJ1Zn9fw7LAhIvkq2fH3XWbLN
         BC3MDvQIFX49aKySzl8TKslWI+JxLJSP+ppkOuZmHRoVtND3DHbOIirMNCXnjOlMk0jg
         zxUoWEM7r4CS2Fn/tA2qBNa33cMrrpnuuMnP9lqxh0IR6Rq6669YYnoxknu6P+GCaCZ3
         U3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092929; x=1740697729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=mBMh9yh4te1UKc+nteAX0hyHLFw8DP4JUaifTfc4zQNof8J+ysBIAT8BAmEvxquco4
         iFR6Pt57KcRA1lkuby9LTyhjLp8UDnEyfVbaq3MfacPCVQ/Qo6IywsoOjk4aiizykB2D
         nhknUQmLDyiCuLOQTuzwwq+aJUGkdGoAPAgenZ38q/E4Q+dmgFkdqiO8tI1XlscVTyae
         rnEqTMiIHTU3GUg/E3igi035QV0QWGtc2xqnE64Z4IxZgzIbtmXJoMkNdJsa694G3d25
         jO65NnhlHY+pZ6FqgMlqYaI1bKeELcqnaDHjtUoCaclzn7CKljMNn5EXLv1XgE+HUgBT
         RSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUOYV1u5n2cykDYk2HDK32ORvAtCURq0WmPOeuA8b9gBzH0ilNa2rNxT3x3NaWfkJTVpM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdlwHzLBDqU7XHxztu5XFS12ntxKbZJMDbDhJCaESM9jb8eNxJ
	Eicy8Mu42Xf6rD3uhxVcFB7CMtLPQxDN6eqlUkTlMFzhCie73zyM
X-Gm-Gg: ASbGncsUq/OTr1wKjBJIk3shmh+GgbY6E3TfMcGSqJVDJhPWIMMyL/NoFhAjFT9bOsj
	4AQqPQURmqQp9WTbzFvQkAis4pmS2VzavcARUCrs05vkVHMVK9kngyIsT+aiCd6OnhyPnI7i5e4
	q4pPW+az1lMraerUyHTJWtDaGGcYsk3uzFgCGC31yE1srUhzWNRFLg6XwxYmLY8w9YZ80IM3pP8
	05rm+PHqAOmwbm2BhIGs7/+3HOZjbl4SJ3bQGClZWwp0a+ZCYTeuYOWcjztckwDoiomcB0KRbfy
	tz6W2moUs3up9hLgctVWeH/dkYyy
X-Google-Smtp-Source: AGHT+IEydEuTk0agw+AF9f8wYzDAN5oKuTWK4h1DVKaFvIYPrYzGCYHJkQgTkbLioaZGj3jOXXoyBA==
X-Received: by 2002:a17:906:318b:b0:ab7:b7b5:2a0c with SMTP id a640c23a62f3a-abc0ae1b6e9mr76032266b.6.1740092928857;
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Fri, 21 Feb 2025 01:08:12 +0200
Message-ID: <20250220230818.275262-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx219_get_format_bpp() only uses the code of the format, pass it
instead of the whole format to allow usage when the whole format is not
available.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index fcd98ee54768e..ad1965a91ae3c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -387,9 +387,9 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
-static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
+static u32 imx219_get_format_bpp(u32 code)
 {
-	switch (format->code) {
+	switch (code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -680,7 +680,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
-	bpp = imx219_get_format_bpp(format);
+	bpp = imx219_get_format_bpp(format->code);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
-- 
2.48.1

