Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110EB3D9020
	for <imx@lists.linux.dev>; Mon, 11 May 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496215; cv=none; b=m+hI9zWZqPvTqVoVM1KltBVZkClLu3QvpWvNthZD3SLODL/3xj7zybrjvLSEJ7KktTwYZIQdq9ZyxQ/G9lD8s+v9Tx9VdHemT6a8Z9rC+ywK2iTnqlcBupOhoaBMOhG6hj+mNxw7Ah6qNlHw3XPPEsohBZXyITsL9MDeZflJJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496215; c=relaxed/simple;
	bh=c5lr+YwyxmPJh4k5BNE+uOrKJBYoOBD+XzseEfCJKKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMSALIYSWj40K9PLXHNYOzEAiHRePC+YngjiX2VEhCD/jhF9d2AKk/F8ovos2xxjfVRVwYrwSmi5abi4x2KLuE/ViPOIsrAHnpsrbLS8Kx+zGNiQG4K/rUljKNwA9MxzPnD1D9nZYtD5jjpZHV7dlV65fD0p5qPLZCYrrg7Oo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeO4fGJn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeO4fGJn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-366375c43c2so2203212a91.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496213; x=1779101013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqfIJWhfpQINNVwmdgP9tbjnCKPgaaqu67uO9dQrqdM=;
        b=OeO4fGJnve/hXC9sOKSosWSokaJYSAcKHBEn21lnAuSXo5r5GXX+Ev6F/y22hlBWHr
         gCUxHRK5GcolXMMPfMHzl3wg4e9PeEg7hzpf+vwb66KVHRtdeaVI0dxrR+SrdVhHNb9U
         Z2cvQ82R+rmlvzBpwRxgeII/ZswgSHKu1aQMi0u3dH5nCM48ynbRhO/V2b2FFzr0fo5o
         5lezO8B93BiIy3u5kNNdWPxLIOJRBnRkzqBd5lrWN4THhT6fcPiN0VMUHI8upjCfKd3+
         I21dS0uFdGBrDi+EIYziNXFPRnhpkz1igX9d0XMswHWAdKMNU0vbSz2jOZRZczSQvivh
         dGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496213; x=1779101013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DqfIJWhfpQINNVwmdgP9tbjnCKPgaaqu67uO9dQrqdM=;
        b=Teo9AfHf0b6DE+jT8KrIXhjgMxwFxa0qjpkXLtQ7IS4hWKcTRMUO8x20H+/cNn48DT
         5kyTfCLqa1wP/j24WxUCxmAKr19goHnbwNBbgvLnXVdXhPfOrnIfqzK9TpkDyPrBQwkt
         zhy7QjC5OXxe823ovK8f1D/nQ3UJmGccTtT36ISIonrUxf9hrBT4ybK0XNOd0LcrZlpa
         58LtceB7+5FxHvV16cmJ1ZPyoin5Mu4M27dmr1RA3+g89FNYX/KqomVnQUCxM5/I/5+p
         ALUSQ0PvxCzsypgsfvxl3N2tnjg6JPHFtu0Mz9yx9TKyx+UVBLyFzDrGKGRsfskwuEVO
         gmuA==
X-Forwarded-Encrypted: i=1; AFNElJ8dg+y3bzoNwqZ5cA04vkNtT3+UdXmglopS5WtYu6NxjvV4u5F0r3BZ+6ww8RafW6R3xQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgxcUle+E4MstCAY88+dYOnrDNRlmZBHqFTc80jdblKpO8r2Sk
	/gdOyuuG2OtKlJSZLeOygzLcWoP919qEysOw3gEuwL0i5PZWEVpcRKjH
X-Gm-Gg: Acq92OGTMkVVK0bFKECxO0zpNG86TpPZ2yy1YhhEmSwVOLxeapVd3WqiAeTrySaCEa+
	wbyRtfE0VqXv7et+Im93ixcCIFS/+Sk5tUvyy0VRaJhIL7hPXHUkd2jmDacmgaXpa2eum8KjOhD
	6f8ucCipSWtBCgjeJwpVbt3TGQwtG1wbOFTsa1yYARyTYbiniuOmRXt52jxjWpDRUL4OMqmCrU+
	6sR7xhuq3AztkuRGrGzoa46upvnTQjrf68NPzpNyMb4zXW4oS1quPnaOxJmFxVnN4CORZoP110E
	o87+WC9xfe8p4jqm4poikgxcKdvNv7hfDFQLNjRm06ty39l4xi8GWIMqjVTKM3sH7WPnUBrnbIt
	72mOdLC8F6S3ZTx4Rml7WhFT/9f0zpNR5MZq9XUyun4cBZBuMLYOgqENWvWCXgoO2ithaIy8Epj
	EOeBCymsGtjiLzFPtcaE5ThU0hVlv9
X-Received: by 2002:a17:90b:1347:b0:366:10f2:8eae with SMTP id 98e67ed59e1d1-3664cd2492cmr13967723a91.23.1778496213228;
        Mon, 11 May 2026 03:43:33 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:32 -0700 (PDT)
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
Subject: [PATCH v4 4/5] media: hi846: Add 6MP and 8MP modes support
Date: Mon, 11 May 2026 18:39:26 +0800
Message-ID: <20260511103927.279550-5-mitltlatltl@gmail.com>
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

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 154 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index c77b34a5e166..12df1dc96163 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
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
@@ -1128,9 +1228,59 @@ static const struct hi846_mode supported_modes[] = {
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
-#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_2LANE		(ARRAY_SIZE(supported_modes) - 2)
 #define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
-- 
2.54.0

