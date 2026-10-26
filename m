Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032183;
	b=qyp4yggBX+PKDyCWbUB6e51DvpX8fEsRYtJVpTDitDcw584C3oh419DsQmOnQLMgyffp
	 VEnZqbrI8yhQ3SxyYHjn1rcV3FI5Ht767vfnFaTIM1Y+2un/y1r4ytNW8MHA+9azIjsi3
	 j+rpj+4+/+jJCTZ02ExAaExu9nOHBMNgcyPQWJg0xB2NSnWls7lay71RZ6QupPwwDsCAr
	 0u2tQMrYz/ntwi1+oUtN/AW1vxpytqBaSsFYNozkZkCXdUEsODXhWhngre/Fejs8FGon4
	 zBuTwwDvQdPJDy8C7QcI+WlouA6HpjtbpAdMxN9qOFVnF4ThHA4HciCK5IgZeCo0hxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=5XHFkVSU2mI8hFZhlF5OXLEmlM8a7XkAhezO4GY2NkY=;
	b=2bddz8U45mnJeBQkpkdIArLkV5F6PKXYJiN0edfluKfc1f0ZSzn8odDPal5QL+nJHbr1
	 om0TjnA8ifnZDBjP2F2LlEQy8oYPaJ/IBcXQtAva0WAsMr70CZS9gP0NzDLkOdmgPmks9
	 faWDAAm42MSp421o1pueaYf4yvHsxC1Yy8Sf9731W9q7DdIzz8l6ZIaJr080nyxHX4IxQ
	 AA3ZwPUUY3/GiYu4XE2tcUx46scyUEC4RY+SaViOVSBYeQDyhdgDop9x5ZzHtiWrP1fYl
	 LqKVpsFYl+3J3Fld+wlMJ6qdLb7uqouYafbGoTM2sWTMfr9RRsG+ns9IjhfR6eMaWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="AT/C4Kml";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41DB60A260F
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 16:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41DB60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AT/C4Kml
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b060ec084so2046709f8f.0
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032181; x=1793636981; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XHFkVSU2mI8hFZhlF5OXLEmlM8a7XkAhezO4GY2NkY=;
        b=AT/C4KmlVXhYnEeycAYdkmPqIK8b+ciesM6xBVoHQLMWvG07oN0d4hbjMUZMBvYHl2
         dqOr3BZG8DfS2riCxp+V9IfPtjDHGtIfUwah4uMqt1fISwbSV1A6Smyva/QEHtamUaF0
         DuVcagZo7AVultY86aphFLciw4VbPzPEPhy1zNPDJPPGKBj6k+gUFuZGlfMQtr4l1yVo
         RvdypgXkeiXtCRba0UI9rbZxFmlgaqCoZ+2r81sgTbbSWPoYBxvkv29ysUXFvXstnrZZ
         S9j20Eu7Gw9UaIUXHdKS1z6gxFW7Ud0RzYs9sQkqPUQjEUp70tOD8ZFovXAPuEioj221
         a7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032181; x=1793636981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XHFkVSU2mI8hFZhlF5OXLEmlM8a7XkAhezO4GY2NkY=;
        b=lworlEmkV3hSXAY2fGwz5pI9vR5P2aPT1dTDjKdloqs53f1MxxWFkDgxLtJHhCykM2
         hWv9KUi3gS39yEm+QzEebCfNRqsc5H5uoqfb5wJ9spcx6TZnvvbDaONRZUDtyli+ysAR
         eo98YYL0QsCtcHYBk4esyTc7f7pARponf6+8Mq7vDsZ1lYeE5x1UUpf/c0u2+PpoVWCo
         127v7xV0xJIAw2pD1fqTNIHaLTVQSU6LoO79ScDLEVNG0kpQp9zHvn9COMaeU3GrVkSv
         XuS58d0M34JxVd2S0YNzHg5Ldmze2XmtPYJGuVM+RvhcuT5McDcMgYY1CMzhouZLjqmj
         aZRg==
