Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C6A274B4F
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322928; cv=none; b=ZkYY2kiUEonzH1W+TdIOrhpIdNXXoy7SawLCSgzavRPK5EeFXxgY0VZU7yC5Zd/hqIt/aiIkwmtagllGDBGpCHwghFzNfrKooVDvTgS9AXC2bP/JhkreW6dRfa5fCJYHB7uUN/RhGkWucQ1tJa3RvIicPrZgSV78MTWeGuhLTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322928; c=relaxed/simple;
	bh=uweK4ZGM+aAvsENUFWqqy7fWvt4AmCh2AoFSFiZ5JLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWNo+XR3a0IVKI/KtehAITSdBgKs1gGJHxE39qaO+/+7sgxow3or2tZjuLjlOS40zr2mUymlXoywXWLvCcfXxXzFXtMEAAQu5tHroHsLmSCxZnchCAEOhTmz80wnH0/4TMykMuW7Rf7JQilmYlRG+wno/QOhs5JE09ej89qKwyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNPRygTZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNPRygTZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af9180a11bcso957621766b.0
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322925; x=1754927725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns9K/OM0OlSKhVmMZUPRzp8mdJBBQqc3nvPasnNJ9zU=;
        b=XNPRygTZhT0fRO4wuGAZgwmPdguti/mvIsO0lzVjrJZNTeL0kpaTZZiO248U9oESS7
         UUOd57cv+zqQ9vHtr6kpK10qgwf+XY5lonm0T5lKfKC7a8/3hrBQZfVPK1U73jU3KPl4
         fCL6cJ21Jg+yVV1YuCjafVwB0/b/Y7yIKGntQLXJjXiX1RQ1HdCjX3AxcD6el96hP242
         N7yatVqnLvjDxBojSLxhzSd6nyOJgYc+gmYCyaePuAJg75CRg+O/4HSMBK3SaXD8mr/1
         cYzVeDbAVQUZKn+e5K/pAyoc7OwUbBgZi2MN9qNL2e6vhK6t+vpFWM5IF9ctGQkzjUOw
         KOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322925; x=1754927725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns9K/OM0OlSKhVmMZUPRzp8mdJBBQqc3nvPasnNJ9zU=;
        b=nDcF2izNjrBXRscB9Ojj7GDDo0UWBFIdNlfDIOT5Atr2W/rxZoicnyl8FJW3QauwW6
         huqh0M25SPOsE2UtD3OJK0ZFU1Rxiy4LzJrIyX12oADxpKOvrlCGlx1jS1647VBwVZPM
         EBG/aYmGEiJ8sqxjY9i7MvQ4AbXybLjMubFqQp7pmUzwddSGZr8GVVxXJcF0687kjqfB
         k16YhRFIWKhHo7ppPDW6KEp9ch5P+hsQ+vwTQ7VxUTEpg//c6nSSNrDGNP9NxIuM4r2f
         WYMBXxUm8PWCRTnUhSfVl5DRZ2HXG4F8U2u4PzU68ShtrfxwdkGOxnEtbQJ/c76CyEtv
         182g==
X-Forwarded-Encrypted: i=1; AJvYcCUdORmCDqXec6iZ6oChnOlxwHHjVihShgwzu0fjxFeKT0d4WSlk4BOYahJlNqK3alConFA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzglK14FDhS0mEaANpPIAWdcUgZMlTeKnKqwzS2Bl9msty7QTTU
	mauooN4LEmVXDqK/wVHj8D6fNOMDHB1Affa67X1V02ZhgxqirKSQH/kv
X-Gm-Gg: ASbGncudmthywzhLUZ6izaCPFMZ6AFX9QEJOTdYQ7FY0h0+4uhvp5mrD2yeOYnN0kMb
	SOukVzoWb4cJPw2A1/rVLif0xyzlZcbO7y21wIdtoqPh3XYsfXcA6FA48aK57qI0lziG1zr7E46
	WrvesI12JTJaDsp9Vu2IGHycHSUrQiz+81LlOCp/MXK3QzgC7UV5zvGquriNrGzlvFYpXFmJ0h2
	aYboRfyvFOtEH99/oI4cWg1f1giKDep5k3/a3cWWhSmX3+te+6/Uh2ZI/0EJnLRwP3sanCmZOUu
	f0+iabIM8ZRwxRNUZlAXO+TihvsXm5OntneXrolDAmsxUlXkbZTwIAOvAme9+VXpADUMShQ/5Vr
	zdv6TsCalu0MNf0genprAQrZPOgSiXWCp63afcwdBcwEU5RkcgFKhsaDkVLc=
X-Google-Smtp-Source: AGHT+IEouzbjulkG+wmc2r45tzYYbBoKFNbyGXyIRI/lLFnz2uUKUnF6zkDeOJPorwY1elRfZNGXiA==
X-Received: by 2002:a17:907:1c1b:b0:af9:415e:2f38 with SMTP id a640c23a62f3a-af97d29c92fmr13675466b.7.1754322925044;
        Mon, 04 Aug 2025 08:55:25 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:24 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 6/7] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Mon,  4 Aug 2025 11:54:06 -0400
Message-Id: <20250804155407.285353-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index a3d0bd823272..2ab701ef1c30 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
+#include <dt-bindings/reset/imx8ulp-reset-sim-lpav.h>
 
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
@@ -20,6 +21,8 @@
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -54,6 +57,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
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
 	spinlock_t lock; /* protect register read-modify-write cycle */
@@ -159,6 +200,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
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
2.34.1

