Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F43783BB
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595684; cv=none; b=c9ufOmhzrt3svV7qS1d91fbNbhdEXUZB8fEHqis+41/w76ibW8+6W6pbbuVxjni/M/dqxeOQEhVdzuXy+KnegqHQ1En21wHCs6CeNdXZofS5nrkXylvHZXzf1mfp1zo1+KHmVvPQcLu3EJQY4UbupFfV1ipPxxO60FVrQjsqeXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595684; c=relaxed/simple;
	bh=QyIuFOJZx926p9XhEzOqnlY0Tjj4EaWSbZ1NmZeyRpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJuR2CyBOj4SADhXsdBsie67GDgu0+S+1GM3NurCbQYN9HNYI7H3Ej0QYLgaVO45oNFLK/IS2/gZdr5C/vcvEVMUPpTVUPdFxYPV8Iiri1EaiYGGViTNpwZqrRc/ywJYnBUp/zs5edp09WauRDKOlC/V+8p1tpHXvcfYHOeARBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH4XNZ/e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH4XNZ/e"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29704705e9.0
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595681; x=1774200481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=UH4XNZ/eQNrgsOu3L4RG4d1b8ElnLakXqGX6QevPluZsOM8oaRqJouBmbBGq/xHtQD
         zglUnLvCYydDV0y0cdaK2ubgbE8AewyE2e9lMy9FLp+LQIjx2ChGtvKBJ1NH3i4LDByu
         3ognnebfrRuloUnFX17oEnahtElvEvAUIcRWESSUpfqr39cDzhAZXMyyCvtdgB/fMgmc
         F7JIeeMsKFo2EiEMm73m7bhTSt6zmFobcZ2Gs1GP2doM9q+U04bdqYeNDSI9YBmDfw2B
         TD4QuIRGrZaq/mKp8vjlx0pCq2159zs4NK9ieSMX2adia7CjaVgASJjoBAv7/SL9MrZn
         3zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595681; x=1774200481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=DDwMv35qH496fDRFVpihlymz1WeqgzDO56g7vJyiaP3LlDTR621Htu+cEknm2H2Ipf
         a4RUWfbR/1z3xjoAPVd3ZAsdGxkvyvqTET4z5k+4yK9DSxw/573waOZzwpNDAxa+nCBg
         C4FD4UzZ7jzLe102IwcVyzbL2k6ZzNx8Fj586NZNtZB655gi47ljqjVEN9ifBqkFyA7j
         UXfH5qNYX/IZ9vvY6bR0zlJuOz7SSrG4DVxVb+P/wIrgm+WQRodnm/5esGqB0CuKXkl1
         PUHHmEYeIXMe/vRYPCK4Alxg/Y9MKUZKZsrbS5MtHSc3iaCnU9PzUV/KuTcESe9jqdM6
         M5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWLyd7QNKPtQPUPdO+R0NYVOkkQY2SIRJtiO4Ezpm/H9E8DJQZ79msMR0uMvf6WY/3lD50=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1L9FZ7NNn5OwEyJ0SNjchlMT15+qG/CZK9TzWMlxGXcqGot+E
	sJ/cWGp0HsqHRzNAOqs6UpWX71M8myUlAHC/kB5GEi4eo2OmqBy5MZtl
X-Gm-Gg: ATEYQzzAMyG49a3oAlicLuLKdSsS2xYV2OeCuDM75EKumzbVRmFax6cpCIIRt6KTlLY
	h9mlQG5GImbZLsEqs802gBWUJ0OS90wzxAN9Ld1i4DvBnA3qmd404GRN1l9mu4Swaz8ndsr0MPX
	j5PqYJD0cmkgdmfBHlJR4y9QcEtFaxIFaE9c0MTVV6cGgozKq5cGLwrW8Y3Y/qKNqjIpqtsGyOE
	vCftUkHZ2Yuo8A7Ufdm6HAF9Cts4uWr7foNHBbEK0VwWXKwai3EWLZ70e5Kt2KCKryKQ2z9zM/2
	/l/WwM2gR5w05WGm2zHbMIxGnkZaTVAedDo8XAbNMh9VRWF0Ur8TLIt7TlUWeMJ1udx/PKT8K7Q
	Jv19+1XpltyJgO8GbccTrfttCsyl5pLls7Ehp8aJ3GPy09FlGVRtAV/N6X3vzv7BCnz/dlySSt9
	RY/nQ3ZD7aMfo4HvfW+zE3Q8hUq97Cm/JZpbw=
X-Received: by 2002:a05:600c:64cf:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-485566cf81fmr167182995e9.5.1773595681386;
        Sun, 15 Mar 2026 10:28:01 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:28:00 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:26:40 +0100
Message-ID: <20260315172746.270734-4-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
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

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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

