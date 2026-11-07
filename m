Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082456;
	b=GUPGjbUC5Ah3CYLG2KTIfGkpZrcl7y4fph8CPcb75sCjUt+4Sz6rkL2J8WwMzkCuPHwh
	 omJP2nNs2fXFktibW4+x2uU7IjvyAhaJxV2C3o3NOgap2CijWTpz8p6Q/xMJ1MUjADWix
	 3Yc7ezGeQ79ETpnrEUM9k9DYXa8rJQGV8fLaPA/YUrfiaqTxBVrj8yVFxfNdgeReiD+Oo
	 DzvK7aHfNXNW5apc3P9Lz1toSPMhD1GqgaKAanalBoZUB7oS1Bu7BG7UEoCtJcZKeT6aF
	 Hxb1jsvIVMEDNW7CBo/7YJaTJNBBav0mQB/xUi+hSLasyEa72SpDNJLvUNgiuTmJQKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082456;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z28hpkRxNuFHQxwJ5bnvo4CTYnv30xHbFPLm6nkYYQ4=;
	b=QYeqUssXV9AajD3j0otNvT+KMeHo0VG4qMW9fNtATpDpipUTT0LwmsrLUx9BJQsJj8JQ
	 Fmi7NcagpYQmZ/dRtjJv1XQTVyOf/NkE9nFtvZ2yrJ1a3E8WXE83buIgf9tiU9rCoCEKk
	 lF4HTuK3pWlQNsa9ecTia5jWTYMN/QZI3159gN7o/j8Zy1MrP+7cDOJLanpCSUa2fZxpz
	 OsKW8BDGWijWr7m7a7PwXQkXbZ4EPvFLmTLka/VCTAkDpQ1OyGUp6d6veboSejqziFuZ1
	 Hqtzpu7OwBiOUFvzxNNoGbaxz1PDbkZSqynPBLtjmetEHlivJv3rMUeHOI+37Ym7tNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AAD606D839
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AAD606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43bf9548df4so20681fac.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082454; x=1794687254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z28hpkRxNuFHQxwJ5bnvo4CTYnv30xHbFPLm6nkYYQ4=;
        b=dQ7kAp83azkXiI6vmHn0wt2q6dffcMT8SZU7aWwu3LmBMtInXPOsmwLg8Zx/jIM8Ss
         UZwf4Q1xgeb7lcGjaj4eCzvYV2erStjSTGCWmjmP+P8zFAGtT6nCV5/dG8qAsnvgrPDP
         nDT47NQlKzRtMpgKd4hhpsYJcFIe+OH+3oH/VhNqqDFxYPQH4a4uGfZdjvexeV4zCfRH
         kPmjwO0TLn3DJSr3YoXUKACj5+M28sdWkCgGdkDz0cW0GKvgzhE9NVXvDlRmQcUeUBNo
         Rj0dGv/5mYG8AmL9ANBanrHAjri7Nw+j0rLQzfW9r0QHqYejVRd+Q4TLjSyHP12NdTaH
         wckg==
X-Forwarded-Encrypted: i=1; AL+hErFxjJf/er9vVk2gRhjFTJdg1Zo8d+jt4Lcp4nDhdjdMnvmKhw4FWJ4Wp5R3T3FerOPnWcI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9fxlQAvsuFgY8zFe6xBc5g17M9TwKKmqU0SiZRdVf59KA7ivJV
	sJx9xIujI/N+mXzSvzRloj4rrZ6DXiQd/8VOqzyhVMqwclVJ3Vkbh6tO2BnWuepanbY=
X-Gm-Gg: AYBFou14ir3L41ji+oiG3cDh7UHcn5WSMVFo6HzT/zfpE7v9nL9gEGtd2xtpIjxN737
	KRGzhtpgtq/NG1exLi+eLHQcnIpXPac0jrPddEIZNTBRf8va16Ccb4KqfTOq2lwt/6mC20u2vIc
	xk4Y2dr7/A0TKbQvnpvUwbk3wwGAH8W3FhFEr8WBdB/K1Dh2H7CmveYMJ3o/X9tXnTKef3YSNZG
	caEZTCfZ7WeW6wsuqtsLOSqsy2ubtwi+6nze/n3+7KIty2hYPvJEzij1iefbqEF9OP/BFOc5y1O
	CgneO3V+ME5dcFSyHnSephn/jNJf0wtgs76SASe6Ht7seWPJ8D8qjPupJpHWjOECf7zR2BL79ce
	Zw5G1NuCgUpBS4Ve1EDXxFyuy93GvGObIKdypoa9PgZuNx/jQSRTK0MnzbTLnW9lb+ULuIw1AO2
	bxK52/QceekaQ4mdegqBqy6ZM/cEg38LEshjfgBB+tra4HlaPo4Pjf7ad0NLtelAAZ48csAOZjh
	s22uW8VLnc72QpDnGpj+RiJe1GN5bjNBYMWs5PcgfCLNM0dshBcCGIiAwKex3qiqCVQ+JuayU5V
	1trqzcAQnkbEGGMXuoGA2gqgq4kpTEcQoroS+ESxlmzhTwRun3M3NMepFHNz
