Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC933378800
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595523; cv=none; b=WkxkTB6ZUu/u7ypkA7rCj2alDYd7Bs/RB2+ulX6FwvXPX9mVxHuKnXlPNffyP1r1oAEnXLCnjb73cYp3QVhNMNUGESdENgJVHvb8C+qDYyrxaNnPMvxaOuz0HKovrE9y/An57wiEs790MgKhgQXr5f7o+HXzHRSkKkBnTAVXKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595523; c=relaxed/simple;
	bh=X32PXM6CIYzypQR5TwfD7Jn/cbq77OlrCWR99DHxUpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAg8e2vDF/iI/kKxoEQF/cG7dF7kS3+oP/OmXgqLAAQn90emwEHrpmh4WVsvoVSxk6ArBUdks+yVg3rkBNZ0uIttVmeVgCgySw2r7MHOOnxf/sEX2EonJTbSnuuxbeMvIyo6DyQtRMdddPLhbgendMAQuEU3Bu6zzE6WzdFSzv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWEZSoNu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWEZSoNu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853aec185aso31192385e9.1
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595520; x=1774200320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=EWEZSoNuFhIiiH0sK+jck/ihy1WEl7QD1GMr4MErnYnam34T81X16sfT5R/K5Uts2g
         MC0d5ew+fCpnDg/nJrPI/+sf1LW7VirxdTOpEo7Rf0VPmi9Szi0LyYlSquiKVgiEs9UD
         UA3NJCRiZzc2AXEGJGNL7a9M8YsAgT2NiJabWxfU60YJUCCaYoEFZjyhMLDg4qrSJdSS
         GVOyWWWSXyDNg4cCfCVENNp42kPBte2TT64DUPu7Hk2U3y5TFJmxruzA6/Q8lhsLWkrf
         Ykqy8Kd0O49KVp/j24vi3VWxqAWbQu+xn17tnFN64FKX0QoELYkN1JkJk+IPrf7fFRL5
         HBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595520; x=1774200320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubQ1v6PBsq99cAcF2yrnS1WsB85d1f/acmJVUU/lg1s=;
        b=ardHu9jFkMJcT5J8kyy85rZh7CUOGFxxU+UI0DXVuAY+eDrbLJuxd+ClpjTAXzpRqK
         9SA2L6DV3a3zP5AAfWX57q2n1WNaDB0XLdZNnH+Fkkakumwkeb9rD4DNYqBVpQrTRrCg
         6YViypQC6NcuNmv/hxnvmZujWYitP2aGdcjTSFaSIdphWA5/Fx4XCMkpAqf7qT0pIdR6
         Mumwhxeo5CKjdOme5oW8NKCC4oTEdrnGa1XgO8cXj2BxgN6OOjz7qUtxs6lf1edzE6Yy
         mmjCKIu1givaUSpvk7Mn1ieQi6XvVS3DXPURgZEfo/1tiyxjThEOEAKVGp3nwR0a+lZ9
         kLKA==
X-Forwarded-Encrypted: i=1; AJvYcCUw4lFPZ6UUh5foxsycaPvPVUhiw5T3bG43l/SYPwqu08b58bZ4vuUiQHh7alNtDf/7TLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCCQDj0iUItCodLiTrsCBfznx9x3aFcfOyxkTPG0ub5BEMM4Hs
	/m8Dzd8cW6coiBow3RYBSGaWg4D9pJWy8cC1Lv5DmHuPUI2wg7doJLM/
X-Gm-Gg: ATEYQzxsbRDB6Q/so0mL0/BD4JnNYjGe2ODxRlukYgDgDorIH9RKQOsmZZwRQaJoBLA
	RLI6uFHLizl2cNydbXvhIYBqFHTscNZSAkKDnooOY9fpdPB8yKPMfAXqXZrf1tAtZLmkSay4Jwy
	W/iwbWaKWfuiWI1oRGZDTEwFELah+SglruyoS+rYOqQR3iR0tgXhxzEefO8sAeZqdpxWe7f3vqk
	DY9ipIqJnJjAEXrXBcKqqowkVls4uBF0IfMzQZrOF7hRXZ4f/WVWhEn9UqhN23nExpNnzbbe+E1
	zQq12GFkSGCKpQxNVU9pfMDq3wLfiEoQiqO/AWA7ZGpg/4jXqYEmYgmQVhsfP+8qUDxnqR0JxeA
	c8J68hnrJrAYExdBlbP+2q87bahFyplIMpq/97OvO2xAjeNrE8yDz6NlkzFt34k6ECZNiuR2u59
	L/pcxpvWEgbFzP4l+hqEPdISbBUp11oq1SaAqSSI7ClL6mJw==
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4855671044fmr171605205e9.32.1773595519800;
        Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:19 -0700 (PDT)
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:25:07 +0100
Message-ID: <20260315172507.270480-4-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
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

