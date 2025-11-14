Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEAE30E854
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130959; cv=none; b=Olqd5HV9KIwngEQQzoSTvGpEBJ8+kjemS6Gy13UIPO6Fsec7FK86LiizIijuu2oZgI53CYvbv952mmPKTACuRhSN6WhqhctWbjgCJPwG8b4aUPKjOtWZC2h5vBn5TZ6eAwkAMtXbmuVOr14NMGUuqUpq4iZN5jJ/gkmkyNUwGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130959; c=relaxed/simple;
	bh=CjD4q1ZMbBJWQvc4Bgiana/20OE4djcpHnIJ+VkNDyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQsuBcT83U5bJUuBPIQ18VsGVePy8aI6uCIRO8wP1SGqvZyHmUTCrs0fqfHDlMoZqwJ9mltLFXRTMql8IB2JeKMaC3z239E/Xv7oz+ckLn6t/J/kLfsrdeBPn7t1DqFbKH5rWUPXDqP501mEA721vINp4SSyDnoU6GUoHYK0Z5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4aeqRN0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4aeqRN0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so3594137a12.3
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763130955; x=1763735755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=W4aeqRN0CevAr0n/b3u7+zkz8y7zvL4FWb/PUt0RhNxg8I2BoxKusLfR8S7ctfnVu0
         B5pydsmAlshqqCdNUbUSmtChlbl1EePsO6FfxBnHb704RU6vIalq/WzVSdy8cqam4sS2
         RH69TBa2HSo3YO0zy89zlxOTXXbP07Ey8WP/Q/3BnMniSLRtNrGSYccAFlPfA3GA4ReS
         igV9fSti4cU0eSV1foaQXmPPCS60VBVOhMfKUJi6SEAG8daeJWtOPcVOy+e0FEAd7oEG
         mC6ysCRsokT0dNjESDzHrZNiOQCHRRmiBLGMuqnmzyQJPON2Pqj0+m4beAPjH0tP4Cji
         dtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130955; x=1763735755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usqzkbXAktOV+QTZEhZmGU1PKdliPqoVmQQvPTmUm64=;
        b=b0qw+BFH4mOM3FZeNFvYv0Iq7zRN1fSVReeIefXF6a/qUqti8m/7OBXYJSURuo8XjI
         FHSXp+1Nnid9CBbLu272sQiakAN/Q0eEipk/xszMjkWaW6vf/S7w8LdF51BH5zMDFujc
         wgTf7CdQdYYT09x0gXr+6/MeQlHchfQlaYsim5B3TM6MNy8ew3E78WOP4BDk7IfGb9w5
         nxsMwc1g+XSH0Ui7KovrVOJhL5A7SyzXlUSqG/cJLYIsbsDP/FuZr0kVWeIajsPUmpxU
         hc8/YtE7F0vswae51BC4ka+cheYsK7RRUGAHsbzZMyAZKrx7DDo5SnBhT+KB/d4i/0Xy
         SpUA==
X-Forwarded-Encrypted: i=1; AJvYcCUByQxYWTXN9M28hozHGa/2++vnVBOOoyX65ddhd//sGR0k1A7yfk8lEaok12IBCDEVUlw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy90vp+kTg3yuscgLurhyk67RFcaFpNztCnihzclrzc+EK6LU+S
	AagT4CiXkGDrNuq969PudEhxb7uX7SfV9L1kf8M8hx3sGRLfRaVZ5XQB
X-Gm-Gg: ASbGncuyYS9jfv/5fRrMY9Hrjh924WYDaYwvCRgAjgbMehcpcpl1jPUpUUzczBLvnYc
	dTac8wf5rTUYQhTKmkgmOXnFkQQfb5nq6r3IZUQQK4FQgv7gVXdirP61l4xqYw1Jcp8fECGBECB
	HmBlweG8jRIoU9u0eEf3/Eg5r1+og2pjogX6Hn8EBFmYRKWBh/7mmpcgC4noisEXhdVSb2sntbc
	SnawJh+3tcdLgb2z3dqVe+p9tqE791JKe77jYOfWtGSTDoZ2LooaAJQZFmFwQWtCFAAUIyHaRV7
	pArLLuabK3Re/3ypNQey0gE1DuEIrd7wpAq2QnmvMe40JYcBUaiQomOPuHPZwRTiN+gJEV8Mz43
	9fEZOjs5nSDxnSC8va+kSxnk5TKAd6zEirBkHfOfxFeEMhGrpgLdLbcciAp09rBWC/rkb5J1Uoq
	b5vf+u+kru9i62NE+CUJMUZp9OGQH9pdiA4Y+5BQ==
