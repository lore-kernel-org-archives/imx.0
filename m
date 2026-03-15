Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433237B016
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605943; cv=none; b=pL8X3SwLsq0f0GoymVZh/p9g7GCQo+xc/Oc7xzy6JzYOvfjjm/JvC8dR55uKK9ZdXQDdSFvx0SOxND0lxmqXcRR2EsPiNpcSYs+b2uLbc4UeowD6RpL5vYBkENTk8Ep8lZFvm44GEgyWNbNPEPDpCzyU1o0C780UMpFMCyriwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605943; c=relaxed/simple;
	bh=YmyURTSOe9/SCjL49JK1pX4JjS3HabyPzHa2LlBpNCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVghlzKx+UX/v8zm7D3yuyz84QIjlQ10O1SS/lLxM7ltdUPB+KmPF7xo/WNtZOEqwAgVwbLlWQ0so74DFcqSYb242BD0CQF8TZjtoyZ7qu2Kzxjn6I+454zOiJcxnxRWIIbQVLJ/zCAX7cMvN2JEzVSQzeILZoiC9kGLpVIA0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJc9eYRC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJc9eYRC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b40003d13so462104f8f.2
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773605940; x=1774210740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=IJc9eYRCPxwQ+EXgcXLud/H3Nt/DqC4UAwyZ9dIpBrGlSJzqx6eSn+SAuTiQXt0zEd
         gXPYWtmd1CNEMRyryjpxIS4F9MIhPHd2XRHUL3Stt/bsO86ZST55qW7BJcSw7KgZNdj/
         ut8tZQqjzxvOy20OGlee0JOpEI2zxcfZtdE2mHKNO4KmjckcjvmaxUBSwwhDPnvneyB8
         G8x3APOeNzNj/atqDbSSU2MYmfSGFvU551crgafVLtxURgqROkPSv89gm6ZWurbC0wad
         KF5dAjZQV+3M8DuB5NMnoAKpOMqqxN50sK/Ayi3qrhkqJwY3cLv06YllKAY6SPs9Pd5P
         WJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773605940; x=1774210740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=l6vXbq3KdbX4QMAlYskL52QdEAphYbFqWfUI5cnWFTOXqLyEHXXfKD6vOhx0LVxbjV
         aVCLUfSQPKMWea7lXJsOR53WHAucyaeAloBCW6IYJTL1uTiCS4ZLDMlZ68lBxBvYhbM0
         rFVukgvZhFWz6A7uNR/5foaj1HQcdwoyZyRh//OgqPP8CosUwqlMABjNIXrOm063qsqr
         EeBa8pySnPVjitsfTuJOeDYNQQKr2Txh8lmvBWEWBc0+KuhumTKP3OuG+AHtesj4hQbY
         JxEhIflvDgr3koNyauxwE9JBb85ic2BuoI3hF9sltc7KmDAPcWCYtNYDapfDSxF93BJL
         Z8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnYw1Bf5O/V6pO3uqGFmSw5whSG8ZERAARCDzxIHFswC0ebduXdgtYK/Sr+VTpcgBZMjA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCF6seOarjUD5EaJsHofXQIMTPYJ/uIF8RQBQekerW469xFsZ8
	ettZxYKdVnxI7rItSwEA9o02ny1u7rK3p12qOH1PSUCGndEdvpeByt3O
X-Gm-Gg: ATEYQzzA7KRdagsPjAUeKr23+CxmDIpc7pI6iZqTzJEN+PjFIfamY+H8don+C1xBeuM
	TEomqL7s+5f/5psZbwD02A8uIlcAILt0S9e9ErfwxKcwJnIva6vfi3qE2ipE59UiInLbwpXPINW
	6tfKIrY9zK9TYkKe7BY2ZXwRHZUQ5/fOGPgNnMVRCcK1k6PkLMTgHTsDrLjGHNt8fmtKAeG5xi9
	kcTGJra0kL6NL/QJxZjqAE84K4L4ZLj5cBlqbgNytIbRioN/K2MCq0g2r/kvqfY9kpg0brYyu59
	IxADHYFrMMNRjz1s4GMXUgY8d73fcdj+VLNjB9TmiK11J+JQ4+nGMZhINJ/N8cuK/HMjPk5qSZp
	W2i1YSBkEMWNKwP2ZQLeNeTPYbewXjPDtfjQ40iiWx5yOIeYkCOLQCxu7VdR3L45H+qGFfCOzub
	Aw9Kh4HDdyrrQanRVbz87XYSTG88iMg9zR+Q==
X-Received: by 2002:a05:6000:26d1:b0:439:d750:42f6 with SMTP id ffacd0b85a97d-43a04d8b557mr19733952f8f.24.1773605939326;
        Sun, 15 Mar 2026 13:18:59 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4389321csm3295618f8f.29.2026.03.15.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:18:58 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v3 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 21:17:31 +0100
Message-ID: <20260315201853.15552-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/core/quirks.h          |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c417ed34c..d736bb4be 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -15,6 +15,10 @@
 
 #include "card.h"
 
+#ifndef CID_MANFID_KINGSTON
+#define CID_MANFID_KINGSTON	0x70
+#endif
+
 static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
 	/*
 	 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3

