Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF603859D0
	for <imx@lists.linux.dev>; Fri,  1 May 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629466; cv=none; b=H0Ti5KSTWCHQcChEkg+FNUTRBVxLeCW6Mp/rBw88X9wlt246TKBbfwzmOOmHZD1LPeEujlXSnmRXv7kdzi8rUULQ38CXtcq361o7mf7YIGtWPIj39rFUrVGU1GbYD6MUGRrkAxkWQqxJ1/hFAW9XPJnMubi1lie1ToQUFeLQWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629466; c=relaxed/simple;
	bh=GYYm1WbFUMOA2zJHVwqVtBVm18ANWirY2AKzv459iyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFLWVVwwYfNBlQFu3R8b94sKsK7oBPLpw1CqCpA+bel6121wT8gCRg8I4LbTnURZmtOQVAn6cA5FJ41iYujwD6iJSlnkrLg+y+4HBBi6qVr7+gTazkIyOwAe5+I/BQ4fMf8uMCTlW3c4SqrQ4XC3Bizs/NZ40ZAu0yqQ7RNfAXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZvawHpQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZvawHpQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7973bbc16dso1062781a12.0
        for <imx@lists.linux.dev>; Fri, 01 May 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629461; x=1778234261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3ob51ZJDmb5EvjSVaP9m9WkKZYm4JcxG03UmWgTm9Q=;
        b=MZvawHpQAgoljRuLKflBRgnOTskcEcQPqH90f8s0A7v/OlYMF+rCcMyF57RF9m1ily
         MM66XVAbNHHjKzGMer76miT1hrgnumxMDH+Oqsh3dkHidNMUkXsmqPPQghUajRk0ULgM
         IZqd4CCtztViggvJH0O/L7ejl1VM+j/XYi7L4hgbOc4QQQt7EbI8OkJ+3naWx48bDgvj
         OZRmAJK4Gul+68xIJ5F9c3qsQ1C6wkc2AflA+NhIikwdpc8wBXmOsZ4L5et58zTgoZSI
         /QKDYRVqafFjX4jGx4wMTFm+XLxAl3RSufAigTlWHw70cOmN2NuTW/YV6dBMPYMKymx+
         /lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629461; x=1778234261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3ob51ZJDmb5EvjSVaP9m9WkKZYm4JcxG03UmWgTm9Q=;
        b=IEjMCgPl6F6uAvPCm7PrjuxCGF2VPMQw2Nu67+kUFbHxYxx6UCccezLA0mAadwYkrd
         lVzGeeK3VfDZy7h4nqW5Bs1/2lVUfYUy5NWk8JiiVRK6qbH4w6KnYvbWJef2josR/Kci
         nXU/ZkbZOGEa1KprJmQXyYTnaFgvogMC8jTFIWCpnZPsIUxj8ncngSy3ijawg6DAmTSB
         p+/5WlnPulFjPAXlt/TQZHPvfI4O76PZ8sqb/c8tPTECixFVQidfs1qmf4YtBS4kNXdP
         r/s18+iABm85XfMdeL1JslpIJMXDHtGhzlSN5P+B/XXr6YvYvveu7AvrtcNEvWNF0poU
         oMqw==
X-Forwarded-Encrypted: i=1; AFNElJ+jrIR6VXQc/bOLluId7NgJEHN/XHv1SEzm7J7Kv+C7zCvTRJeRBQL2o3Gb+SZgs89MEOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZPNYD/xSzg12B2drcau53dLY63vEybsXuCWUIidtd/WV9I+4/
	m1lXJf/birSFnq3RN99CvEmoSfgAM1jRD4C+/ZSamwyzOuuKqrhgur8nd+/i3xYTRd0=
X-Gm-Gg: AeBDiet2zwDgg43wq/lsTEKRNMfIvf0IUpAD6Jrglws8Kyf/qbqBSauzjCtjg7vVGY+
	sgiqtJaHMRO8ltNHUY1S+bFsM0IMDGissS6YvVr3yXiLWLJflaIcM/O2cZsKHmiGlFgkW63V9Ou
	pXapji43qmrpIzhrL8Te1vg95kyFJdOHjIYTQ6p6HAGo2/bhaCB2heP5mdlC1RyEVVcDzgCTfFx
	UX5S6C272iqOcIZK3YaA/WQi0R323sfwMxIC5d+aSx8gQiTLpr7EbXoqd4qAyy7WMhuiS55/Cac
	QhKEwiOE07HbANJhzbLUzeo4ffLGrXVnYmqqxGopBFsuTjJv268mkMSeKglxynaeHABtmzDdnA8
	Cz3V4nr8eeeCF4of0RNacJDaKgpUvbLVbXxS+NQPmG7pSVaLdWLJ6WCxwK0xuJjgz95flGmKkwb
	sKB5mi1iH4C6QylA==
X-Received: by 2002:a05:6a20:5493:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3a3cf5f759dmr7089603637.15.1777629460890;
        Fri, 01 May 2026 02:57:40 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:40 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
Date: Fri,  1 May 2026 17:54:32 +0800
Message-ID: <20260501095433.1609309-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
No changes in v2
---
 drivers/media/i2c/hi846.c | 152 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 3a0b1e124d9d..c786a54fc6f9 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1027,6 +1027,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
 	{HI846_REG_TG_ENABLE,			0x0100},
 };
 
+static const struct hi846_reg mode_3264x1836_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x072c},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x023e},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x1836_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
+static const struct hi846_reg mode_3264x2448_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x0000},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x2448_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
 static const char * const hi846_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -1127,7 +1227,57 @@ static const struct hi846_mode supported_modes[] = {
 			.width = 1632 * 2,
 			.height = 1224 * 2,
 		},
-	}
+	},
+	{
+		.width = 3264,
+		.height = 1836,
+		.pll_cfg_4lane = 0x4124, /* HI846_REG_PLL_CFG_MIPI2_H */
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_config),
+			.regs = mode_3264x1836_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_mipi_4lane),
+			.regs = mode_3264x1836_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x172,
+			.width = 3264,
+			.height = 1836,
+		},
+	},
+	{
+		.width = 3264,
+		.height = 2448,
+		.pll_cfg_4lane = 0x4124, /* HI846_REG_PLL_CFG_MIPI2_H */
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_config),
+			.regs = mode_3264x2448_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_mipi_4lane),
+			.regs = mode_3264x2448_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x40,
+			.width = 3264,
+			.height = 2448,
+		},
+	},
 };
 
 struct hi846_datafmt {
-- 
2.54.0

