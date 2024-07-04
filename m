Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E78137750
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113822; cv=none; b=liNfVbTBC/DhywMWYgVru6mVGDtw3MEvBt/fElVXSloGbdd3JtvwBKaXyYVwisEP8nwJwpUK+EDYIyIEH6nDygZ6x0rM+YAqDUuMSDln5TxnchaIH+687ReaIsuIic152fGlkoyACwgxocbeu99ir8RoNs1joHeXqk1Ru/DnJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113822; c=relaxed/simple;
	bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/MsgDmRdsWIpJ7h9pbyJEQctYwakytYNWZU/uIBksXt0RJDiumHsnfgIqTmgq6E1oxL4ylwx/MRcEFTThuPREoJIInKHpBVmR035Jo3JEDQbsTOsHa4vqCZQm480ZZBh/5RXoa1uivtNVGE1Z+6aAsL/YmTmpnH1pltux1YMu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYxEVF8d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYxEVF8d"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so5669385e9.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113819; x=1720718619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=YYxEVF8dPbgNHfzrXh/rgtsfmMiZQR6gi+kXobJv4PVpjWT6Dzj9Ys+bRgGy8mn70Y
         /xq/Dd7I3nRM4DO3NL0KfGcVpOH0LLcR2gpcEuJ6ped9ioW/iU36GtSAXsTmC3XPeQEL
         tXrKPk0tE19LvIAA8swABKFbcmnd9Uj68iFqo5euOVFbGkQqHfB8C16t6cprYf5qGGaZ
         qvVgmnjkMvrL6JmH62kxKGXy90ilZQmIvIrRlByYAu56mJrff470A4W9jzVpgcB9dwFt
         1mrN1ftUyIMZSiK/nMPBYXaKHBwOoD8ZzYe2YME11oS+rfUFua1GFJF4XFDDv4CSeyZS
         V48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113819; x=1720718619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=NEccZ2xSIcQIvU9tja7pNgkEh4HtFzJPUTVYAGJWgfRc4SbvWbqu2HfLMM9+QdFPHs
         FLmtvxfjbL+JFUdABNroy/QJpfc+OtKpikcgCIDQz5GXWQpUNGVAOOqVchXFL5LcBhh0
         bh+4ndUPeMqwQsGVG77k1G0cCUNBwiEpO3REU+BTOtsOBGVXUVNWvwvW5hq+FQLa8leC
         myzIb4xQdWNHXlNsDTjKUs2OKRlEPfvYXGdsHpi0AWJINLY6jO8YrLSXh6LPn34PYELz
         o2XGS3U4dSkxZyJ1GgXfWeAesWeLYOQg8g9QG4J3RKS11VV7sWcPdSGzAZoX41tjNP8l
         gaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCiBOQr5J5+M9Rq/xnluyJ8PwvHwZc6YRbHtrbU6yTdSTqx3i2MOYqWD+uaPxO5JkRR6qkaK1Eb1shQl5isQg2LpY8
X-Gm-Message-State: AOJu0YxTHkR7dFE6Tix2iPA++2Ooy5HWlHOKRsFesaTYzTGrE0HVhgNw
	5GtSDD+lnt54S/8FqBONUM2PJBfI2evaK3xDfx1pzEjo5MqKFVDr
X-Google-Smtp-Source: AGHT+IFaLJbGPGKqt38tbITvJvDUJW0cQKWDZwNHz+0MsfB1OM0rGrAFAbj1uDUigyKdYCGktKoyHg==
X-Received: by 2002:a05:600c:3107:b0:424:aa5a:280e with SMTP id 5b1f17b1804b1-4264b124440mr20595165e9.8.1720113819026;
        Thu, 04 Jul 2024 10:23:39 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:38 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:17 +0200
Subject: [PATCH v2 07/24] mfd: intel-m10-bmc: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-7-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1447;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
 b=4Q4EhtFXAShhKO9oUsSVsc2sdoAyfwskGN2NUMjuJ4hwqJmSsRstHVgJZYGl2RYvZ2AqucTml
 oSt0eImsfB8COF21mipK5P99JHEEqOPFIZ4lneZOz6vtuRUtKukkgQz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`m10bmc_pmci_regmap_config` and `intel_m10bmc_regmap_config` are not
modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 drivers/mfd/intel-m10-bmc-spi.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index 698c5933938b..4fa9d380c62b 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -336,7 +336,7 @@ static const struct regmap_access_table m10bmc_pmci_access_table = {
 	.n_yes_ranges	= ARRAY_SIZE(m10bmc_pmci_regmap_range),
 };
 
-static struct regmap_config m10bmc_pmci_regmap_config = {
+static const struct regmap_config m10bmc_pmci_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
index d64d28199df6..36f631ef7a67 100644
--- a/drivers/mfd/intel-m10-bmc-spi.c
+++ b/drivers/mfd/intel-m10-bmc-spi.c
@@ -24,7 +24,7 @@ static const struct regmap_access_table m10bmc_access_table = {
 	.n_yes_ranges	= ARRAY_SIZE(m10bmc_regmap_range),
 };
 
-static struct regmap_config intel_m10bmc_regmap_config = {
+static const struct regmap_config intel_m10bmc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.40.1

