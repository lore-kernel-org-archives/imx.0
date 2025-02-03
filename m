Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E220E005
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603152; cv=none; b=X98S2d5mv80UstrGwS8P9AkcTqppxVexDn1tEE3H+r5J6BO40GCoisDXRDRhfze3T+jOrTNLe6tSD00sg/o+0d+lTVRQitG8igpQuQE+DypZeAr55Qnkt/uKUkTcuK/I5DhgySvRDcKLEX6aYzCyliobmBZzZRgB4tG0bDaetQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603152; c=relaxed/simple;
	bh=c/87/Tqegwrt/2Kl9lHnm/e1ty+fIyN0gPiFt760Fno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGrN/tJqNIKOL7oLrT4V+LWAT0vtjZOVQD0gN5ODFSl4Mnlj1p5F5sq8qW3yzymtNVUndvy5SfLdQomjf63Bc5Dlj7Xx/K53+BvfsTnClqte8ScOnO7q9Tle4iNJO2ct4G7rg0YuepFeLJMxx+qW73V4XOVEwcsUCF5oSAau40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/cnRMxi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/cnRMxi"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa68b513abcso827592666b.0
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603148; x=1739207948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HDJU/hlw9VtUZBjKQe881/LPWYIHVX4wwVTE4H2RZk=;
        b=A/cnRMxi9EXk0dmDzWYGz5rAbUJ803E11OCEOT6yJw32c4ukUy40rNnzjZ6apreCqZ
         CrqQMwhBycgSUkJKB2BOusMxRKgAgG7AmDWFFxwv3wzI/a5Veb4hRubKEyfBBM8Chq4p
         zpnz1QpD2vzVGUecnyhDCP9HyO/BzdA1kJvKj2UhorYzO3WlL3G/9sq9Jhi9vc+U69dp
         t5ZN1hmASCxH/C5lXG93XwlOQp38dJX3CS1tlkJCbmV2PNSgzk0rH0DqFiE6Fa0M5ZHW
         PQBOASjblnqWxakfWbY1vU1E82R8sianmrYXlMGIEVQV4H7nuZD5xc8dKoUWJwWUIjez
         f0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603148; x=1739207948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HDJU/hlw9VtUZBjKQe881/LPWYIHVX4wwVTE4H2RZk=;
        b=GyJGkAuY/nhDqnsmZs3j9GbjKOf2KnkA+q/7uJYmgDCS7DDPvIQG1E10jH9hqCLrDE
         kInRt/WeIEMhhiagmlVCAFayHkoea2rTNkkCTB7omzrjVFXnZnpcgYabS7fI7WXpAEWV
         pNTkvMbakH0rUo7p/s301yZKT6kApHTwwBG65BzY+JINU2/LGgmn0IhTgZush+LXwsBR
         203AASF8Qx/NzJhYM27dX1dVRZWFhgrCDG77CoQlTrthFwFE30/vu6BrXTWjD/ViM0mA
         o3/CsR6h06+a+suwoOPCdxhTHcuNSkv74BRBIh1TtRXJnHgU1HtQatiIEGmJ4wXLe4SL
         E6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDuePsVF5TfMz1VH4pDOwjhUEd49d0AxpOnhRQmSE4PT3Erh4wc0q6gPkqJbZlbCYG+XQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5/LZcL/crLkjK1LT+ngnihttN5Xb4SlJMDFjPLJFgBfJjuLcY
	lMjpHoVPt5mWZ5eIcrgFB9LyF0spVxs73oj/ThlIBAzfBoOCwZvg
