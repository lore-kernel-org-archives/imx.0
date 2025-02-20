Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A11211A38
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061085; cv=none; b=efeVkom0062YiK9/cwIfki1ggTw4GhrHw8Ng06n3kf0roTWNeNFHWZEM3+P2wlmr+FE23XU4/GpfUSf7/siDT864vcnE6Ftt5+HOc4jHt0ps6VGXLjHL4qpk8WGxbEWuimxngmAph9i0ITAYoONzlRFu6AAKhraZQtD++zfEY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061085; c=relaxed/simple;
	bh=02meRziosCIj5XMgGS3fhZ0M79JRqzLS+o9FESCTLZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy9JUnPjlFFCBoCxeThkxpGuHTk4oxd+gNI+jhsXguyItjdFlMhFRKfm0KRmtzG9nbTJE4clUVVZtO8ZEnJw3JCYl+lDt6857p+mcBpnVoP8OgZQa4P1b0O9OEHTlLLAH5g6eGC38xC1RygCmxm0co2/y0fzaEfxFV7oeaSJPw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuUiFqBv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuUiFqBv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso1797366a12.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061081; x=1740665881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=kuUiFqBv0Akm6kLVzFALTPrXKHWKL5nzfcoVntdewJxh/nlQcPDbqASCdnOIxnl48C
         xo3yNfpaDSxkBTBhR6v3e9c2cwWt5p3YZ2cAfIIHqmdRDfw3J+Ic6RdHdLxTsmMJRXbs
         47XnVg/7jxkZ9U4gyRH27cmsBwSgNh5SUltI9X7lmz0gb3iHoSdw9W2v+9j1k6EzP44w
         3bjSbyx8Lm0xX3WEl/YLC+aUw1hKCPqTPsy+TsF71JkyjxqdavvUrC9mzm+Aa0CJ+jN/
         zvOEMDmJM42ASsnGXrC0pU1Q/fbyI/Q1qkXNZSqloyaRauVMVZXIJIL/SG/I93db8gTC
         c5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061081; x=1740665881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=QsdOE3ZRXYA7eUlOFJayiKzIM9SZZScjsnKPQXrn5d1KR9OlYzIjyX+42sgBJsANWy
         uyr+gOz0h8ik1L/GF+xlFxAxWzoB0UqCDpNvJdDzVHQEAaTTrYLZLG+45xUPgqUFUOpR
         QAIjj4EKhltgUQ4YJ6nXnC0pb0EE4Nu8ZtZ55OEBXQT3q8hu+abkIjJx0Mx2PJG4ZINJ
         acs5vf/MR73WzPk5mCc+XY8IytH5edTfQvQ73Yo+Q/TWcLy1kzhVNPxrgjztKQlqe4Oy
         pmTCHmkiPcbfmsAXgDXLWQtX6LsHn2K2XNSu3Vx2n9CnzjjtjpWtwP/9WsddAyuxRnos
         TzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCViCS2NKCQHguUfFC5tFO8msRBaXaWYkw7oaAaMYDtg6aBp+yYGFo+93aUSrPZXazEvpXA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt0YhEILkqMnpbwdAljR5QzEjCaLBl4qQ69jl7mdtTmub0FoDz
	ij3KmKT9uFtusmOTDUNRCtbcklzqzBy4oiiJKSveNqFSzVX/8EkB
X-Gm-Gg: ASbGncv1k0iGnpCao/+taC8qS1rdIj0enjufh3EGc3ijKRZp/EkmaLnLveugqMKKjA7
	+NAFDdH0JkkF+tjeltQ93T9/BDLcTh541BC4fWmRWvDf+d9AImulFKC6rioYv9hTrc5kT75mcT1
	T7RbZJgVD+/YmuCW4RE4MM86XFhSLgW+h+e6jyAyLLIVmgv3wWxIzfeBspi8nSgUaya30evvf3t
	/Z5sUiODyni6B3DGSLl5N5DFlKlN0XEYFvarvtNl5QvplEmxGmIsvL4zQX8x8gEtiQ480p2Ap3i
	4/elrwACDIqEBr0XfRLQA68BCKfQ
X-Google-Smtp-Source: AGHT+IEI5BjiSueHGowWB7V0AX0jphOzOkC+hVJDCuWo2okxV45XHcKYucaW0FwCHe0/kc3RlhAM1g==
X-Received: by 2002:a05:6402:35c1:b0:5e0:3f83:92ab with SMTP id 4fb4d7f45d1cf-5e0a4bcbb50mr2539326a12.30.1740061081463;
        Thu, 20 Feb 2025 06:18:01 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:18:00 -0800 (PST)
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
Subject: [PATCH 6/6] media: i2c: imx219: implement configurable VC ID
Date: Thu, 20 Feb 2025 16:17:28 +0200
Message-ID: <20250220141739.228714-7-demonsingur@gmail.com>
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

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4c4ebe54f191b..5790106b35936 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -38,6 +38,8 @@
 #define IMX219_MODE_STANDBY		0x00
 #define IMX219_MODE_STREAMING		0x01
 
+#define IMX219_REG_CSI_CH_ID		CCI_REG8(0x0110)
+
 #define IMX219_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX219_CSI_2_LANE_MODE		0x01
 #define IMX219_CSI_4_LANE_MODE		0x03
@@ -363,6 +365,9 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* Virtual channel ID */
+	u8 vc_id;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -724,6 +729,12 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 				  ARRAY_SIZE(imx219_4lane_regs), NULL);
 };
 
+static int imx219_configure_vc(struct imx219 *imx219)
+{
+	return cci_write(imx219->regmap, IMX219_REG_CSI_CH_ID,
+			 imx219->vc_id, NULL);
+}
+
 static int imx219_start_streaming(struct imx219 *imx219,
 				  struct v4l2_subdev_state *state)
 {
@@ -749,6 +760,11 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
+	/* Configure Virtual Channel ID */
+	ret = imx219_configure_vc(imx219);
+	if (ret)
+		return ret;
+
 	/* Apply format and crop settings. */
 	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
@@ -994,6 +1010,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_subdev_state *state;
 	u32 code;
 
@@ -1006,7 +1023,7 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->entry[0].pixelcode = code;
 	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.vc = imx219->vc_id;
 	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
 				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
@@ -1149,6 +1166,13 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	}
 	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
 
+	if (ep_cfg.bus.mipi_csi2.num_vc_ids > 1) {
+		dev_err_probe(dev, -EINVAL,
+			      "only 1 virtual channel id is supported\n");
+		goto error_out;
+	}
+	imx219->vc_id = ep_cfg.bus.mipi_csi2.vc_ids[0];
+
 	/* Check the link frequency set in device tree */
 	switch (imx219->lanes) {
 	case 2:
-- 
2.48.1

