Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607F92C0273
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958528; cv=none; b=Me0+2+nI18wM6e8bc6C8kC5+o1owuzzH86+8RwUBEb81gU/FLcu+JuZBAjHKMKMMVQz0ti0X2U+JgUBrxvF374iI2jDPoCyq4thA6K6vEL7zGeAO8DR0K69FG0/nW2q9K6IyTX9NL08q87m4P3CfVtXpnqX1Z81gEBhDsXpvQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958528; c=relaxed/simple;
	bh=82XTjjSHShPDBuv5ewTva+T1nGonEhZqWcuzr/UnA34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyyFRMHIz5EH9F1horrUvhIW1ShnM4DiFUaBranVWtU47rZCT3uQHk6GZfC/EWp74ZrdsPuyRdku4ZM0+CdMluF8XevJMtEK1uM/Eq4GeQOz5ht/d8WWw5jCNPFD5Klk3dKoAMYlIPnZvr8Q3gAtdex6nJWnkv2Incofe8ZB+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZNM5BD3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZNM5BD3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so1288555a12.2
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762958525; x=1763563325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=FZNM5BD3RnPLM7aMvBs6kI+6Kw2PUsENoG07vPJq5MkKp9LHKywECvmiXO0HSpo+lh
         JxoJo0OrPe3FIKd6M1wuHd8I9SsRilMZWYf2tJGsD+Ez5ckOW54t3NknrLnXA8c2i11a
         t3BQlHs49aKGEEO6UY+gNm2kkXj32E+p/p3pfhTaLpnV1ukEqItkF8Hi/y87GEOViwMz
         fAPMciabQe7L4HPgrAqNtwBP9gWplGfnvFrBTCZPTqxnddsgRIBirHne8QvkZq8H3wTH
         Z8mxT7KuRCxmFyiHa/jwKcR6HZpRi8DkLLUH/pVK9dif9CXg2EPUCdc6VYln/YRpgjng
         fVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958525; x=1763563325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=kEvlAJWQxH4Zo8vMWofWt9OIvqHkjPo1y9uFEEtG3/RC0KntoyiIMU/Fibc2l+AFHw
         azEaKY7njkl4yXYJaWdjrzfu8b6yo/YeUUr+LzNH14C5yfOG0EHnkwZvH6ZlGd6/GgNc
         VChYw6zEervjKm4+hePw/ZLSs6M8qL7KWyA59zAfZcUlC/oTJZ/FUarHBuPKBvY/cYBe
         fVY5hhvG+kZbr1NrEhV03HCvbkyMRR01ZHAmgsSWhBmkvphJYMiYP/QrSvbTZRIRP8D1
         gMvIqNMFXZf64QDo0YMnXecVdL/BId2nMs5hRz6zR44UWY+iepQ8GlO+Yvo7CtVYY23H
         oDDg==
X-Forwarded-Encrypted: i=1; AJvYcCXuHr6nsxQIFJDPO9AuwbzL0GS8luZafYY6DEmlxMUDmVGO55t72kaLPNH3NVWjllTRLuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyimsnYsKljH2h336JQdMSEb/5hh5TEfrC+cyd2H+gpsuwWtUzp
	z2pF6pZcDbLkjDsbUQ9ez2XVbuHmVwHMzebpwiptdvafPFlP7Zfe/cEY2CWOSjSf
X-Gm-Gg: ASbGncu1oaPG8xMqzILDBEyjkyrzUrGDmVBKhkhaKelFhS6N5DmqODCQaRBUx8s+rZs
	AuL0+zzOy8XmBjlKkwCPV48Ll7uPhqMyc54/HK6d14VnkCAFUa/w84Jg8W3a3es2KDUq+VROvds
	H9y/EOr+HghtANaKhEO3NIz5e8L2uYdVNoUzvo2S1lalSUIsl7RnnaSrXQbtThRlRexXxzv1CCt
	uXO7VaDkI4ENjo3GC2pbvjAqD5dWQuD6vcdMcy3YbwCLQvteqTzJpoodSKTEDdGQevvr00Zc6Iy
	VfNL4+zz9Lfh1yvrqA2RDnnJfNuAnqWoirzsZMpM+Dm3dwqJD/hW66NclGSzIam7VBUYzmzhgPj
	bt83hjmHgM8dgRAfJaRI056TblKuvaYiAHmFlWi5VrYbXHcm4gmW88hYrmFFtvfW/P2n7p0426f
	ozpdebDWH60KngKMbcuHl36dFfG6g=
X-Google-Smtp-Source: AGHT+IFTNGoT4aTk5EceAUoALwAHvKb+bdrKgtaYUbE8eWmnwtKSrKlBlBHMiZPM5J2J25G44v5DFQ==
X-Received: by 2002:a05:6402:13c1:b0:640:528c:7d49 with SMTP id 4fb4d7f45d1cf-6431a57e4d4mr3033556a12.38.1762958524375;
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64183bc4533sm8411180a12.4.2025.11.12.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx9: use SCMI API for LM management
Date: Wed, 12 Nov 2025 06:41:24 -0800
Message-ID: <20251112144124.680-1-laurentiumihalcea111@gmail.com>
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
 sound/soc/sof/imx/imx9.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

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

