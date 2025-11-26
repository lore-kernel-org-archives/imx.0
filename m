Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B0328267
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160990; cv=none; b=jx8/SzT0PJC8iwdWUsM7zSSOKLdFg5MS3xVHjMB8VkSMao2ag6eqNajE6joUkqxE/UT1dqvMqemkmHJwVhujU7VuOxI18QDVGBfYhEemIKCptjWtPB28zvjRww6WD9U1M4VeUnhoiuNfnJdflC2RifXI7HPuG4WVIWEazM+LZQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160990; c=relaxed/simple;
	bh=/R8DB6PS5O6Vu0rqhYBkNBWOV2WuuSjtOHLfrZBLXnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUY1ubGZwlB4FpS+IDD7ogbrGdVNl1+MDWq7YqroFTSap2hmo7uGV/YP5REOvGFUef80P3ZwSIwiFHwrqIBhuydmLlALJkr8l2A+fcaggEzlFwPJNeStkUPU6Jth/h94jY9u7lf7SzqHtcVrXJkfGIX/xsNldxm+k7XBHoagzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arLgI4ub; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arLgI4ub"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so11311190a12.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160986; x=1764765786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEUrAaAcrC3D3wCSVpJgszh6h9a2J9Zuh9+Hw2rSnjA=;
        b=arLgI4ubESHVqvQIZl0Gewa2GrLuX+/28ReSPDcEu93v/2MucUi3qB6n4vD6s6IiA/
         63DxnhYrv7Fl0GkvNiCXmRtVsG+ZV63033/NlR2g5yH9hHiwjzc+0npfO6WJ/kPYRv27
         gunu1z67wiAR4UZXhRQAR3WJjLuel22+T0Wrgfl5Air7Uls/NeyUwkhhD3IKBKzYjyVK
         yzDX+KkrLiuJ04p2LGQp/ZcSmvW98vWFzFQGCMi79jW/4mjvEKJ+m4fn+prQwIeyXYN/
         DbQqj0LGJD1md0psiHMennsaQk8nTLtzVUU93bkn9+Vwwgyi/FXaXln+lic62yjcqErY
         rYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160986; x=1764765786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEUrAaAcrC3D3wCSVpJgszh6h9a2J9Zuh9+Hw2rSnjA=;
        b=IXUNXe9yJF+m2M4oFEyaRBhWMqsruIZx7Vm8C4SvDrUfaQ4+cPla954f6btTYjvEcj
         qQaY+K5Yt2786uPCTtlm5DifmFzWO+BmtDPKZmhl3jl2BhqGUKI459AQ3van2YRQhl89
         Sk5cI7UPEmEQO+lJvbN/DIpEIKQZavrkPXsknbOSWpHEMYYJgvACdWJ91rbVF8JfCD0F
         JITAmW2m0XiyX9zS/PxuKzMVqcu7MKy5T5go/R6vT2BUokLSEgI/ZFkcuqdT3GyoJzcH
         s3HxCugEJn9xRLU4XTVHUkQd0oKhpIxJ9Xa+W2w7/h1KdQr6LFd0im4ZbrL/lqpbk3Bo
         pxEw==
X-Forwarded-Encrypted: i=1; AJvYcCV+ME1MRtKQSYS9sGlf5V2z8kwmly2AqBPL91R3jrvWexGl6d3GpbbaXm9CqVIGnYpNreU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV+2S8en5kGzeTkSpZF3cdwMsF/LsI+XydkAAlaJrAQwJBNm5A
	q1Rq1iZlPm0cXhAJIcgzE12sBrhwADBULNuFimixMGRw2lrbNr/0pu58
X-Gm-Gg: ASbGncvHD3kAnYQoR9wk3AMfuQKed/lraajuKorUiQji7R6wX84mFzh1+qXGX3z3PrH
	7EBWy6xHI+aG2luYZLMhtZB615tAX+2XMBvBBg1Xy+qzqKG06Z60Tfn0X4Hq+dOWxyhZWixHS7B
	KIc1Nn57twn0rR3ed5eATVxwxq2ISKt5KGrM62g6Qv9Tav5qrlfXgbxw7sAE5zGl+XwJc4a70s5
	M3Ah1U+9Wj4HosvpYISbrWhEB4LeZlONgWsWDDvp5uPHiC2ENotgd2URl5MPyro72H+vLv8IyAN
	Hv7Gbo8jXzGiICY8sxTnMtV3qJTgcI2LKrvkXM62mliL2WJTsUgD5NCMqGFTi1erPCiCDGCbpWx
	0Q+UW7m4lrRqi5M6dBxnoJaXH8Pw62klBKJr6i3DFQ+lcFnElYDArXmVhdasePyul0TEdz46ND6
	3nGplDcWDSML6CMHiZ3NvW96FglhrANC8fof3m
X-Google-Smtp-Source: AGHT+IGKLPw8td8LrQ0ou6eIh/AvAY0vkGQJXd4hWo3MO0W0vfngL8sRsTQuh8232uCr75jYDD5EoQ==
X-Received: by 2002:a05:6402:510a:b0:639:d9f4:165e with SMTP id 4fb4d7f45d1cf-64555d057e6mr16359675a12.29.1764160986331;
        Wed, 26 Nov 2025 04:43:06 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:06 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 3/5] reset: imx8mp-audiomix: Extend the driver usage
Date: Wed, 26 Nov 2025 04:42:16 -0800
Message-ID: <20251126124218.803-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
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

