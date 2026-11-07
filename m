Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082424;
	b=4x11XZp19Tin1kQKICPz5dvWrLPNHYxB+2h+R4QBdRDTvXEeotz2lJQ8TaewHrtnjs2H
	 RO3E8lHa87GLNFR8KrPQunQQPCmtqbe0V4m0M0zF+eknf+1Xd4k6+WLTtaW6Fe61hidKG
	 mnc8lAaCusJK3zFyvxrawYnIYHD6TKuP/Q7X3vTGJkwg+LwlmKlilSsyMHqypEA/YY1OV
	 J1PuzcLkrTneZz0G4Joj90lRbvaxKmVVpUL1PxVUqwsYIn2HJJAXnz8i3i3bdTFctzFuf
	 9VRC65l3zQJkfGvyeSvTIY/2v4wS6h5ylIRAM7Vy0B0l4ohS23r2LfxjA/RoQY/G/Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082424;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
	b=lERoxneu1b/Nnasa7yEkdQM1gJJuw3yIS5SLQ6yTzTa9kTARGwN+dk844kGSo1atQyNd
	 L0DuLT99yPvzuSnQXzzlcmHUhLGtldjGU/8BhNSt4tPuD9hLSUgmE0O4JKF++oXJBeg0/
	 pxMGQnOFDduReuFcdEPTw4fmCjp5F4B3XRVEa2UPoV9PthRNea70e8Ck8PiJ4Uni6JZ1Y
	 HFfNRY6HcyEFmM5BqCSEEiYJ29ZW2L6CTc1kZ/4KBUqqbtrx1WOFW/OeVAFgy2b3kEwVh
	 8NYyxOX7TRuVkr3bhD52pxPecUkrOQPu6FNE84vazeFXTNs5o0gL69Y+f/DaPDKpv2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351E606EE94
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B351E606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8451a619da7so1123402a34.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082423; x=1794687223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=bauNST1hHP0vgipDi2z0kTh0vzgHlc9DeXVfl1JSFUXk9AgY6Kr4mBqnKOV1U4nhqV
         O+GVlXf24s588QFi9WX04qs8iSEYP3pR8kiTVW0UOOY9rH3D7X/ToY8Ss8rbiKO5VWBB
         ezNx03/3yhPPfT8DI5/c2f8G+74c/Zeq4H1by25PkQzMbXSK4CNPmCA5ws9pPV6+rxey
         sFr9xfaeFVq+zmxSfJZ0WvmruZPcb+riQqqZ/pm+OemIbqehucBYGRlIfN85SSnfmRb1
         xqOdQwyjaaedr3bVsJ0dn2lLO1gY7DdtU3ycFyB0Kx/l1F7oriMv1TWhAsXxedxu5irY
         5UCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmNvlW2d8xWQeK2o19le5/+ogneBYi/UaEevjrEh3vXBjQYtxz1TTqYbi2Ug7FGtnKnmk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8IagSeL1Ne59xx8KFb2gENg90zCgxY+ayT6aDnbdQQBxOZ76Jf
	Nl49U9DN9pb9Qw1clyB0n5OfzBz9EDkIecTGgeHseJOS/82AvkdcpKd92N3owAL2wb4=
X-Gm-Gg: AYBFou36i5CvPg7p43O203s8XI0tZEqKgvw9CHmLLlkCKHDofrmn2Cs4QC69Nr09y+O
	Ca4w1SSmmxiB52cOU4ww9xRo2WUwgJHqYMyyWj6R9gYA0y2iQ9njz0Rs5XRliyh1rX/vVe/npEY
	oKAolu0mGdnhdVXrYVd8OAmHZWujY9TPOQ3ADgjZfF836DQlHdVLyzJNo9abqO/hJe1toUJD+TC
	tS5dgQFPAW1/HvjD8lOO2YteWM3yGYoBiaCcBdVZ+0hI1JOtm4AOICnJYSQQo2O0DBXBh1bruKF
	29XTdvKi+7IKVegWJUa9vfUZ2XjLH64bGWV03vi6WA1RvWVP/Ey4qOn0z9kZbP/ylkxI46GymrA
	QOMaNn/GqxhPVgUWalx0T+kEVM5Z6n9eR6E7VvYo16A5pv8zw3KH0akungqgt0lalix4h2uber9
	+JRt020LxnQGHjDS7Xm3eyCnaXt+gvnwHVkCUzilpuznnjeMlD4eVmBGA7AiX7RDCZK0L9mRRav
	2X+9MqRCsC3LLzvsHejyMVmduDQIw5ITRD0wZqpxmygt2qps1DUbNdbymR4YAyx3Iwdof1YIu8h
	wjql3vh2STPHDw0kHPoStG9RsEbQai5IihKU3jNoz3lHaW7Y+BH2zILasRkn
X-Received: by 2002:a05:6808:670d:b0:564:5fe0:dd60 with SMTP id 5614622812f47-567e0997194mr5082140b6e.9.1794082422526;
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:41 -0700
Subject: [PATCH 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-44-0181ef0cc4c8@gmail.com>
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

Disconnect the chip before releasing the shared four-bit ECC engine.
Retain the chip and controller while MTD references remain, with final
NAND cleanup independent of the device-managed hardware resources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..2231e6a45114 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -895,6 +895,11 @@ static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.setup_interface = davinci_nand_setup_interface,
 };
 
+static void nand_davinci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct davinci_nand_info, controller));
+}
+
 static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
@@ -919,9 +924,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, nand_davinci_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +994,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +1002,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_release(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1033,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

