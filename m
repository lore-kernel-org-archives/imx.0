Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011C13C682
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113827; cv=none; b=e4YlSaGTim8OWERtMB/JObkWxYMW+LNiNwMp296yDu2NluHKIezuWpIanpYWhq0fs+UIDXFHsPS4VUYDT3b6KetGMtbDXXgCmiH4kF3Qhq2oPIuRbcoFWqg41uTu/pvuFWte9M/x1BvNjwvjQbeyqIVl28KCZgudz+jzxOAU1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113827; c=relaxed/simple;
	bh=V1YaAN6Ae4SYUS+F2fqEOGoyBhvW6e5jyjeki/M8uo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0QgmXZqvkHHSNzzOLo2buCyPQX34ML2Xf6heF5qCcQRU1nquZu+i4IL4EPp8zOlpC/1pZs0VeCQ/wvaCU1hW+coRVe9OhPHObyIBt9tYlfqCsSEgMlZ9SqCEx7OBoVCZfs6rWOd3LXvqmhxxXxYDQa+DMwIrrFD2joopkqV6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHDu1c1A; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHDu1c1A"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee8911b451so9834361fa.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113823; x=1720718623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEcKMLoBT3vk4y3IWrtrUEpgZYcFGVwoc0kCUdiwlg8=;
        b=lHDu1c1AWAQ4BeBudURgII7Gdb9IreK4X7WjF5aJQz8PmyiYxVDfZkOg4IORdQslEi
         FYB1IZAzNJY7hGdifXFKAbD3LbzHbxOwLvMfMFCzjehcuU8+jWS20R6ozEUM8PVYrmcj
         5zzq/pMEfGlX7hdM+oQ/gwq1pw7zBPKpC+Wz96JuMSC3KFiBHAB9AhN46Q7PWfoy1xN3
         3mBhbPHnH9CBHSixSMxSEP/Z2gGmcwPE2ubRw7Pwv7dLuKAaQ0Er9xybZyPx2rUATTxt
         UD+vPRm05o+xeEZIyXIMOdGnu9Vs4yDdA0F76VrnQsMd4QnHcJI6K8msUCe3/idv+30B
         Mzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113823; x=1720718623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEcKMLoBT3vk4y3IWrtrUEpgZYcFGVwoc0kCUdiwlg8=;
        b=mNBZdar6/F0o3P3LIesMmY5ekOvxhwR8E9rw+1kd3QRVU7M07I63hYE6VM8yCgOl4S
         Beun8g2eUZP56yDZWaJwvo5GBDz3t83422HQYpEdmqUOL9/gKlTZ3Q7XZYLB8m4KWmqq
         6xMvXP8d9zC53ES+iinUEna2OZKNS/3Ia+pOYBoAfN/WWFHfAYfsM3E1Sk4y2ZHXX7+q
         txMLMqdXVpI5KXBXv1ASum+EklxwRjPycwrVPr2dPECG4/UmMUAZiCqfGCiSy4QKe2ym
         0bNZW1XH7BhOOd40DRF979/aYrsCd3+gHsbRi0F1lgIqJzOhrZQyo2XN1YBwG/ceFvKx
         QvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcal58+xRcQlgH06rSAMgPbRSeMcBneGdSl9mL7C/x7dFAVpGmCblj89Kxej/eu7jL1rb3QvFGeTafSvCksGay534D
X-Gm-Message-State: AOJu0Yw14DjFMooz1WekxSKVBT6CIXq5Kxe7Y8y/lmx0wAKBCJnsUacc
	PD+9lJIuIByyJmgJNQGLrU6DfpaEXoA+fas8XovLGyAXo9vuHGPt
X-Google-Smtp-Source: AGHT+IFNP59IFboyukf1rrfIMaw6kHzCXFpazPd2dB/0uvup5SShiaC7xDpvSqu5YY267U3gS0hiPw==
X-Received: by 2002:a19:ee12:0:b0:52e:9ebe:7318 with SMTP id 2adb3069b0e04-52ea06b7845mr1641184e87.43.1720113822765;
        Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:19 +0200
Subject: [PATCH v2 09/24] mfd: bd9571mwv: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1160;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V1YaAN6Ae4SYUS+F2fqEOGoyBhvW6e5jyjeki/M8uo0=;
 b=UeWR2+z6XmU+2iBQpnyuihdm9i6qK/rcCaw1b12r8oK8MhRMJIyAVI98/jj/H9/QhGmnanzDw
 YeBwmgZ+wdbA+6PBSsftXrA3de/3ic8/8AP/xLAgw1JjbbW7kkouDCs
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd9571mwv_irq_chip` and `bd9574mwf_irq_chip` are not modified and can
be declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/bd9571mwv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index e7c2ac74d998..db8c2963fb48 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -93,7 +93,7 @@ static const struct regmap_irq bd9571mwv_irqs[] = {
 		       BD9571MWV_INT_INTREQ_BKUP_TRG_INT),
 };
 
-static struct regmap_irq_chip bd9571mwv_irq_chip = {
+static const struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.name		= "bd9571mwv",
 	.status_base	= BD9571MWV_INT_INTREQ,
 	.mask_base	= BD9571MWV_INT_INTMASK,
@@ -159,7 +159,7 @@ static const struct regmap_config bd9574mwf_regmap_config = {
 	.max_register	= 0xff,
 };
 
-static struct regmap_irq_chip bd9574mwf_irq_chip = {
+static const struct regmap_irq_chip bd9574mwf_irq_chip = {
 	.name		= "bd9574mwf",
 	.status_base	= BD9571MWV_INT_INTREQ,
 	.mask_base	= BD9571MWV_INT_INTMASK,

-- 
2.40.1

