Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082395;
	b=nIjqSYaujb2knf9q38HPV3smTPTzwiqE9T1NV7lSxTTL4GnK3JmE5WM5gBk+8TUjStpz
	 YDqhwZfR6ml5Z+eISO61fLR6iLn8BlH8B2/Wa8OhLwrA2myslvpKFMODqkzSfYJV6rEVq
	 zSzlrAcUdu52zKLyzZNrqGeNSIm9Y5nwNCQf/kYCre7+MZVaraYW295DkkFHQ/CCMmKbs
	 8JOM3OivptIhbnu7mHz/v6f7LRvobzJeYCHsrt9bq9ZaiVvBMRdgK6OsshK576pGVYddR
	 sK6meslH8jWTxcWzd8FxBbpjbzTDW1/6WZnlHFdASwwK64BMMrVyIqoLBaIDcM5ODIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
	b=M1XpW1kChz8eB/1dAEM1n4ABz/TXK1/rWzQi+5WI/AKl6Ap6bnse1qaqRc15RRjYEb0D
	 7KI4wNBBaBPxruN0Q5IfK0jmaueCtzjn7hjnVxiOI5ZtBoenSybwbEjMlsw/5tHfKb1mx
	 tj9Zl1szKeL2IWsTdZX+SjA8tq04cs6UR9TSNcpSKkH/iDf6aLjBxLN3oSEogHLWSzVyz
	 8gFBLNYi43gMtj4R72NWes/QQAKMlRlw+SRj1JLnkzR17Cc/OCIwPBGEasCBlLuBviRKe
	 Ohw0g1uGAAk+k23dkMxJDfIotAaqZYxPmVbj0HECIqATIbLfdM32je/N8EMUCGeflPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EF606A33B
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529EF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df0b02fe91so449561eaf.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082393; x=1794687193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=mkgmAq1vTjpvPI+AYu+uV/lraszTaFtbFYy+YGRS7r7m9jNSbPFgE52+YmoeYnlSOS
         2qd+RelK3y6BpDy/RkhlOjMg2m/38KC989qOUYJxkXg5YWJfSHKa2uSmiXby6j7zcyKV
         +U3yuMwSNEdGM2j2iXnqSIUg7KbuPMR7hAGIxVrEUpDQmepDyN8YYSG488KGPq4WDXAT
         wC7Myh8kwgntePaJAVJak/8zRAB3fwXn8xPsDaKS4oiw942egwU9hAOdMAVbtH1zOnMf
         CpK4zlL9cf8RerR3scsh+aVoa3mM+10zdOd+WuI2h3mL+mc2jaizHjK3uSxMaZI1yV+1
         EdVg==
X-Forwarded-Encrypted: i=1; AKwUvBzLVFdntP7DW7fnGz8ho0O+yOxd52e43Ys8sj0vuajs8esvHHrTQqLhvA7etDqxM3HKE5c=@lists.linux.dev
X-Gm-Message-State: APuU4Z8le4aIS+RTrMm3FeUqjuIEXRGLpZP0jVQZYMh9mlCAx4id991h
	jYxyHsTEJTNN1fasLEHydVD+z7NiIN8V4hQk3PDAIKAgR2DqNSirrQtnk0/Fg2sDq+w=
X-Gm-Gg: AYBFou2F5Av6a25QDyF87V8/PfMaf+jIJ8PNIh7JN7jWcTgo4SYlfIUvbhpULBOHEs7
	qSaAxUQafeTzQF4Es8W1OAv4dNIW34xR22T6U0BnqddTZ+YWriUscgzytJMTAFkK42bPzlq6L8D
	f2OvhJ1T7Ddn0CQQUq4DRphaEGvpAWFIYF3zWDaYwQ4WE+kVFChneNHn+GPLpNIIoHWeW+UOVSz
	HU36D9q7RoFNZBQLg9Zhj4IdU2LgMPKI9OQnm6a1WDMAN8k6iwJ30HwWdo2AiW1RYkPzebgvZr5
	Dc3170KZRh9XuaJ4sjMPwphk9K+DaKFLkcHm7FdPCuWYaZZOaAxxa0AX6plA3Wb62lcj2JSS0zl
	Szx1wbjEVCI+6OazmaMRPiItjs6+n0i+REzoAysghk6vFWm32x+p5v0gtUklhIb+pQti8hL1OZy
	ego+ZS8wETl2VIFjOmwUq5jtG96qcZqK7sjOi8sjnQIDQwUS1B8fQI7HCaJsRRDI9zROfyoFoqQ
	KbIpppD2advi7Of2HSuNK8c1Zt8PdJ3EQskrgVpw46DAxkqnpvuZkP7iGqXcy6zyquvz8kqy7t/
	Ud+1tZqioAJX5D0PRYwS4MP6pByDXzJKX0/5JWscnkfukW42SqfR4cFsUhLR3A==
X-Received: by 2002:a05:6820:188b:b0:704:2628:b1ba with SMTP id 006d021491bc7-71700c850a0mr1064837eaf.23.1794082393182;
        Sat, 07 Nov 2026 12:13:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:31 -0700
Subject: [PATCH 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-34-0181ef0cc4c8@gmail.com>
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

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

