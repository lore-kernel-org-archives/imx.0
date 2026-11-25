Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624130;
	b=0RgVGD7yCXfGOf+zVJ9jqaR7QLyPfK5J85/2FWxTgZt9C84CkBu6wQffOxGHsqRSFLXv
	 RDHAmGHqC4VfStvBU8YDynAJwjMkXCTto4WyyA8r4I8PdR11JHfgiykYQFzU1PYek6RVZ
	 eRcX9lpMAiae4zefdSaYwuJm0BG0fmDhCAtimwh9vyqn13ok3w8nEt3eG2qQQUp7vbP6f
	 cbHO+B3KkTCk1pPCgVbuFElMjWFMyidrqKzpkx7OsY83+xWKEYBOK191SyiPYyGTuNgdG
	 5qUrW6nOB/z+yjz4HmHHDfxgx4c7CxVkrnFarSSyAeUjADPVilqOGnGhKwtaOrM92kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=;
	b=12f9VRYuuRcoVyrF/f12uRXiRNvx0GMlEXMPM0zzAknNZToEpLCjjv60AgkrtG5w91nT
	 H8j15JG2G2gQ+WngTeymT9tUnogv42PZKRWhOXgQzRBHh7ZqsiOIC9p3QiTPKcEiKK3tF
	 sAz0sndAq5H7QS0cnCWep7guzhaVUnlmwlzO6BvWYf7us/WtKX1Dp89bWrEnXen8OR+oT
	 LZToRExuyGEnx9M7Z7ZGZzZSKkXWpY1x7uBCDtcENxesxfFV7yKzJMtC7K7L3PZ1gRUfA
	 gUVnk+8zV5piXrrBT4Rx4yI/3AmNZ2Ufzz6m59NFL9qeJRuicA67i7wYymWB3duI/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ISwl3XpM;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8EB606A335
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8EB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ISwl3XpM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34880555e9.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624129; x=1796228929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=;
        b=ISwl3XpM5LxUYKN2q+C6oawq3z+pok3GlTTlIBWeDDntP45Ms47WTyGLRzLnvd9vW5
         wkZUoqKWDPwKVoiXfC3BuddbgcXJ5qpzxgkqcTR/elOE3Go0Aa13lR0LxdxMUr0nmEp8
         e+hUHRwfbaJ3Z5xf0dPk6YxLjDhf2tbj/CHG5uYQQb83kdqbjm5fZlZ7a0yi/cA1eKpV
         JZyJfUfLZ3L8tBM9S7F1QQqR6uKeJ4ka2hN5zfaHtf/YEUBXVN6PaaIHR8tegQ4eR3ts
         7B4K8m3Mxc8anINizMyWLQKrQ/3hFVfG2yE/MWMiMSVaf7i1gcJ6PVVK0siVEoKzPHcU
         e6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624129; x=1796228929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jkpq3Qrv0SgVfFgdH0HjFFR4TiuDoTsfQLCdgkzvL4U=;
        b=E1ZOv3NO+2ZCGjifqXBOIZyoBR9jgoVVzw8uhGyqK1/NiUOVgigdBM8xHrLXLADZJ/
         03nqxMuZmgl1b5BsEvgjZR0iDW4MzhvMYBg7YtZ008BBGgCIbIE5u9ev3L1ykPec9k+P
         lXLyto67dc4I0Y4cz0WPd1n12gxUahzHpe1aMZUZZwMY/74oUhy9Uje5KUuX3TdvsNDc
         uRGteaHdjjr6Jb+yt7SXpryit91PNWMbd93Dm5uj0HSYrvYfFNdzsBPlTvJd2CKco2GV
         FbcH1elIbpK71aIp06UB1Z0pCfQnmBMNsolHG3m7xZUD/TZUoRTP5JHsVNMyuvx1VLBK
         N0lg==
X-Forwarded-Encrypted: i=1; AL+hErGqKwNMsM/egEs2xD0f8+w27SNsHY5pgWEbM9gkss/Ka916VVM5L8NSG/POtSd9aJDL9c0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8e9Ypwaj072bQx13y+d9xFeNnKxXkD+BLZAxuFMdNbm20b77ld
	kkEU1tqS6OXpddCZ7ZByPbStJCcRpjHDXNSdff8uptNflPKqydx7BbYcTJt3DrGG810=
X-Gm-Gg: AZFdTZcSDUxrx/NNvimJIxI0OyL21j3Bsch+w8qiYDnuFlYtDG/7XEGcxstvQvZQcbE
	V77OnmVtQdtBV2kDUbbBXr3X42uG/ilCKkZaw10Vna/G+EET8ZOpoBD52q0GMLjjawZQqjOhRyu
	ua0ltfk5uphjyzy4HcEuJYvF000MK1WDkkg3wMRGnoRIXBkz2RjIymkfms2jQHiTUEyRR+uK3LE
	J1xnrKgEHEVfGDvadQPRgzoEPOsgi0WUAiCodjl8U7SBkHPFHzz99VtBDFjzYHu4TOk+3K6PXNC
	uL/otfhazyDiv/lqaP1zeXrKMsTQMO9i+pBbZ+POksG0WkWEy/2URmCeEGv3dSDAY1LdVGr68Np
	TMevQZYd3RURIXl6kPp4FWFt1VrKc6DQEaUdaNlz28JyNQrEtB/G9dWmw5I27aOFwYjCsryPGFB
	medVg2DxiWE/rErblf/Bp204RTUnyvv/K6EVbRPYc0pnCkBsW6WHeByz4ymryEFnazsmKe2PkzI
	ATqDhWAzXKgHIq1vTau61rfMAktTKTwq9ba2UCGCk6iowvwe4tylIkdN+DWseX18tAbJ6/XZYkH
	FOMJRfLNt12IZ93NBglAL0qKRzeyU9Q1q1zd8ZQ2k2w3Aw==