X-Gm-Gg: ASbGncsI1B7wKolE/cyl/Zeb1DrjndlGaOwLCBcJioS/a9K1rgS3Ve50V48YQZxVXp/
	j3PHHAZN0giBtnMnu3XRX3qBBWxcnirvgVseKlftIEiodZYS/DCHzabH4ktZwYjgyZqVeZnWnSr
	sCzk1yleZFfMqnQWgLB0a3W3sSAfUx4GM7/2ASWWgYdfDCr2Q5L87HHcxF7Rug5dOqOdEG0sl3b
	vBmcFNGdIwr5pWoJngJUMkfZbkJ0SYZ3xaQmBkhaPDSj3PO58uF1l3QcuceqrEVnX9XhOkbHBiF
	zhfZSIgJcUI5POVpyvuWb37pX6+cN9NEyjGqPl4DGOBzCP9vaA==
X-Google-Smtp-Source: AGHT+IHqGG7FODmJuqkyhO/fPMpoBjkJnej9dmtGBBBibBSaKHHWSfPqxSu3cw+Gk6EJGBDRs/8G8Q==
X-Received: by 2002:a17:907:1c95:b0:ab7:992:7f42 with SMTP id a640c23a62f3a-ab709927f70mr1262532566b.34.1738603148425;
        Mon, 03 Feb 2025 09:19:08 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:07 -0800 (PST)
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
Subject: [PATCH 4/9] ASoC: SOF: imx8: shuffle structure and function definitions
Date: Mon,  3 Feb 2025 12:18:03 -0500
Message-Id: <20250203171808.4108-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Shuffle the definitions of some structures and functions such that
they are better grouped. This is purely a cosmetic change.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 85 ++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 05c4d70cd116..93968f077d52 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,6 +41,49 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+static struct snd_soc_dai_driver imx8_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
+};
+
+static struct snd_sof_dsp_ops sof_imx8_ops;
+
+static int imx8_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
+
+	/* then set common imx8 ops */
+	sof_imx8_ops.dbg_dump = imx8_dump;
+	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
+	sof_imx8_ops.debugfs_add_region_item =
+		snd_sof_debugfs_add_region_item_iomem;
+
+	/* ... and finally set DAI driver */
+	sof_imx8_ops.drv = imx8_dai;
+	sof_imx8_ops.num_drv = ARRAY_SIZE(imx8_dai);
+
+	return 0;
+}
+
+static int imx8_probe(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	struct imx_sc_ipc *sc_ipc_handle;
+	int ret;
+
+	common = sdev->pdata->hw_pdata;
+
+	ret = imx_scu_get_handle(&sc_ipc_handle);
+	if (ret < 0)
+		return dev_err_probe(sdev->dev, ret,
+				     "failed to fetch SC IPC handle\n");
+
+	common->chip_pdata = sc_ipc_handle;
+
+	return 0;
+}
+
 /*
  * DSP control.
  */
@@ -100,48 +143,6 @@ static int imx8_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static int imx8_probe(struct snd_sof_dev *sdev)
-{
-	struct imx_common_data *common;
-	struct imx_sc_ipc *sc_ipc_handle;
-	int ret;
-
-	common = sdev->pdata->hw_pdata;
-
-	ret = imx_scu_get_handle(&sc_ipc_handle);
-	if (ret < 0)
-		return dev_err_probe(sdev->dev, ret,
-				     "failed to fetch SC IPC handle\n");
-
-	common->chip_pdata = sc_ipc_handle;
-
-	return 0;
-}
-
-static struct snd_soc_dai_driver imx8_dai[] = {
-	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
-	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
-};
-
-static struct snd_sof_dsp_ops sof_imx8_ops;
-
-static int imx8_ops_init(struct snd_sof_dev *sdev)
-{
-	/* first copy from template */
-	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
-
-	/* then set common imx8 ops */
-	sof_imx8_ops.dbg_dump = imx8_dump;
-	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
-	sof_imx8_ops.debugfs_add_region_item =
-		snd_sof_debugfs_add_region_item_iomem;
-
-	/* ... and finally set DAI driver */
-	sof_imx8_ops.drv = imx8_dai;
-	sof_imx8_ops.num_drv = ARRAY_SIZE(imx8_dai);
-
-	return 0;
-}
 
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
-- 
2.34.1