X-Received: by 2002:a05:6870:788e:b0:4a7:4cd1:6f37 with SMTP id 586e51a60fabf-4ad9880f064mr3791819fac.19.1794082454298;
        Sat, 07 Nov 2026 12:14:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:52 -0700
Subject: [PATCH 55/58] mtd: rawnand: r852: retain chip state across removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-55-0181ef0cc4c8@gmail.com>
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

A removed card can still have open MTD handles. Reinitializing the same
nand_chip for a newly inserted card lets those handles access
replacement media, while freeing it during PCI removal leaves dangling
references.

Allocate a fresh chip for every insertion and separate SmartMedia
scanning from publication so lifetime ownership is installed first.
Disconnect the old chip before disabling its hardware, and retain it and
the controller until their final MTD reference is released. Stop
IRQ-driven card-work scheduling before destroying the workqueue during
PCI removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 111 ++++++++++++++++++++++++---------------
 drivers/mtd/nand/raw/r852.h      |   1 +
 drivers/mtd/nand/raw/sm_common.c |  15 ++----
 drivers/mtd/nand/raw/sm_common.h |   2 +-
 4 files changed, 75 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..0fb320cd7b77 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -625,16 +625,34 @@ static void r852_update_media_status(struct r852_device *dev)
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
-/*
- * Register the nand device
- * Called when the card is detected
- */
+static void r852_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
+/* Register a new chip instance for each inserted card. */
 static int r852_register_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct nand_chip *chip;
+	struct mtd_info *mtd;
+	int ret;
 
 	WARN_ON(dev->card_registered);
 
+	chip = kzalloc_obj(*chip);
+	if (!chip)
+		goto error1;
+
+	chip->legacy.cmd_ctrl = r852_cmdctl;
+	chip->legacy.waitfunc = r852_wait;
+	chip->legacy.dev_ready = r852_ready;
+	chip->legacy.read_byte = r852_read_byte;
+	chip->legacy.read_buf = r852_read_buf;
+	chip->legacy.write_buf = r852_write_buf;
+	chip->controller = &dev->controller;
+	nand_set_controller_data(chip, dev);
+	dev->chip = chip;
+	mtd = nand_to_mtd(chip);
 	mtd->dev.parent = &dev->pci_dev->dev;
 
 	if (dev->readonly)
@@ -642,8 +660,17 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 	r852_engine_enable(dev);
 
-	if (sm_register_device(mtd, dev->sm))
-		goto error1;
+	ret = sm_scan_device(mtd, dev->sm);
+	if (ret)
+		goto free_chip;
+	ret = nand_set_release(chip, r852_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		goto put_chip;
 
 	if (device_create_file(&mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
@@ -653,8 +680,17 @@ static int r852_register_nand_device(struct r852_device *dev)
 	dev->card_registered = 1;
 	return 0;
 error3:
-	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));
-	nand_cleanup(dev->chip);
+	WARN_ON(mtd_device_unregister(mtd));
+put_chip:
+	nand_disconnect(chip);
+	r852_engine_disable(dev);
+	dev->chip = NULL;
+	mtd_put_master(mtd);
+	goto error1;
+free_chip:
+	r852_engine_disable(dev);
+	dev->chip = NULL;
+	kfree(chip);
 error1:
 	/* Force card redetect */
 	dev->card_detected = 0;
@@ -667,16 +703,19 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 static void r852_unregister_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd;
 
 	if (!dev->card_registered)
 		return;
+	mtd = nand_to_mtd(dev->chip);
 
 	device_remove_file(&mtd->dev, &dev_attr_media_type);
 	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(dev->chip);
+	nand_disconnect(dev->chip);
 	r852_engine_disable(dev);
+	dev->chip = NULL;
 	dev->card_registered = 0;
+	mtd_put_master(mtd);
 }
 
 /* Card state updater */
@@ -734,7 +773,8 @@ static irqreturn_t r852_irq(int irq, void *data)
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
 	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
 