X-Received: by 2002:a05:600c:8b11:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4bb88826835mr369069605e9.8.1795624128871;
        Wed, 25 Nov 2026 08:28:48 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:48 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:31 +0000
Subject: [PATCH 05/10] mtd: devices: Unify *_device_id list terminator.
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-5-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=5688;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=e38PNjVjjK9fQET0Z5RSjQeQUR9n82Nx3ix8ylWZkAc=;
 b=UmynCOwoYM4GS77+J2oETnIgPnWornuOiaAN1UaN6yWzj88g2jweJvGkqkw5pwk01i9dDTzKw
 jhi+aPV+h/XAaOKJSEM/GC0voUs+NMNtgllLP1rD+cGxum6pU8i9x47
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/devices/docg3.c         | 2 +-
 drivers/mtd/devices/mchp23k256.c    | 4 ++--
 drivers/mtd/devices/mchp48l640.c    | 4 ++--
 drivers/mtd/devices/mtd_dataflash.c | 8 ++++----
 drivers/mtd/devices/mtd_intel_dg.c  | 4 +---
 drivers/mtd/devices/phram.c         | 2 +-
 drivers/mtd/devices/powernv_flash.c | 2 +-
 drivers/mtd/devices/spear_smi.c     | 2 +-
 drivers/mtd/devices/st_spi_fsm.c    | 2 +-
 9 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a8a77de1c6f0..1f0b1b0f4a83 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2051,7 +2051,7 @@ static void docg3_release(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id docg3_dt_ids[] = {
 	{ .compatible = "m-systems,diskonchip-g3" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, docg3_dt_ids);
 #endif
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 05a4ebe21e4b..31c0f414f449 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -225,7 +225,7 @@ static const struct of_device_id mchp23k256_of_table[] = {
 		.compatible = "microchip,mchp23lcv1024",
 		.data = &mchp23lcv1024_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
 
@@ -238,7 +238,7 @@ static const struct spi_device_id mchp23k256_spi_ids[] = {
 		.name = "mchp23lcv1024",
 		.driver_data = (kernel_ulong_t)&mchp23lcv1024_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, mchp23k256_spi_ids);
 
diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index c6e83775638d..60dfe0980557 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -372,7 +372,7 @@ static const struct of_device_id mchp48l640_of_table[] = {
 		.compatible = "fujitsu,mb85rs128ty",
 		.data = &mb85rs128ty_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
 
@@ -385,7 +385,7 @@ static const struct spi_device_id mchp48l640_spi_ids[] = {
 		.name = "mb85rs128ty",
 		.driver_data = (kernel_ulong_t)&mb85rs128ty_caps,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, mchp48l640_spi_ids);
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index e766258d76f7..607c5cbd2a83 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -99,15 +99,15 @@ struct dataflash {
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
 	{ .compatible = "atmel,dataflash", },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
 #endif
 
 static const struct spi_device_id dataflash_spi_ids[] = {
-	{ .name = "at45", },
-	{ .name = "dataflash", },
-	{ /* sentinel */ }
+	{ .name = "at45" },
+	{ .name = "dataflash" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, dataflash_spi_ids);
 
diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 55a945c1a67a..63685615a02d 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -863,9 +863,7 @@ static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
 	{
 		.name = "xe.nvm",
 	},
-	{
-		/* sentinel */
-	}
+	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
 
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7c6b2852916c 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -371,7 +371,7 @@ MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>[,
 #ifdef CONFIG_OF
 static const struct of_device_id phram_of_match[] = {
 	{ .compatible = "phram" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, phram_of_match);
 #endif
diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 4bd7b41a03b7..596d592a8ede 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -278,7 +278,7 @@ static void powernv_flash_release(struct platform_device *pdev)
 
 static const struct of_device_id powernv_flash_match[] = {
 	{ .compatible = "ibm,opal-flash" },
-	{}
+	{ }
 };
 
 static struct platform_driver powernv_flash_driver = {
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index dc66ed852d80..947d82bebe4a 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1079,7 +1079,7 @@ static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
 	{ .compatible = "st,spear600-smi" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spear_smi_id_table);
 #endif
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 94872e03a04d..abdcef3c91b0 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2124,7 +2124,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume)
 
 static const struct of_device_id stfsm_match[] = {
 	{ .compatible = "st,spi-fsm", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, stfsm_match);
 

-- 
2.53.0

