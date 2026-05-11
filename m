Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8313DA5BA
	for <imx@lists.linux.dev>; Mon, 11 May 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496202; cv=none; b=YkezSpKHVKmu8C40yVVwRbA/+3hXUhYejf0yT9QUkcq+4F91l32rCLyPCRAVEvzNtD/hrB+CkjUS6+x18S5/YooTQAEzCDK2dk54CsPAAVFRLfrWPWUZ5jUKhCZbTrJ0Sp40rQ9rHkn0uOqexOMTTd17PLxVThqQc6me8oRQobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496202; c=relaxed/simple;
	bh=Arh65FwgpuoQyK0HMQPAmmIpzCVfFvZU3gN/HmExq5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpDhwulw4otB8IPnNm0nSAFl0ZszuxW6jkrAoJiZyI8D1GJrwX52qzwhLPyWuFDYLXy68BlhFtPMBlRjMZ0q9bXHaHjB6wVRuRks3Us9zj342sxydmTNTdvR7FW02qK46LFGEe41ktmznRrM9WX7Q5140CIbD2Xk7BiCKaU0dYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5JDjOJE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5JDjOJE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3667cf0136fso2336038a91.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496200; x=1779101000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=R5JDjOJEO9aMKCpjjnsM1ZRiLx0NjDPdcFY30Nt78TqIy5Y96WlHL00MkVS7D0avTO
         3vym+A+swb6azq22rhBFCo4uqK2Nj+7Yz+B6ubqGUIRynOJ2Z4bN0MvitgKb/7zg90+Z
         9OKpN4rsmwdLB+Ajxi+50s9P0LNGI8CTxrvfY92hf8nebPrXA1NrxHo3MGLjFqBph7Ly
         rc0cmu/RZmJRVlkiwv9GdNfoHkX7FMMmJhfSWhfGJdVCbECOtliTFnsrrmeVFiVUAqQZ
         LJbd+tOYWhizB1pP4v30ZkN5CqLDO23h1U4Tqf0BECRQy3MkHufeeuoBEiDKrQ0xjKB5
         1Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496200; x=1779101000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=jYkmWsbd2/H6okxzJRq10ed29JtcWx1v02cn1Uba5CFNchld8ef0W55jH2avx6Oo8e
         pJ/sEBjjtzXlTHYvtkydjcSjuYa2UH+U16d4oC9JOkQfZoOi4K3mIV+xL5JEo2kkjaD0
         mE1SpKrBSECXgEeo8unXPKPcfPzf8DeOKTjBK8o42w5njzQhuTimF17zgzGDm3peFXH/
         6JiqaPXGVSUzMlsr00B3vsK72244TmjLwl95zBIplfABv0zXq6Xq43O6xHWYXM/t+wlP
         tWgM1EoJ6nI0DzX9EcCiKWVPkB5mdZEzOn4m2NMkCZFUd/Zo+PS4JEKxXTKvHXbs3lYV
         pTAA==
X-Forwarded-Encrypted: i=1; AFNElJ81w4xIidU9YY9qY8oz/qsIUPZ9QzLO3/AAsAMLyYMus1+LZwKdX7CR+sAHymhoNpSpvYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyR4lxD2P42iWp7L06+JQeL0ZUR+KV7u/KfObsPeZmGq962StO
	ICrW0RcKgKXnoPbQWjWMoEt/4JAD7uK/IM5H2IdUiFU5LwWnL/lx8MI0
X-Gm-Gg: Acq92OGPKUGlmGWluHeYC1jNF/UxuqekedpCuRwTBOz9cjTnOCz0RmA4ZADGTPAWrjY
	EGDyzjtjUAmk/a+Va2d2B47afHdF0d6NOPpMaYqM5OfqHuti56oaHDdXjXBKS7W8U+26hvL1Nlx
	FxuK1WlMr6c4rcf5gJ9xZhutYHQcAgbpbzx7FJ0NO6LhSuYgZpjSEdXEBMzK7glBWpmjJkuEMhm
	Aju9amJCbJ3o//MhUdgQh26FEnoHVnVi60ZGtXWz4goIB7Hz8Y1DGnp0LHVxfEcmWrxKLLGfwCG
	A7fhQC1BOC9JICbKHrZ4MhjCtsU9WzDQP7cr6OtuJWaTOGywv59APs6FwYEHT9XMOo9tc05rk7n
	AvqadsqH2nUVTDNptX/Vlwv8br1fHS9/iuLJMY4MrB8r8she1mKUvWIvQ1Ftj8ooP6lNuNFFrhj
	hclpP2nDV3Qhy+K6wsbZbquJMHLqJg
X-Received: by 2002:a17:90b:3903:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-367f9f1b66amr8598826a91.7.1778496200549;
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
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
Subject: [PATCH v4 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 18:39:25 +0800
Message-ID: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
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
index 61297ef66a0e..c77b34a5e166 100644
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

