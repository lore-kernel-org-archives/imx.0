Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C82F5335
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257851; cv=none; b=X4udgFvpWu2QqoQlAr0z9YMdtVrtJ7EV9syqjAb5OwsodyvUa0Gvx7EsYyG7TdTG8PkGl//FN4PBa8+4ZGh7XxHPRAz5iC1+Vlv8HndaKtWVEDGpcrRiiavaNs3cJqbFiShGYl+9X/SiSb369JV8Yb1pcpgOlRbTGA8e8cOHwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257851; c=relaxed/simple;
	bh=0QxHrm9C2RbfZnvci62gAmEYua+kGV1/O6mGjSHQSUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxBBk5wNKnAHHwswXa/HeQn1KmGgMGRHq3wg7IdQDvfGkousjgLhix3WUw0jJARCvy1Iw0E06C65jJC77KKkSOLEjoMd/elD5lDcaNK/34Mvu1CtSaR0R/D6YVmxuyub73ZzoJX4Sj10+n3vitUkqn7BFw6buzZnhA94L1BYp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC+RuZfd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC+RuZfd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d402422c2so215187766b.2
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257848; x=1762862648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=lC+RuZfd+tNRbmFkZAlB+DTrjJd0KBOUKxW9JV6PSeMW/lF1p4gjdI6uWNsWoJJoTC
         B1bkzWT0OQPhN7SkYGs1CFx9xyRof/sXgtGCEMKzBPceMfQ5Pf90wqED4sSXQGPZzwOq
         07dh+jIR+6er2AMu0sYjKcyuloPjbh3mfgp2QkrbFWSUNEOwqLqwu1qaDyIjfJ2+Bbbj
         CIbdhMHbQoRhKqqHA2s0fHiMNyitf2SQ/1KVFkQ7eYXTWCcpiWrIkPyGBBKsMVvt+2yj
         wlGE02XGWD9bvAJNln4ITMJuBNTfYExab2Y0QiRKg42zjfELNMHj0bk7Y03C6Ssyf9Gl
         vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257848; x=1762862648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=lfYH3QHsJ4tOA7UEEZhiCsV5hPDPM6KijB5OSbNq7at/q9xQg1WsSbeH0jBl4TgItC
         hRIzJst/gSHcZvqXkRzStu5Pr9EwHYo/hEJu3GlJyUhNHZkVzIydbSjhmtW8Spn2MdQV
         rcLNyk6AJRuJZ8oBhHVduCFVJ6KRwkVcYGlwP62f6L61d2ABxOcm11Oda2SqdMw+CUR9
         DNvlpVclz63pxc937+68XBFb7TiEN3Rq6c51AjNSX18Dp9mmJ9/HmJTlgUTvcexphDos
         xtsV5TK1AEIaMyn2Dd3TwGYB8U/aih1a/898/qjTNBpFNRKTacIyLuZETLg7Dkkzios4
         FwoA==
X-Forwarded-Encrypted: i=1; AJvYcCV4Swt8iDgsp/qPpTxu5zn/bIjmhRlof+It+fdUlovbV85stIJfJzg62n4jgLjytjsevEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuWze7Ultm8q7IeDlVVeMu4HFw8RdO2EuZ8uxMfd46UeEeQ8tC
	2JQb5bfBEdj+vT3EIDF01uPnVd1bUgckWy+dfN7gwV5FENGX71+DDG1A
X-Gm-Gg: ASbGncsmUaCYerrbNjDWkQMH7MwkyBJib3BzOlxCl6MS9x01UF9hLlEblxUqakmpnsh
	scUDewh65SxY+1J8kfsE4rz5DrnMtzefow6ZJpoqYeBSZmasyvPLdVbLFoaFkaFjHmdm5XcKjf5
	ihcIUNGqE7D0ezqApOSjsxGf54x14j6uKYi6tk9FtFG2VaGFNFY7ntPzpCU/aCfMzfA6RwGwhCL
	Z2e0THlCh302oGEOqI6WLEeH02XnyyQ7oxwvvfudL9eL/OTZ/0w8kKE5ib7BNGArmdlYCbUsP7p
	YIIwJqjmZpJErGnVK1fvrSw1cWsTk4vV7TssG9ucHHZSw8M3iLs7r3BPlujzX3Z3jGNvVh94Hc3
	mSd/J6F3nhNEOVHNsrpC5Xn073pLHy+XuNsoUbwZGqBYhC6vIS7wcWFGS/eeLLTkZ59ZFic9Lh7
	MGTz5UODUcq7EguzOMXN3wXA5waA==
X-Google-Smtp-Source: AGHT+IEFmmFqmwF7IJGHYHQFLdfcj+i6AuRD6y5QTSlNabPHEjYgdTalWazPTsjhrKIiVzJb3z4NAQ==
X-Received: by 2002:a17:907:8692:b0:b71:a627:3d8c with SMTP id a640c23a62f3a-b71a6274340mr486414566b.56.1762257848026;
        Tue, 04 Nov 2025 04:04:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:07 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Tue,  4 Nov 2025 04:02:59 -0800
Message-ID: <20251104120301.913-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
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
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 18a7f68aa59f..745b7e22b954 100644
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
@@ -41,9 +46,15 @@ static const struct imx8mp_reset_map reset_map[] = {
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
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,6 +66,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -141,7 +153,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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

