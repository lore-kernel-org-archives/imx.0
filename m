Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB61FC7ED;
	Mon, 27 Jan 2025 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982003; cv=none; b=N73zPiHGH2d7MQnMgHwsqi1TipkEu/LePOUeBdEgwXTbBN6PV6KpXViCBA94I/NLodLz8tyjS+cb5YV4On8RmqE9iq+ROxept/P0GkG8gAC8XVdCaDF78U/j1AiPyGpV2zSEk7Ka0xleWjzveKkeaaKU+Vm9vuFX+qzTO/a8/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982003; c=relaxed/simple;
	bh=LQrJh1cj1U0MJFZHGoCZeLdGKBz6XSkjoRXJQp9xyoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PV56FOBXw+R1PJIKceonxRzUUHzuilrCnJgv4PwQDdbfS1dC4gFLWMYukm2C6owiSYAVA3iNH3vdzGhSTtafSrCkuzrqyZIJZvAYwRg9yIvU+0Ky/+CY5isaIv5X/6YiVpwo5guDJCZjW49xMZphx5aMmh6dudiOTWYBVaDBxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq2dCxth; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq2dCxth"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43635796b48so27913485e9.0;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982000; x=1738586800; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=Fq2dCxthP9l2+sqvCXZQRGLH6osVpgss0RgWz9hO89OsGPqFQaGY5qWUuOQXvLEIf2
         bVmIbuCty5mQz9CphltyEPd1s+q5sr3c50wrA/BD8zM+EILf9u12TZU77osSNA41V7cf
         rgyiA0csc8pzAbHtOJy8q5oyKCgoxOI43so/EzNAMjrpAgD5I8uu0Y5qcmMtBpSvFw2e
         r6K1nWkSeaqmw3cqeGgnyEs5a/if5YM6oeT+U7qrLKOOU+OUO5xGEb2Nzvym7UyCbYYe
         dQom51WX7OMutF9zZDgfXfCpZOY2nmXzzUM6X8wsaX3mP72vCCuKy/Es+zLrkSsy8RTg
         zdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982000; x=1738586800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neEI1yakl6Xdd18M2E+K/Ks+Ljapr5chXpNCjeaLAxQ=;
        b=uiSCWI0LtUeYgsnAeg3kZgm5kUgSRkSJMKqyUFzm5fo5sgxh6Iii3FNvJvRHh2jf6O
         Qh2X4j3p42bGF2KS4MQ8QMALk5Kd/jAX4Xwi6WM/tXxMlFpFyXALvOPVDIT0ryiRxmjK
         bUp3flxr/MhB4grqz/jFGJlx5QnT+0qEhQIb6e5rzy3/0yltyBM+ToOf8+IxYCj154Fe
         uNLb0WwKK/KR4cAxb4OoE/i2KKEFWO22Z3c/axer6mOiNbhhZrHT6H5qL5K2QxU2nlxF
         XBIYp+WrICwkH986D4WOFoztnpP1vpmHNvqzccUkCHnggWh5JJ8zSY4cNDt/jqhIOC34
         a9pg==
X-Forwarded-Encrypted: i=1; AJvYcCVqCoty9arENbCfH8UzMZxBDrsiJx/eIbCyEx67YOyUltoFko3K+I6+A5aN4WE+CPJDSK1zDoj/sNpyiEE=@lists.linux.dev, AJvYcCXM+KrCv7H342wLfvSqgihjoNxEW6sWAgyHMDO96PP0wc3JabWbjSeSeAiUSfJHOGZ28No=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY4rYD+DIaNRcJIjOD2roCMz8TYHRgoy8ZAypaN1PkEnGat/hA
	Yet7j+V0q4TTZyBYpD8YRXR+vsmzq29/DyMjeuNWPuVmTpQWFUUL
