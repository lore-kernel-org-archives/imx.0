Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046612;
	b=hAUp/PJDW7luGyyJUS5392Kl9nOUDLAzwQV93VVL9V5wynveGLKc4IRMTq5YZylAWL8f
	 ZqFubOmOhkHxeQLsAiY8Q05XIDHfZdC22NcSo033K0a++QrGNCbLycps/WAG+qGI2L7KT
	 6HTLiy56QhnoiIfZZQufw+6ir3QnrhtbAi9kULccGynA6CKsCw107nhgA6TlUeRLw13JU
	 BjxtwT9sHW+C5/NjfVdVsh0lm5NTQ9aIhzLG9pXHo4UQysvyO7M7c8ne2+Els5AInNd4C
	 BHiD2R3Ium/wz9oj80BfA5MElqe0o53W8x+90batxZtRohppsxqZJq7CPXtGnofTTbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
	b=OSyLAtocyhn8BdLd+6QBRQZB1o9/4uGPFwCzsqmj37SmMOSxyp670CISaAEtDu1K7dVE
	 dvjtL99tz8PJdiMgx4p82mJ5DGC0OVHBl+CDrmxkja9hxE738bm1UmTiodrKkcRvlUN7+
	 j6lVdlwH8P7XQqdTN0zWtLZtCRshOhJJjP1CwZE3JdxWIo/yLe0mqZi9CL6gEqLFYKgTN
	 Ngns99akTd5g/yFmIKdZzI6qYMuDwIF+kttxE59cZU8xX41OQw6hGnWiUGu5qEUTKmMat
	 rRHPpGEuU5hyY652fXGcHReiwl4uSa1yI4CudBxib2+8u63mUqWrOxuISB7fRraqMUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfm4XwpN;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F36083613
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72F36083613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfm4XwpN
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84a248254f4so881760a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046611; x=1794651411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=vfm4XwpNNCsdDJtSFxZR6vq7rFBDxDaV21HKbD6Donbb3C7QcM2+Vkl+bq+Of3DmlK
         Yw99AenAM5A9ZfiNjxGP1IYYY0l+kGgoaQLeJ2/JhTkwUDV1CgiFW5k/6my7RKQe6I2E
         2gQgj89IPP41+5WSb68mZQ0yMbiRTtyuEvy6+2Fve10vTeGL1/OmCtHYbrpNF0+dULab
         ilQ81lU9Mi+uFNOKy7BpxJVqymYE7DP0wLwBO1CHl6xeslh2eRDrFuqlxAL/T5xKvia4
         5pFmTKkRkNMKz/MRDEJKDCSyfP7wcGPi3drkKuCozuOHNg5RY30P6IpUvqLkeNF0fGgN
         nziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046611; x=1794651411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKhvO/JDZmUi26rwGqJ96W9quTw5lImbNN+f783UF4k=;
        b=qrjqz6xlii5U75YSOEwoulvfM+v542hJnU6m9B86D5D7wU4lv5qO1GSh+ozgAiuQ0O
         nScNvKCr5Pvxnabz7mGPWyQ2rxXxzOjxSR0FACXW+6pvm2f8cs+I8ONl4N+PfbA3shll
         UwR7TUQRrVAAjooKTvDnpn5IUGT8qfF9Loe7Qig2wQI3KA76pfZQJalK5WDl5F9ce6+R
         W/++9PGRMEdNWu6YW4NCdL0BHjU9N2HtGw6XPKyeZbJGQWJ2H1mzAcK74Gt6PW6lwni1
         nrVQk5m0ozs9ZnDGL+QBG8r19jW0RjtHGB71Op1yKpGRaRaJhj7S3rAzsvA+BkJ0xBf8
         feTA==
X-Forwarded-Encrypted: i=1; AKwUvByUXye8qij+ZBkHN42ZZm8R8FAE6LhITbM/mINBsVSjLp3FKNRrtT9L26oSe0UsemzD/dA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+jGnrmt6+naMf37B3GV9ccqtqRxLTae0gvva457ixNYeQpbGfq
	YHEfyTFIxi+luopzaKBn/k5hU7qwqHGmCp+zEFrlUikMy2KnuRX78lJJ
X-Gm-Gg: AYBFou18ITViqan2Jovc/t2ta2pz5YqU5xI5STkPZ9QJc5Ms7IJaKInox6Do884Ex8X
	pjcxZYHURphkRC0EluFVcnN+eG/Thh1JqSqjvgxk63rIP+/A/3RZLFgZOzYks6wcSNTex2yMpa5
	++ckLplKCLaPiGoS0yjfkrJHrjFersnMrfi8IZ5PbNgzPIUhwnGzPFfZXDJCk3swVqNRlN1CqLd
	tJ2kjR01GiDVtWeM9wEX0X36r+HLM1plBy4YHgpWWJcFmi8z/Z42tuuhDunwOdsxjG96JS1Qoht
	gkeeJ0owuAZhuo1pRdtkzIaQOKlkHIRjeTtDnyGTTJuHMLKrMrogd9zYrt+oV8nrX+4zSmSKnVP
	aLd/yoOJTNrt1N3Sw/AMW2nSIWSTREJWyYEYIqHAKaU17ugj12/smqzUcja22wtcUEj9sXlZ64x
	Q0w2DGyj4PnCsK0yTXuZ79QtzVJR5CmY9QyMD9cFOku9FK6La7kGsAX7vF6gMeARzp97A+0cZqZ
	YQyeRkLUADcAw/W7PYylERCGKw3V069+oa4PXN4FS/rfE5u4yp8IZSNsdPIuRHpzAGWz8T/BPkS
	XHDuuG9UTYS/b4TvSaqu6Q4SOqVvJwkFCKUPtwkZuk8qiFQx5mxNc21xWETP2DL2q5RFL5MQWB+
	pD82U5pmNsJhS3i6cdUGM9t5oSWD8n+NZHrmJNlK4ufQEHLEAaqbiMDrtXsc6EoxIwb1Uj6kMX3
	hugBSAi7oC5Js1aeAvnVC18oECZ9ZnAnZPM2rRjKif8o1D06R2gYfgJsuvqRrYN7zQEbkP5C68u
	A==
X-Received: by 2002:a05:6830:82ee:b0:828:d647:332c with SMTP id 46e09a7af769-85f1d0facf2mr4771818a34.25.1794046610805;
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:06 -0700
Subject: [PATCH 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-9-0181ef0cc4c8@gmail.com>
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

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

