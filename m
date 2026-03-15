Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B393750DD
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595022; cv=none; b=h5K41NYnby594SIMPAA4xthnIIOUNfxyYYlknivDYUqRIQNs+LHJGiS1uTN+Prs+nsXA9pMMDb07+OuF03ru3KokdQcw3kdFG4bqXHMCU8zr3jh4Z5RLXNBiFgEkws0HVgtmhEf1b4of+1nKe/txzU7voWtbALond/omMP1HorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595022; c=relaxed/simple;
	bh=X32PXM6CIYzypQR5TwfD7Jn/cbq77OlrCWR99DHxUpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcbDVsngojzJm/2byi+Gz7u/6K7ZKsTLrWFMDi0+r+NdC6s4jJd3imB+Srs6LVDwY6s4Qdlp5nyJCVpuBQu6V2huXqAp5YRD5Eyw9TqFgb2OptsSV8BgHvhDVff4chbW7umjzsIYsZaO+AiIoGG7tJwoCnYabNjh+LLNu/9O2Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3pagWg3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3pagWg3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso3943292f8f.3
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595019; x=1774199819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=A3pagWg3tva43Px8Kn4EUjhAtDdMJQ0YkBLkAD7wuG2gOiGLomOmeScMGOR2KiVL+8
         8gK4TIQHKCx3/j18JOI2RJTgrlqPjXVliU1yJdHZ6/o3zspe5NBhB5JrF988FS/8sBPw
         G3z6IO0k0K7Ko8+mqlrRkxU0xzEU8FKHokgR/PBk/y9sG+ob3ZGiDsGVd9yeaE3DDZ1T
         eBDcs98LJev64lvbywwNYSEBpuugKqTQ7iJUCf0rLvLaPztS6Y92vbbHDbgtsVsZG9Ji
         jNhbLE5tBCGBvB568KgDkSQP1j6PEpjOojauEBdGir2SxXRJm+alpZQL7f+KuBiXSZl1
         t4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595019; x=1774199819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=IXjvZWY0u1I9xKG5Xx+X1vm0g8GvU8JqcYgiwaH6aYjXMKNfDPu+ADBMK1IavkNVi4
         oci+zQ7K90TeK9RvAYNzsu7tJ7420bWQv26KlDxb5BUgyemShnRYIklDAdK38C1dHWD/
         tZSpH5kDQLMFkA56ZbNXdYVc2yGxMwuR3M0V0uv30m5yOOJ6XDSh7poQcls3rhLtIOvc
         bH/OAktpS/ice1FkXZWUfEmDJjb26DjZoyuJUOQlEsU8g+LtA8NwLhbupURvOSsF+tdy
         174K+xApiOMKpQzX5tgKoOfkjqC30qJDp7q53OJ5IGFNlvu9qv98jpDqyQJzssPJr6AL
         QJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2jSDHV+4iXx1ZyzAia9rJpMdBCrsQ1BRkgkGWtA7WJno9OUXs+Dd1k2E84ASHfERKxPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4rIj0BgITS4EJQPekFLxCAfRSAuKqMuk62+Su/SvXrl7tmgT8
	Td6hfVJ/23jxM0iZqs5FjXadgr4Lzm6sc02oVf0TUt+jNcyXwiZaLiWK
X-Gm-Gg: ATEYQzwn7dFv4Mle0OH6jCmyG3hRgqV75AIyl7PihLyqC16yreOVVw08rbfdDddNupp
	ABk3KQI+toXYLMIhnPlS3LuSd6xmqq3C7NR8a25VGATZqq1ozn/myYenFKCWc10Qph8uF+f+9vL
	c0aHIPe4xJ+vgvhM0NsEFlEEaBbScCF2sj1XYLBTGxJVuvWZJttGoNonQdUfOVF3m6ynAdz+OGi
	kl4TjI6bjkUG16pFgDVuG4HOvAMIHOnbMFTyZf4OAsN7RKjirn9yioHyq0VO8koC5PB/hSunwrG
	1FlG4cHb5QROix8XYYpGK76gXd+CQzYLOhB6cpqDnle305/NJ92206I25nJPBwSkIUYA7AbiDtP
	z+gxh8A6hzNehbKTFARo6lmX6r5DrKJpX0LhYb54DuvJnxPFAiGu19G4DPseRGrF7UZxVh3Ldso
	h0DStLQmmPSS6JRVrvMfX0aB8oonspyeMbuQ==
X-Received: by 2002:a05:6000:200f:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43a04d79252mr18547646f8f.6.1773595018822;
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:16:50 +0100
Message-ID: <20260315171652.269020-2-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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

