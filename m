Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A16163
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787475; cv=none; b=h+h0AHZuBVOOELyhD2Yog63SqVCjxxcj8xvw/VNHuxXcX2AsU1wXRQUsTOFLQbSWJlWM0fF1t47l8sov93Q9WEFJPJTEwUn7zvWgm+GHK5AKso3fuM4PdpoMk3eESBQG4uZOJfuM5UL/CQBdIbx7eWlRPrgtoCeUvARJJFnwG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787475; c=relaxed/simple;
	bh=qe7ttvq64awcUf1Bh/SZBEiW9DFFzWDMMy2H1g5I4qA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUtg4IA2/sR7tZXsPysDThUy3R3TCNRV//p79aLLpGifnzwc97BYtJxQ2LnJlAYrWLVapyEvEJAp/PDzIpyWwakXLpI1wiTp0Cv42m+9mSRoArP+2UCIpIczORoffYC0Y2yyEEPI2gqwHmiJ7OYX2TqrRPPLwglARnSG6zCVn+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt+z551T; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt+z551T"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcdfa7df68so344491a12.3
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787471; x=1739392271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4cK51CNRTbi5HsJy6wyPaHqt26s9ymp8U2/6x/uKuM=;
        b=gt+z551TV9ukfycS/MR3XGET91mG1PPUEGI6meUghZoZbRpAcBSxrhMel03kP0WFJs
         X6hmSAYYsKItok9bUch65GSV1VJtLK/BCkhgfvghoUkgJ6gfe4/ZWDMOFBeZHGHzVZfb
         N/dRgJrT3RO6ifLHUqzfetcsOPmePg/2Rblu7lA8fgpJKH5INJCzMeGnviWP6KIlj+8O
         pEJ/v8/q5pZydrrQqYrBnl9dr+OXELO9JrT7iCrdqW1NtPc+YUoWIdqE+/Du64jmjS7m
         GtXHxjXrBQYEGLRQeM9DOc+q5yON7Y90G/8N4FNRdhNkbAA80jrKBZaGaE36DfrYhRAT
         xeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787471; x=1739392271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4cK51CNRTbi5HsJy6wyPaHqt26s9ymp8U2/6x/uKuM=;
        b=t2sw2re6CDJEle7WUhZ+ZW4n96NvdW+lX8YTmcJWsko5Kr9UqhlXrhBVL42mdXkXnD
         fctSPVINsKTXjDr7y0A+Fj3GqmzVcH11jxZaksIrd9DIaBRaMo6O1X6ev+0KNVgYY7HN
         d9XVmRM6Hm08uo1tTCXPxxN8dqQvaRrifJ/hRrRFXEwJxtkEin4fs6Hf2W7Hsn8928Jb
         gZkO2rqpoVi1sincdFYTAO1Aj60EPHFCiYK+EONa7YZ9PGDJvz9ZgAd7ZlmHFt5QKLeH
         ARa5fkqSg9LZHbuKBMF5qcq7wBrnAqKtd2c9Ru8Ioo59XDyRQ//XagwiTFF+ddjU4eim
         67LA==
X-Forwarded-Encrypted: i=1; AJvYcCV4iuC8iXxIWt6bTl5JQKlpn/sA30bX7ZHmJLt1s/MNsg9GwDtZmCKiYsPZMx28ebxFKb4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Dk/9uKS7ZL0ZPbiz/j59l7lgOM9P7amz4pVlh82G7ml3rgfQ
	xE7XZ70rAtdB1/QvA6RXlV1AAFipoAMTDPeBQs9HdjVO2JRZKE7/
X-Gm-Gg: ASbGnctjQD+aQMHkV0lxf7unaIbJPwxkLLY1UAGYj0y0sYdrgiRRqYeD7N4BKdddPmb
	EvSxar0IOZg05eEzaPBVdQD3QO5U8ze3pm6JMgCMnN1PG7gR4Dd5tQ9pOdL//3KJv22M5AS/2BB
	7mkjblS299t3UCCXSbIixxgKj+iTQ4ulJmP5w3G+tTPcpI+9e8Ne0c3dctw+D+Gh65KXjhDy4gs
	VSxWUWJuIO5C+B2LNU/icIHP7EhZqpqQVPNhRDbnhTfvU1HF+8MtWV4bWS30j4GT0a3oYAHZynS
	kGvyltQJ2ObKajpxnnO7WwOT+VSu6nBTGjU2sS/RX6yPgwVsVlHEsA==
X-Google-Smtp-Source: AGHT+IFKrFcqprX+GZtzDqejxj4Rz+XCBLHaHMwVVpFMT/hD6N4fQTevoJA/0HFE/zJ2spS2DeDAJw==
X-Received: by 2002:a05:6402:400f:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5dcdb7179e2mr4562356a12.8.1738787471045;
        Wed, 05 Feb 2025 12:31:11 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:31:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 8/8] ASoC: SOF: imx: add driver for the imx95 chip
