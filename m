Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92C18FDC9
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945408; cv=none; b=mBXeU3dZYzVnEVvCgAOOnFX93kRdxQeK/4IsvtH3zDjwQsqVdPhngzLwmcGq7msJZDTTCskBiCsbUIiD4poYBB4FE8QWQRRGmxdBlkMgBp2FNjM6rPWz8le+99I/dRI+33s4HtM0VnWpAbrpWlr3dDoOlAQXsTRrpBAFvTIm1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945408; c=relaxed/simple;
	bh=XI8DYyfiLKvub4PmXw7TuJ1urUXl+IC9ImTSN0/1LcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFYQRpEC+eeVs98v9QfNVlAbbyeJQ1OJDGRJkqnH9U29yTQ4cSxPm3hWEQ2e5VOSuRi/PQ4ouVmR0BhU4sJGsnyTg51bVpRV+Dr/c9wU0ayPGwt2XJzebt7aUoeiQZCSp9wkXaBHmabljOpOeHfgF1N6uimQthCvQ92LOScxnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dz+3QKC6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz+3QKC6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so920524f8f.0
        for <imx@lists.linux.dev>; Fri, 07 Feb 2025 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945405; x=1739550205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S2pc95h+xNAGYglrEbD/pDwanj3CMP4mZo1fmZSwIE=;
        b=dz+3QKC6x0pWyjRCWJaxA7PLiGpNxTIDVoeJ+BVGkPOCotqvuPGXG8COh/U6G6ddqw
         hGWXgDDnTa3fdqGGld+cZyGMxu4f1TSdwU/jO50BmLFxN5kgxidMze+ILVLuITNCVxQq
         22z6N2n13MhpsbrkJeQ3zmzy8HOPC17/AlCT+t6jqJgEAByjxvfBKIwUgw7l2qTPhs0w
         tqPBzZ+C036f7D4EQlrm329QXctIQV0DOGgNr2Gu91+xfZLL84/+DZmE2jUZm0Q0xxu8
         SKnmkrqkwl6dWFLcQaytvVC/lZeyht00KdMQuDx1f3m27dz4Fjvm5tT28ZTPbastT/X4
         ulTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945405; x=1739550205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S2pc95h+xNAGYglrEbD/pDwanj3CMP4mZo1fmZSwIE=;
        b=Og0sS1QvF/qUW/IE5CnnJBhhfO4Z5AGzX2sornKcrehGAkhh2Kkh0Yjv0a1JAoi6md
         Fsrm2i+naJYUvlT4UHgGvYxXym4SPk32kARKDt0pcl5ubttTITIVQbesHrMjhjLipb9q
         OgBJN0MnihKr5ZRgD1/8+ud0cUVCZBTTtiyMi0+uekw5bN923FEhFoX9E+g29CiCcotY
         oJWpSqKF7d4T8hL44ZJGN8OducFBjOjFRQ/sA2bpHwFLVYpQO8eMTT04MiPUHUsoORB1
         ojS7vTZ2UKUPZMgT3vTHwpu0h21K6jUf1jHS2JK0nLASJZWvC4c+DbZWQtyFklh6wLQo
         jjXA==
X-Forwarded-Encrypted: i=1; AJvYcCXZuS982imzLHjnqSQ9GDpxzk8tohsXAFaTfltm0g5CyuTzbbUiCDOXGPKx7d42FTrNUkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPJVLtKBI8sbfCvlDMr/61kK+k5ODbDz25ulxQbE2pQ44EzZfd
	IY05PxG9T3HzGgeANYV4bb1tlGPHZel0F3J6B67Hf5BJP+zYHYq+
X-Gm-Gg: ASbGnctGpiilvIGhfI8MqxUJmJ0opiYMCgsTkuReARtfAtjiy0otI+bKj0lxIpiS7z2
	0tZt+A9Cx3eMQaWAE+irtyvKMovkS5aMrUNTJDKz9KI/8rLv4wvrEkfGpUGTFHgV7xkGxeV0v4+
	bCF36bQyB5n4uBJgGpKKOf0mm1JZpjVhsDpg4hhpG07/iO2g+c2ALWS9GJWTEmjGrer4AAwVTbD
	kkxnjd1o+EWKkBGWwuycYIQycfOBDyuQJz+VIQ45EKqFIy3gSIJ7ei/1zDO7iPf1biNwlUcvTIu
	Ww570hj8ylMC/jXgZrfRcRUCZyX40QDOSpX6u52RKBxlcCMqEZ2BKA==
X-Google-Smtp-Source: AGHT+IHiwxYpJj114HuQLOINoNybbMY4FCCGqCLIK1FJir5YzqppK45hdCKArgkX2E2fc52bD6UWaw==
X-Received: by 2002:a5d:6d0c:0:b0:38d:b7b0:7087 with SMTP id ffacd0b85a97d-38dc90e5b9bmr2407211f8f.1.1738945404614;
        Fri, 07 Feb 2025 08:23:24 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:24 -0800 (PST)
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
Subject: [PATCH v3 3/7] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Fri,  7 Feb 2025 11:22:42 -0500
Message-Id: <20250207162246.3104-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
References: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The definition of 'struct sof_dev_desc' has the following properties
for imx chips:

  1) FW path is the same for all chips.
  2) Topology path is the same for all chips.
  3) FW name can be written as: "sof-${machine_name}.ri"
  4) IPC3 is the only supported protocol

The structure takes quite a few lines of code. Since the intention
is to add support for more imx8 chips in the same driver, we need
to try and reduce the number of lines taken by information that's
not particularly useful. As such, we can use 'IMX_SOF_DEV_DESC()'
to reduce the declaration of the structure to just one line. The
only information that's particularly useful can be seen from the
parameters of the macro.

Of course, if any of the assumptions don't apply anymore, driver
writers can simply declare the 'struct sof_dev_desc' the "old
fashioned way". No reason to make the macro suit multiple needs.

The same logic applies to the array of 'struct snd_soc_dai_driver'.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 71 +++++++---------------------------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 25e3296a1e5e..52dff369d9cf 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -119,28 +119,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 }
 
 static struct snd_soc_dai_driver imx8_dai[] = {
-{
-	.name = "esai0",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 8,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 8,
-	},
-},
-{
-	.name = "sai1",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
 };
 
 static struct snd_sof_dsp_ops sof_imx8_ops;
@@ -238,47 +218,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 	{}
 };
 
-static struct sof_dev_desc sof_of_imx8qxp_desc = {
-	.of_machines	= sof_imx8_machs,
-	.chip_info	= &imx8x_chip_info,
-	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
-	.ipc_default		= SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
-	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
-	},
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8_ops,
-	.ops_init = imx8_ops_init,
-};
+IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
+IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
 
-static struct sof_dev_desc sof_of_imx8qm_desc = {
-	.of_machines	= sof_imx8_machs,
-	.chip_info	= &imx8_chip_info,
-	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
-	.ipc_default		= SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
+static const struct of_device_id sof_of_imx8_ids[] = {
+	{
+		.compatible = "fsl,imx8qxp-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8x),
 	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8.ri",
+	{
+		.compatible = "fsl,imx8qm-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8),
 	},
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8_ops,
-	.ops_init = imx8_ops_init,
-};
-
-static const struct of_device_id sof_of_imx8_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
-	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
-- 
2.34.1

