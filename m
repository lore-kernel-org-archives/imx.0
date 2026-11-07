Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046626;
	b=las2ld1ERPiEIEZLCBnI0A78gqSaLhBqqUJc7NpHYAOZdAuF74DHIVKoY5a/e4fxkKYV
	 OrTtBZKu6rXxfRJLUKwtUBTxtl8kGFB2EMJNLmcjbaTzTzoQliOOI9RfUTOY5M+i0SN4f
	 z9CzzOe7I3BKOLKzwWjUeJ+q5gZ3PI6puRfWuQVrHGcHdAN4ea2ffLvVJWLp3aKYugXJ2
	 v2lc+GM8Y1dI8BfAoBdkKFR1BRt85HE+1RNtz+YPJwCzb7U4TZ5vreSN6S1VMEO1nRRkP
	 JBhLGTMtZeOBqJgfozqg4gZ/jWmNzM4NVD5xqNy3P3u6PSGZoRfZjdBApfgtX7YBUYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
	b=uPahQ/yLmJpP9bX6/iqNdFAcx6U6BCixw2qn/jK9tgGrK6IDgpN59JsMqUB3GzH6VbbA
	 YuiiEZy9GIRQ+KeTL1LTfBK9uH5I4qOs7O0EISKn/lFklSEUSsWrY/C/B292bv7XzJO2e
	 NfU/UzbTenkj+87eeVec0Ntib6Z8RMtdxA6lYhPr63DKDY9lNxrX/QWg+WVgCbaSRJiB4
	 30NF8W3TLOD3iZRShTBvw3FgNvGbs+Dzl2GEww1x3ahBBYsYbYOkJv0hvHU0RgF41AY2J
	 /QFubMx3NyStyaRh5E9Li15UpIr2lYdJV9CvGxlxjqQsq0UtbBqhyk/mxdWRFbt9PvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjjrElTQ;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D560A380B
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8D560A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjjrElTQ
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8241a56cd70so993848a34.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=kjjrElTQ3cd4g5m3xJZHhVrQvIp/2dR+YV/6c5szKistAnTWeGGW26prgsovzKrdd0
         M04yIWYL75uWuTlUKDgvdg/fDV/wtHBVHBuweCdqOU6xGUiThvy3tGGZeqBIvGZtrKd2
         ycWay0MzZmryMFOxGWSopgElNoMgkLKMLVA1P7znzIHVTR7CiMzvX3TJxpav1nMXup6z
         X5t/Fm0CtYdNkVlmHfmYJPPELbpNK1qv13XsipnT5VjWoVP6wIqakqRK8V3p5e/27Kea
         hBv5e7X56HLB7DIuPTYZN/pa41HOxMWwRL+R6sKepObYBLSUNrpS0PrmMqnkAgkeEq6U
         OP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=hfA5KkqpCgi6Py9gEWnOfBL/QSQwaEyjZNOMgYHx4A43JCPQFgGNL2rGCxYsevNBX5
         g1ADsN7X6IntAq2ixH87Cf/HRqhDzljWi6V3kJNFzsiNoxiSN/e4nNMwWPDxYq+/G0N8
         i578PVt8fsZqZWawb+Qq4GH1XQMBxdlEls15YKvQ3ojINqbCn1O8Cu1SVXezu08cVrk1
         8sylN5h8Jo27nayb52FVamPuMV1jWXPZj1eGdB/QzcDQwmxy/XC+smAA9/o81x8LAdXn
         WLVcaol2Q7k/hxNlAo57avkKd/EsV+KTq2RbxpNhavJcpYxzlPMGH13YDE82GvCT1gdX
         IR4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNhBZ+eaTSLS51jo9yrb4NN7UQpvhcMdtf3D23QybDQ/raa01yDTAa36T9RjgpnVra4BM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/aXynU+hVuMoiv1Uvftb4zihOYUickxi7YbVTsjLbr1hGBYnsp
	yf0nWOCTjW2V0gyVb5T+9/O/DRNw5b9WcWgpYlrbP40Y0oACz1SoEO+7
X-Gm-Gg: AYBFou0aP/BZOllMiH50dxCNMOGR42jEac5ixNmOFVNZmDGffKwj2hLdvILavHbB93K
	N5KyLbPq1vM8O0E4OHOk70ylYorV1rWPcMLNfZbdnXoEMXzPJHXIiYeO8ARYe97UCF8XrI0kO+y
	w24h9UAlIewj/F3W7ns8h55STwRiMWeDk+fi98ZDCXi0Hzkf17nv8ph2t/mYO1KElZ20rEM0QnF
	pp9N+9ceSJ6aaVOQBiLAr+3K55gaoQxJjoPrsERei31gg2ciWjBtQ9aRAmwcgZ2lqiMEXRNkGPw
	pRuUGSEbypYNmx4r7n2h/sSbItUf2YyKN6ujuh/rbiRmN4yRmWBHdmPkP+ysh9P3zXwi4vyzMod
	sipaSsL+0he+qjXCikZtxuUR15LzQyUWjImhuxvd8NqeUzvi0YtOLhRRb0G+b//3hZPLMgjwxi5
	arlJNmy3kVZRFqWTxyxFQ3NUbLBEJUAYllYS0AKh/B3zCvKDG4g8WthQPDxTPG8JcuMtXXlHE6n
	vFowMLCUWPr4N4R21HyRyWU7UMcUFE56tVZky5RieDm8V7CBvLX0uWgGR+6w+di/xGjC+W2ItuJ
	EO4ZwarNk3KstLafDvko+71m04suUC9xkC5XmVOW6nnGAlKNxwd60zwGiUhObUjkcL8mgPBUHwV
	qECrWsIPfvOrkSkR2YByAcT+tfZhdH5vz9zScIy1nXiv1dk4ZYmmeG4YEy1+0wYXT+NcNSi8OEK
	wFZu01cabUCUlxXC+pfy/KjlfZh+SFcA1bXoyG2CErFGTMqiIvHpU1
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

