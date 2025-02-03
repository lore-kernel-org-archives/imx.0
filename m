Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB820D512
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603150; cv=none; b=Y4aCwUy42u7Xt0Ud92rIM8ih/xntFjHN11G0nADqZ3svAO2MBUkfcdP4MG+lAWAtLXOybTMAVo5kXXSUVcciX361fGhY9Hw8XrgTEGc7AXbk6zEPKbOEaIkLhQKfYwU6ggQLvjoU67bgJuX1Sswb2CtmbpPW4VpXVFdn9KOItfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603150; c=relaxed/simple;
	bh=VNs1yTCL8ASYwgaEioSkbavqaPwUFc/eFJ0jyKYTTC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sW53jXCOShWhg93uv5OWQqOZ8m4Gj4Ks13RXOBBg1tQm5ZHiANd1onoK5yIFb0h540k0W78+0fjcrtXK/glNoe4zsLvBEX9Cp9labxNkQCoIj5kYu2KVjWKQ4ivboOGKLgv8YeqYEhNzVmrFjqyR32GWsLpl1HMS9oFUo/Cne20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8euEKFX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8euEKFX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso934218366b.2
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603147; x=1739207947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P34NMvrc2uhxkk2+6CwvtqHEG5loNfpYNkGJ1/e/fKQ=;
        b=L8euEKFXbRBs+CHxTLsq3L4KKOG13TsqfXa0uyBU3GyMTviWO5XEHSkEgPVOA+R2C4
         wtKq8dUS8hn0dYzOIoewtp8i19vWpVKfK84u7lnSSwPndlW16rSxbQ9imRkuCL2wvknc
         4O2iJr2+oWjKMg4cZBGO92Kn5v6EdD++BPFF0J7i8rv47pE5lgq8D327EfjFVLnjLLD9
         ztlgFcuqADYBLYJXLQEDYcZjk8XERzwKhGkcS3a6ReL3e7hKyeaBCNquy1Be42LznJkj
         iXA5r2KRQr9HBUc803Y2EJhgdDpuxm1ZTt2mj0gMRJSIMXORJ/C7Anz0cgvoZOcNMMT+
         /Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603147; x=1739207947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P34NMvrc2uhxkk2+6CwvtqHEG5loNfpYNkGJ1/e/fKQ=;
        b=NV5f7zCzngcOWYzqnnn2I5N7VEFPxgvNXyglzPQ44xo/RoNMi/o8vp/5ozgtjkqa5n
         OY29Uwum07KjJcFximjPDUVv4oOl0NDFjOz+0Yil6pNcUUsr6T5oko1MV7TUUZ34yFrX
         Dozttf58k/+E+UM6j6ARldhxJJbYLKdwYULZe0abWPTtJiynbUwf4e1DAX7bGhlwoved
         qchxx/YXaIRF0VwDVEZzPpId41qvC9B/4xeKaLexrcQN6+Npy0Jdj86myyNj1qUCqD47
         NeqS3QpkRzlrO5IIU4Vnrbfsh+sJ69/l1gmqXgq4VmHdEveyrVPZHG4eQ3Fv6eT/V7O0
         sidQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvAMNUbzksQR+PDXihq/mOzp0GtrZBe4fn8szBoirte50rgjvtECqTHuUfnbiuLNRQuBg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5dhU+1tDwSv0i8MFB5j3mC4kdIQOpZgzMeKJnq6LEaKU3jAbe
	RPGtQ1YGw0E9sekv2sdsCwKJN81ocvsqGaBtUMpY8s2ssrOq80L8
X-Gm-Gg: ASbGnctU2iu2PRJ0Erkwc338JinZ4DOQUIfm69gZJC8XIL1Msn3GTImTa1TjTCBOkIr
	/Nzg8+9pnS16SnYQqK5/v4X23axLl6yfHtJKOOQNMHzULUODYwF8jjjHdGqTkb3vouUvbTTiZ1M
	USC2IMNzJo0l6Y8IaVRyfIKW2fY2werd5lUMHlogEj862qnr+jFjSzvnLw0HU1wv3YYhX44SV10
	/nneZL9kUnm8lmYEH7OYptZ0hVlqhNe56UkcD9OgcE2H3WZneSYzGyavGqb6Ywb3QAP8Vu26mne
	mA0NQc1aNyt/jiwh/QtULI211+ut30u4gCObcnxcypb8d4BAVg==
X-Google-Smtp-Source: AGHT+IEdHXc+fPM0xVNULF/V/H9tGXzO0UkrXEfKGHXOEa7lVWvXt/Sg1j5c1jXanaNrw8TTK2W3kg==
X-Received: by 2002:a17:906:6a17:b0:ab3:2b85:5d5 with SMTP id a640c23a62f3a-ab6cfdc6186mr2164326366b.49.1738603146473;
        Mon, 03 Feb 2025 09:19:06 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:05 -0800 (PST)
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
Subject: [PATCH 3/9] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Mon,  3 Feb 2025 12:18:02 -0500
Message-Id: <20250203171808.4108-4-laurentiumihalcea111@gmail.com>
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
---
 sound/soc/sof/imx/imx8.c | 71 +++++++---------------------------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index a44c3004a537..05c4d70cd116 100644
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
@@ -234,47 +214,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
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

