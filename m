Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266231C59B
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127511; cv=none; b=N1S+SCPD1iHKY5Av5VRIy4mYSu/vV9dCfjOlZOYflX1/AvHdN7UPNPqa/MU6lqKO1wjDyYtazTj7y7m4VpUhVtnh2ANn1+YzJO/vCEbX45nF5U6ye4fk/JC6JdJMJN40FVvJQB2jAtq9A8Om0YJTFsjq+odqAGGtwH9cPulBttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127511; c=relaxed/simple;
	bh=WDONt8lsWsVHQ3PYPlqLEoaUzwOTi24id4NOGYRQRbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCmACB/ZSuKRIwG+B0tHFJJHRS6QYiScWOMfI/ahMlW9Jnu5Z//i/m//OcHP5rRGxKWAVkvThhrdB4lDumehUY9aUt96oWLcJjBb6rYGFRuF0TIATe3o4gryEwUp9YyIDWYtEvIZ+dsQxJyI396Gh8Bhi1hCX/Bn2ir6yOnBvzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDDuGjHB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDDuGjHB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b728a43e410so310696966b.1
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127508; x=1763732308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjEK4P3dbzSXwnv9p+7adMjs6IATWQpdCincKxuWQP4=;
        b=DDDuGjHBNYbXW/XeQqXZRk4MDTpKaBfsGMVqoiLHm4kWNbXyNzmziozMrGyD0eS1C+
         3N//e38groyg7yJkvxsTJpHNcp/AkuZ058ntTL/shTKLEq/HHnnt33r3krXKilMpdNDO
         jCt3mNqtX9qiw5D+88MogdX3kZvzSCOsr5Zt1Y8JqMJIFZpRxF//b0t1b887kTqZ2C+5
         nr4dp3g80M9uMDV7T1RBuNPg9yw/X4o05quVnkP8xaxr+Ha2dyZ/BNk/2IUzHjg3gFYP
         vDXphahTSHWgRjRy2QqszBYfgYG1oTl8MOJEFt0tOO2ZoGgdqeEzJU/TWcJ/u5Hcxrp2
         Qq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127508; x=1763732308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjEK4P3dbzSXwnv9p+7adMjs6IATWQpdCincKxuWQP4=;
        b=mvLiMT3Vi1rpj1T2uujaVbz7Uko4vbNkkK4cGryr9ZDP8qyuhWRZ1s1Ws300OwkOpS
         +bgb5egPDvcHw3V+U7cRvrpvdtZjh8zcpAwCNLwCh8FsY2DyiZV9rWchVhKjuxL6Eawt
         Aw6FM2AYDStd1G/cWpsZ+Y76STLqtkDGB3PmI2YPAwUV9fLbD8qbJ/GKsFZk5tS1OkgQ
         WIVQI2ktnhpc8NsbUj0F53N0KZEeJLLJHlOKTE5/Qcj7CJ4zgvDm2dfUz66CxYKY3A94
         MWY8kvQfgMI7bIMbDrjsmXM+zeUGUvP6XJNeatHloZSbkP5MRPRuXn2ms5Pri6jjahgV
         Nemg==
X-Forwarded-Encrypted: i=1; AJvYcCXuZM6mS+zXiS49aHE4fZRuQFUJuRjQu+mis+1M9K2df6k88YDlUiPOy1VT17owEUT1XwE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0QR2bB3/sfUaUfxAMHzK7kKIEpHy1XETZvXReqYajc8H8nRNq
	/bAgdU6q+hXIvEmVchV5onBRDyzP7W1tvuga9qj+FA/2n3kxl2s108d/
X-Gm-Gg: ASbGncu5O2e7hdAaC9t2ZCCU0EoG+VAIpJcgSN6H+O8hBkM8SvO91wy4cm7zrWIgfub
	tH4vkYGEdsEGlJSbs/q56X6IfX4myg/xpCj3KNPGmrallfpRrAEr+h7FcalURII6krgj8U+1N8j
	3fgD+Kr0a8QThRkoL1dYQP2CJ+3t2axsUiAKvp7Hkxed/hnEpv1sSLAm8Tf46XwUeL7EBrXTPB9
	wPbIR6EJonfmyepb59UfpKaz2LI5obOyuQWB6k6dtD/JfTVC2WfLXOloJqxYKRlz1a8LUEe5SMT
	INdaploVuMhwvx+4nFRSJi1Cr0iilTz4p9BF2Zzuqk0YMgu14rsggFDaoYlUMbnKFpcx2ib/0WH
	ZiTtgbKN3miKRSZB/w4nGxkW5TGn7Kdd1+VWCuCetKALe1fD5o88xuO+jCNpRVUbfUUZFS5fceK
	gz2t3YGe0xumUVav9yvpk1culSj/SYPHqyqyGYbg==
X-Google-Smtp-Source: AGHT+IG/Eta9H7LYA39y2DTXjRpl0eAQHOhH3wq89aCFtUYEwpNsngjLk7o4A0zETlY/YY2uNySFTg==
X-Received: by 2002:a17:907:a0b:b0:b72:5e2c:9e97 with SMTP id a640c23a62f3a-b7367b8b6bfmr226704866b.36.1763127507961;
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:27 -0800 (PST)
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
Subject: [PATCH v5 5/6] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Fri, 14 Nov 2025 05:37:37 -0800
Message-ID: <20251114133738.1762-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
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
index d3396f37d1ff..83fc8bcf80ab 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -18,6 +19,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int bit;
@@ -52,6 +55,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 25,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 16,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 13,
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 5,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 4,
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.bit = 3,
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

