Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046646;
	b=Hfd4SgYU7e0ZXAf/y39UEdT/ArL4Umy+zZkOcxc2kEkpa5Xq9czRvBCSjpSUYI3SrJFK
	 2DbVLbIFJ9cdmnLjyQxDBCx+WUrwraPCEG+eaPm0TiZBAD3MMIufKdvaMv+LIGrOW7vCw
	 g/XzPRHNkYQ2nW6MVAjAXMfpIqDajCBWv3Jp+Sf1xUyp8LM2VYyoqIButgy1SE4DeyqRs
	 rs0liLlmr6WiG7CVEblGguMow8slmi456q8rCVwl4IKizwDJkwI3GT9ugwOfLirJanQaH
	 1HI2T5/7M8SJB5B5/19yk2/Oz+27hT/NPnpvzhu+6YEajmZAJYw2+yS3PP/ZhGZtQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
	b=bcAGRWbVq/Wae4pwvNJBHAvwG8xffbSUt7TPQRlw8R/X03zLUP9exz1lz8HswuoP6IrG
	 sMRB+/NpRbU0On60u6sfA1MbDN4Mb5TM+LqGFVYYGtcwVLNVVEisGZ/XC6jOJxPVMWr9A
	 KnDjx83Hi1XWgeTIP6ymF0DBoONSNqrrkMyI19/BTzOtxJmQnFpn527RvTOX6Sg/CzSUs
	 RsSO/J5l4rY18JtaCyV4zMd14CwyJdDEx+24WPrv5F2F6tl+mDdpYaUrxG4vzJRdiuHm/
	 WyqAJ0nn413ITBh0DDjSnSeM2U4uYmoS6KsbuH0t1TeFKp2WcPil+sEHzKijvF9JHdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRdbuUud;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC960A6F6E
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAC960A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cRdbuUud
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8256106635eso629498a34.0
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046645; x=1794651445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=cRdbuUudPUeTnY5K3PuLe1LxwGrI1PCJ/c1iS8R/gcQZRfXWK2gR/L9nubaqKlWPPX
         Y7JkL/tDq92hGEVUWHL7Csj0GE1y1FksSdEDJ/1wIZa3Pt66KGwIkq8UaxrgBjFzwhMx
         29g5Xt6tXZKvXcFXHyWQPflhD/pVOBJ6tv6z+JmfQnf34yi09IxUeKgGIxTh11MjrQdF
         TZl290GkPyrw82Y5exjjf7PF6W568Vrpk8bkA53OzFY02+m5IWBbwudSjBYA2cbt6UIc
         Uf0zjGKPU6PjlHi2RcrPv4GTtZqnF+MF57zpPg8wdGABEAVc176B+jXntmgZb65wsplG
         rhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046645; x=1794651445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=Na5PtElMfYHmvpGczjE+StmH9LjcRIKY1EOtgQpnic/dMCyTO/wzA2Ltp0ikimQ18J
         vs3osMt1Y+pF+kpTFWVo6FsuhZR7kIi/Q04X8hUvEOW9bxAgW9c8OZ3LBl/taLUecFQO
         kNaCTGUwbLy3udGGfVhNJ7g7DZ2E2prCpRU8WvXzq7MYPBDZYx+mAKvPBFkVOXE2nMAn
         KFtdUqf9D8AX/qze32SDX21CKFoFcGNUVlPmYyS1QEXhuukiFCiPKU9jAWwk7y7fgqmi
         ShTe0qLhhtRNV5321c4KdCuMh6Rg7KuByiBvIGH5pyLsxcvx6IXix+6cs+hhPQ02/69w
         tzVg==
X-Forwarded-Encrypted: i=1; AKwUvBxwQq0mx2EoDRIvyXstqalRfczbxbTv7YBazoiDRIPyX/J4VF/ZJYzcnd7pgPNdxjxrhTQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/UtqjTH2lN9jjfuVNv6CY+Wnl8abc7sgyUumfdsUNmQVRvi/tf
	rboUWXSKCj4TKRwjPk+CixIt3t+uEBkHoSR9YD9fwAdkzuwDFPaP+ieA
X-Gm-Gg: AYBFou1sfoF53IRGBG58lVNICN5xGJ4riN3ADV2NZZaW6r72LHiHJgGfFr/QntKnLuk
	l7+41WGLmfiMbVfwd8pWtpU/Yh6wU9cOqqm3BmTOSAi3QcTmaIo23P4bZtB/cms9sPt7V3goKrz
	VUQeKeD8GNEdhIDDodamUD7f/5CLgwlglVhmN2MIsCtwIYxly2uA7Gzk7VnIie28mzXa3Ox334Z
	gLUIh6HDNxQWahlYmG8+HJ9AjYo1WSXXVvZ+eCB+iPGNyIoLDD39aUu97/5/Mvt8CKryLEQFIKl
	K06RURaRMpP9fs1qmAO1Yso7SPAV2qAtFz6O9cl5hK+s3Q6cEm/DbP2+TDkuBYiLhb4d0YcuwMq
	si40n5sJZUSh3atfxH3Ci2Y3TtUPMR+xVjDvgc9X6SySzL+vHbS6U7zjmwB9uFl7vqIU/zc90jT
	58aJZFqPKRm8dX/fo/KN6kCPV9qL8ZpC9k6jS7eRx7avZkWvAhA+B+QS3BbJ4kaySVpV6DQVhf6
	7lBZ+sTzj1CqowrbffqoxwM08HsLolrLU1k7qDMBizagET7Z6vXSX8LdMLBO5CtNwWmOaaEpwmp
	gSzZB1pSj2H9vHm9jUxSEEkTBXssWNvTg8F0HnE3p87wgSknCQZi6wXFOrrz1AfumWbaRYqnIWd
	sBeyje/Gj+2l7JVWtuP6/hlifb6YdJ3ZeSaIm+TJObDyPMm9HolXHt4FEi+rPt2b5H4KbEQf6Ke
	gv8sE+Bk9TeTqNE8xGnzpm1oYJu5BILJZCVd7ozmobL5eFAqeDZ9vD
X-Received: by 2002:a05:6830:2546:b0:834:200b:49b7 with SMTP id 46e09a7af769-85f1cf63bedmr4454506a34.17.1794046644873;
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:18 -0700
Subject: [PATCH 21/58] mtd: rawnand: fsl_upm: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-21-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0

