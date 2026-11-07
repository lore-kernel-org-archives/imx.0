Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082406;
	b=rX3JU2N9FmrSkaUB/xj0FQyOLmheB0+1+Oj1NsptBpLaGQVSFhuA4drK+v+EI7XGYkjE
	 ydmiiMoZilAjYEr6wGkEikokd5hdgaYpwEajQWXrFyaeTQY9N4quFkwu4hnh8G8QHCMiE
	 P+IolOnzCsDA/2HIlJHpTLNHwt9d98eI5ZpuoLnx1p4R1jUqdvaKO1kZG/TB8edLWROt9
	 yRecOGAGFIQjZVCe7bYwY+rbTyry+SMSIViHh41ck8X1Y7Tc0LFXFLy8GwgTy5/U5yTGP
	 2gPsLUIaBvlfkKLKIttubb2PrQijqP7njbkaMDG9SbBS95tG5iDR8uGSr2t260DLm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082406;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
	b=0bYI0ZMNkKf4+U/UXwxziM1u49cM6LrEITubCP4+5mKQnQUEv9mEfTX9CW1ivmJ0rSZ1
	 F2hMG6cyJbYOpPVo+w/+CBdBuHFDCUIVJdVHmC9LSgUilNwLXIHdlhU+jGcMDwxMbczh2
	 hN5TpB6nUs0qeofFyud5uh6OkNoMBp/urTbU3ZeJvZQXi2KUwTWk0fAduLa6BrBxnjxIL
	 y8Ruk9Y742jXD+MhsRsOIp+Wp2xGO1AzFDfAMd86d1vjE9BIGEsVTLdHLoGKNiM7zbXHI
	 0DT/KDLXMPdnf0xigtrNKRpAyV9/oMJTFpiYZE1eVKrG5BXDgT53EptjZcbiIESdkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E80606D803
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E80606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ed6d69bdfaso3316b6e.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082405; x=1794687205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=GeLV72QkWQGgFc57NSlyB/WZbCtXxhuZ/ZHzhpwU7wWfmx70QDRZS6pXI3JTl+voa/
         oIm92e8gZ6yXpBvlv8o136p9KXCnuTHAQJLhRPAqFnNVLcLAuSndJM5t5tLUvowBVuUf
         ldT6jKXAr2TL9cO7srN0TEW2FrskTdga5WdUFSWPnHroBN8ad6NaYWUnzdvzw1seuEJ6
         zOan0smHBHXDArIrdkqurh48JMfdhWxvdG4DBqnLIkGjSoAOjfUI4sa9FNZgEO0RFeUb
         iWYpkOFyn9M3HWF1cMZh0gHv1kM8cRYM0raRjEu2CmBTlgBy188mxyPz3zdOxzeFJenk
         zL4g==
X-Forwarded-Encrypted: i=1; AKwUvByIa2tgv0RYBNTagvQnXk2+aCf6aVfjt9Wq+g9LzErrkmKb3obaLaOlSvJOUnALvaXH9JQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+osArKkCT2Jf6jtZkH93tuwsnXgivBTIKXmYHnnp49e5aNvvHa
	7KOTJowkSZXfpg/L7OY8RoVv2zCBcFtpsSF6oUDXtMsxTtbpYVWE2Pyq4bz7iLueCoY=
X-Gm-Gg: AYBFou26/tV9ZUoJ9BMJfvW5RjasxOjDYNoKuiedRUdb4kb97g9HmgI90mHn92RL37Z
	wscT+48wwhFB4eh5LnotajW3qQChV/EApZAddU97Z9RDPgFMghZvEfOsheByWTvXVwi81H4kqx5
	jS8c/vzCissL+RwARY9AlDNajdNxvmp6WlCG9CHQ5Oj7EUUBOehBUZF0d6YgW4lqYFf3gVEZwcH
	2uoHcLCdTfPHb0vtIodb0SqBUb/Yx4+y4wMnDE6Bpe13czfYgOW2uRCP8wJOoGyOY9eytlEF/Kq
	kV/SbMKdtpKO6DPoxdRC9ZneQVygMS3ZiepWPSt6wnEUqLy6KgU8cRsntF7whPtk9W0SOjijM5H
	hquufkE7NGKyjSaM092b/MzFa5KHvOabaahfI9DC6XyB641yhXoaPi0gLffecn/RrhUlwIDJP40
	rIY0ixUPt9C6pZAc6Tm0o/6gOvt0Mwy+y8j2/bGEDMuI6IbNlNgr9cPbVQTmxGvjYHxAigmn3bD
	7x75SUJvyvN5FWXeVy43KfwFzG8985OBQcAxwpFUaCzq2rVL+0TWNMYOkLiBNuQnaH54nK+w3Lx
	YpIr0ORLjbcCQyKnKgFrjba6UUJ9KpxQz84ga7DtktiyUMkXI3Ka7HDfBCYm
X-Received: by 2002:a05:6808:1202:b0:4c1:5614:acab with SMTP id 5614622812f47-567e10c6cd6mr4431450b6e.37.1794082404730;
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:35 -0700
Subject: [PATCH 38/58] mtd: rawnand: cadence: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-38-0181ef0cc4c8@gmail.com>
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

Allocate the final shared buffer before publishing any chip.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 60 +++++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..65c4eab600af 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -2991,6 +2992,11 @@ static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.setup_interface = cadence_nand_setup_interface,
 };
 
+static void cadence_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(to_cdns_nand_chip(chip));
+}
+
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 				  struct device_node *np)
 {
@@ -3007,9 +3013,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3028,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3065,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, cadence_nand_chip_release);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3091,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3138,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3193,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3212,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3260,6 +3279,11 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
 
+static void cadence_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cadence_nand_dt, cdns_ctrl.controller));
+}
+
 static int cadence_nand_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *res;
@@ -3275,11 +3299,15 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller,
+					cadence_nand_release);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0

