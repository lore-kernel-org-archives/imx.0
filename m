Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC931FCFDF
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061078; cv=none; b=RLDKscZI6LaYyDm7s6mDinPzed5fLOyfG9rHyRJSUxetoxXo3aJ7OUiZJx/NUy6BCdTabqg/bKUATf9+tkM1o76Oz/9MhkrB75pXNw+4dD80P89EzYIqvMT2rKxOqFTks8CZ1ax38j9rhKr/s4hyByXsT1plNdM7AuswOKyyT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061078; c=relaxed/simple;
	bh=zAx5h3CW9uhScVCOaEZGPbZKRppELpmuFuRjU0AzcDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FraIscZ27YSi/7+AE/oyz5cqqvn8sfVmiQJwQN5oV+n156tp0JoBYBrkfUbfUsw5Or5V7OJKfnvDiCyBeI+YnOYOfYc+ohfWHGXQw0WHDW1Y/Rb09SE5NPQQWFXh2Odnz+Hid/VYewXy/DI7jVOJGyTq7SVFvwid9rXc1F58cEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS1nXqGY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS1nXqGY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso1546416a12.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061075; x=1740665875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=XS1nXqGYb+T4RjsuvpR/ogVbM9Js3phbHw/CJFikj209Vw/OfoC9J8qmAxDQo0lznz
         Iov/+i2q2KiSi+ys1pkzvudkZIg8nmLAnxfbal6h6IfeqW8WFtJrs/tRXKJKG04VS0O3
         aNdr8Dc7sqpVNLkWv7QgxSs3qb1SRrh46jHzNjLyS9SOh5GuJxZED5SQSqZVkiCNg3y2
         uLYt5031CAHYuBVMHDU9DwcClEDrBXO4xU0Hz7oGcMV098c1SsByYU1SzLRnOq3mZYyH
         2We6w8YD3uOJ+w3jsX83SwjOyz4GlSN1DNlpWytSaxxK5RoO1GPZernStg7MQ0kgT/p+
         mONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061075; x=1740665875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V5REDmi/qwmeZmzS61DPGBCJO64NPZWi8x4XF3HxB0=;
        b=jW/BGplykpBDooGOSQHezTY2DXTSh1idNyU+OTN/F/wLefmCy7iI4ua7ddZLNVOD+c
         eUiDDpL3BOy++hg8SYC2pCoLbAFdjwKd01GC2Ke9+TsdXuRjb+4IVvKXhQdNt3GuE+5N
         JlHIxER6pTWgfuTYiw1+27IG8R88Qh4q2mp4sBphxV0OnVhQZkSAecgQGfoP2+SjuTC7
         nR9jpDF8b7Ah/TKKcY/mOCjS9rVpfSgE+3B6PF+yoO5Jbq3Kdf0Nrl/50xMJb/qejXFN
         07v1KkT0kg6yiAnNzPP+9AhzeRJPGgfrm1elGz42nLFBRfntj+AITZhrlNNj4iPcp25q
         1HgA==
X-Forwarded-Encrypted: i=1; AJvYcCUmfFwM4KBDKR5XwxiCNY11nPlzF6hW9EIJlGoHMgPlFR06REK+ETB9XqwO806dKT/1fxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBSSHkGw9qIE6Wy3OsvNRuWdi+hGmXpaXKCygzwNHNg0rxTrqZ
	E1QjF7BJSU4mix+rgvTqXFtoE9ECS6aUenr1IGqvmGmi5JeKLa5R
X-Gm-Gg: ASbGncsQV/iUonM+kYz/JEW9zF1JJvsgq1GwgTwWr2MJxk4cyhYtQcWxxX4DSSsXmba
	bZqKQxLBAPXM0mFb9JNfLJisuF4YWuvAk1yyrHcXv781yB2ps/SHip+Vv7KYLzJIXD5TOaQg3zi
	4MMnCsKXZZqWU41WcxTLn7CzzrQ2ydFyiETY7GTKZmz62zja6xp25ZkrxtuqfOxImb3PP7tvR6D
	VB00oBzuVDicHlyFrY7rEp0xyzPlJHEkAkiJO/FuuRPAt/2INVp5cmonsMKEkx3Qh69yJ2aaEds
	oYGjFXfQ3ge3wIJP+TCM8aJjECb1
X-Google-Smtp-Source: AGHT+IFFJvKPRHucc1r4QGSkduMvmNCXiQ/0XGioq753EqOOggpo2+xqmAhfLNknWvVEGi+w56gFTw==
X-Received: by 2002:a05:6402:a00e:b0:5dc:ebb8:fe64 with SMTP id 4fb4d7f45d1cf-5e089523080mr6461869a12.14.1740061074548;
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:54 -0800 (PST)
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
Subject: [PATCH 4/6] media: i2c: imx219: pass format's code to imx219_get_format_bpp()
Date: Thu, 20 Feb 2025 16:17:26 +0200
Message-ID: <20250220141739.228714-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
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

