Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C9145A1D
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113848; cv=none; b=PTM0bbvCSQci5/BQh9hSqRolFxrvWzPYwvUBjtvPTiK9EVLHh5QAwbDjjpEg6zjSsgt8zYpLiDykiMY83UcydiKgD2XLG0A8s3PMXQFTfEmlesxeeNcrb1xB1hS35k7FDQmJLMkrFD4C9NXglo9DbaEjYgB99MlQUWZM2GWC6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113848; c=relaxed/simple;
	bh=EFjeAuFQ+yjeW5Mj8fAqH28Zfk3DwPtm3fhoKInicuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWqFsuU9g+N62V75lvkkXuP7s4AdjOR6K9tMVPKNn5O+vElB9cMT7DbVUt3mbypFqvjLLaMHsi3PrY0XtfjSqz+G9uHylBx0pN0UjZK+4nKk4ijZQRo2wx8wYGLu3gJf10jNMGM0+CVM9JdiJhTFVRci8mFRSlxJsXmcrwzDuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heY2O0Fc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heY2O0Fc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4257a390a4eso5800105e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113845; x=1720718645; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSmkXwdNDx8gxRBcSFEMTKWfVzkTr4PxXtZV2NUkJPo=;
        b=heY2O0FcHDj0h1o2KgzGSCvoZ1bi1BNc/Sk5Hp47TJn2zqIzaTq4LTpey5BPSXChsI
         19ijRmTzEUEyFNAhoT2CH0etusd/Wxe5X7YhawMHtdAkBfMSrSbTBzd98ntirA8mpSMa
         6Vhe8EhLQdn2tJ8Wrt6dgDJIOY4CMYnpp243VU5lGPsumGVEN0RUOyKqwbu0IHJiLPJ7
         ozUb/FQqjVfndweH+rqWG3/vZdpWQl9zjkjkIBFJZ75IS4LBbTY0+0aWUOOK1YU3UUkM
         PmohikWQQw16rg/OhOAUEg3a/IV/jaVsrJae7ahmmKUfK2hJAPZfC1Snwq0xnzN2Vl1s
         19oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113845; x=1720718645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSmkXwdNDx8gxRBcSFEMTKWfVzkTr4PxXtZV2NUkJPo=;
        b=nyyJuqndnkjYGbRKHS89/QP9vWmKKNAuoizOE4WoCIiG4irZwEegbY0VAZ0EsMypQF
         zqGqlwQPcousJeDvcaMuKsXSC/qOhx6Y3y8J1VoHawreLHGyKpIp9GqVi29HzMxgOQ9g
         A1w2ZN+8edZpCcLfeY1ytgMDxWr/swQ4KBO3HStgMuhoyfrvDZGKNJPAciBVnFXOjTEt
         Qo0fIv+WNzIbA7r3FZ7ihTVRkBM86icf8gr5w5pVK1lx+O6EBSlr+4oVQ3imKNxv6Pbz
         69DKptYPtFhGrKJ3blt2O8RdcQMauLXug7hLAPWIHGH9ApcouPudT01YGRVVvXA3XZxj
         rQgg==
X-Forwarded-Encrypted: i=1; AJvYcCWG5kh0FMHBzo4cak1Fk9uOxwQAGcKfFfJRS7Crw+7NzFLoo9iR7u10JK5x73QRFhtWio++ZXdyBsw44s6JyAAcvmr7
X-Gm-Message-State: AOJu0YwiSPR2At1ncgI57tiJ1N+zTqskxfDtEC34IyhRGtB0cHLnruUd
	7jNkz92IIw+CAgrYKIy3w/0uaol2arcZ9rTLGY2C7MVZw68CCcx5
X-Google-Smtp-Source: AGHT+IFxi0ZapjHCUnWyNL5kvf9WrHCIIvC3731ltStZfnS1OdULl4EU3AnXLZGmvjFniCwRREl/eQ==
X-Received: by 2002:a05:600c:230d:b0:425:6424:357a with SMTP id 5b1f17b1804b1-4264a45f760mr14744965e9.35.1720113845281;
        Thu, 04 Jul 2024 10:24:05 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:32 +0200
Subject: [PATCH v2 22/24] mfd: gateworks-gsc: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-22-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=739;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=EFjeAuFQ+yjeW5Mj8fAqH28Zfk3DwPtm3fhoKInicuk=;
 b=KRVR1dMucgQ62PGtutNIDVIfVON9pSMU21YATQa6veFwYOOGrU4wZI9vUYUbP9DTsH5+o4UkS
 TXwaYJ6ga8MDJDIBznuScntzxKT1mngJxqyLIchPUhjkVFNNkvLTP4x
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`gsc_regmap_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/gateworks-gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index b02bfdc871e9..6ca867b8f5f1 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -160,7 +160,7 @@ static const struct of_device_id gsc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, gsc_of_match);
 
-static struct regmap_bus gsc_regmap_bus = {
+static const struct regmap_bus gsc_regmap_bus = {
 	.reg_read = gsc_read,
 	.reg_write = gsc_write,
 };

-- 
2.40.1

