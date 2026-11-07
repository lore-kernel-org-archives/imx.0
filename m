Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082398;
	b=t0XbsAmSw1U8OoICt5xIOXNGU1QWTXmqRAvWXU//lJrI+J15kq3WbjUXXODXD+i5UqNW
	 2e9ap6yTm6nT4e9Ot9THNzTCUTxwC1Yyf3hiwilYVrBG7K33kkcR1DEGdd30VbvqH62j6
	 yHgqb/g2BeLi7tAvnOhDLxsiUlO0DMhp9+pfYht+Y+rAdeTWZIzaIbcaQEKhPL7yuCYXe
	 yDWAw6ERCFcb0SkQOTjKCSc934lUEf6ZN3xdvYRajXo6+CqN+CIAwkEiSsEBs+vKNGuEI
	 xJmwmtGM1KY9b5B6xL7y1WS2hwM+lwXy8KORBiWQTLGCAzpCLeHsOkL4XWnDTrwGXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082398;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
	b=HsqWyovTT94BilMVvt8AewXWx2UUAaC0cM8ZLNJeOC81CthDEIXM1ivYOMpOMMGJSkSY
	 xBEwlmtcOGXBSvJomrHGl41MtNezaYw+0ebFKur951d5N/YSiSCUneHHSzK5ChOS0B8So
	 azMeVBxC2/mL0eMYDLwg+x7ySt4qMP09p/OQOIorHdB3tEsNi0FkBOhQW9LZDt9UHmGsr
	 LWkQju15dQRiF0p6u9SoaSSrYbR6np5ADh0RS30uJfGcDFxks0l+5epKBS/5zcgm4sYLb
	 x3sdnwPjhCOlotAOXKNigcyaHGG7nK1HO4opqP4D6jMI8zm2ND/SRft/XKkv39Z769A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10C606D83E
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C10C606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48e9476e26aso1177fac.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082396; x=1794687196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=ou6WzMcepVJYbw8CpGYnL9lctetiCzIBF29V0ZbvPMbOlAR2bWJZASho3ZZoZfC4dn
         pzXC+nQjVPC1yFmjilkSEyeEg5g1FCg2rBXEEXx58DYUuD4R2KvxkGNsFfdq5c3vnSKX
         L+abYMFQWm8MvH3bhQFibohjp2BdhP1+URp6S5FVdIbjpJtqJMuVEvx1gH3BnMQ2hdBK
         Cjm0/hWQ11ox1dpJvlS9po4fl/kts5CCNopUR6i28eIwQmqEaFjrphoOTT9VaB+v1uEv
         UqX0NEG1rFJeghA8w6ltPXt32u495625Mhz9gqU3miqwJ96uRa7YbB04WkD/wxFuB5/h
         nSpw==
X-Forwarded-Encrypted: i=1; AL+hErFANrS206V5ec0EZ82VU8dpPeomIcrVaeuLkHBlBEYgbUZ/JaRiXfhEQ9RypSvM96wMpgc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Tj+ReSxxxEsp5fQY3j7xUk67+8rEtIXNRMZtViGjJDmq8sC7u
	MNnZ84PTzKtDE7Jaa89W/Imv6CwErnlrueJ2exPQo0yxXCAObfQwGIcV1Nvj5jGKSv0=
X-Gm-Gg: AYBFou2oxA165zzCeJtUd836/3/nh+SHhrW5e9bo6Fiz7oBvxkFYaowur853IpAKvaT
	+233aVWMUgxlmWDZkmTpjLwPeEaNCkMqtaw736g8E9KzP6PkHRV2FbFYMBTsoOIC54HXsAMIBQw
	MOCcIDLFvdCIPq/Pym3Ft5mQap0Y1Z0WM7id5AlJHyTTTSR4x4Nhl7XwLg472eJ1EzKF2PY6fOV
	dTd8OStqYFaFjXaSUUxJA/pXPpdyvacOvYNX6yXYEJbX/KIv7xOE+i7wb/fFe+uogFU1EHXsctT
	teOIlJ3EJH3jYy+2whdOQqb4TES0w6XD6fdyjZ7c1fY7KHqoCypqrePCzbstryqBqSTd/TubmRa
	JRXqlNGiRDjVzYchkFeJy/vUxeYElO0+btgAjxWT8nlw5nDNMpwlmfGnJnYqKjgCVkrOEZYTmZS
	TFNC5kL2I2PPX3RCd4rasqBNEUzMiA4gWv/pgyeIxkqhOytbjh377bIxU9FOYBrvaoyKPTYx9sL
	cnpQKPjWaDqovDNWKJM6ZQyGz3whOBgFqN1ev3p8Zn1qwCH7YtG03kd4IzRgCAO4wlAA1GBHdPt
	y3IAzdlGe+lTOS4tlvvwhxB9ttguqGbRDnVk42KrPKdAvVVQYWMWra6gE6Yg
X-Received: by 2002:a05:6870:16c2:b0:49e:6fbc:cd5b with SMTP id 586e51a60fabf-4ad98df7d0amr4149316fac.55.1794082396094;
        Sat, 07 Nov 2026 12:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:32 -0700
Subject: [PATCH 35/58] mtd: rawnand: marvell: retain open-handle state on
 removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-35-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the layout metadata used by OOB queries and unlink before put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..f3967024411c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2600,6 +2600,11 @@ static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.setup_interface = marvell_nfc_setup_interface,
 };
 
+static void marvell_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct marvell_nand_chip, chip));
+}
+
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				  struct device_node *np)
 {
@@ -2630,9 +2635,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2657,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2693,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2708,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2744,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, marvell_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2759,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2783,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2932,6 +2950,11 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 	return 0;
 }
 
+static void marvell_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct marvell_nfc, controller));
+}
+
 static int marvell_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2939,13 +2962,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, marvell_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

