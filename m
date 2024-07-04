Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D45143862
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113839; cv=none; b=o9JbFNMoWjOt9X0LJs1LVhEX4UPj3nnyTYICjoLNJ7i7WclL+zrNf9oNnafLqD+p4W2fV6Bo3xEFYQSRqGI6k8NqbX433/Evk75CN4ujNK9Ev1HewzRavAfhHE2yHFOrhzJH/0Nutc0gYkBSBldm7u1bbnrJ8DfvlIrQlIMuTTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113839; c=relaxed/simple;
	bh=/w2Mfm3b//ArFJq79ZTzz7Oj9gnwB0vEiff6gNtMX10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV/YxIiFt5mvZUUzf1UuineM8tQGYzYpUoizWiIjJdGFRLgxr8AS++Sm8TXzdxDLcNhyG0m7YxsISfq0091ecV2bOcNLzlemnly9eviap4VOSL0d0xq/QzaYtRxZAqSkIbH/nUM53DsBrirNxBsp/oUg/6JlQ30M/1E9CGSx0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCqj7D7x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCqj7D7x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-424acf3226fso6080255e9.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113836; x=1720718636; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXvtbk3eJTlknQfO1g6XBXuGBlY9arYdCdhrUDB15Qk=;
        b=LCqj7D7xnw/WvSqXnZgDzEeWBHWaoASzI4mzcyxCxNAf/EaYvr137nA3VLGaSrJ7D0
         UQyxV7qvhah3f88IQDWR7fE5ISeMCbMH3n1/exJI9TYanu+a0qgADyWk6KERv2sYGcd/
         T7XU2Yua4G0Lq1EI7Q22br8sq8XnocpWvX062coGmiexypgMmzi3yZyws/taTXVB01YP
         gvXeA5rDvjV8q322h8JKyDVHzdAdTyi0V/vzPrrFe4/lm7fT2RtI+bcFwJlsNQins4hC
         P5GrKU3dKUAh071ncDi83RjANaILk5cON/GcbT3STD+rJL+Ax+pHe8QmK9Al0dnXXDjV
         ToQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113836; x=1720718636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXvtbk3eJTlknQfO1g6XBXuGBlY9arYdCdhrUDB15Qk=;
        b=SvDFriBw0CP1+wYrCoe+aDi8Rp25X+8nk3Cw6TMD1sfNQwPZ+t0chtnDqp1Vzm7orz
         mh3LkOpc657P4K30OHb+1I+dQ7Mswyg7fxZNwKLEgF3pA0HO2OtwNMXtrl74E8r0BmE2
         daapJ0QqdURdtL5ib/vfwZLnWz9wjBdvaOSL/sVQYUuoA+NhaEQRmOXte8jRNgsSEQ4A
         0rE3J9z2uuh2xeuAfNol1Zf2+bM0QUadFbCiLIlZTG04+f5NUJeq9xTAM6FIcahmnD8c
         7BlEM1++vjl7CVZHyAW8hgQrkkPvDnPqWE3GtwUosdObwvtNS6dis5vJOKk4x5vrHNyk
         FHaA==
X-Forwarded-Encrypted: i=1; AJvYcCWYwdQ3RphQGEu8kb69XNHazTHdBOJPB36aXDCacuhJKainOrCL7/iTkilHelJi40+OkdFaTuLtFM1j9hmjLdU5MTLZ
X-Gm-Message-State: AOJu0YwgSWA/5XkYCSkx3OrsEThL8T4hhf8Hp4fdxWDcXyZRDhsJ1JnH
	FXRO3vYDrOH4C+4Xs/jd+yX6/XXX7hQeojcbpoTG1KNcyjOhWat9
X-Google-Smtp-Source: AGHT+IEHdGR7aWDPHC48GX7xnpPP9zkZvU5WdgSCgIsyuE6VBDayBGzZuU+F5S67Yb5hOGQ04hSJvQ==
X-Received: by 2002:a05:600c:4487:b0:425:6a12:bbe6 with SMTP id 5b1f17b1804b1-4264a36e4c2mr18864815e9.0.1720113836422;
        Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:27 +0200
Subject: [PATCH v2 17/24] mfd: tps65218: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-17-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=731;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=/w2Mfm3b//ArFJq79ZTzz7Oj9gnwB0vEiff6gNtMX10=;
 b=OsGThnGbxB6eleQCVQo1EzO1iCBucxxKtKb0NyDYLCLfqfoWtpAvo5rwf5kwibFxTvZ76KrNS
 K6Bi2mbmKBuCws/nTLk7C5CrVqeEQofHOH/f1CcDiRMCWNEk5r5wRjb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65218_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65218.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index 427a2b97f117..4f3e632f726f 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -186,7 +186,7 @@ static const struct regmap_irq tps65218_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65218_irq_chip = {
+static const struct regmap_irq_chip tps65218_irq_chip = {
 	.name = "tps65218",
 	.irqs = tps65218_irqs,
 	.num_irqs = ARRAY_SIZE(tps65218_irqs),

-- 
2.40.1

