Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5556B1925A9
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323999; cv=none; b=p+bzKAPfHP7V0uvnxf2+1+YPGJUUvIYgUlRpPFy1nHX3mEokBdbbaYH05Fewb9P4TxJN2vjou0o3nFW43t6n3TtKTk+boZgu4FeWIxODQouaFQ8AVqliF8za27oeW63Fpi+Kn3h/4Iu1YALpkRXYZc7z4VWnZ48TUY0EjQsssGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323999; c=relaxed/simple;
	bh=SrOU0DWf5Qo0VlyxfwgPrZKheynvQ+WBcg4n73EMMHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ReyEnKujW3AUZid2THAwWEk8Md0yKFEAHOF0O92veoAv+gN0FGd0ksQftXrxnUPrFvRKLgvB7dDmQYvxASAaX09/aGwB3EX+rZZWTN1GnX38LZ2n+LbgTXUVfYnOq4CNmjDqNF4zKQ3uOfbEA07uyf7QzmQCRsHwll88h7kQRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eeEe2GAB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeEe2GAB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso746604166b.3
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323996; x=1731928796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=eeEe2GABcqth3paccxksmFozW3RIVzNXJWnG+8XgplV74QCFHmy8mCDlg+skKy7ZAi
         /IxSZu8ye8BP7gkaMtA/Y4Dmn2EfGq9X1M88BR6oGCie4s319VNa1Ockb18KGXZGWCrP
         nRzpBqexoNx6ZwWFMazi/BRtuobl9DhkxusS0UiihvYG3L8lv+fykTr3fqk8h8o7ZiIi
         0qOee9P3VAGkwXIR1LOEMgRNXldNs7ZOy+aFhwdR9ptNbrIKXjt1fizPXx3C/XBY4wws
         b4ZrvL1eg9UTT2VsloUQYxYyN54HbHiIaBEd6fVkvsG9cH9/kn2IYKQAVCUFpMz6PHxk
         mnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323996; x=1731928796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu/BrO8IXX6alWkTb0GYjGoZx8cl1iROqgITASLHOag=;
        b=d0E1B8Rib0Z86KXftrqgsZybxaFyQ0JCMItwvrJwiuhCkj/hTeLqpsSENl0JFunYoT
         Uvg257nHxBtFg5mg4zt3AXkzw5eZvxSnTCGhc83IKKKO/RoLfxonMEMTqnXvsoKe1q2o
         0d/1H48zfWMNXl0Deuy7SYXuOiHR+0/3ZiNBlDsJTNoWr4dboomdc2dkFCeZSOU82Xb+
         BzAzWkBZjxHLs/Sxey6KwBSpQUHGXB7xUAX4Rqu8A3Xv2DzK4ZsffpOlrEJPmp7Ce6MW
         vBaEBHYd2Re8rh73dQkD7u1sKvNAkORUOk0bOHHFQT4FoVSQoAcpwVyCl+JTO1tiTnPf
         vU1g==
X-Forwarded-Encrypted: i=1; AJvYcCVVkDQfi2kW1LWbzW5Ko9dx/yrh4GriN8j08zx60raxFXqy2IcUJ+CtV1uw4H1aRqfT7To=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMdiuBoLNX5w5Q8bJiIRL1ost6bmNOl5L7pWB7YdCHBzrey90b
	SwAcwJfQEdjesejKAvD7UMag/ddKHaGFdVn/xmPMg3v/NHPD7+Q9GkX3NvjBgEk=
X-Google-Smtp-Source: AGHT+IETD0TTRXcK0fhtRcdkx1FK3e/NgS7iCgkGzVtCtOmSV30aF2EybWWflcXrw2+dh5CJKbTS3Q==
X-Received: by 2002:a17:907:1c0f:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a9eefeaf352mr1148302166b.4.1731323995661;
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 3/3] mtd: spi-nor: support vcc-supply regulator
Date: Mon, 11 Nov 2024 13:19:46 +0200
Message-Id: <20241111111946.9048-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=tudor.ambarus@linaro.org; h=from:subject; bh=/f04QIpiuRXQZGFnfAnaIXlKFecFw5Gb/Nj7YVsESQI=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSiUznsRKk7icK+iHmW5tJsygFpLEVcVVqy gWwSLj6VbSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZCHB/9VoXfZlG0zTmKUX6uOfKEiomBJ3tfQ08Fz7JZbY9HNkY8ASnC7D3i/ne0kDCkVXmDdN/t truMWEiWIE1aEqbqieiySwIsqcizG8Ng8aLiNPni4zPgm6lAMLGq9pGPkvgQ+cFq+o3sEqK6ju1 teBSW2iQF+1ZFN/yIjDe8egf9CAcfouomGbsT3ezLCWmfzGyknfgU+SZm2MuI020jVlawX/8u3/ SdG44Hz6HjnrJkYXQyvKOVYGgxNXcow+G5b/UAbgcUNo9rVXbPNFG6etyN+bN2C9AgYC5BJaPb8 ApAAcl8bVmIqGIMm7hll4kkRejUfWBnUCOp+r6Vxabk66hCF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

SPI NOR flashes needs power supply to work properly. The power supply
maybe software controllable per board design. So add the support
for an vcc-supply regulator.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
[ta: move devm_regulator_get_enable() to spi_nor_probe().]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: introduce the local dev variable to its own patch
v4: move the devm_regulator_get_enable() call from spi_nor_scan to
spi_nor_probe(). We no longer add support for the drivers under
drivers/mtd/spi-nor/controllers/. Those drivers shall be moved under
drivers/spi.

 drivers/mtd/spi-nor/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2a329084505c..19eb98bd6821 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -3587,6 +3588,10 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
+	ret = devm_regulator_get_enable(dev, "vcc");
+	if (ret)
+		return ret;
+
 	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
-- 
2.34.1

