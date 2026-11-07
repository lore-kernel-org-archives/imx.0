Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046649;
	b=KuOllYJA2rzhUaYVTTQ3XbRGAnmAskM6xdT38t0/gOwVpbMH7LK3nea14uGTHI6uacBc
	 AnyT0NkE0gow2AXkWC4T1ifeM+qKSC9Wef1Tx92rlZ400J7mtMAeocqLprLg4pmqOTljr
	 9Qbd0aqw7rXga1fxO6CjmRO9p8sGS2UQ82bE/bXzWhsjKqK5rLSXjZshCDPKgcyg0rbr6
	 MvhU3w0AuDT0QmSZBuXtfwG3ZgvzfS6Ey0vN13LXC309nGDP/slwFOo1796PWeOf9I3WU
	 x4xxsySCKYBZN1ncVuVQlRqx97FTJ/ZhSH7pgkqpIoKzyq+YQhtTfoF77VgVcrCNZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=0IsHYRylbqOGEwDETLGIV2QYKw9E5BMAv3HB9AVNoQQSfmzXhkmIRJ7cgDOl5feDJCRe
	 j4NQdqT5tLCN5itIC0SHZ4xmmkAiHPkp7rbQ8jgjnnWj9VpehqTdXINs5WLLfi/7uo4Vl
	 Gz6r7KhCE3oPZq0hdpD/U4ykjrjhvLkNLv0NvWok+njSnaM+m96qKFsr+rDnlFuFhWntS
	 b6f2dlSlqyPXgg1jO24veMjtXRIsoW9JLCofJvlNLDD5YfUknybj8bBO4ft/2ltBwlp5M
	 +Yz3NWUA/NS7b2mB0u0AGBijYnn66F8kO/+EKPlD7wcFuC8LWpAfSaz5WZq1a3QwOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQEggsdv;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B6608D965
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51B6608D965
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQEggsdv
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8253bc5a613so872407a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=rQEggsdvgebU2ZtqjBKsdDmQvdo0tCU/75pRNxPY0CZPQXDB0750kDcBOBMxPXesae
         joEKaG+ptIfAJvzLw8CK88u/2ldJR6BZK6V2a/4sIqwUqDDQ4WpuBrAECNiexP0SaocH
         EEa6y14aWxg3+UxmH1XH/Zgm6GEFmW2pgX65wZ+QIlQ0E1IZ5IKljGAN1gEkbPDK2TbV
         R1by2rqCtAEfYsF4eW9K8kN+7F38jv3blCrzgHIiltE8OrLhVn+rzN4VL1D28cQdTuEe
         U5cQPnDoDNzr7b8CIynI6H2kjMANSqIvc08WBcBh/Y4PwbtIwFzlrE9+Z5arVAHknAWg
         H7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046647; x=1794651447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=kX6VWxqjT44Q5lvVgQSBbzzqm9Npdl6utG87c+8JYVCFWL1uCz3qbRDcQYNTtfUpIm
         tcsQ7hs6JJRYCz9O45rPT3DTa6tDkIreOV3t2uO+mr1VrWg2zySSZYwHfEDQpD2jJvaO
         9UxuOO6Fsli9ZKo2GX57ciF+izvf22jwJUA5n6Kx+AU8454TGhYmr3RGo0uYYwI5VihZ
         0wxR/MECqubtHdIHhjBEqnHWpzKHlsV18eWl88NjhQ0pS9nT6qEHX5dPf1iTmXLmv18C
         iVLTT2ktXNvjSfFeDauRo3miIS+kDPfiL7rSw5G3mKGmDKWyBi7ozi11GpE3HJBFD17g
         Q/Wg==
X-Forwarded-Encrypted: i=1; AKwUvByViWXtTo+VkPQJOJ2SrSFQTVppr70g5ghZU4B6X7m97Lk4n8DmYl4e7AbDGD6miZ+oFxg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/FEeCqkLIZOA3U3QkMdgJ8uOsGMPWUl3E9y/veLbOPGVU4Gz56
	MSdv3Scgm0dqoKL2zWWeOMBjmfS4d7MCkpJar0u5ncTFFIk3V8XDhqPo
X-Gm-Gg: AYBFou3kaMNC0bQA7IlGjqPFlZIScor0wKoYzgM3omT+FyH1x8Oo0OgNqy5YcwlcL/e
	wFtVmvC3uCrt30Ju6+pfwFu11sSVgpjXg0YAi32/e7jmcbdoB+DPsp1s/r8hZazS+v6wOxCNYWE
	GM+BcgxKMRzAMu4nXptoEz7HNx39ePDqgID5ko9yKPjEf1FY7cq14yDhZNi1BzDovDLdOjS2mor
	/oB0pA9B2T/1WeirN2IZZ+WkgR2FIbSFjnb2HqaHmGidywO9LdhOUIhYRUCEFIG6tAFc0mzPmlh
	rTDvIKwos9h9L/2we+d8HOiUxvlHlpoa4rWFSH+bp1M4yjA/QDCFDKuFoc4itRdkElPVtKQIS20
	t7mxE1lB4j+iKF0Pgsl2LO3tyCXMljj99+9egh9h5r1Sm2dark1wn1FwI/6uYIFyIxXuI6ugzuG
	4zBh5wtf9lpQ4Djz8nfdVlCo0OO7F77m7C1XW6comvYeeXjoSRgNxlCDyUqBTi7IN3oP28SWwWG
	taUL6XVJiKVFmgkcvkrOy3eZfJGRqhkje9SxFrGYrwk74rOWn/CdW9VIYR/9OrWJH7FqC+BuXIw
	sZboc4MVPZyqP1lw3qhAPRTKP975bSFQZ7Q03zbD21BfTOFeHavIkDVpHSOOOdWCb54AQQ+aQX2
	HiFWnAJ88veAwZ9maiCvuVEHRygBpGucHhvEqcLR0JWGkzJfLXbwFt2As6Sc90IVO4UH+nLJ1j3
	i0annGmU7+y9pwxJY0B9jcdpK6DmgKDjiWTIICVI2zu++defxe+Yey
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