X-Forwarded-Encrypted: i=1; AKwUvBxpJg5+bCPyJAt3/m+mrIQmrGi3vw5rDvh3qD2MsybsRmH4PSTqYgPj3UGY5JHydb3alGg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIdBINpSrdrhYvsMJIu5faBQlJC4fAgx6mLZ60j7k8uz5cgX5J1
	5sXvRnTR7auIuHMUgW3l06t6uyDixT942D+US2gbruU2V/vSdU6hskTcWLEGWqXqDOY=
X-Gm-Gg: AYBFou3KAneo2UXdcC4B8lY9MdpN6FUdz6Ige1RHF6xyXlrbq8AYH5VSuP7Nt5P4YBg
	ajN0FYgHjcKX2o4A3m+ftHmozqrxSdxePA58LkvoYorRQnOHwptk3DkNS74CNUEEgdd6HajJqKr
	cA6U12KGcGtR5Cp1a/Tjp1uSVfyxrv/AVi89GB+eSSO8Nxz1WupB3yywBR1MQlxjxB/702KG3vP
	gbsKRC+TOTQ+WQpin2JoJ0orTNLNLtyaOfZNm3EzbgEWka2u4HZW4pPA50cyOUMvUtwSljQ0gu7
	3o6Fa2nVEM/YUX/YaaL1sYBMNc0E3RMGjynIN6PooX6KKysY/BgeYimC888+Ym1dXf9ECUXbETf
	zvCU9KzDVgXGT5GroMYVURpd/elzAcsYVZNNH23WPTf6IdBAhttDFH4nhmgGGowB5XmQLNMqxyh
	KVvFvkWKVgN6sND7SphNZI5essQOd2LAaLyB0WlxRcs//mA/lXPRjeGprFDDeCuZviLwmo0ND/m
	XPBtIVf5hJew1aIfQfjBb6CVsMzyVbanCpCAE98hkOBD2rFvODqX0nLijAEQILzpbSZH7YgYsnI
	w6isuqY7JEVwm4NfneJfPU6zZ36kyU9xfpE6AnXRyyw=
X-Received: by 2002:adf:d023:0:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48e3eba194fmr10567506f8f.47.1793032181272;
        Mon, 26 Oct 2026 09:29:41 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd48fasm17263736f8f.31.2026.10.26.09.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Shevchenko <andy@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Imre Kaloz <kaloz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 09/22] gpio: Add missing OF module annotations
Date: Mon, 26 Oct 2026 17:28:20 +0100
Message-ID:  <844cb6a50d79486b95e8cf1cb369bb031268cca1.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7997; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=akpEFUS6e+7t/TXVTIklqyBqCRw9KFUW6hy+RHPpIhs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+yOx9prfz6bp503HP8eXZAHOpdRnELItXt0 SBDYxp9/KaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/sgAKCRCPgPtYfRL+ TuLjB/0Z4uTawxhv4wdGOadVvapBIRFpY9zNpr0rRvyqzB7OO8+fvc281IL9X4wgMt7ASOWDEMQ JXtCeF9Spe4j1AiPXCCEx/oL72QMlt+aN5+L0Utae6oaGnH0hpcGPR22ygd5UbctnxPL4Iirs5C yiMqVqz30rR3WWYLeAg45zq/uMKUMxJvbDUiGl88CK4nFNFNHo6Mt6gOunX0nMMKGmDFFbddQgn L6xBsPVfiQsLxfNczO+OAXigUi6b6IN33K2bCLk6RMnyECwMOop7/eXCReIO6+vxsVePH4U19wb IfQfTWGgr5t5KkY4UaR+lU91oayV4M8M9BmoVV3nCcz+VNHa
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an of device id table is supposed
to declare that in the module's metadata. Add this information for
several drivers that failed to declare these.

