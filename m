Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9E1850B1
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021088; cv=none; b=jBNjr5y9y1LVb6kSEBiaYVKhbhNL7B4AcS+ggdaOdbfp96suRhl4AcVkLzfiUCHdqwlew6MXshOmGLBFO3r9wteS6m7Bw9fHY/g8/+C+59ZHMw6qK5OZDXvZkB9/NYzgDK2C7mGtSfxju2CR73wkAMPgDt9ohK9wANU2Zbm5Css=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021088; c=relaxed/simple;
	bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0OrVEZNpYGe8ggT4GBVXPRyytKdvuaruYSc+2q/e6CPbIrBf2yVB1mAOcWz/lLCZ58V4JzoFEzQpLTSh4uMLsuMWtTigeV8ROao+8xd3e+cMwl99Rrb43ZM/ouEn+6e3qmeddYhUC3miuyAAUGV2689+EB4Ph3gGKdiYzE5zLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcKZNlqm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcKZNlqm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-58d24201934so1078939a12.0
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021085; x=1720625885; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=QcKZNlqmUhqA6P0AmDmCQZ9H0OEopHQKi1jVOwdpJ28jnDA/26xACVLGZ6FGMm7hyN
         zQgrOa0nvbxj/ai0eGCiMJqJATlSoAKy9kRfDgK9qIe1Mt1F6l1xr8fsrmz4NrB3JYSE
         n1E5oP0byhJ9bgSqZg0RH6hZRTFZuUeOHU3s8Qor8zgUzFQyXNHxQ/U9daIrHdu8jb/f
         jNCIGKvEXTQYja0ptZDD8VatcZlsaUlO8MrmoYISbBjIghJtSrvhE3b2/oQsmeYXvRi0
         CCKfdkvZNZF7o6SYQPbNaQuzbGjTlyKcoAX732a58TSCvmw9lZxf3datcV6muC6fARNL
         2mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021085; x=1720625885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=Z1oo3UHyj0WAJmfW1YgiNJX+bs4mZ5hNLXmE0UWy0QDGWbg+T+2crc9TZFCqZJVczW
         Gae8sQPtyqSdOBLbnq8oX2hGiljyXx5MVhSpx5ptRxYh4W6rTpUZsKocGBRCgJCGA7cW
         8Q70rTiNGqiTLkQTIUPq+aszlPIkvkBeNzfoDoFPEjsM+krpPo62vIl8QMxeqbPXcMVg
         9le9kHDw34zyxn5lSTsCKz7xRwM1FaAXqgrs072NKotHoupJhEMPSIxE5jEOcMO+CMVr
         tD2BgTjmR2e+ULx1X7GJAFXdSHMWb3poiiTRiFOBd4RDeNlm0phZ+aEkkwZiOfU1nOjw
         EHtg==
X-Forwarded-Encrypted: i=1; AJvYcCX4JpT/kO6SjyuOUATjvfB82TsEPUDscl+FA8A1ZptQ9BRH87RKEUqPpgeNHp7mrQSp4rnSV7Hh9UH8GlmEIC0aiNgu
X-Gm-Message-State: AOJu0YxOndrog17UsemS7tYdHGSeWTjSqdbQqTck5tEw2FYAYmDfUhaA
	I9m75MVQ78ut8E5lhzh5G5MJAbPu5et91+5vKfqQMubG5AvkIZMm
X-Google-Smtp-Source: AGHT+IEH55huE/k5TpbK06pig6EzTTffXJgUxint6WaluoXZ+m5yup3JJBqxfU8O7ZA5KvA4IiQ9LA==
X-Received: by 2002:a50:fb86:0:b0:57d:455:d395 with SMTP id 4fb4d7f45d1cf-58ce4ab0355mr1374332a12.7.1720021085159;
        Wed, 03 Jul 2024 08:38:05 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:38:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:40 +0200
Subject: [PATCH 7/7] mfd: intel-m10-bmc: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-7-aa6cd00a03bd@gmail.com>
References: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
In-Reply-To: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=1447;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
 b=lJ3zTuutc0Z4p2RoH31euQHDqzOporSJvVUPFyuQFoRAv5URPTdnbH5qJjw7DBBL1OERTfddD
 Z8ZzClYrR9VABhzaaNK4ubSv5VPNoYHXpRqy6vD28THHvVq3DxqZG1P
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

