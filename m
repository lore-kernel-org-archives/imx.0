Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079356;
	b=ZRMa653KxdUZS+JOpdVYf//xVGcc5yHxgofx+th8CrZxixSWJG/foDx708obLwwkiFzV
	 uxfRCNIyNXmDkQjsbY5QxhVQg1LEyKQE2B/2eo4jlU11ZGBk+AdYpyjcKSIQmnv11ERkV
	 zjGWH48AcztMyv/BEVSU7CI+JmYdgB5CDuf6dUH/Z4txn+HmhP7iWaFErdwwN1gGgtVxb
	 fvbtlemcqMJOWsIrjDT9G5/AzkIpmFFVxoeQsqVbPe39lCs8m9iT3tcejE6rEnTnca5Lh
	 7A9z/OD0zetGTWRkc0/i570gIoefjRNBLy/vwmAIiSNEE1NvZRkpkht4U77TBYh4CPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=y053qaTBZNBn2oFV19lcp5Zd2jGhRabnRvYoyAiNmKAzR37uy/YjK68G00dznl5+HVh3
	 +aa35HChZQRlQmLVu7ZzBr8KCa8l8eRp/HIE9LTDPvw5rmRtgDDDkqWoJoyWLLtwOMLNb
	 bS/3gAf/aJqaT9VaKfL6Q1WakVbywFdHQyCmbDRKmc8lA5vmx7DTrg9dqyXjwu/CSCvEb
	 a88uYm4OpYrUPkiJG8S60yS9mt/o/pYI7kSYMaLT/hsElEWQiKSlJ0pnhxQ/+0wPWsiHY
	 BVo0mTj6QaryioVABq9W6pT8Ygq7AevUqk+slAwDoloPDSo4DRWfRl9L+JNJkQRObqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNG0VmIf;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38845606A330
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 19:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38845606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNG0VmIf
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2802fac.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 11:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079354; x=1794684154; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=JNG0VmIfLZml8fttdl+uxuLKHv4dI/YQsyQJzswmDeArcSHFQFVwBj1y0fPu4GDQaV
         1mHf2dKd8ioCdROqcFduSvxliikz/0J65xVeeVCB9Qf/bwfE6qoLYe9d3pLLHn1yHeDg
         YBfFld2iJa1lHkDDiWi1DCvrTI3cqf8qYLXncqyP7mtrGJr0ye9MiyA0YJGwtAW7mVe1
         EkPREYCJE2RJlbIhpGPrTlQ/uM7K26Ovhj9LW86kGts0qS4lIXs/NpTmhruCoRv6jeaz
         ycyaFJfZEaPr6foIBhPKJBSptzdhdwcBCmI7suU2rD6t0yHAuW2k9alZRGQ3HctppMcE
         nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079354; x=1794684154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=Pn89Q9Gk/C/Utg9I/MpqEHt8UhTym09CDD+DM2bNq3+SfWPgW3CHQEitHekPPygXCs
         GX0h+b/2O23E8vI97CMzMg7LHDLInS5Qk/c9ltZ9nTzW9AmqsiNfAR9p9BGaA8/YQqIo
         zi5UyHvZqxEYZmXSj/CTn/uaAg/WK5Mq8Ey1Fi9WcO10IvNYOTJj7WD6eugjgSDWF5Iv
         ZpQxhHnQiVtomqbz9aFu/wIPN2gXu4nN2A7yXMNrtqMtYI+j6bVX5NI26HXhTOCDrLhZ
         6irfk2FyB/+rrIR7WBrb1j918djpK8x15dy/TjiUoGW66KOHr10+ksT6fC64IKVF8N50
         iuew==
X-Forwarded-Encrypted: i=1; AL+hErEyCE3ZuMrAIqWUBMbUNilGyRmIKSJdCCt4gGtlRUXazuQ+9Sw2kEeuIjvff94J38QiwwM=@lists.linux.dev
X-Gm-Message-State: APuU4Z92Uyq9XK2hP2TZq44NozhvysyzBYP4mn7vH5SgMIsNsSqdsg5M
	mVHCXtRQZv2i7s5BiygfN7T2rpbWIneBcQpk1TiYlCpZOEgJ+Oho8OlT
X-Gm-Gg: AYBFou2vzJtjEFMv3gqR6WuGBw47sUSNYUiSe1X+y05fucDcZBNq8VDzbWxrNPsuJrp
	S2PD33g32/P6FuUZfP6d7TLxYJ0quNMMSBG90WWm4mqBLyUsNKdMAb3W2YwWlE7vi+c8lPZRs5V
	4rvHzJPAbKGjCh4HBv7RfrNjLvdze0NCHErl47tguIdRdnPVdmzufI8/Xu4rb/NucKPVj6w3mTi
	7bYyd6RdXrpN0YvDY6PFm6oMLFL2UF4v7VPbAp/4FNwDy9BP9+H7KIwe2pp1QsDOvFX5e96T+YP
	mWJxVMdU/E6CdnO9McGjpc640AijEmAuYNplOoCGh1ugrBBFqPOkV5HhtRpSNctdQTx/cImigyV
	GlWGmEuQK0d6dDWX3aOWWcbDlJyPE7hnS62LrTKiRkm2I7T5OgIfLUq3hlWkNk0VQNVKRL6qJLo
	7pmhoIPLOtjMCHwSuxxBNFZ+UgH76fNXBqCbHOeDQt+2wJASqXop5lJ3iGnRgA+H7Qe5G65urnE
	+F9x44FyLKokJT6JSQY0Ea6ljCpI/pNk8RSXnulIgGCRS4TAKkpSsR4HM8DZqxLwgy3oJoJOnwd
	iMaXoDru06RYf5z/Ff3w+D1Xe5uAhCzt9HnVND3HxHu6AS82Vxjg7bfRrGe/Yr1qL0edgTj3yOG
	sR/dspDuwCs9QB5U98hvyhESWzgfQ1Lc2ySJiZNVc4Xui3aoWDOjbd0caGizEtilbAgs6yx17uf
	LhWLdZjZTAikSU080hGqQXU1BqxdJ3wue2CcXhodYV4SfRfELIhv/3
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id 586e51a60fabf-4adc0db6cc1mr1204864fac.28.1794079354066;
        Sat, 07 Nov 2026 11:22:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:22 -0700
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
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

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

