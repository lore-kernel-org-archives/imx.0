Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046635;
	b=NCChhaH4LK0e8klsC17Sk6ppA6+x7IyBiOy+Neq7cWdClnwu70lWwKX3IUJc2LW1EUmm
	 zmA+pKOTN7tz/kO2L0uhYfVMDixf4WWwsqi/IJzDQBWtK3XNwZriMgiq6czp4NlEOtYZw
	 jjwaBdbizRPWmBuXAyUb4ckBYcykF9LKk81li8jh+t4BLaHRg+PrOY79ejb173TDJ/6wZ
	 QUnaRi2j+hF2ZIoWY9hGCA7y7bKfOp53BQ6mvqd/hS51E3DaJZnskYvyt4xPBKEIladM1
	 NZjp140H1Fprz7zczSznPNKrU6MKuvbolV0t+En+PxBoGaUkiO1mYpy/XMG7p0+ydhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
	b=4bJtcC4BpgsTJC7yTD7+7J6SkEDGBJog17SsBUG7eafU8xz0wcsgsg/y0y9ERVMmO+nc
	 8vdDGtDUKoAOKo9CB9EmGZQQ3GdATqQu2a2C+Q7XtXl1Ud5Pxf7bZ/D5yaO3m+o8j2psO
	 uP+DpH0AJQxcUFfNAkskl12KovmWG+jhCsm86nHLq8Hmw5m2AFiI+6U8UO6FTQcpzc2Bh
	 nda6+Ihb9/4frfcYzLk70yrYgqtrx+R/TXu6RD3NPKkujbrZS3YHQJ1sxShvvHaIN3yxU
	 CraoFRyTLoQdrQbZTtIij386BJayCQSNzRQxnOERpXXH/apS/gLhdz/6QR5Oy/lNdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s+aQx/Ej";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7679606A326
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7679606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s+aQx/Ej
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8451a619da7so947234a34.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046633; x=1794651433; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=s+aQx/EjcClnNxojTgojnoduJ7t/xSMHubkhqHDtV6/coCMUt3fMQjY/RGeIO9oecN
         R8JjMm98t1JJmgcO38X3PlCwdQAu5IgOR2Pd9mPNvs3bpspJFHCa2J8CKlUMnZQqoKrx
         9qk7pHmtCGFdPSckE4cc1Z6nCKLrvCMuR4F56VE3ooufs6EYze+koTkpG0eZNbbTagrx
         Z5ZIDgc8kdkNerzAPvLuwNvR2Y3GWI1ljcgsslS5Sa0ugMH4Hu5nCYKPkJA9ETJ/g7p/
         G+zk1CkAgKcQPCNC5xQ7rpBQZuHt3uXespILY8DGj7sUNVDV3BvRhpYW7Mjl8ilfd7rA
         gVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046633; x=1794651433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwPtW+JjAhqo5jTU0/m3cNOHA1ZM321zSLbm5kQ7SQc=;
        b=Wm9RgGnmW4frORmJdfT+FIVvNP+uu4hej0RLR6x4uAaQ3Vtt2CwqbyHS6WMlDcgZD7
         nEYgEjNPYTivo9Ip/VKMZqp+ypcMmYUz7xHQPfXQS9xTq2ay5e5O0T7NRDILxO9vj3yD
         LwbqXhRRPJUD1F9aLkzU8uQTrMzqjVqSjqQxByOVColuTkU3DLBBsdgV9IOUtlWn7kGR
         J7GUrir5ACKsfSZtTWROseBER+kTa/bLb4ioTZS1hetw5okAKK3let8qlgBLyJOw8XUG
         NniD9JUMuD+JyjNFfSuJxsSIfcBlvmM/611PFEulJINpF54WPbSkxzT8Nd2pOErKpuWA
         WCUg==
X-Forwarded-Encrypted: i=1; AKwUvBwmBJgMFdjoSsCUvWMmZfZNHlatbGszeUCZk1IHlXPR3EkXO6AWGsNbxrPX7ZuWPgT7ZOg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8S+OjgXXiDD1isZGFSkMgF+Geqbz0AZLHTruRD16QAwQ1NHHGf
	ckA/TEbPcXLNSug5Z1uleJEZu3LJNWn6ZwITKhUdbwwLzUO7VWxRYwi8
X-Gm-Gg: AYBFou2OSgDY0IQ9eQ8qXQhtLT0zMph4VOSmTqBZxiw229r/fOQKvodC/TDNRk9qavx
	5TVPGORw4ZINIWux6cYq3W4SdVHi1zyDEazBdeAOTv3Io0AtKzuW1lHTCjpeg0GphM37OeNm1Tm
	U6K+dT/KhgkT3abiMfbJZjfF5Jk690kLmz7yLa9Dg9m9x8dNh3WieTvDBYZ3FcCdDN1GcbBnRW/
	kTfqLyI77lvsbB2a0HWgf5tnIUV8Ntie1K6NpgkuLMGekoTX7OlcL2tkZVJS8cjNWp+kszl3m9f
	LUmuvkObjApPWa25zRsK5tjhDo0Ib2Vvh2GdFzE9LoFPcLEWO5PimRSb/HrT3s6EljPt7nBmrBM
	hxRpoj6F8kFtrN7eYcvyY/5qSnNe4+Th5/wAdwmy3U1VYCpSkQ13ohafgD7hxXgvoKVCsmVRUP9
	LmJJ5ZHbsRt7ugCXZ7+PM9OBBjqq4/j4Y2dYCTUoTbIE/mznohSbBiT4l6/wSNSW0m9+mc1PRMn
	58FVqNO/r1NYrkDXV/vKk2q0k1PJGr1RbkJ7dlg17o19kNoHpxf9W3HL1oRolSjc3oHxGP1dv6x
	INIAxsVoD74nNzi0PQ/03gu/6CM1dUm4x0QloSqVkKoKQzz3Nq8wamCoyLvSIm4GVYG9/ocBdGw
	DDdFowppjm44fJbQT+TCFtpDZ0wubWsFV4pWNITDhoolInErelABS2b2KluMOYUh5H4jJ2+nqiI
	/ysO8eSrMSit1ag1IHJt4OXqTjtiDpaVGZbG6PkCsN9QGfgPBE4WrZ
X-Received: by 2002:a05:6830:440e:b0:812:4cc7:4afe with SMTP id 46e09a7af769-85f1cfe2161mr4589309a34.17.1794046633427;
        Sat, 07 Nov 2026 02:17:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:14 -0700
Subject: [PATCH 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-17-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		rknand->sels[i] = tmp;
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0

