Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046615;
	b=MaPQbvUG9+nKGi2pl5TtYmtCsngtZdNzDOhLGqVDEbmWcc0OJYS4F1RiG2uPkb/OB2Vq
	 CE2mcoem/uuATTvkWng9SOPUQILo6WptYQ47nBM7iYqrEdPFYgB6V8/usKbUTdNtptOqP
	 fr3OR2FvZ0Htk0+JgEDxJo8Gc4rNf+ij2X46+NSlqIMvquj3qX9lhDZ6MZZopjPSIoppu
	 lXFSh82dyI4kHeFhNqsQltn+8tfKgueXgE/yLZ8XADOrM1zN2rYwYElxKARU8MeYpBp6J
	 YG1w4M/Gqu1BPbU4KKfP5J0QOYWRkKXt7bfh17dBocgbQOC4EDpo975NZ7fu/+hgn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
	b=TTZ4Yf2SIQtAe29qJ7bp1v46fv+seeuYLr8jyXLvbxoR/EgoQxN4oBO/c9dEJj+7okwg
	 cj92bwLTlVe3OhRvuVgirlLY6uVTBzaxGKuApO3lccFOAXR/6OWW68KAmJeTeGCpadvxL
	 aWYf/c7AvYq3vM7sBIznD0LnvI663h0NmAkMDbbeAtCnfUyVz4s0beX9np43o8hTgR+fU
	 m/uyduh9bxAdm/PZKXdjBO+AhrbEzM2zwAVGwMOF6kqgLpGnvqZOriZ+m1NAR2mqut+2d
	 I5IZE68dQ5eb5UwBxcrgHWjRNiJ3KUZTfokE36nxgceRRm3dUhTkFb7tx1kG9hFdz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1t7a8aW;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD7608362A
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAD7608362A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1t7a8aW
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-85a5455bd3cso839936a34.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046614; x=1794651414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=u1t7a8aWnVKP30UzaijU/XEaKbl4KnAgqqL9A83gtpQ56bAz+u7KSw2UrYwRff2x6K
         NLzXIkLn6950cm9zTP6l2xjgrRHs1R7916D8P7z9LaxkgLFcEZiFPxcnrbM3JMavxx58
         C49UongGZLd9+/sbAkCk0VlWmL02G5Ili5RAQGrZUzWR0uvnGGNyJpRz0uEIbk4gfThB
         ljcCXLq05o9u0HooV9oKiSOw+RlhB4nRq1Th+D5ekryzs41VMLZLALm1JmItADekoOkF
         y50iYll84V0VMAElVXyk308WHKoqm12jC7dSWoeBefbwmPFVUgPiQlRvKvPUyoTR8g4j
         FIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046614; x=1794651414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=b22jkuxtDQp9ITqYlgIaHF11PAfe1AztxZi++zbdz4HPo9Pzs3lwgih4M64Zj2Y/Ge
         hGoU8SHLCSwRM83RRvkC25x/dlNK8wnE1Ya7BoRco1M9EjAE9iccChIjc7y/wvt4p7on
         Q0rWgHLowCWJf/5z07OLVBERYFQqEyPWzNeFueHrHM2URfChKfy51p3MxLXiWCzOCyF1
         A0kNfFFXVthgcpT2S8Vp4WUHLpqoyb0D9sQIQ2W5lKP+E7bGazlPiyuu3b4pgf7rmRsJ
         dVHYYWX5GtJ7LpJFC+s1q6Ki/PxxmQqIiWwbSFoaQY9XOy2s7GvY2UubS1zW4rw6yy12
         NElg==
X-Forwarded-Encrypted: i=1; AKwUvBzD90Y35FxERQ2/0Om/uh7mahhMV30elFGP9FbX82rPa0m7BTMdTkEO8tAwQDTOdm7qJaU=@lists.linux.dev
X-Gm-Message-State: APuU4Z84OL6Fpn12ofyYrIraYwrEnwXpSrxL5SV5glmU754Ttxa1OzH+
	hHfp9STfwEVvFNmHSRAJ+95fxqO6hHYsemomk559EtKsWeZvNPmA4LdA
X-Gm-Gg: AYBFou00OMQUvBxJEGmjAyu2rkKqN/oe1QavkOSIcJ3ZbS8QTGeZVlDvymN/+WXQkNS
	FNAfCHG9PbD7dSVVwaN27Gi9ZF2HRVVRo9KKckZWv1K8jpbuqjqcQzhQRHfBdxi8JtIGZ84juQn
	rHEBTRkt8RlA9FjKcFoirrIcy1bYhumGJ3yfofD75tW4xofsSidBLlI+URZYZFZRuFcMz0aNaxk
	sJc5uq4D7b93w7bk3eCq3xDf9a3r42WgjFc6ZK3Qk8hn2A5lrL8epM7B2xIxHe+RWVEBZwtDGhN
	EQi0oB0YBFyGjPFCxpLG8pLaa6eY+AN4uCR1BpDoPcyCa++kkM7hcZyiTWzfWqWyJRayC5pl32N
	gL9RGEqNGWs9qK/T/jG3V7KUI9XOw9T/3wkV7RaDelAgLF/mo2ZX2iLYIBBjclKbkC0bRilAl5W
	b9G6UgX7q1WHtExFujcJcmZeNyusJDO29UQyJbNCIUDq6NvmeSQNAvH+uOAyXNq7eBWYm/8fDzb
	4+t9zxCFyInWlGjNCekLn/2dnI6cTM9NqSESdVkuq6uGqIEWnbFYQN8Ie0HXdlJADUv0gHj5Qam
	zQUC4v4iyME/hnYwJ3YHfIY0RsOBHKigZEyFvBuvqExjUIWST6SgEqX4HcB2f3ob3wdV77YH9ua
	9cv+uqMTeK9ZaQ3BTf1KHnRv0clH/j8HBXT64BiyZrj72VW3itNc7btHRRK622iKA2iiL/V/H9F
	2IKIVMtP2TLvkKr9QQnYNXdfQIh5SGuPLr7VJqUnk4cqpOfCcg0Ipd
X-Received: by 2002:a05:6830:640e:b0:814:8259:780c with SMTP id 46e09a7af769-85f1d012c2dmr5221596a34.19.1794046613684;
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:07 -0700
Subject: [PATCH 10/58] mtd: rawnand: stm32_fmc2: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-10-0181ef0cc4c8@gmail.com>
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

