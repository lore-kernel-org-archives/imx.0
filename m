Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082403;
	b=Js+owwSbeABfzaIileaGNnXs16m5XNkglDBI0kmkzuIbX6Bmedrwl0WwrANTsSfajp5r
	 OwXmSMPmiCXnohK2bErRvA0ake+6cHKsz6wq5nXbVzzp5Uc2rIn/DsX5M2iSGE2m5/CUj
	 Xrh0dzvgBG6urEWc+bjSzNpA6yhKEOaFDIX6A9nX18knE8SyJo7K/LdftVOT9adkZrN3Q
	 2vx2ETRSwyi1ypnRX1PrO7I/OW9N7WDTac3DITp6+B78m5RvvDrCoNPL4Xikc4YguYrk/
	 yh8NoSm75ww/IgfiRg4jcrlPMfm78Rnw621em4YISp2j7NAu4lraJ4aJ0+dxoVTgOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082403;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4cbHlEgTqAV0uFbOpmY4khYTjF5IiPDWn5PtExd0tWk=;
	b=4Sj2qTEWVsJAC7dVeot760sFLr0WkL4ojM6HSg6ztmuFWnSeLH4HdSJXHR1/i1xotviF
	 MVz5Br/7gVjl+0eRy1RsZjUVq55AdX8rsZlWbaaa2siOQo8bAszt5V88FefrUBflqJ0c2
	 97exk93p6EeQQofaE02xkx3WIVWBv3+z0UXryZ1Ne3ER6OtR7Y9spHxclqOvTSYiepZng
	 Kmej+zcUr8IIiyBQHgHNoUDSUqFyughtVryefZH7cmhSja3PLE4MnK6rs5t1zaP0LeSXP
	 46FjX1IW5Qu0rRaxB/aYgzh32n4F8FQN16nCgisoBipmqPL4vCTTWBk+IJDpX9HStjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9ED606EEA3
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9ED606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-55e0090c580so1956b6e.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082402; x=1794687202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cbHlEgTqAV0uFbOpmY4khYTjF5IiPDWn5PtExd0tWk=;
        b=RghmDY4ebvN0YcgEQBzm03HAfr9UrE6N9Yc13PbdMBlSJGKHfDPuLXw7ngKAMgmGZB
         hlb9M3e6StA5v6ae41l5mLDqK87keCOVdtlVRN7yP+7Je+gSHQjuc++eYqO5qU4PwAL7
         3iiXgBaGGXhTWjRSrAotWtDG3RqA1iaaUG609YdX6EdKPHphH9poIbbTNOxdM6ZvFe44
         0SSVv5kj+2SRB6B9v8xyVOKtJZyEAnVN2k3TtSWcZpiUflaU3v7nHHoS6OW2z+ENfdl+
         Bq9mFUOh6DGK10IhmHMCdDF/Decb788jGas8r8oO9xNHs1UFd6lU4g4Ofn2W8DM7UVAl
         1zBg==
X-Forwarded-Encrypted: i=1; AKwUvBx9X+dAgsjVgmtSlGlhpwNA6Dz1ddSoJVlKL2myuYJykOljkgDDiPXdvwWIGDiuwzulQ9k=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZQtDwb0SIILBu30qz+l0TeYbIPQM/qwkF2Fc10wsiewFn9ifd
	KnoTv6LMp705Tt/aB8XUzBXt9vAwiuEFCushDvMBttigwToR6PDWmm9qO/0qwCRTGUw=
X-Gm-Gg: AYBFou1aDPkGbAESX1UveYBGMcTIWQgdv1o9cfWX/djaKUlROZ1cxWJEzo0tmb90e+Q
	RVN579eYkoukrooZXGdoq23T33irh0wOH8DbJ/R3wOWtdw7uRgbJtFO+/z7rS5ydOw7hikAEwsO
	9pu+n8Cmk+nnBeNrWDLRsZmIbOUfEb/hh5cXBdIv6oGFe2zYRGOBQFvGfRalHZbXbQfCpI6ouLd
	PYqWljCdu4GcAuqO6+LHE9BUC53w45C8o38NioTzeJhXTeXU++/Wxb7svklSVSuPuOj/UJWmHyB
	Vzg7pzCYy+H1psn1Dk1arJt1GCJ9qDiUxJKr2KeaFYyMKKECN1GGFBiSobJhL5lrKgU5FOL3Rum
	1u0E6j8cJ92q7OfFelWU9k/mEk1Ml/iX1eb6QMbTiK6s1vCjJ81y2PRwJKLJ3tWmrO4h5W/IUN4
	luPQmdp5ZMdQJioCCO8tTsQOuowmoBPoICuhLvI3Uny9l8GDWSbShA/my4EpaQ5gEm//dEan+2J
	QaiaLS70bDp8lkG43EkRiuoRctszcIpMc+UnYDGJJnePlnsGTfbqVPS2L6FaDHcwPBojbeN2BrM
	rkT7T6mjzsNg+QN6H8pNq30xe4Whg+4KvK9B8PTq2Ou32JdjB5jiLjrroCGjVsoCyGnbfwcd89O
	rnEkMWg==
X-Received: by 2002:a05:6808:1b0f:b0:539:df4e:2d20 with SMTP id 5614622812f47-567e14d55ecmr4884980b6e.27.1794082401790;
        Sat, 07 Nov 2026 12:13:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:34 -0700
Subject: [PATCH 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-37-0181ef0cc4c8@gmail.com>
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

The deferred detach callback only frees heap-allocated transfer buffers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index b8834aa96e81..4f33ea7a1b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1381,6 +1381,11 @@ static const struct nand_controller_ops meson_nand_controller_ops = {
 	.exec_op = meson_nfc_exec_op,
 };
 
+static void meson_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(to_meson_nand(nand));
+}
+
 static int
 meson_nfc_nand_chip_init(struct device *dev,
 			 struct meson_nfc *nfc, struct device_node *np)
@@ -1398,8 +1403,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1414,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1434,14 +1439,16 @@ meson_nfc_nand_chip_init(struct device *dev,
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1456,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1464,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_release(nand, meson_nfc_nand_release);
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1501,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1544,21 +1560,28 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static void meson_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct meson_nfc, controller));
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, meson_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0

