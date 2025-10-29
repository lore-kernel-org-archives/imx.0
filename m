Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0583559E2
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746178; cv=none; b=YKiTBjz9MrJ8Me0M5xQhFWA4SZz37jOFKz/4ysws8TfXs5Z1SZ7JBD4ENohW7GYi3PVkLCo6XrYHibHzQqv4DdG0H7M9ic1gyN7ssTTl4gOPWefZLudNn2aOdyg0KYoUYb1fpvKmDb2z29k9AiRjclEbSTf1LTvYTqv/4n2fJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746178; c=relaxed/simple;
	bh=3WHCmAX49xY50ns2nAwuW9SNvqdcTJpimMT/AP061rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmmIXX2x8VfckPXk+PhituSpcpl304HjOLV9tprn7flJtTlcDOU2HvjuiWbEl4sesDGHZn+f1wkleqOJR8LOGHv9P3ICTyXpaXzan72kNujpEtMU3HhI92nrm0JkogFT/MvaI9uOWhNTXxlip4hIYFqJAJxEo4euQeAhaI0IJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbGLFJC4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbGLFJC4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1738738566b.3
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746175; x=1762350975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=XbGLFJC46D/PhC+5dbwEuv+UlSlRoEF2ngw2RaqRy39dgIXQEc43d2z+nO9mFWk8RL
         A4jxpbNMWqeOTP6Xy5cSu4MJ1SbXoHTEj7MIxxyDgxQqJIVTNKl4eEb/Ib0oZbK+ienm
         WI/GsETNSPjO7FISmBflter24zsWVNJzehoQS57QUkAIBsWOJ7rmsp+7q5UVOHXBf7PF
         AXdE+QpWXDlHWMAaVKuckjhOcomx4PQaclRLmz37W6NTHwnJNqjG5Wc7T3x6bqYEuylU
         5FZ8dr7J+JxIVPepeXxdnbT51N+MqwAMHvFvxX2/BwU9+1rs4xIMdPZ0s9MkEuDbmfkQ
         swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746175; x=1762350975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=c+q9kfyf3YSEw734DNYyizfOVPQ6wcSRX0tRVMtnKX2Kdj3/1BUsdwdELYzIhMYtal
         6ENjgu/obZDY98VNcs895FstHxq0NmU3SFLsrFkGdObQ4dsoLu22DGO3ePjg1p53dEPw
         obcr0p++/xksNeqiSbVLKaocSlmh2Dm3THWlSM178MfWY4fd2h3Nid8vOePndCFioiVH
         t6NpINwziaBuAnPA9xxfeRZd143pcLM2jzvRcZ97LLh2zDdCo4FZF6WWzt3s91proZVc
         MU5Yvle1nkgMx27sLRW8uwL1YuYBQYcV1gsbIMkM/ZH1jlZHL6SCHGjGa0z02aOv+CeN
         gM+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwgW6ivS6Zo9djZAnXln/Pb5DiPd5ONjt3t6JvwFvi2/KIv4Yerqvr83YM+MJp5EskjQs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4eMNokpUnmaJ7B32qsw+iMOuLw635y9RBzeZU4jvTUg+kPMEB
	PkZ5l8JEVj8yzVcbasQcr38NLIkeRRUWGhuPaHu14jLNAn0CEBG01NKB
X-Gm-Gg: ASbGncubHw8pBLxCB4ocl5XhgFeQttGucQDc22Q5vHClKWcxEJ+GuF15CrHR3aw2x9t
	KYa7LJpigXxdAUNy0F64GmCBbusQB+EDxgDhFf1bOPd/wFNgikh+Sg6A/im0G7k6ee97xH3fZdl
	3nOwNc3NuD8IMMugPzSH1YDnXia6grAOoZQNcKMzUmK0J3sLJIICE83eWQmuldT9RiVasNZmrSB
	B1BR76KMt3DgwCxgeZu7grpLD2lMeKDlHf6UAW723sup+LsKg69J40b5T4dqDgpx737i7w2xAgw
	F0YhyGUOhwsilLrW1MZLyPdvneseDvu70jq//WS+5p/Rj3bLpyGuBToMQ5vR5atUvSSA2+mNQlk
	PON8/oaZllI+sHaRFg2uQRpmdhuMobDaIWQRK6bV6ACxD3F6fekSLYY5MJtilUtrHvCZ9Gy+JTi
	NBw9kVpqpub/CnJ592E+n8ypiH/Q==
X-Google-Smtp-Source: AGHT+IF7YQSNedMcBfqEpnFNryZkQPX09Rcf45htF6l7ea4hMqG4HFL94wsmN4DEcSgePcpQLPZJMQ==
X-Received: by 2002:a17:907:7f14:b0:b40:6e13:1a82 with SMTP id a640c23a62f3a-b703d327464mr285687566b.26.1761746174508;
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Wed, 29 Oct 2025 06:52:27 -0700
Message-ID: <20251029135229.890-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Replace the previous approach, in which a single reset map is used, by a
per-driver approach, in which each auxiliary device driver holds a
reference to a certain reset map.

This change is needed to allow the driver to be reused for other NXP block
control IPs such as i.MX8ULP's SIM LPAV.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 3f6d11270918..5ee5a32c6950 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -23,7 +23,12 @@ struct imx8mp_reset_map {
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
@@ -41,10 +46,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -140,7 +152,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (void *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0