Acked-by: Daniel Palmer <daniel@thingy.jp>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bcm-kona.c    | 1 +
 drivers/gpio/gpio-creg-snps.c   | 1 +
 drivers/gpio/gpio-ep93xx.c      | 1 +
 drivers/gpio/gpio-ftgpio010.c   | 1 +
 drivers/gpio/gpio-imx-scu.c     | 1 +
 drivers/gpio/gpio-ixp4xx.c      | 2 +-
 drivers/gpio/gpio-mpc5200.c     | 1 +
 drivers/gpio/gpio-mpc8xxx.c     | 1 +
 drivers/gpio/gpio-mpfs.c        | 1 +
 drivers/gpio/gpio-msc313.c      | 1 +
 drivers/gpio/gpio-mvebu.c       | 1 +
 drivers/gpio/gpio-nomadik.c     | 1 +
 drivers/gpio/gpio-pxa.c         | 1 +
 drivers/gpio/gpio-spear-spics.c | 1 +
 drivers/gpio/gpio-xgene.c       | 1 +
 drivers/gpio/gpio-zevio.c       | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b0beffe48b7d..9bcbee25f685 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -522,6 +522,7 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{ .compatible = "brcm,kona-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
 
 /*
  * This lock class tells lockdep that GPIO irqs are in a different
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 157ab90f5ba8..2e159ea41791 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -131,6 +131,7 @@ static const struct of_device_id creg_gpio_ids[] = {
 		.data = &hsdk_cs_ctl
 	}, { /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, creg_gpio_ids);
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..278b1093dd22 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -377,6 +377,7 @@ static const struct of_device_id ep93xx_gpio_match[] = {
 	{ .compatible = "cirrus,ep9301-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, ep93xx_gpio_match);
 
 static struct platform_driver ep93xx_gpio_driver = {
 	.driver		= {
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 11e6907c3b54..e29df8d5e571 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -323,6 +323,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
 
 static struct platform_driver ftgpio_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 0a75afecf9f8..3ebd3d73ed58 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -114,6 +114,7 @@ static const struct of_device_id imx_scu_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-sc-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx_scu_gpio_dt_ids);
 
 static struct platform_driver imx_scu_gpio_driver = {
 	.driver	= {
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 669b139cd499..88d48cfc9017 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -341,7 +341,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 	},
 	{},
 };
-
+MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
 
 static struct platform_driver ixp4xx_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 00f209157fd0..2c828bc922ae 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio-wkup", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
 
 static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6868f673831..ee35da06cbc7 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -318,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
 
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b1c4..1078b3018970 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -295,6 +295,7 @@ static const struct of_device_id mpfs_gpio_of_ids[] = {
 	},
 	{ /* end of list */ }
 };
+MODULE_DEVICE_TABLE(of, mpfs_gpio_of_ids);
 
 static struct platform_driver mpfs_gpio_driver = {
 	.probe = mpfs_gpio_probe,
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..38932986dc36 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -688,6 +688,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
 #endif
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msc313_gpio_of_match);
 
 /*
  * The GPIO controller loses the state of the registers when the
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0..d433b8a9e230 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -993,6 +993,7 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 		/* sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
 
 static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 208fed631975..90293329b40b 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -719,6 +719,7 @@ static const struct of_device_id nmk_gpio_match[] = {
 	{ .compatible = "mobileye,eyeq5-gpio", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, nmk_gpio_match);
 
 static struct platform_driver nmk_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 3ff21e899278..fa2087acc025 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -583,6 +583,7 @@ static const struct of_device_id pxa_gpio_dt_ids[] = {
 	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
 	{}
 };
+MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
 
 static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 96a0e1211500..3099deb2b290 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -157,6 +157,7 @@ static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
 static struct platform_driver spics_gpio_driver = {
 	.probe = spics_gpio_probe,
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index ad0f1551c271..b34b0c58b67c 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -191,6 +191,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 288a86c8294a..f1c5c6a20673 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -213,6 +213,7 @@ static const struct of_device_id zevio_gpio_of_match[] = {
 	{ .compatible = "lsi,zevio-gpio", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
 
 static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
-- 
2.56.0.rc1

