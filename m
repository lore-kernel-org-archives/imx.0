Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046623;
	b=ti4gnD64bFCAj5KQR17exyaHmdUVnxGqK5pBZaxRY6A01Dubgy247phQWylfd7pAb2np
	 zVFbRw7LCbF15VKGhbKTC416X7Z7UImhb5IB/D6xc0XFJPVPey9kXktEjIbshxXjAWTnB
	 xkE+zHgs7pi4NMkVuuBhpebjpAPJXYPMjGUcLBQqF27kwEkm2XJ/PELxjo4u/v/qM0IAc
	 UnSEJ2MDdhlE9HFouxFGtW2A+cOA73OGHrBxeFFj+OACXKl8fTFVqM83vXMPEjFVANeZk
	 D3ZbRCDaY8Z5VS5rtlJLIdMypgyD1jPtZ7CZr7fR7OElvk+E87AFk/UDWfYvSzll9tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
	b=qDEFVmIhAmOcUw/mEEV7AH/OdD6mp8iMGB9qH3xAVKGBfd5EytrELaiO8uOFZnbQDRmy
	 hXVowzwMvrOYw+o46M53WTLKfWDl94/9jNNsSsJq5r7J/7yEGBELipXgMhfrz4zeHoLgj
	 YeBiWrzbS8f4EQu99co9SnbgVkSyzuff0EB/OFdHTb+9R9S9PTWbHhI5BAApP8tFfvM5u
	 Dg054APyHCuoMGjQWEWpz4o/ZsYJTjBw3nmUVQ4ydY+qPQT3WodHiAZX6GQKzkrQHBsuN
	 uimSF+6AlJOQf/ljThh2HrZPpOfLGh71Eytf+jUdo/n2NdejjUfs/ioRiyAtMldVnFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwebpBw5;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCE60A2627
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BCE60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwebpBw5
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f48c750afcso836062a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046622; x=1794651422; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=YwebpBw5HiD9opsQRcyP7Ia0ISAPWskbFMCuz6Sht9hKCB1cVYQ5JwwOd6WaDkUTbS
         T4J2RORf0E2EdkUj2bX8EPAQ8tTdG29yHLt6LrTl7gxVI1FKN0HLBado8Rp7305Jetlz
         HQe3rEp5gyREjc1KRsfbmSksgyWXPEuti0S7C2rQGbVEhrc4WR979HPtDZAcg9AHjTmf
         qKdeiGjqcY0V7LehQRjOxPka0pkYk6jmw4ILeVEkmLir8TxrzU16K8i9NYEnsSITHmZv
         ibe8CG6RvmtSLLYWth89zxihRWmJcWa7irnedD80mDJexDDgMSp9MohHOAgCwPqHWX+G
         YKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046622; x=1794651422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RzOOyuPwyKab2kn/5pQ3MzZ6HwvzC6fgSV0cFeXekc=;
        b=Hg1e21eraF4QVjUFlbFxK81BBfrDYIIFWlpwB2MomI1HQT2qrTT3ScWqaBEZERfrCg
         Iz/1fJ+YNM4+CeiYz2pOdQrzM3BldRoRc+zPXPY3uAOK3hTQ7WVq5bYpwFfIBCFoUz8t
         wEltigtOy7HosdWxMds4vsphm8QcLauDwTvvAtfyFubX2Nmowqs5kziTYUeHEyY/lFxw
         T+FWiFlqbeUgB6f603jQ0Wthvx4z85Asp6auJr74ETFEpgw5rlSf2KkT8FgTPHq4PiCY
         21PV4kcbNZRxt5JBtHrtq330oBTc71AYs+qYQOwpjbBEotGI2kZeNvwQimxjk5l7NaAD
         5bWg==
X-Forwarded-Encrypted: i=1; AKwUvBx8z1+/oqi/hjl5zF0rUN3Lwn935dnXnh9W3iNZKZbm9wg4lfcEzzKHcWOpqfT21Y0SR34=@lists.linux.dev
X-Gm-Message-State: APuU4Z+AMhyZe/LCV482u4GuyR93aSvaLWHVdvqD2r3fXes/vWChjk6K
	szsBZW/lXEbL57eSK+leV7CuBe/LSu3rNzrjyjNY+wIGP5UrNMQ03jQW
X-Gm-Gg: AYBFou0Bib4XdsPUQASH4izZnH5Tc4Vl6IMxpVaV5pnbXcz+bc3jBnJ8NrGVGhZ3S8N
	a0eIhJpKkxCegdyz3WDjfaxnKI+XGNVo7GI5A+xNV5HEJqlxeKUrqCcl0Xt46tsKa330bRuEbvL
	Pb8/Uk5ANiT2V0JHSsd/J9B55wMgES7SORiztvm+HCnmVAt5drdy+CbtIFc2OdXhV2boYe2IWIX
	84Ofl3kVPwvQy7Y05oSjqQrPTkJvFM+QW4f6evamg/uyU2h+9GRfgk3cPqsr7NoKOYsF1VBUUth
	LouSLg0ynrwXnBCxFG+XxLKIXEB/Ae1UjWyDvALYcYqmST7yoQBbX0LuQ/ipDUQuteadj+VYKP+
	vFPQ+T2QwFJKFU7g31DW66PpycGNYV0k6hxy/G0Zh1HxS7+BfaPsYNF8hdntX6m+h3vIGexHT8y
	F97vfg+ifVZAR6eLP+PvFo5MIEggrCsAIPWG4+NhVUDQXhqAlFzpxtK24J5qeQlOFG1N0dvYrh1
	YReeTZ1TB/qNREr0fXBWnCijsFo9E+XW9hq9j0wr98t9Z+mNKU2ri19m1C4xOfKQvwgipMqdYeA
	vrAyZXOXHIMHxJAJwTeuzNuTYXnY3jK+yxRWmTbcOKTXI2Jxlu/YrmcRDBb7iafYIk0xBq7dlnL
	V2ZyvuKdrqh7TaRfb10czMDKziisa/hkIYVA13hxR0tnyRTU42XJybyas0KDRYjy5NS+cXNUcPO
	oPbquMY6xUg8pDUAiHGBy/jrdwPZ//E8YDp/f/YTXE72TZQpDfkdHr
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85f1d00201dmr4359887a34.14.1794046621892;
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:10 -0700
Subject: [PATCH 13/58] mtd: rawnand: mxic: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-13-0181ef0cc4c8@gmail.com>
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

A retained MTD handle must not access controller storage freed by
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0

