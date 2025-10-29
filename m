Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B93563F7
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746180; cv=none; b=YtcHuGtm98wmVXMrz5lfwyecZf1zg0s3OS3xCtOjgK1d8VEc9BSPDX+TluqFPjKbUINvBZboRWAONoZmEOEjDIX9NePb47RfCv1QxscGnBGFqyRPmvf8r8cOj1oz3xZjXBpYXKK3Q70mexzcRDE9Gogo1+S8pMQWlwUM9lCIDjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746180; c=relaxed/simple;
	bh=j3R2uXoM/Etft2azckQg/VwhpCxp23HVCKOSpioe9N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGAMozcI3SnPP65APtyougDqvy8RpI1jsY19nvhawAHfmD1Y3nhPSHCElitjXOUi1S4WaMgvjvDGZGlmVOGEtC3GUG6DdL/gwreIVghGqliAKJOrynVRdGkvc5zk7Bnol5Op251Ip7aIcyLuXL3BGt1ZWbcJEwMVyjaoXhWJBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZshRsUp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZshRsUp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3b27b50090so1290601766b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746176; x=1762350976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=BZshRsUpyD1dXhMifIXbe+9BRH2nDVZ63Ph4VSS+2wuGVQbTkRkzaS7azk9N5sZ0vs
         PU6/u7MOUInXozhzn9uVizIHo85KeRF0NdEHxSAG5flUfJz3IAnem7uPG4bvWfUpLwpb
         pfa+sC6EY95da73rMrYghPDYKvW8ItBxy3efwKEkt0h0tMu3ripdlfgYw4Y88U+WNtYt
         LyqTAgGXlK4F2SdiWdXNMcmWwvpwN3lxrP2Zd+m0vGQpHOJGiFcfOSpULK/+Ho7idPhe
         rHgPcNxzVkwBJJsV71bMixtXR8GwNJcYfYmSNQg4RxJYyax35FzHvPgndcBtox+dKHFb
         6CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746176; x=1762350976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=biO0uKCrG8xC1I5YIfRXopxHbs4BjpPosO84sPiR7KSrCu1q54t2Tg4uVoOPxlNnAl
         dKBVJFq3BWq/b+0PTcKTnkpf1G+36mmBZgkMUMpnl5ebpKHNlqZ0CeZwBrGq5O0GEqxZ
         beSazcDkIll/o7b2nMl8yyHKlL+JmtlN0g4jfuAq/dlALlhjiyR1q8fReEeg3+tQMsAj
         rNvRA2XCIwB4Ta5RLerB7WvQvTFnaPXLJoQWHvws/P1yi6CSnsM49hPG9IeeBv07OuOB
         T2XYejsjlKmRtXLVTRZubQYuwkr/r0x7PZHinZKEcSPNpTeMoSMcbYPZYTprIDFz68RT
         bS2w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9BCs9K7KMKzQpGLx9/Nfv4LyhB7ZmIV/e10fC8OK9usropXGXO5BKtXYtKVkiARu3zI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3heSUe2pIB051ktMgRCv7I4EJFQ2z1jaQQg5Dk4dM9ZLe7mI4
	hD8yhU0CfotxEQC+cfu/r6Rx2hCFSqvEDiX9wgZgDI0bIN2km9V6U+0Z
X-Gm-Gg: ASbGnctxCAoiiDp42Nnsa61O17Uk0KbJWMiJiZUstMwdotdK9cjWWwOlTWI8j5RBHk8
	NpZM8ANTDK0gIEwuv8BK0uzay1EGpr4Kk0KzVOOGbN7CYeaE9xX/oCVsyMQVYEI9ovYgMYLmpid
	Zs6takkj6abSTThZBdnI0tJkk+cXHIPXvm4DDCqufhGPagWzDe3E0JoD6soqsdF+8NLral3pLjn
	tZtDTteHKVgN5Y11XDM3Rzl6LEwmVTe5kt8tCRiCt4j2aiCc1nPB22bEhu0SxnMI+t2ptnHVit+
	MlCkzJM9bvjBzC0937tOywRyXT0CjGy6vwsoSAt8GTB/APjx0E5bZD4ZHBk+Hb2t6gs/qL/B5F6
	2YNCzSp6GfVVDZhUF1s+OrEDvIY6Lssoch5sUFK385juz36Q1cO6MEoGjE+ZkN1P1YOFaB97bRx
	YAc3EcfOQZXk6c+PJg5PvA26JNEw==
X-Google-Smtp-Source: AGHT+IGW71s06HOeamIvGEWwmfCKA0lO2ind9hiNyNeFinhDdkAcMBYKLqyvdDoCQ0vzL31+LZ8kKg==
X-Received: by 2002:a17:907:1b22:b0:b6d:6c11:e9fe with SMTP id a640c23a62f3a-b703d5b0deemr281105666b.64.1761746176434;
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
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
Subject: [PATCH v3 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Wed, 29 Oct 2025 06:52:28 -0700
Message-ID: <20251029135229.890-8-laurentiumihalcea111@gmail.com>
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

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 5ee5a32c6950..4e420c6b8fdc 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -17,6 +18,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -51,6 +54,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.active_low = true,
+	},
+};
+
+static const struct imx8mp_reset_info imx8ulp_reset_info = {
+	.map = imx8ulp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
@@ -179,6 +220,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 		.name = "clk_imx8mp_audiomix.reset",
 		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
+	{
+		.name = "clk_imx8ulp_sim_lpav.reset",
+		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
-- 
2.43.0

