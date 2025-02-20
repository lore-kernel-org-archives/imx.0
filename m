Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612D20D4E2
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061081; cv=none; b=aI3J/9ivApnCsPF8n2jyEaqB6zwn9T1EbmhLzENuqhIcH759k55UXokbhGvEfpTKBLpS+NbnF7Ljh4t7pTBNtAFGAikF8c+l/Nhf09ayMf37u7TiUVMK2kW1W7GcdOTd8JB79/fMlCaAJ/cqV7B9xX2x+HDhwHoafDv0yrT4FTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061081; c=relaxed/simple;
	bh=c2oJdhEAPkgZHieAm+Hz9dCi2VAJ3Im9nKjJmOfI5T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edV0qIDmzxB9MfLfoQJkIsL5cnd78Lw7iYCagxg9BRnf4YUazn4vvMnZz96dBfGPwoMuDatLr0Zo3wkyao/sL00SEO/n716KH4xe6MjK9+v6tObjO812kLfW3yzs1TpA0jQu5Yn/hjE2yRP9rCNfMlmL8TU48YifH2R4pbdDq5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4rVo0Fi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4rVo0Fi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so1435912a12.0
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061078; x=1740665878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=m4rVo0Fiybd1wPFe5XR0cXLNtMSOJSkjpwlCSEw82VaOavz7lNbOIJaV3npNlSnIVI
         DzP0usLPZcBsVX8iQhjU8wsBbz8SFRzAoXYWr5YDSV7a+hg0VVSqLfA9EhDFOAjYBGPe
         sGMDH2T3aEAGLC2GjBrZCK1nw4OAxtRmAvAkCfUlX30sIBjpiO1t5enjmuJ4yZ/8QTMd
         X8Asendgj2C/Sr3rc5mOs3x5xtdfKlkXYs5N/4ZL2KxDMFVP5WzEc4nV5i5vzxOA8oD9
         sKuNWBy/o2gkCZZpSwBiHy7hwv1egw42RNckjq7U9awclIHZ0nbzgqQyeuts4CBv8u/S
         vOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061078; x=1740665878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=Ie1wlWHxN8vWAwgOhMbHxOMT4858iWuhPg2XLsTQ/zx80HQzpgcbgpRq0z7xG819sq
         ajKg69zEMJ1Qq3aBnGSAVV9RjyFqd4Kbca3QwRUhCMwcg3+YnekqJzFwfosKTCuV0r8o
         SFqNkpOt8QeSc+/Om+cFPhnkn0x/GSRaGTbHv93HPYdoIXj/p/W7SkU3QmWNgMCizldG
         QSjajGxdrxd8tMd/PHkvaBbeSD61Iow+EnpkNSBkStw24d9q0tZJ0BL7x/d5fUYkzZTt
         1lZiA+vXNHh3QZE0ZbEkTYVgJ5HjeJm2EnYsfT0cF7084eFG1HqjquS1siCti9gOJd+N
         H53w==
X-Forwarded-Encrypted: i=1; AJvYcCWLsy9L8hlYwkFnwrrAwJQ7o33BbmZ9BJE370/LMQJgA+kCI/NO38mUjjM4oR5HmSgE1fU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoOZJCWF99/nnEjEiQEZdjzVLGM8UFNM6ZNTEv3ArfEv7QGJeH
	bF1OBOi8rM2zO+pTCKQeTjchRcSXD3RBSiUhrW6GdXjLfpnOtjkc
X-Gm-Gg: ASbGnctqXKdrPSu+ZlJqQVglI9n8EVEdHKJziaLaBLNuvwUaiuc5mw/RREaW8jCrAY2
	skJX0KJtjqvvc789O53FF+8LwF2KYjAVt55tXs7R6lbPOZ1DsO0Qccr8Xjtehl4v6r4G4m+dk2m
	Yq6I5RkXN2Uy529CsXrfSBgv/cnp6WcOoNYFhPcX1bKKmtNUwCxBwnLyPfFSjT2CyI1sqrnp9dO
	Hvx2iD/KP7+AN2MECVLuN7QW/MEsatHRM3U1brbHYmbfbtEThmdxLhQujU4cLS6lXqS4QoyH/Ho
	nmLMz1GfVCf4UYNJ7dlxHXetcoV2
X-Google-Smtp-Source: AGHT+IG+yJuG5x65qDSW6wpTU4i8GdeI5QaF0F4bU7rg7alr8iRr1hZM5jP7CSW2D5EyG71m2P93dg==
X-Received: by 2002:a05:6402:2084:b0:5e0:8c55:52b with SMTP id 4fb4d7f45d1cf-5e08c5515cemr6215804a12.15.1740061077904;
        Thu, 20 Feb 2025 06:17:57 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Thu, 20 Feb 2025 16:17:27 +0200
Message-ID: <20250220141739.228714-6-demonsingur@gmail.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ad1965a91ae3c..4c4ebe54f191b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -990,6 +991,28 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -1000,6 +1023,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.48.1

