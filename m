Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079360;
	b=RuWoAych0wQhvPXcGyl90W5XH46g/p9pNCFKN1pjrNk1dCrXpUySMm0UiDJCLugYo/K1
	 irgOBxmRlUz/xQRDxoKUEEXhuvNVTTKgIOatiaMWAAx3bIVyvYRdUk6kNAA8vP6yfZbtL
	 do6GMj3EqQ+Tn6x64H7FZN0ElqQqciSnqlHVKEBJaFODNXHm2G+CyrGnaP7LXcFHBgLEF
	 E4QQbyJaVhLlFDfdHsUJkjarUKSH1pu3XNjjlNnLc+5j2O0fXb77X+KFHgKqJALyHtz4R
	 8ywgeV15CjuKw9VE22XJPI8oANalOyX7xAFtWeh3NH/K+NwkFExyP4SVolgSogVYBaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=yKPKFn3BJDuR2QvEIVzOca5XJzspvok9/O9dEbp26uSFnqyBSBoihNl8aVcz1GmumpPi
	 eJsCIGhGYk8LCDud/5WjdPaB8TVI5hRVnWi7KSOZjv75Tg3FWQwekeWG5p6Dtflh/KJar
	 TaBi2PtiVWxs1koB9G8XuDvOEd0pYK6S0h9/PELTJGsTCxHUbLJxLG59eCAYAwyTVWZq/
	 KSd7at1OQLBd5c372Zqaiz32C0yZY1IwacJdZInRvhbtXsN6y9WTWgaS+dgttzWBsfEfQ
	 APdMRhWTfh9vm+mxot8+8h7/91rw+JX3KkNa3ZEN13BmBeA5RmBAhNXd/pnVcOifvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUdsmpKy;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C554606D80A
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C554606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KUdsmpKy
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-490d838b425so858494fac.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=KUdsmpKycypFornE7BCk1/nQinc6XnAuAMXXI2QrQO/yRSSrk9hwOlv37bTEh8LBFx
         ibNF72EgmgmN5jYV0muRcVpzdal8kxEOHVdcqXYxnOpPmBSiCe8w8ks3x8Hz9EOJ9WfR
         wOPfCxYkAlOdh6SugAMphFAGtAkqbb/msw5GNnhON/tPIfLPZFY3M5RZcpub36dOgIe/
         sUAI90yDDN5mc+WbaCW6I1gvim9HANkpRz9ETor11Oe5arG5+YpZ52/LwHhSMIODJYQ/
         Y7kPT4MoRjrxW28ByY4Ue4ivUCQeEiiVYNfe1BzvNpjssOh9N9n82fBLkkoKIuhONBDA
         d2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=K4k0rDz8pjuNw/Y2Pr+MyywWjcJRaoa5h4Vq7reF0rpD74HsLWfygEYeSSWpWalOYD
         pSdaVzAk2v4iNW+0ag7XlzA2+O/9H/HJo6V9nn+uzTS+5RQj3uOtmcCTZuKO7W5ZUQ34
         LxqtOSl2vl4secAfgcaY3mXVnM+ghH1QKFM+geUnarQOUsU2La4R18GiJFagRBPrDz7H
         iSjnZ59jYTAM4PuTRQ7wUGDye7d3iBInWCWv9nRvfvVgEP9W9PzkCBmSbCSk4zIIzuDt
         JRpT1VCyp4dKrSn7rtzqNHsXR2X+frMBDNuPeheTofyU7ruz5L7XY4Kor0VGFkiI/esl
         Gp8A==
X-Forwarded-Encrypted: i=1; AKwUvBxD8UPg9EpNtWbjs8bVz2rwYr5q/18Mu3JxX1eNLpRXmOzhSL6PCkS4BetXu3DY9aDWrEc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Gj0t6/iXHLLcNVIyy0Z9B5WRNfsVGOtiLWGkwejZ676EhHTj5
	oYMM0eB51U+whmqV0PZ8WGTnSiyX4ziJ0wV8aYNfsfrauRNy6NI6Kutd
X-Gm-Gg: AYBFou10m685rzmWQ1Nkp+tRjLMP2D8Lp2kCbhlxHF6JZFRn7RDLpSXjh5SzQwyHsKU
	wwr6Yzo6T3Y9b+vHQVqXT/IoZPT+aMjHt3481dNMF1tpGQ9HyC/UROneJDYe5O4/g8t1ZnuOB3A
	ZodVW9oMfAhOxDAYDLeIkLkDgj8PNV7B84RiUynNKOSaX8SI1mTDct5eh9p77ZWPOy2241aXsl2
	3zepCvM1+1Vmc1jj52KnvOwrtN4ZrDvwmBaM+/VVBhNV4Tjx7WCDchRVhI+q5SadJ80D89CBNYh
	S6qdYgqZqmwNMNPDlN37O3ZctvO8sJlWb5Z8dyErz3PvWvSNr+tyrHS54zBugpUtSFJpKmTH15d
	njA0QfqCXr8xOg+BYbnHSEigWaKJ8WH1tU93JtbwAhUvrZQrR+PKhm7S8vBq+3pjXNQgUupj7v+
	NP43vlmTqOXWjQCVj5WXis5LZHeMDID8jeR/3p6c1xLgRFEB9SV5F9Pt3VLkXhs7JttXVVOxKBr
	lnr275a7nfdHg4u9vcp1S4F10kwt1DAcLVGt1X9nm3I7dmF+a5iUvGybOkCrQ1k2gQJYpTTAuKt
	PcSyITcbQbRtDxiGptubRgnO9LLpYH74GMsAlTXvxLDm0jWqNOqnT5UPIMz++RmjxlA7XGlYsLq
	I1Ym4LGRX+bDbdC0iheg5IW6iYKoYXLi03nQrkqz25FSt2amZgw+ccV0beG3ObwoVmtlD3hNAi9
	FxDcoA+KqW0O9Me3eSMCQTTxqnr7BTk2psFigh4t6M+EO2Kbl8H7A2Xw==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

