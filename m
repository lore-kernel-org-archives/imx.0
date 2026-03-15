Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D037AA9D
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606167; cv=none; b=rDJ4QSnttkbQRCgi4aBZ6YO9EJThl/wONAqI9wQpiPEzHhwVR5rkoRofA1vNe8W+9Au43pvlbR15SsMLicx26TSEaERnE9qq5LozDDMWaWZDTpjbdIXzK/1cY2fbuJrkb7xV9SDLvWO6LoTsno5EDqXOm8guwdJgLVFvbauqkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606167; c=relaxed/simple;
	bh=YmyURTSOe9/SCjL49JK1pX4JjS3HabyPzHa2LlBpNCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LEHlAvIgGnQ+WYYSiUVd/2NtTQsccFVt+KamkF/i2w5Qsf3rUA2xSXINmBs3HvCzELBlQzmgYr0j4vG1JtnFRi2CLUACPUDuG06cCYSISMLtaj1zZNeG3q3bNmiXBf/40Y0eQmtk8H07qXL8Z/+pFf3StNC5Kv/LQ2DIFfDjCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGn+oAy3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGn+oAy3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48541edecf9so42000845e9.1
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773606165; x=1774210965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=aGn+oAy36IQaomSuphG/lRaxH3oARwoe4PuP4O3Q5DZyACXu01shcx2S9xqJkTDx/+
         L02rblAjzcbvA5mPf1DQUGvhfuii7Ip2eLVcK2rTv5hRirrKSvJYj8VZRUA8Ris9/4lg
         VjuZa8RWiYUttT/P6qpzX6Fm4kZ93dLSN7UQaASWb/X6HGmesiwakCGc3obDz+BGNJQZ
         AnFH/WedTd66WZpU333CfDap9WMMpKjq2OYb8nK/9xzzc4xewQKTcnC73MNyoH/+ADEG
         Az0OAgSzIKJ8bJxMEVQ7eY3lFBhgfBmEUb1WCz8oFaLaqidmqoXS1BZD8PxAdrimRYVn
         IA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606165; x=1774210965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=jBnhG7DqWkG7uQhSq1+Fwa/QXySY3gYrKUhInV5zt5zB1foXnfvkMqYd3qrIgMzTPM
         WW+6jJYuWtoQnk9SNX0ZMr+fuTZA5V/9pItBOSCJApWQZHTGHenYZumpgrO6nUTRy3mi
         o0E6A8DlaQi0LVFOpncRySUz4iDphsu2AxL5xV53hCawnEq3RXGPUIH2r9bHh2q9zEhR
         MKf27rc2i1wqGwpAPnfoVWPxQ+TcKd4JCevGl9NTkghi49mzQ+avYBubSC7vxl3O/2Zb
         iOU68nHNqmizXFmOWAkEGxa34GejHadHlFernD0EFWhikaeVXhxO0aHDFbNBHapzXEEi
         dHAw==
X-Forwarded-Encrypted: i=1; AJvYcCU6MDYkL37Yu2J5l2BQ0e6mro94FCirdEbulhnQzXlGW74mDiJEdzmHQTbw83Czy94aj0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOpbAA31fa9fuEHXmMdrf6elncPNPN+JDgmOz57DbBuaTsJMgZ
	sgNzKhb4zHw3dKn0Ik+92x3hahGqDQ4CZHUI/HO69L05W9//bXL4mHLu
X-Gm-Gg: ATEYQzzvue1gAB9jte5qM1BafIYjzyw/0y8zYmKcF9lpQxhfwlq33K7+849CPBQnWiy
	V6DAo6gtGIVDExTTlWlEMeic0hW/uuC8unNlCPz1hyj8pLxWgh32rS8LP2CXYVLmmwMTLfjTFR/
	Ck0MzEGkjwzRH6GZLn1yI7oJmZZPwP4KmuML15LSGrfwsvxk46J9dIB9SmvBMCjwkJbiqEGksMj
	kKdMr4uZwkk+sc4Jo1fq1R15w0Ku7HA2Xthd8kkvSi+kHhiU/fUGtPQatVIW3WulFtmvq9ymQT+
	5mCqxVJvuJ7o+naiKjDXUrOfZPa2Jxk+B0PaR2l9CK5cb+yvFn4uoXzwv3oZO8CYMLYYaRKJij9
	ranBchsO2xLW3SsiQeePUqSK/3fyanCPObbIVWXnLMmSMHPunqSq1jtN5I1IqIsPyBJj1dADMYH
	v9uwSfFslKM9p3OjoSbSbULGWguNPqtpK9QA==
X-Received: by 2002:a05:600c:3552:b0:485:46fd:100a with SMTP id 5b1f17b1804b1-4855670299dmr172636005e9.25.1773606164279;
        Sun, 15 Mar 2026 13:22:44 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563f619csm121862955e9.1.2026.03.15.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:22:43 -0700 (PDT)
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
Date: Sun, 15 Mar 2026 21:22:34 +0100
Message-ID: <20260315202238.15758-1-adriangarciacasado42@gmail.com>
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

