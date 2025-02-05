Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EDC2144D5
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787463; cv=none; b=CtFMY98lgLKRgBZuWh1Bx+Vv0jJtpCGP7oK4G3QKaMEdtSrQpPzu2ZQDIoeS+FALaYOcw18rB76yD7RA/+BuLGSg/v75l9eNl88RyuZwfrqQV87SojUV+Xxq3YoOCoHay1gDQvy/zBST1BUZ2D2Oy/5YJmApURwBdFoztpivhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787463; c=relaxed/simple;
	bh=ajnbZQ3e0D6V7M+mWPbwkUu44l/yDFphV3w4slUmg+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KZQaQydCw0MY33F6y0HEAhItEBDND3wP0W6yTSk57oJ5qfEFeojfJcNczk8339UKF+wqf9ORyQAqSAZw86FkpdTMjPjOOX/Zt5PlZtERIanv03fcW4aWkb62/H8aP/fbfyOKspV6uXFdtWkv/BtyqaYY2v7VAeXZWcGm4oLM/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CePcBVPB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CePcBVPB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so479404a12.2
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787460; x=1739392260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q19BoYw1wFsQAgppIzeVmEiAEdoAgxK2A6QaivgZP44=;
        b=CePcBVPBFF1FudVcYo0N8FoWtGqZzI4kE5wdm4fBjtPiROr2mvCfTBrCw0jZGwfzPp
         AQkvAPVrI8A/IOmmPL3iqBt7jXaVCeebju3WQSirTHUMQXQDi38AYpsiT8CL9jphYKzI
         QzsJM/ZZo5L35vprs7sX/yafyEXgOdbc/yWmP3Kjw163LXCDdAid965QIc5A7WXSOnEw
         G7Q2zzijQaLU4vRZfTv02KzrjujN7xidzTOkcQKNtgylzfoH3Ainh1dA/1+mPtFDgEwk
         RpF65t9EoKPtwU9daHnMXjIsApXhS5lOMA7saCHPKJQqSD8DaIODJoFkHhZGo7GdxdKc
         ngHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787460; x=1739392260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q19BoYw1wFsQAgppIzeVmEiAEdoAgxK2A6QaivgZP44=;
        b=wb7V3IKsAdf5xbxyycfscIkBda72ah0S95r1hQIPEY6lCOfI2erOLjqBFiDfUUQZ+S
         U53J21rikIczUmSSH8/DbY1m7/cArc77wDUOGwmpGI22DSrvIEGN5l9roF3mWf6BOznL
         oZPR9H+eSkHuKX3Q+iwXAgV+ifjURs5ypRjAiP1GTnyoijnAd0Ydj3sgVDh+rnHTKrmN
         vg/KfXY+whnUFCCda3/tsjzaW2uKfWWBklUv/RWkOiy4gcpsrTghJsl9AIPh8gl8S0Ex
         vClvUBoLn/RMgsPmAEC1n4XIRSIN/JozVgwrkBBUA+43xjtMeLvfF0ytMjCJp0JgUir6
         0ncA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ssxsHt2Xfn1PG5SfUzy0pdEdu/Po31RUuKM7JPPzRo1oxAsnxi5IxCMrYRgYbBTVR9I=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpm1yvL/8D0iF7OtKk9mMgY6w4Z5uwfAv9WH7wOD/LCFqEaFCo
	mIyEbNJLHHzCULA0XT7vE3x1B3j+DikR90LptEL2VI11ByhZwAJO
X-Gm-Gg: ASbGncvesfwK+8pD1gEtml51TiVncPxAY5IpdIgZ+V2wcvVjfkLRCJI2eqzaH+LKFC9
	n3t+VRUZuGyy1lkpXbCoEep8vTG0vM8D0+dd+83q6yZ9syh47uAQqkx1qYJn8+8IM9krD36NxUF
	EzhMHZ+F4ADgpOYwa95PoBPHfaW7U3dWrrV9lYeVXjdaLhoHQL2AopcRmw9Yxt+VAJDQQ6r9uAH
	4GCldWjQoHTXGsud+225kDJ3FHs+0VItQeJ4EamuJCq48zpJIH5ulhpFUow1aA98FonRZjf4AuP
	JBSASb5NIEyepiWHKyEkEDV1gz30hZgsEcQfz6LEnYWOyc9sPBXqPA==
X-Google-Smtp-Source: AGHT+IEBjBs4i+haD1xfHAP1IX5bkejMQc7mFjpZa3tEGNcYMVEupFXCWCioc5dl29D2w4W+wTqXlA==
X-Received: by 2002:a05:6402:2392:b0:5dc:e393:af63 with SMTP id 4fb4d7f45d1cf-5dce393afffmr1987522a12.16.1738787459589;
        Wed, 05 Feb 2025 12:30:59 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:59 -0800 (PST)
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
Subject: [PATCH v2 4/8] ASoC: SOF: imx8: shuffle structure and function definitions
Date: Wed,  5 Feb 2025 15:30:18 -0500
Message-Id: <20250205203022.2754-5-laurentiumihalcea111@gmail.com>
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

Shuffle the definitions of some structures and functions such that
they are better grouped. This is purely a cosmetic change.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 86 ++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 52dff369d9cf..5d6524d695e2 100644
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
+	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
+
+	return 0;
+}
+
+static int imx8_probe(struct snd_sof_dev *sdev)
+{
+	struct imx_sc_ipc *sc_ipc_handle;
+	struct imx_common_data *common;
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
@@ -100,49 +143,6 @@ static int imx8_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static int imx8_probe(struct snd_sof_dev *sdev)
-{
-	struct imx_sc_ipc *sc_ipc_handle;
-	struct imx_common_data *common;
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
-	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
-	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
-
-	return 0;
-}
-
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
-- 
2.34.1