Date: Wed,  5 Feb 2025 15:30:22 -0500
Message-Id: <20250205203022.2754-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add SOF support for the imx95 chip. Although the support is just
for the imx95 chip, the driver is intended for all chips in the imx9
family.

Note that the imx95 support could have just as easily been added
to the imx8 platform driver but a new platform driver was created
because the intention is to keep the families in separate drivers.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/Kconfig  |   9 +++
 sound/soc/sof/imx/Makefile |   2 +
 sound/soc/sof/imx/imx9.c   | 137 +++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 sound/soc/sof/imx/imx9.c

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 2edf9de2c886..327e2df94a58 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -32,4 +32,13 @@ config SND_SOC_SOF_IMX8
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
+config SND_SOC_SOF_IMX9
+	tristate "SOF support for i.MX9"
+	depends on IMX_DSP
+	select SND_SOC_SOF_IMX_COMMON
+	help
+	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
+	  Say Y if you need such a device.
+	  If unsure select "N".
+
 endif ## SND_SOC_SOF_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 36a3a67c6efb..74b5ecad8fe8 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 snd-sof-imx8-y := imx8.o
+snd-sof-imx9-y := imx9.o
 
 snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
+obj-$(CONFIG_SND_SOC_SOF_IMX9) += snd-sof-imx9.o
 obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
new file mode 100644
index 000000000000..598675d4350a
--- /dev/null
+++ b/sound/soc/sof/imx/imx9.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/arm-smccc.h>
+
+#include "imx-common.h"
+
+#define IMX_SIP_SRC 0xC2000005
+#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
+
+#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
+
+#define IMX_SIP_LMM 0xC200000F
+#define IMX_SIP_LMM_BOOT 0x0
+#define IMX_SIP_LMM_SHUTDOWN 0x1
+
+#define IMX95_M7_LM_ID 0x1
+
+static struct snd_soc_dai_driver imx95_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai3", 1, 32),
+};
+
+static struct snd_sof_dsp_ops sof_imx9_ops;
+
+static int imx95_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx9_ops, &sof_imx_ops, sizeof(sof_imx_ops));
+
+	/* ... and finally set DAI driver */
+	sof_imx9_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx9_ops.num_drv = get_chip_info(sdev)->num_drv;
+
+	return 0;
+}
+
+static int imx95_chip_probe(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+	struct platform_device *pdev;
+	struct resource *res;
+
+	pdev = to_platform_device(sdev->dev);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!res)
+		return dev_err_probe(sdev->dev, -ENODEV,
+				     "failed to fetch SRAM region\n");
+
+	/* set core boot reset address */
+	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
+		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static int imx95_core_kick(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+
+	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
+		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static int imx95_core_shutdown(struct snd_sof_dev *sdev)
+{
+	struct arm_smccc_res smc_res;
+
+	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
+		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
+
+	return smc_res.a0;
+}
+
+static const struct imx_chip_ops imx95_chip_ops = {
+	.probe = imx95_chip_probe,
+	.core_kick = imx95_core_kick,
+	.core_shutdown = imx95_core_shutdown,
+};
+
+static struct imx_memory_info imx95_memory_regions[] = {
+	{ .name = "sram", .reserved = false },
+	{ }
+};
+
+static const struct imx_chip_info imx95_chip_info = {
+	.ipc_info = {
+		.boot_mbox_offset = 0x6001000,
+		.window_offset = 0x6000000,
+	},
+	.has_dma_reserved = true,
+	.memory = imx95_memory_regions,
+	.drv = imx95_dai,
+	.num_drv = ARRAY_SIZE(imx95_dai),
+	.ops = &imx95_chip_ops,
+};
+
+static struct snd_sof_of_mach sof_imx9_machs[] = {
+	{
+		.compatible = "fsl,imx95-19x19-evk",
+		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
+		.drv_name = "asoc-audio-graph-card2",
+	},
+	{
+	}
+};
+
+IMX_SOF_DEV_DESC(imx95, sof_imx9_machs, &imx95_chip_info, &sof_imx9_ops, imx95_ops_init);
+
+static const struct of_device_id sof_of_imx9_ids[] = {
+	{
+		.compatible = "fsl,imx95-cm7-sof",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx95),
+	},
+	{
+	},
+};
+MODULE_DEVICE_TABLE(of, sof_of_imx9_ids);
+
+static struct platform_driver snd_sof_of_imx9_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of-imx9",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_imx9_ids,
+	},
+};
+module_platform_driver(snd_sof_of_imx9_driver);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF driver for imx9 platforms");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1

