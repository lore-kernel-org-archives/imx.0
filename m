Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A091836D6
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021085; cv=none; b=iHHhgM32UXrRra1CyNenutKCcBwd7MhOPdrgQf6M1PK8E8E2M6EDdNHuHRmvDvACPrRmKxiQHDCyj8FrgMllfT+T0NZSV4mebpXN0yZ5IUC+LtKKSv/EMrATbLuEVVwGabqsv27MXBc81LlLQsnUad7oZEndFCRLMc9bWE0e6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021085; c=relaxed/simple;
	bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiRgaQ0aYgqM2keIOHeIFMTbv1Hs8DLAYVLmmrZXEZYtM604fC6Psau5qsMQi5ZIojCyQ4FK0/ng/njFapDuIHTF/sIctDxu1ay6Hf0mdm7Ny0e0JxWO+PGTlADd/yRDH16fGBZiaogEdvq5HTCxGpZQSk/duOKb4fgF18QpHns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiL1bd6E; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiL1bd6E"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7541fad560so255867066b.0
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021082; x=1720625882; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=CiL1bd6Eilgv2PvW10FIwZQu4OZ6u6nQ0nFRNsBJA2ofFasKe1m3sWygt3ObtZE9m9
         hMCUWToNHTwRHI4Yll1vE2facuvedSmdc5yYCVMfQrlA8JdqqLc9BhhYL1rsfp9H61Lo
         4Ivnpgbv5uwYMLJg/r57qIdmNMJ5bWwaG5+dHlMLxg+gXnh6uq0vNBZFSJEsDUWdgNOE
         RFxN31TQj85rLSOO+RYsb+XuoV97nxSChm8gszjeufYZt350PRkz/Re9B19Kz9LYMzKI
         9anxJEdOtyd8fK6fwUKh1/T+j5I19gsE86zpMv9TWM8eM0Cglv0WI6oIcSby77Gz3LKO
         uqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021082; x=1720625882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=N12B+H2X6FdwYeFqGEDKJ0jMbigeP+88U93SDVyH+T+eKsy6y7ImbiY2IzbNJQkAAl
         Fjhe6ojvJJtOvAhuRsQrbEet3vZK9LXNjDDAt79IYVjJSaTwC1b7K2zznY2VS/9H7Nfm
         19UzeQVDTxd9cahShP0iSvCQprq9E6yhUnB6owja+u0DL2lJ2raFToHP9AhZuUBjMNVF
         wW1e+AtUdnk1y2jnb9JsVqxh5AwGnVncNekRpm9sKc/djT0CIFQFieXs+6bPmK++IKMS
         4jxS5xTop74QjNVsx/PBOR7jvuCKYG6KMnEqfAP4yTTMjbyxCmyb027xW8LEyHiYOCZj
         4IhA==
X-Forwarded-Encrypted: i=1; AJvYcCWcVElqc/3hMY3nWiXFh80eJ7Or1l5A4RNHvO/pCI5UYdb5IVRQzMwaIe4UVe2CcaDdStxjtnTF4Raw+BH5omcjYrXr
X-Gm-Message-State: AOJu0YycCxGV4wTRgXEc4dMUXktSWCGggqamRRKh5Szid1pDNyFluBDs
	9GX67lYCYoyatPD+kMresUSLjlCwstXfpdtUebjW/pnLlg9OUMw2
X-Google-Smtp-Source: AGHT+IHCQ80mEv1/7hzgKtXN4Pxvcf2tTNEkA8d6/nsYXqmAct+j4z6C6IBojaFFHMQaQ4EikNbPxQ==
X-Received: by 2002:a17:907:2d1f:b0:a6f:48b2:aac5 with SMTP id a640c23a62f3a-a751441f052mr926878266b.15.1720021082289;
        Wed, 03 Jul 2024 08:38:02 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:38:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:38 +0200
Subject: [PATCH 5/7] mfd: tps6105x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-5-aa6cd00a03bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=722;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
 b=0aDXAOV2yQ6SgDy74o9G2xuTzpilnDRzguPUcMJe60B7GRpVMf+4+PYXAUexv6XzXyTNSv5Ts
 n/Qk2O/94yEBgZU2mES9qotIgWXd8xKOvX/z05dIzLdMlcrOHx57PXt
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps6105x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps6105x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 0da1cecb5af6..e2f6858d101e 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -23,7 +23,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6105x.h>
 
-static struct regmap_config tps6105x_regmap_config = {
+static const struct regmap_config tps6105x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = TPS6105X_REG_3,

-- 
2.40.1