X-Google-Smtp-Source: AGHT+IEkXh8aOaEa9VYbV+mSh0EevYMCtp8lTPm/U4emLvWPOqyGjxIaHiTsSpt8P+ehxwrwdlpbfQ==
X-Received: by 2002:a17:907:6d1b:b0:b72:ad95:c1c2 with SMTP id a640c23a62f3a-b7367828c43mr340632166b.11.1763130954832;
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa80afbsm391264766b.11.2025.11.14.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:35:54 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: SOF: imx9: use SCMI API for LM management
Date: Fri, 14 Nov 2025 06:35:03 -0800
Message-ID: <20251114143503.2139-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
API. The SIPs were intended to act as placeholders until the support for
said protocol was upstreamed.

The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
replaced by a LMM protocol command with the same effect (i.e. setting the
boot address) since using the CPU protocol would require additional
permissions (which TF-A already had). Apart from this, the SIPs are
replaced by their equivalent Linux LMM commands.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v2:

* add dependency on CONFIG_IMX_SCMI_LMM_DRV.
* link to v1: https://lore.kernel.org/lkml/20251112144124.680-1-laurentiumihalcea111@gmail.com/

 sound/soc/sof/imx/Kconfig |  1 +
 sound/soc/sof/imx/imx9.c  | 36 ++++++++----------------------------
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 327e2df94a58..09d88ce5b9e6 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_SOF_IMX8
 config SND_SOC_SOF_IMX9
 	tristate "SOF support for i.MX9"
 	depends on IMX_DSP
+	depends on IMX_SCMI_LMM_DRV
 	select SND_SOC_SOF_IMX_COMMON
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX9 platforms.
diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
index 853155d5990a..e56e8a1c8022 100644
--- a/sound/soc/sof/imx/imx9.c
+++ b/sound/soc/sof/imx/imx9.c
@@ -3,19 +3,11 @@
  * Copyright 2025 NXP
  */
 
-#include <linux/arm-smccc.h>
+#include <linux/firmware/imx/sm.h>
 
 #include "imx-common.h"
 
-#define IMX_SIP_SRC 0xC2000005
-#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
-
-#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
-
-#define IMX_SIP_LMM 0xC200000F
-#define IMX_SIP_LMM_BOOT 0x0
-#define IMX_SIP_LMM_SHUTDOWN 0x1
-
+#define IMX95_M7_CPU_ID 0x1
 #define IMX95_M7_LM_ID 0x1
 
 static struct snd_soc_dai_driver imx95_dai[] = {
@@ -38,7 +30,6 @@ static int imx95_ops_init(struct snd_sof_dev *sdev)
 
 static int imx95_chip_probe(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
 	struct platform_device *pdev;
 	struct resource *res;
 
@@ -49,31 +40,20 @@ static int imx95_chip_probe(struct snd_sof_dev *sdev)
 		return dev_err_probe(sdev->dev, -ENODEV,
 				     "failed to fetch SRAM region\n");
 
-	/* set core boot reset address */
-	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
-		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_reset_vector_set(IMX95_M7_LM_ID, IMX95_M7_CPU_ID,
+					     0, res->start);
 }
 
 static int imx95_core_kick(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID, SCMI_IMX_LMM_BOOT, 0);
 }
 
 static int imx95_core_shutdown(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID,
+				      SCMI_IMX_LMM_SHUTDOWN,
+				      SCMI_IMX_LMM_OP_FORCEFUL);
 }
 
 static const struct imx_chip_ops imx95_chip_ops = {
-- 
2.43.0

