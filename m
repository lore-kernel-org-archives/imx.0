Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082446;
	b=qQfV0F8dNCJ8qSMIy/QggwLyjGueEawOXQqmZGJdbToUpGaAU2Ff0Gf7MIAKzoJIomys
	 ztehyysUdnCHZsyPobO2CFn0qYKessMCVKF7ShleOu+AcDJvmvKVyufhhCxWAPYJNLExt
	 xqEoaj+gyQNwEcB8pOgeewzKoPm0cPapkaZDatz944H5mAkJAbfCNzVCM2E8PEBfO0kFw
	 C/4Pd2V+mMQwz/h8REMYNWhGKvIDECTeaEAC8vKw32gXECUkUaZwSbDgFXn0GbKnqEgBp
	 wV9n3cE9GqRpM9Cj6PfQM24F7CCoIDBD5xDx/U457m7yXzjxKZ83zSMnRiHQo7RPtDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082446;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
	b=H76NPwkiK3SlFkwxFfqewPFNqZHqhgV1uRzl7eeCy1W7Uw/cRxjUavJbOIQ7jWeXxXbe
	 uu1FnIWDLvDOwhk50yQdZFmxfaQlKDK1cV7QhV3506qYfdv59ULRv8nJC3N2GE25WnGCc
	 ZAt1f7PK5HynBFaVgShSlInEHQRHpfYPPtUnR5pNVVFBtfuBcJYueGVEhPMepp+SjoNsg
	 hnXJlMLs1mKQQYbMwnuCGP5dciWFkuqxiC4OgbxzLFuX88qvOTz8qs4DtfDpCO2QOg0lB
	 D8IlXtQKmioR+WSLEQcF+ZucE5fOtwJR7c7zFk2EgM2PYFrCN/1K3TuzFNqRHURHl9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864F860A2603
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864F860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dd7070699eso1179536eaf.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082445; x=1794687245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=IJ7Tt94awXMOWdGqUn0Qx3vE0G/oPsvuYq5pi3w/EnxheGGqncvxZzMkvlRqge+w/V
         p7mRh/pR+i1EaCPVrzVXVqunUZgg8qGbM7s4YN3Lm7kV0Wcnf4Gsq+yKRXwbirKJIbUj
         30Dp24wXg/3sSB/s66iPxiIn7bjIqxvfm5ss0G6pSA1DOAEBx0wwfIQChXFrmZGmouG5
         k5lD/yQJ7N4/JHrIORa9u28uxDql/sU0Fdilr4vmVFpn96no3YHYAh86IXG1rD9OwQPH
         XV7x4HDj7mmEYcWd2JLSeLOgKec45AP7CFZaLSsThXeui9GQW8ShRPbrkijdodP+2p4m
         rYbA==
X-Forwarded-Encrypted: i=1; AKwUvBxnAwlzmsmUdvaezhKY12qPOACRPN3cAd2hzmeT0z68u64sc4cuOmC1ZmCAR7EYj1zPx10=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Dtqu3qVlyLs1OI4lc/mHFKle3NwuJcGNuw6Jc7Zt1Hqt7UYb/
	oHI3DRJoQJx33cFon8ByWxFY4GhTEMii57Srh1Y5tJm4ajVmH93n/5xUN7TKeJ3HRPE=
X-Gm-Gg: AYBFou3gIOiaZ6NvexQA3C/wO11gc4N2j9ivHOPytxKU9vGlwfloQmap2eDshrTde1B
	EnD7D8gWcsnx+cgHLp8guAyD1VC45wpjX+R5iMnp8lvdvfecP0nDXA4z/0VQtNV2Z84OJV2ot3q
	tEb2bXc13WA8D2Ih8iSXFtB5IUwJ/ZDD9mX6LWoAwuzRmxnRgPRs3ib8tbokHXTunzWI6FVac0j
	Y1t5sz+v/l5xu8cCMk16aE4+R3+EK4oIQxS/lID8nDjOeV+lPF8dc0SJQ5AJTt95+njntfp7Svc
	Bdu4iFEDDPdU2aAXtnlf0tQIaaYBnfDRKjqEemZsvvPFxppG+WWIitKFayefD533MSHPWSYHJBd
	zc+lKHCYSNAKMCrZcIY4yX/3SppW/Wt9xQfCdNXoiJDDwdqdPQzQP+1w+hdh0PoCw3PPIcR+/Sc
	cgDRP6cKXHcjAgopb3hGnvvqnJiRd4ofPqcE2QfpVD03ZAbRaoudCFYJU+b7uCBg1ask2wie5fW
	38Uz1SncT3ztbhKFpjNDAeNcDwb64xscc8MVN79j4d76x6brh23yUavWtM1RQ1qa98LQWI+HbOc
	dV+HjiCGBPQMnpvK15VwyYLnBuXzQtKhYhnzv70FjU96eKYb7tNkYb7sePd4Lxj6M6AGQDvl2Z4
	+eKARVw==
X-Received: by 2002:a05:6820:820:b0:716:c0d5:2cfb with SMTP id 006d021491bc7-7170f1be2c9mr28227eaf.6.1794082445409;
        Sat, 07 Nov 2026 12:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:49 -0700
Subject: [PATCH 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-52-0181ef0cc4c8@gmail.com>
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

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..60fc440d4515 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -19,6 +19,12 @@ MODULE_AUTHOR("Rafał Miłecki");
 
 static const char *probes[] = { "bcm47xxpart", NULL };
 
+static void bcm47xxnflash_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct bcm47xxnflash,
+			   nand_chip.legacy.dummy_controller));
+}
+
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
 	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
@@ -26,9 +32,14 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller,
+					bcm47xxnflash_release);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +59,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_release(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +83,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

