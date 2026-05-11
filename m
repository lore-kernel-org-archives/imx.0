Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B023BF692
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490704; cv=none; b=rtpcdHLDO1PzX9i4IAVG3CY016H1qMMeYTpKSUB+x1kKn+NIqBCgrm3kn3AHno8dG08l8DREz/dfYyf9tj/KnLUs7po5VCyczN9ShwmKTbQJZEUVY9i6P31RAvXhyu/j2YSEafh0T2pWcrw2AOH4oGGW7jSbwrysER/dseWr3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490704; c=relaxed/simple;
	bh=BmKgwW+huMEmoGPoLpy+I+GMFUXpf5lF+r7mZMlbwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFVT2q/mkUee6eMnL0CZ9ji8MWEnFMTaGbuWGhwDAq9js3utAw3TaTNBFfnPc5CTeMPyJ7Q77WCv8UNvRX+my55a6ELbTSDfySa3zxPrMJm0d0MG4Tm8hZBd77rli3il8sW1C9VBmqDoYHpJrhqSgGIx7PaovPZE1IW+fXxygac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtI9OI+9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtI9OI+9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83975e992e1so1926252b3a.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490703; x=1779095503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=VtI9OI+9XSail6UwZMJ+mEDUie8wDbOyzRbD4ClwMf/KBqprVG/x9lnPux55msICa5
         mK/vgBkDdmD5W+TYyojL0hiCSbgE07Um8M+xt6xgNGtgYuyjIp3p4VbUwxNH5xc5C6Se
         aWaN+OXc5ET375iwhM7ssh3/p+bMBrlKAATN3tVRlZ4JP9/TlKhRejKlMNqRcAgiruRk
         sG1mOHI01H5JWaskUjhu3aOdBixumU6y3j3A6W9evfkZVPsmpwv16MDc3SaMiJs6LRGu
         lV5C7+UCC202FqrVFLam29MUiK3cIKae8oY6SEJ2tWIwEye1oE1w9cLuXy5TyivXhO0x
         FoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490703; x=1779095503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=ThVjlEHdnaL805+Ek9U9uia3fJb09Zqb3/WVAEU+vsi7TvhH1naC5+d2nr28fj0Th3
         ZCMx/6vJ/R6iqR7Yw1Gl0riLYetfJtdYCNEP2Py7dBo7cEgCl8jgqC90wbbcy1IKMjN1
         AAYHCtNilBDQOJM7n25Ly4ELxtrVePZ8FEEFwB+RwXcQ+qU/SY8GHbVP6Yk0VQtd0KGa
         CYZeZALBcmSVxmbZ9O4Ug8fK6p5ZoaboNbU97hmo3ebIMthrbHrPEEguT7J4u1kb7x7t
         WUL/rBTcDAJRQWVOv0Zk9qIrbsaxPTJKbSnXwC6qvLMIjhNciddsfKG90x2jZLZYpCkp
         eEfA==
X-Forwarded-Encrypted: i=1; AFNElJ8mLmHBqaFz9Fb5xH2NwLRdjLCtKAmgXizSIBFPumhAspnUyhkN8t9lT56qodFDkxUdI7s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxvRJO7Y8Du2ZAgP2YGBFUAKRi2on9mnybejDXX0c0KsGHymnY
	ayjUx944H99FL0S9FtBSxy0NvCJy++aUtBh6tl3GcK62fGPEqqfRy7PK
X-Gm-Gg: Acq92OHrUSJk1gQPPIwj1dGORyO1f1ksTf+NSnhtaP+x6RkBahjE5eGv4rFOEbsLc5L
	YKES7OkvK+OBvygVKYrYJ/C2jwwENPRwsctJUnfUXx8BUPOwc+w0izNoECqMDfERrJLDsoGsq7Q
	PTVxGCJJxZnwYlH6z6IsXsyltU9UoKrY+bHZLap4JYNB8Q1ScFoXJ3EUKndWc7C/3lkVXazEKZI
	0VWXW8Xisi6KwvnfS7ZFAf3f2loam/tBb3WbBOYXs4+kcfH1HnnBoKXETjWjEYPQa/AvWjwTDy0
	JUx7Zw7qVQvoMDj9gWNX2tkXul8T8vAGNwvzntr2Dv0aEAxHCMoJgroib20E34OwerjhRhLuHcv
	7NIRLwoNn4rmGm3Rb5X+UJLKLO7GR/1S49IFx5xse6cneV6zzNp7EbUTy0K4Swjc7tzJRJOpGpK
	yw7nxD/rWFnoGDwqixOzMvRi2c4h7calqoqw==
X-Received: by 2002:a05:6a00:914a:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-83eb22f4300mr4998591b3a.11.1778490702569;
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 17:09:22 +0800
Message-ID: <20260511090924.269106-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index befd54553df2..9decfda74787 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0

