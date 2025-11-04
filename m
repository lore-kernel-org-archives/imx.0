Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748B2F60C1
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257854; cv=none; b=DnThMrgjFFP6SAx1GbWtkju66wRN7AgWsN17U8jPpfHwmiUoEkoo+DXWxIKeHF0w0huwBFXEEwAjsuKlBDKD1VpW5gSSTBgZ5wy2CTMgMNxQ6fNfz6iE7GrmtEntIn54G0m7aJOn0LarIt9OB2m+Q8EP2AzHDEURsImPEc2V2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257854; c=relaxed/simple;
	bh=jfUNe2KhyNhQkqz/RyX9v7SWqUEpKz/Cnc+k9Uq1/I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1oWuXbFMK+5rxleKx9sv7XHHWNHo2L3pyjyWCScKdH6fb1hFbYLiD4pdun7/IpfJ3irdxJwLFNdT6h2ya8pvqBOo9ud+n4XELy5lR73+ntpdPAUW1M27E47dBN2dXWn9iZvMvj2j2BHIsaraT9z7+D0flstT4QJA5pOR9oDwvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8dss8Ct; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8dss8Ct"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d345d7ff7so1177778866b.1
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257851; x=1762862651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCzqKD3xSHfSBn+d7Ai/gvl8AIDeYTTV+y/cpT/4lgg=;
        b=Y8dss8CtppUeFoi4PJXiaVP5r00KTnUca7GzNCwERhPwGVBALTaeTlWcGMbl+Wzshu
         64mzYaKu0qG/REwQNez2oJrrwy9lzeCHkl71Ty3t2z79USKorSdYc0qxgoz/3Oi4qRrC
         A8iRESQxDwegwxIl9Th/xSrR0Ed5JekIjsdLRK7t9Zj0G72eXA2wqEFUB5DLr2omp72q
         5jFH6JLoDDnXFdMHmk/69jETPQeWKR16yWuqDr4duG6aqGGrPnU+d8aS75BVj8jdvUxN
         JwHsub/SkOIRVXV+auzJMnGxqqt4BH5WJQeEdH8oApm+92CcYPNM3/Lg0jZBpnbLxsIV
         tMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257851; x=1762862651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCzqKD3xSHfSBn+d7Ai/gvl8AIDeYTTV+y/cpT/4lgg=;
        b=hIebIUxrVVSUfVV+Ok0XC0hUwpntPVJnbRFQqgN5Z3ULEgD92KaTawhDLJCfZE7HbA
         shVEUloFhAMqP6GLXAcbrKf0LEbpsZoRU2fl35p/Hz5DakRIvKZcCaQi5G2gFycYLE2g
         dwJzi/CMnqLwKbZ4kWYmXQmmxnIvKs3wHDaGozGXLsD4BnLJyg2B+P+TGE7SdaiVSwky
         afD/HaSpVFAqEiP3CLAF85Xy09RfHrfjQKVJCDA/NOJlG7DlqUWT3Zz/rqh7tct9KxGK
         JsYiwnK2lY3ZwE/YCuET7GckOlBrvKMGmQgxPXiK+VmQ0czSMG/2+Di13Wyf0zjayWnM
         aKug==
X-Forwarded-Encrypted: i=1; AJvYcCUgH8oLDRuTN/QYT52vz2Pq8TI92ZVivn1F4ZbrfPobeiJrsrF4z9YwmYD2OckPFQBxX40=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyIoLosdlj7uYan1fo21+kkNEeYiM0/Dc9aPkIm178K/OXeafV
	u8smcHhdBg3V3RftTXNaEpdGk/EPOzPqF24PKkQjRf43IRpU+HifFEAj
X-Gm-Gg: ASbGncvGT1k2SuNeEO4rsHe41gUj4KT9xP9aTyc2ph3tkzbvetqQ23O3ZxpQJbncI3y
	oVNlCO5GGmiGxlQuKQVIPR+RB/xWkjg27C/aVzvAU4SflMMpk4XCy8hSxpgWGtaYUfav1XS/y24
	X7cY9lzt0ZDh/So1bgdq6EejDLeU+gih9vQEBdCajXpjlaCffvXjiJ0tkQDYpQcwsZNGgm1yipP
	Pj4nZKedSiXHG3YusR0XcmL0M9V7pASf5TbjBLmmVF0WL0AiGJOuVRtOHC69/7iIb9DXBll/nP0
	o1lAhT6oQ9o57P8Fe5ZcuwOasNNHnfmwFcstlYsl7tmd+bLMYqE4IaYiX/bJOIFuJTVPri9wgMK
	V+apB+d1VX9PtYVzLpiQy+0AkSxlFr1Djqw4iLwGSeHAy7/9K80oJzcHbkosjPZA+AVy6sOROML
	QHtDbPUZpFr4jlxOWunm8ALE/uqA==
X-Google-Smtp-Source: AGHT+IE2RvpbkP9lMyxDB9hrGIqiXzETjyBqy83rux3b/+zJ7/joFNzbydou1+hhLeq8yhwIAz+fmQ==
X-Received: by 2002:a17:907:26c5:b0:b6d:5dbb:a1e1 with SMTP id a640c23a62f3a-b72159d5c65mr316758166b.5.1762257850774;
        Tue, 04 Nov 2025 04:04:10 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:10 -0800 (PST)
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
Subject: [PATCH v4 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Tue,  4 Nov 2025 04:03:00 -0800
Message-ID: <20251104120301.913-8-laurentiumihalcea111@gmail.com>
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

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 745b7e22b954..af8d585d6c18 100644
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
 	struct regmap *regmap;
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

