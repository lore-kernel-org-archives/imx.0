Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9045D21423A
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787461; cv=none; b=EJgYSxZcxLOAb/pjC/ahL3JrhPvh6y88r8FseqWt6t3Ial5c2F5Ztl+w+tZGSyqXTRFm1PMQp9nC2luyCb0+/E36ncH2Ey9Q0PggHLwPA0RiYN2f8axLtxitnJ14HN8/YzxIq8AY2QP8n/jyMi7I+c7tNsWX7FyO+gZob9/zaIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787461; c=relaxed/simple;
	bh=DERUkf3Ndnn80VwfyhwE0RxeXuKQ4vhj1CUs/t/WHsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRsNBVDRbcIlWwfBcT+z32Qg9WcJyUMC7guosSBgzioIgqK0lqsFPzLshIxOB268eeBtfkHD7BIAf2WxEaLGq5vBSHJZxXE71t0BveIeFguW/toRITDZx8/gNrY7FKR3CRMJi6Ev+/Yf6RCadSoOd4bW7A7AqDmxeEy1dRptaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkG6Qr4n; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkG6Qr4n"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dce27a72e8so446948a12.2
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787458; x=1739392258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDTMpJw6LcKOnZi/nrJKAK8RACzjtMQBi0otBSlqOMY=;
        b=YkG6Qr4nTl/2cASS7MB6Q3/93o1K3CDET7Ur0VJAP0auAhe5xxzN3BlwItpDUHKdqN
         njlLmusnw44bE020IbuXHlAGMd68clUFnKYuGNNNfyvtpaRHcrOF4sfvzXzykkTqpjCb
         Xct7EJ4o7QdI6+vS5lpv1eWuXEhjPuqr7q+OFQbxrGVSTzUCzbypAKYrnrDZ4bhK8fZ4
         vO77VKhio4M37OLo88gXdLVK0xgdsOGeysDrMc4cBbjZJt0qulS9VzvFmv6ZdJm8Nu6F
         3vbW7t24HNuasdw4Xf+QnXfqkI+Lsh1sVy77kZyj40bMgWKTrsJed/4VAO3E3sKYWVck
         yHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787458; x=1739392258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDTMpJw6LcKOnZi/nrJKAK8RACzjtMQBi0otBSlqOMY=;
        b=xEU3F5XebVL5I5GIDLMtBUZAjM3IwlX6IhfymkYOXF0vF0Hr91o8QPB/XGaN897kMZ
         T5nQVxYlKl5iXpuwvK+7MQdHGgFfnCIgUKIcCs1nbAWPFRMsYgjaazvsGxB+VVgeIqWP
         qF4kOu0ykT3qTLOmiJOh2IwbRa9/gwdqgJyELrgogNCGDy4WLyIFG32fh55AcQ6mBJjQ
         Sxp+Pxbyf4ppKBAppqyQ1uOgp7m5VgA3uVEOBJ+rTW6IDiNBBoRNKPJFFTmigeML3Pix
         StLAdCIA3sAlkAPIugrwVepaLdUqXlJ69WJWOHnTuMonuGywq3wDDCQOCfSe+bRJcL9P
         FxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI8/HVWHRBaEepCZYvEZipHIcQMwB/9PS5jxqSRZRFuEE4QBsB4C6GVGYncAMPnBDr2b0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyksR7A5XPyze4ne6oWs2z7EkQCsVkr/K4xN43JAbZU82aB7J6Y
	Zxzrck6s3MoHgbHq7Re7isVAILO2Yy/6cK28eAqeCOy6LAvlZ4Rc
X-Gm-Gg: ASbGnctDW2N6kFHyUDtDGoIM0zMdq5FwwAVAnIXTI3SDFFvgANb/yEXHnpGTSbrcZ92
	49RMbvLZ70Kq+tv/aeYwRsrgf+v86MDgO/Cj9I8jVDR5Ma5ABv6cmSH1zKjN8r9/amRkUuUMjU3
	1I6JdMsW+4b2QmJ2eqYCv6LgGvSyFJfT+HMB2U45s7CpWdTkwuOxh7zV5ItTTRyY7azi0lDb0gA
	53KOIqByMqIIiJL6c4PU76jfZPP0SlcdbQpB1rKaC+hCH/qf8dZRUYZRr/93BIkRtveIiBBhFEX
	93icaW8AZ2UGOTUi5p4Rt3jbpYtC8gw5sNdmYWRVS7A1B0DntbeyxA==
X-Google-Smtp-Source: AGHT+IGvoPHjemLgM1s7lxJyuJvRNxcx7Xo5a04p/jxjwtUIw/nEo5+h88xyo5nKAQp8DwQHUovsLQ==
X-Received: by 2002:a05:6402:4303:b0:5dc:7b59:445b with SMTP id 4fb4d7f45d1cf-5dcdb77f78dmr5903338a12.28.1738787457743;
        Wed, 05 Feb 2025 12:30:57 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:56 -0800 (PST)
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
Subject: [PATCH v2 3/8] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Wed,  5 Feb 2025 15:30:17 -0500
Message-Id: <20250205203022.2754-4-laurentiumihalcea111@gmail.com>
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

