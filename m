Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046651;
	b=3KYqwPSlfJTrBIdpl8ZZ+3jwcxeDO2fItdiNfw8y8Qq92B/MsWK8n+5DSe1JdtSFrqqC
	 jUKvXrAyIfq2FZJpPAXg7EGjRKkwtRMflswxDDuW8J66aTlkcOS9g2dSAaJgmPXgFrSMZ
	 fJyJII4BJ/B4QLlyKpy+iiP5X42sEEUrAHO/tpUioDaumY3gi6HBl8ZMf03FONVnFhDbn
	 cbJ6JOBJ8WQC2YWyFyLoFnOBPwaJKl2HjRKzPPmCw855Rt89ZnWtNTlpllSiXD+cBN3Lo
	 xZRvG54f+NUCHCuFlalZ8OaE1oGcLtL9WTuR4WcIdWb+QyyopbpAUaqrle5BiDteJWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
	b=mDsIRiKMUSU8cR3aDvberlY11kgQVCFpjVjnMt/wq11SytfaDZvK0ay5OmAopOOHd5rc
	 rgg2glFX3PNprWT2sIhL/MAMQB/WyEPKVT/K3LabiVRBf/iFApp8iWSibAm4jLh7SLAFv
	 kKCi8qOVMM91pFG5YDGwdXt2NZwq5+cqy4Uw3FTHjVGhCiB44Xgtn6vgRneyWaxnKnEiD
	 FTNs+xYriMs7CkfvDJR2HNTYCUabJGMbdoaklO1R9QshO2TqSEG3DzoW98y/DjuJpWSju
	 j3KIs1GFK0KcJvLwIuABV6+hmJPf5bTW6XFN8GYoJ0S1LbZMi3YDa6fCsXSi5jYyfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgob6sAt;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85020608D97C
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85020608D97C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgob6sAt
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8439fe796ebso990708a34.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046650; x=1794651450; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=hgob6sAtS1QOIO2JPrECc62+ANaR78S9oZ5eyKHjFUivxgV0/KFlBDxBo/c+J2SBxo
         4cJvV9RZRY7nMWp2LqS2SEQsEtspb9EFOq2KTQACxszjHICDZnMbhNuXiOKMr8CD0wmh
         ZaHXeiH6gzFa8igyFRG09ym28+VEWUlHwz04f+ZXUNa6r8VN35LmSwE4CfwSlwQwq4gQ
         eCUse3+kpS2dHzYawBXOYT1s3b0+DtpS0UNJn5XJsMmyfYLu7og+LKJVp03ztFxCZMH7
         IqZ2Zo4VVovpfjFq9KFW5sS+FFVRgHMI1mIxcBKoT6wdbrOqQpL0BCt/RA4A+fQggfgV
         bl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046650; x=1794651450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kq/spd0nl7HRarcKCTMCG6UXne9OBTV31uGO58RYFdk=;
        b=Wet9XZNQPVS2ChkHnKzMsLBRs0ERxPVV9hnBoFWR2ZFX8Yls7kcgy6nzx6FX71RAAN
         ox0w8Gc3gdJB7ikfEuFoUJgJPbmre2MM7VR8DQz8pNLPdi/UdD401UIquJOTnvavOT5Q
         RlAINqhwC984ueKLBGnKXS4yuqe2nSTdLiQ0fuTRPWn9U3Y/FsKSR7SaYjclQgFiRMSh
         JQZvAhJliqtFHIE4VxOzGruEHFkRmdRafHZL8oywgHBRGP534LwNLcdogpCKHB3SJWPb
         X0BDVwYhpLr6VIgunojMx9IudPI1vp0ygSVJw/inAJ62uXeORNXND4I4hrdVySGpbekv
         Ls1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzncYT06cNtgc9/zrl0nQa77XDqZz8ie4B17OPvBsxa84RiGnEOFU3gJ815+HkTS9RN9vk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TS32tWvmJPPlnOpykaXbSs1rHaaq9n/XDYpjkbQ1+I7tCJa2s
	tELtX7yZAl4pVBcFZ5NeLy40kwu30G3f3kIh3FxaNblmVU/KmFmhAe02
X-Gm-Gg: AYBFou3iS2XtZjqJ/g4936RJjEFsmesUb9Jc1K4l3YMZbPa41euZ2ZuR1r3WETz4CvS
	/G00ClLu09xIXR7YUYL7vmumaM2Z9/FlQgAlDG3ec82yPo6eObC5TICe4BjwNxLoXJ7hq0Jc4Mr
	xFdgvt8w/L2y+Tm4CugVyMj5mtWZ+WM+84hKrt4zBd/FrSijddBX39u3xnWUSDxwboNWvJNBVHE
	1J6uQyb6eo/BVgEDajnXKFzyDtIY3hqgBvsFS4590fzWTShk16mqCdHBE6Xkd6Pix8VNI/KuBL3
	v+rvv4hhQ0oCJ30+ii0OjypZrPdJfsw4Gfl+/H40DMtM7yPq5qdTF6QT8DxsbsdmWZ7b3czInv5
	/1AxfLxFFeF+/XEAMNwRxR+Nw+VktxDkYaCFH2DugVNw0Qlhow5Gjkbdd6v1SWVGM6S9TrDX7BZ
	5lsMCgKgzL14FD5oXejVbenlnYFnxORyxsVog/ANwrGwSCrlZgg9lbZf1UplzVcb/fiS1SwJgUy
	mLmuBgOR7K55qD4+J1N+JNSpXMctEHQLo4MAleYI6THTksrMDbPKPtA7HJ6w5CKm6Pj2LC+V3vc
	f2mDjP2noDe5NRZ8p6iykvKtcMUj+pWHP6bP/C2A4r3qZ5shegK/5DbqhXMbEskuMrYzCQS+FxK
	EfwGXkXzVf+x/dA4p5ODfO1bzkI5ZrjvRRBiRyJJaTjzyLqQHwS9YtVAc4B5VNXu0qaxnjA2qTr
	UCaowTs23949KaIz0aJtulph47JmQF1I77QzMZAwTxEBeiC1Tp9qzBaEygKmbi3tUwjjkrbNhJa
	u0=
X-Received: by 2002:a05:6830:6809:b0:829:2af1:a07d with SMTP id 46e09a7af769-85f1cf0ebb8mr4412683a34.5.1794046650417;
        Sat, 07 Nov 2026 02:17:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:20 -0700
Subject: [PATCH 23/58] mtd: rawnand: ams-delta: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-23-0181ef0cc4c8@gmail.com>
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

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..ca3fd966c4ff 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -233,6 +233,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 /*
  * Main initialization routine
  */
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

