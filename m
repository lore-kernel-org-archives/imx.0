Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E8337101
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444538; cv=none; b=t0G2tDw0CM2/4xXhmm3btXrksmZFPl2MaI+shXy+MQ7vJhhg1Ap6BKhTpT2XVfF/x7geRHdVkEpsZW8+IEPVZ4GG+2OSxkb7eWIhQKfc0GhsSu76lxYnrLHG7HW+3I4UFR1UvOTSvw4RMrVBEjVsjaFK7ItJic1IuFGqv3c9p1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444538; c=relaxed/simple;
	bh=eRutke44C2eUFpwmqytNRdXRafuqH9SgrNmMEuugYOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJf0HxLElQ+JH77S/+sbQd7JOyq6FdNe9UEB5uuPg+BVcmExRvucRKbDkVw/lWD02L4Nah4ULzfsFL7i4nzmfAfyMAAK4bvpT4eNwbe4KA8ztMqsbkfigL8Ag/5xMx0tytEbpCGv/oIQ2Z0Bl9iwfw7ko2XR/2gRVfFY01h6r48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llR54nh9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llR54nh9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so35681275e9.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444535; x=1770049335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz2jknnsrS1lG8C1mtWwO8TUayvo0fQL337DUELyEgI=;
        b=llR54nh9AieoOti7Bb6hlreenjo+cKQMy7Mf2LKjz7f6qCVW26SQw5+QYMejn8vTc1
         fzfkGd4GZS+z4DMcn33XPX7jPF8DfHPrG/2eEkSNxw5tFREg99CLjEP4nnCT6O04+xy8
         +CKxnAN503tzocXVwwwALiHlsDP6aDs3INUigbjMTBMMhcsFxibGkYMdy0A7qyf8TS5k
         xFBKXkC5i7QcFgYuVTLoP1Q/QASo2lMwAp1wC3Zx0U7PgEhjPMmYKCBD0C0JA1nZB79y
         nXqXoGUGB2s4gEuDhKh8/mAH9hIe6QzbtVIETxW7LbMxdieRyPKvc6u1D65p6/rkSUwU
         T5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444535; x=1770049335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pz2jknnsrS1lG8C1mtWwO8TUayvo0fQL337DUELyEgI=;
        b=BYjTxY6WfnLqrl0MrMxwgQtf1ywfzRU4PI7+vFH1x+OK5tZw87OnM23JdosLalsQKT
         1lmnMEOIbLoxCs/8YIKr2tkrx3k7a8HxoWK3KuHfkfdidtABQqQIMuYCtis8Uas5AdYQ
         I2MEEqdIFpYITNht8iE848VGRDH5KUcxCmBbOGkTlRIO9f7ZedG+pPfMw4m5tUxHHVrA
         s2olAhU/GXuK5GmP7IP1Oy0d+rcpwXnHE0tt7WytmKzUS1kbG/2nbqvNghCvZ3qX+ZyG
         ZJZDRR9oyCZIblMUuW6QfmA3cR+qQ4emlQlThAMgvkOYdACJqOx1OPREdFLfmTvz5vPg
         qY3w==
X-Gm-Message-State: AOJu0Yyvb+B6uME70acw9ND5xXXkDrIDzfSKHaG64gf/hPJ8DTH5meY2
	6E3arULSOSamm7N/1gw8uE4bMQ4SgZZM4Sfm2uxc3VeSom6QhxxSrQEJ
X-Gm-Gg: AZuq6aJZpchS3S5qt+VgEaTBgN9pa5n5udmnRohWgcqxx22Qm6BI5sPELPrSVj192ek
	6ZJC56Krg/LW/cSt0i4KXfrFeVqmh2pbkAsGJo2qV3s2S7U65GhYG5Emxfs1CPSXyfB7TOTtREI
	Szl8hU2X+XVU+Dt8Pjd1RkVuDadez5TKYRp88cjtCwvjefPNxGFZbzFIppe6Ud82NXVKAm9AOU6
	PukyN5WAJ8lTPFPRTmOHVaZfPTL39kzb3SQMd5sKRuaB1wUpzsG6zHRK3VTS7KG7auDMnzRUS5e
	FVisBq0Ng45xAjYHPDXVod3PpYPRbgO4EXoGaA/hL0SFLfoYirIjPRy37UcInkfpzX1KWqo1RIN
	DsgD9dtanbvWmJNStdZqA0i79fgVJ3IHLUlj0e9VTWMLEnl68XZXj1CMSbF9XLPt187mcBXZsPU
	Rkw6aoOB8gY90zfcuPPlGpXG5qm24lO6sBnvGEDg==
X-Received: by 2002:a05:600c:a194:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4805ce4decdmr57737085e9.13.1769444535111;
        Mon, 26 Jan 2026 08:22:15 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:14 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 3/4] reset: imx8mp-audiomix: Extend the driver usage
Date: Mon, 26 Jan 2026 08:22:02 -0800
Message-ID: <20260126162203.708-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to per-device reset map to allow reusing the driver for other NXP
block control IPs.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index f6152c0cc5ff..00eee528a2d2 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -24,7 +24,12 @@ struct imx8mp_reset_map {
 	bool active_low;
 };
 
-static const struct imx8mp_reset_map reset_map[] = {
+struct imx8mp_reset_info {
+	const struct imx8mp_reset_map *map;
+	int num_lines;
+};
+
+static const struct imx8mp_reset_map imx8mp_reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
@@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx8mp_reset_map *map;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->map;
 	unsigned int mask, offset, active_low, val;
 
 	mask = reset_map[id].mask;
@@ -132,16 +144,20 @@ static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
 static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 				       const struct auxiliary_device_id *id)
 {
+	const struct imx8mp_reset_info *rinfo;
 	struct imx8mp_audiomix_reset *priv;
 	struct device *dev = &adev->dev;
 	int ret;
 
+	rinfo = (void *)id->driver_data;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->map             = rinfo->map;
+	priv->rcdev.nr_resets = rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +180,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0

