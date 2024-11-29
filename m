Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908771598EE
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871412; cv=none; b=NA9vFIvOEbjOpVsv0iWI56adt2G0xRol6DpUSeMG33+pta05i2G3uMtLGxX6OFm8jO3XIXOqRfXLoeohYXNcIs9VWm3JXyxDI+IF+m4zZQbLtH9YB6B/hRAOYEQhnkWXA/zyfhJDfp4EXPrt0/iupsSJRZJsZbTvKJ/lQJI092g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871412; c=relaxed/simple;
	bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAvM0BsvAtxsJcvc2pDQDgdynnClZjUw+LvN70AH5i5WvdZkw0rwyDsm50LomdM2FepKvXPZ2IhLaMdMZwQanQcC6/pio7moyuEvkZgqRzSgifwfHck1UMgl4mgcexLSbCUB9sFTkq6wDwadfpEzP2/tnC1C7bNbHa3KjXpCasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTLSp1WT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTLSp1WT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa5302a0901so185761566b.0
        for <imx@lists.linux.dev>; Fri, 29 Nov 2024 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732871409; x=1733476209; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=dTLSp1WTJSIDnBWIWYu9KkXjZxvJVi+25RhxofBKyjujVXCp7/dSNK78t+q07INFNW
         d3j91T8IMC05Yc1NpBPQlxyAV+6A3GL4b7lzVewEbCiS/N7njhVxIKBgcbEZjC108sND
         LoegQCJe1xiO20+gEM7qNcL0GZuGQI5PJyC3lQn1RwrXqR+nfudG8GnpOv+z7ULqIh+2
         UR3DmHOSb/0/XRsXpSW+pKqGnFVd4e5khUNkz62DXIXIbiLcAozM7WG1fm4LNTIz32p/
         Bquy0zT+53/Gq9Zp7MuNNubHWlg0EODqOVQCQoaRwDg++sy51REyOsUryfT1LoHI9Nws
         9eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871409; x=1733476209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=Aco74YarWELBdRJGno+P0JlYZvvQ6zd4kVrAAzRvCoDhhuVYIFKgXxTNdbF7UppZbb
         /vyvuin9N9GG1iqVI6l4DgWZjQfq9LowQ6wLHN1Yy9FeUGH4v0eFA3rjyLhqNnCkfnMc
         RF14yGdmuu6G1gtx0VGRqYTy0J7gNwwXAD0xLz+rEiX7yu95mA1OhXXXCioKBrfTtIIX
         rFGNnxzk/Bjtl+XLJEVvKEZRnTyAtyCdUkIiom53/AOd4wSrarlLbfevtwfbu63HS104
         CCtz0B0AU5nDhjkw5ePPmftJpVyr8ZAzw0P7ZNVHQfOo9p9q4mqIh3bfa859vuNLYRYE
         Krqw==
X-Forwarded-Encrypted: i=1; AJvYcCUh1pF3qMom6PRd/E6UlM64PF6ZtkOM/ryzh58nRDfacPMtMlKoBArDcvrtvc1B7/0RqH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG52+iT64QlZDafs7uhKeeq3hzxC5y4kjy3TILZsp72/dBFXo5
	tcxgojLxRl+9KzZI3yPxQA5BQZ6FOcjaNI5uNl6eveG7jhDm8TOUUZww5A==
X-Gm-Gg: ASbGnctSrKVMwU+dYR35gnS7CyhI/cxr2nXzRMzxIoL53n5CQRocwShxpRo6JfrtfpM
	9si21qYC2r3gY5+zL40Us6CSiwEnFvTurR0HsJcjZdlXr4LwEPArVcb8CtA1cogRIrPqCmV3Tpv
	qeyZthFXvImQdyqPeiRsAO8ub7kGG6kd9go2qqm4AzCxz87Rpx3ywBZeD3Jr+yL9QhXGFYzaFqu
	saRIKkkV4ct46/jWHSfk+lCGFCZfU8RRWN5DdueK9MDAO5B
X-Google-Smtp-Source: AGHT+IGaSoNpYyEkF4MY0uin/iFl40YkpVFgMNLIjAQotNHq5x5X5IuG35tfQL+bge3PzeB+YGebeQ==
X-Received: by 2002:a17:906:23ea:b0:aa5:451c:ce26 with SMTP id a640c23a62f3a-aa581074c05mr802310266b.51.1732871408811;
        Fri, 29 Nov 2024 01:10:08 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa5999032c1sm152775766b.133.2024.11.29.01.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:10:08 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 29 Nov 2024 12:09:53 +0300
Subject: [PATCH v4 1/2] power: supply: max17042: make interrupt shared
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-b4-max17042-v4-1-87c6d99b3d3d@gmail.com>
References: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
In-Reply-To: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732871405; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
 b=EvyHOgNK4AahgKG5DWBHSPPcVTYoTJaiheiGNKsbrhG7AOhn0QFFuOhoAyU4v55mKxKIL2oN9
 y0QTQM7oOgEAjn27raPOcOvSbj+ijsZ35rDRl/DiAFJeZ6tqZoApkdx
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Make interrupt
shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.5