-	if (card_status & (R852_CARD_IRQ_INSERT|R852_CARD_IRQ_REMOVE)) {
+	if (!dev->removing &&
+	    (card_status & (R852_CARD_IRQ_INSERT | R852_CARD_IRQ_REMOVE))) {
 
 		ret = IRQ_HANDLED;
 		dev->card_detected = !!(card_status & R852_CARD_IRQ_INSERT);
@@ -841,10 +881,14 @@ static const struct nand_controller_ops r852_ops = {
 	.attach_chip = r852_attach_chip,
 };
 
+static void r852_controller_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct r852_device, controller));
+}
+
 static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
-	struct nand_chip *chip;
 	struct r852_device *dev;
 
 	/* pci initialization */
@@ -866,42 +910,28 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	error = -ENOMEM;
 
-	/* init nand chip, but register it only on card insert */
-	chip = kzalloc_obj(struct nand_chip);
-
-	if (!chip)
-		goto error4;
-
-	/* commands */
-	chip->legacy.cmd_ctrl = r852_cmdctl;
-	chip->legacy.waitfunc = r852_wait;
-	chip->legacy.dev_ready = r852_ready;
-
-	/* I/O */
-	chip->legacy.read_byte = r852_read_byte;
-	chip->legacy.read_buf = r852_read_buf;
-	chip->legacy.write_buf = r852_write_buf;
-
 	/* init our device structure */
 	dev = kzalloc_obj(struct r852_device);
 
 	if (!dev)
-		goto error5;
+		goto error4;
+	error = devm_nand_controller_init(&pci_dev->dev, &dev->controller,
+					  r852_controller_release);
+	if (error)
+		goto error4;
 
-	nand_set_controller_data(chip, dev);
-	dev->chip = chip;
 	dev->pci_dev = pci_dev;
 	pci_set_drvdata(pci_dev, dev);
 
-	nand_controller_init(&dev->controller);
 	dev->controller.ops = &r852_ops;
-	chip->controller = &dev->controller;
 
 	dev->bounce_buffer = dma_alloc_coherent(&pci_dev->dev, R852_DMA_LEN,
 		&dev->phys_bounce_buffer, GFP_KERNEL);
 
-	if (!dev->bounce_buffer)
+	if (!dev->bounce_buffer) {
+		error = -ENOMEM;
 		goto error6;
+	}
 
 
 	error = -ENODEV;
@@ -961,9 +991,6 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 error6:
-	kfree(dev);
-error5:
-	kfree(chip);
 error4:
 	pci_release_regions(pci_dev);
 error3:
@@ -976,6 +1003,11 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	dev->removing = true;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 
 	/* Stop detect workqueue -
 		we are going to unregister the device anyway*/
@@ -995,9 +1027,6 @@ static void r852_remove(struct pci_dev *pci_dev)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 
-	kfree(dev->chip);
-	kfree(dev);
-
 	/* Shutdown the PCI device */
 	pci_release_regions(pci_dev);
 	pci_disable_device(pci_dev);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 96fe301d15da..a89ab61ea51e 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -128,6 +128,7 @@ struct r852_device {
 	struct delayed_work card_detect_work;
 	struct workqueue_struct *card_workqueue;
 	int card_registered;		/* card registered with mtd */
+	bool removing;			/* stop card work during PCI removal */
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index e238784c8c3e..a79e3c3c77d1 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -182,28 +182,19 @@ static const struct nand_controller_ops sm_controller_ops = {
 	.attach_chip = sm_attach_chip,
 };
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia)
+int sm_scan_device(struct mtd_info *mtd, int smartmedia)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_flash_dev *flash_ids;
-	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
 	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
-	ret = nand_scan_with_ids(chip, 1, flash_ids);
-	if (ret)
-		return ret;
-
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret)
-		nand_cleanup(chip);
-
-	return ret;
+	return nand_scan_with_ids(chip, 1, flash_ids);
 }
-EXPORT_SYMBOL_GPL(sm_register_device);
+EXPORT_SYMBOL_GPL(sm_scan_device);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Maxim Levitsky <maximlevitsky@gmail.com>");
diff --git a/drivers/mtd/nand/raw/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
index 57fc9f86f9ee..d8a330d6b730 100644
--- a/drivers/mtd/nand/raw/sm_common.h
+++ b/drivers/mtd/nand/raw/sm_common.h
@@ -33,7 +33,7 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia);
+int sm_scan_device(struct mtd_info *mtd, int smartmedia);
 
 
 static inline int sm_sector_valid(struct sm_oob *oob)

-- 
2.53.0