X-Gm-Gg: ASbGncu8pxgNljYr8lgXYxpw/+IMU+IlFwIZ0jIK/TLt3lWWcW8T7/DjAYy8JguehPI
	kmqR5Hm61KIYHbPY69IAmb8Ec/gMWdAZlw0Wk9//QFhURFaEfecGWi2eEuy3vn6UFHiU13Dz29V
	mq4XCDLRa1wzpPHrsfqAK8tX2NuLs00T+svpReBjDFH5pSYh9f5+qVbsS5PE0KMutFspPe0nzWi
	cp19w+J5GQpiXHvJbJzeAaKmGTJpGKyOOaLJVU22i/XZ/qVooiTMpooEbHHdjqMaXcwl2KDPVRN
	JEx0
X-Google-Smtp-Source: AGHT+IE4B3ZWBvjonvFeGkuLk5blZCAjtvZWvPZJwKJKIySnT1AS6AlcYkd8YzGAqRr1xASJxsefPQ==
X-Received: by 2002:a05:600c:1c14:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-438b8841d5amr149069615e9.1.1737981999987;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c38sm128625445e9.11.2025.01.27.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:57 +0100
Subject: [PATCH RFC 02/14] ahci: ceva: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-2-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=LQrJh1cj1U0MJFZHGoCZeLdGKBz6XSkjoRXJQp9xyoI=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArRFwGWZoghduZ5MsMtU5JP/K/knP54RrlJ
 u3CYrMYTkSJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tY/5D/4h8WBFOd6bLxfcgBA6HQZSQVHtRe/MmxwQhqArKIu3NAzo6IvI5unGAIVRFfP8J/6taIZ
 coTadHR6BS25WGCU/geH+pL7tlRftPl7w2KPA53Ty2vLyAcXhjTak2OjFJbepzYKyLGfcFm8Enk
 mvYUOXom9+osUVVZGr2Umi9NzesNQHW4+NmAk0BxAXY/v8/ABC1Pkv8T6gcvM2vbB5Tt4CqugXU
 LnC6yqpRf4bZH34M69d+iT+0cZayAlqbS5E8AMrICLI3tvOT69hALbx8n2VSfVFcho3CbJsZ2/m
 WFrLEpDUSjJMZ+PUCkuo2m6pUQHo/2qFKhd2RD6Jp2g6QGthqal4+J5pkGeN8ctZMPEydKW5Vj2
 qhHjVovjhbYqaJUQZRw1hDF3lWToR4EFOQfsYk1CizgHiUnYxjOscVH59b7EpvgbRh0oihBWtN4
 deMGS+5dEVI3fcGE15tDralQuwpz9z4nE57mq7OCGIPgMyTEh6rf5PCRQuF5tnM0P5k1oyeovBO
 hLm7yrCPsLqTSZej/Ngu6KMJBv/kP9z8TFv0kDKTp4Y4kqzsUNb5kK/qxEliK3qAEW5AaS3Q5jh
 7JaDUx+YgJ2Veym0I/RZ9xlsUejgS8M/P3b8++OXTFiu6Ou1Gh/QDgZusSKawfMHCMOReT43FBy
 Rz4SB+DJyzfb7og==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_ceva.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index 2d6a08c23d6ad5d1d11a7de7fbe2968201d6095a..76e55f1f7db1f8349d696e92d8964af609532186 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -363,12 +363,12 @@ static int ceva_ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int __maybe_unused ceva_ahci_suspend(struct device *dev)
+static int ceva_ahci_suspend(struct device *dev)
 {
 	return ahci_platform_suspend(dev);
 }
 
-static int __maybe_unused ceva_ahci_resume(struct device *dev)
+static int ceva_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -398,7 +398,7 @@ static int __maybe_unused ceva_ahci_resume(struct device *dev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
 
 static const struct of_device_id ceva_ahci_of_match[] = {
 	{ .compatible = "ceva,ahci-1v84" },
@@ -412,7 +412,7 @@ static struct platform_driver ceva_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ceva_ahci_of_match,
-		.pm = &ahci_ceva_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_ceva_pm_ops),
 	},
 };
 module_platform_driver(ceva_ahci_driver);

-- 
2.48.0

