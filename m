Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082212;
	b=mbVX/uRYefwo1ZnAjRjigVR3okZz7yU3RbPBQhCQoretiiDZfEUarzddnzL10X+KuiTR
	 rM0/3vleZO0JTyLkEcmMN7yrpsgZPGR4dKI2CoAv8BQmPd1HACU9/08l2B3eUMHcjrLqs
	 v5SNFk1qWuEUef72CMHzZ/8Qxo1igSSIiMqdha0ht7a0Sg1Jd/X8oLATRZUYSaHx+VSm+
	 APQTW9IIEetduVKIHA/woJT9+wh4zgkJNSGahgZvHyoy2eTXt/FpEo7KrQWbhymYcladO
	 ioZuPdaxpQGCvC5n3rPLs8IZqHqusS2m+KSXMV61gGk8aydnZ3++luHPt2kakjiImUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=14KK/rJu04n8IdnHBIpuc9ESaorGv40vuNCPOWnm48byBGlyOESaOs7CF/NmOReo+EZN
	 GSX/pqpPVPlieJTYdOXwGZ+Q1WspvsMlyL+aqXK9HtN0sdx3XO1+Kymww4E2+mqV6yGJI
	 4hlQAR0qFAO5OQ/mgbvOZZcLG/AqY9tZCm+5eyiI/EBYl1tPc+nAc6U9bVMHvjfkinGhA
	 qOBJo+J0EU/T8PBAwp0DWVDanY3mRumnsRr+527rf9WBLL1zyfM5bFHS8vlRWepNoyOVL
	 2dvuSSfTOfkAY6hIW8G6h5EMsF5R2lbi4o2kEd0biVY4HPvrnXdV45qGFm/vhNomLCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B5606D81A
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415B5606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1103646eaf.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082210; x=1794687010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=R8KZi0E4kMSI3vLtLqkCkhl8GDiNpRyDpz40vHv71RlSgWuG4xJlFmxsx0iwC7TJ7N
         WADPqhZLunIQv59rwsuAPCuk9sRJGQRUNirY4oPL4tC4jz0Va2lcjqXVZ6CDfFyNJ6pB
         E0b6RH2LfsabZnHXny0hUG8MaNzYPxWvyAamx0UxJfzp77zQDtz38aiKgvkt0L4LYq+B
         1zbIZK1ReJHy/Ha1wm1c821hEPVfr+InXjz3L8SA1M8ZHG78QwBvl4DRsE5xkLZ7SBpM
         q791SyDVzvcj7UDHokvVcfxHxeKceFXqAFnyYL16GURND3nDBaoSVr0UJgpQfFVhsynR
         7DPg==
X-Forwarded-Encrypted: i=1; AKwUvBxnPpkzu5bvvOpb6FotUb0V+uom7LPeJEzjccyM5SElLjjHU7TZdjNwgrjqgY9lcz6UHA4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+1rB7sy+wQ2fScyS4jwyzOME3yeZfZ1htZr+JDVZajslIERByP
	hO62rBicn1QGXGSfJfgjaRzvAG2xH0DQ0HVHqzhAg5fCM/7k3CMCkLWVvfqs3cXhwtQ=
X-Gm-Gg: AYBFou1267uGxgjayDdDHT31RYrp0D3dLBa20CvV0FXClG2X64+xp1T9P2zAeNGdUIX
	J0kdAsGbD6e32c8E6kUyfPGQAq0iY+bjCstONPkf18n1AiyvyTxyXUwtCmsVeILThq9btc8KdZt
	aq76WKh+WAvpEP+vP5CkEybgtuG2t7Np8Huy4Byst6oRGeNnCGVcwywoMn426sfqaQ0AWDbnCqt
	eRY6Kw4ATnU0fMXwnLqf6mZMc/mPZmxz1mnFIdZVAD9AJ+LoKWP+JSDSgbAt21f5bI6qMLibXqJ
	gTCzZ0LlgpkxtGN9A1xCbyjPIQ1t/6zBi9OmvzM2BCQACBN0kZGLRICWvnNfts2/nvYd37NdMOY
	CwQrcUyor/G6v8t3tzTuGVq47OTuyK/AnCbKTTHqnedFtlFhsIoHJhvbTY7WgB7XW7nAjWao60T
	OYVYrSmSx9lM5Ud+4uaFMRxasjM1Lx91x3WNoLzjIt29ZpHBY3IkwzrfkcfjKmmxtQGZcGaANFo
	EeUgEtj0zsOVqdf1WkDjlHZU+HVpTPu12o4MbRYb0U/z3qa9OhQxmKHaVpd87KuDxpIwvmMr8TL
	btXDmHu6J6cjzabRiLq78wqZSFFONKpL52uAcenkvcjhkEPRE8v3aFjWIMQ=
X-Received: by 2002:a05:6820:7054:b0:6de:25a7:3be4 with SMTP id 006d021491bc7-7170f349085mr6610eaf.75.1794082210155;
        Sat, 07 Nov 2026 12:10:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a26d74sm212708fac.15.2026.11.07.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:10:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 19:33:38 +0000
Subject: [PATCH 25/58] mtd: rawnand: hisi504: retain open-handle state on removal
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
Message-ID: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-25-4311be01fa4f@gmail.com>
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

