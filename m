Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082389;
	b=p2XfPoyJFNG0ecfU0xbU00uggjQ5Hj+0PNkYY4UrOMyU+40PHV/EYUYvlb/Y1T5xy+VY
	 zwaEMOnWD9gya3eIAoY4yvOwVnwQPevOlSMj0MUTlC0pxN6ih5TM0YaX1EYjIaNNjePJz
	 qsU8UuqG7hywSaflV3saMh+Wldk3Bbu8QNxvMuY6reeGx/qBQUQfYjG3FB9nZCIjCuCst
	 HKJqbz0vi8dKieHYfZQ3RNomkULfXxNd9pL0Yt/UtsyWreibaMGzex69okcCVfYVRrTKy
	 adx1Mz2humd0g3PTpBH8L2urtncITv97ZAWIM/63cSjwuQmtc/tGbmAnjuLljilX5Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082389;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
	b=VdYgR7oj+lgqeN4+jOnrUpuIASKU0Fp1TYFJKBdbkDqbcZHx6w3Filbe63luZ4UiSrIw
	 pgPQTiicspiggQJK+mXqtJQyaf7sO+X8+MTHwwzK9M65ABqcRmrYrhAf7To/T1I1PUUaF
	 aAwOsRN1aP//eUu9Dc3h4xG986I2Et5doici+3j/NpjKymvQ7d2i2LxQdpSwZ6gripHbb
	 5+dxKtACs4V7pfiKn38QkHdL01N9nPF6CSBLM4GaUNQqBwV68zBrk2yjS4RV2DxBVbRV6
	 0hZRxGsjN00JAlGqT57URBHK7U+N/wqlXpdRuQAhzEUQCwsDyo9sWypiVLVmeEaeaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77E606A336
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA77E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a76f63b243so494302fac.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082387; x=1794687187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y022+nlY6fsxp9yeExqcFOZHpsByokSnlDdM4w3Us8I=;
        b=ELDb0ww8JnZtEaELcRUlxnSwVJuUw6eGzhor05adQtkKglkX51eM7xa+EM/QQy5tri
         gnPspPOMzkDXnotKNMjr+dXKgZszvm4yG8G4M5wf0F6ErkAGYlUYcNrmR2vMEofneNcH
         JWd0cjKVQWm7WUllhxNZ5GUBJ2ktoRTw3yWtBIodrt0kZJ0hpe6THc9tNDDi8dU4jO6B
         C9Mh6IMl0XrLjW98kFbFyF1+oFiQRIC44f7AfedjyvfaEPwml7wtajASXQ7ylFrmB/5X
         MSAJ+Qym1Ws+tLn9AMAss7pGhY6wT6bwRYsnaO9u+lgd5aeA22/eLaOR2FoFgnLkDstw
         9g6w==
X-Forwarded-Encrypted: i=1; AL+hErHZJR3Gp9qDxw7DXFJP7/1mLUanqGL4eexZzSNnf6jJAcBtxaxDfhnSxB4fgRzWDFASr4I=@lists.linux.dev
X-Gm-Message-State: APuU4Z84pksNxjmJ3Z7g8GJFKhIAVLqHVciJWtIeLqoCncVhl08/Lk+x
	sjdfhQHlTFNFhtozuagC8QXX5/MiQrFUhx6wMPIfKrgCTVn3l1ao5wZ31d/Eo8QjxC8=
X-Gm-Gg: AYBFou1SAWrlq85VT8FV0JYI6CuhK9baP50DBPbxf8vssyKFZqtt1pro0nMxHro7nHL
	Llivw2Tb4KPHou49nCqGIZTbTJ0+j6rV0w+FxKaMQq/PXKaaWxRYGlectAe5kwnEUJxiq2TzOOQ
	EjVXuab/2yw1Gvs0K8Ql0tK3KZaUEJ1T+BtWVFQau0KgWqwku93MCNbpKP8vuzI+/i6xkxXN3Bh
	3Gty0Kl+kMUtS/II+y9lBQ5pPjn7tRkKxtppHDseHbUR7HKS0RSkWxv02SwCrcOLhS8ymllg/4p
	ZLHAS7q7FbYT16bAF4jZOdDe4Cefz+tI3ghzsPaW8HUnmAPg1yvQGlVlGW6RwBCoL20Ttc3SXAd
	A5GqdTMlW/2f/MFGaflSGO3zmcJaLWbB5TiDwiAEuOtCYH0melpDymKR7WfxUhwprdZHECNwfWG
	tZEhTzGP7BP+b+QleGcmzKqMqoDlY7XQI2t8TRmVmLqMF9A3atK1ErFL9l8p02U9JYqRv0PaQh8
	wTodTac0tJ1F385kI5GNjF2DVVv3JU4406k/JLfeGaocuSjeAm02Tzel8s5gMHqOG17D/m0B/zg
	7266C3e8nl3WczFsGm0512Y1+rOidz6qTr7SmriDX/TnV8WwV0d8MRcj77Zg
X-Received: by 2002:a05:6870:5b99:b0:470:e96b:43e5 with SMTP id 586e51a60fabf-4adc0c230famr1253184fac.17.1794082387495;
        Sat, 07 Nov 2026 12:13:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:29 -0700
Subject: [PATCH 32/58] mtd: rawnand: fsmc: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-32-0181ef0cc4c8@gmail.com>
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

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..ef0738c4cca1 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1024,6 +1024,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
  */
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 static int __init fsmc_nand_probe(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host;
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0

