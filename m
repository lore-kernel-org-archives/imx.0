Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046643;
	b=jYFwgegyVEJ6q9qwufr4malKnp3RsNVXag0Ffqa7aaVg7yWkKucNctjCoNISzLzJd/X9
	 U+h7LiyJOl4ZVce6gJJXm+/UN/TL1pJ9qxv93zP9ibJw4vsU32KMdOE2b5p8dXnj8xczK
	 E8dwR3okiM+tSsEDYqiKS6nCcluvQhGJtncUNzXzL0l4NBcDTqKn8CiaB6oHskKdfOPPG
	 nSpip3sJ+WDG30aUqXAAFe0HCJsx6m/imlD9ObyiF/1qyvnI7tvoiFYSxCRDq2r5VCyG8
	 XsNM8XnD/14vZkKLqKKCyjNWIxt+h1wABEvMN9nMiN8bYjsKzeJT/1JFilYeIQcnwVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
	b=uFoQIF5HYehF3ddypPf2AHowqAjP6k2dM4u6OS2gAwZKqMaDn7IXhiodsipqmBPX60Bm
	 vmVW3tZItc7UUEbqW+btqskMRYkAcO58WGVft6BghgyLPJZ4dUbd7tFPgU1Kr6BwpakDQ
	 Iu9SbQF9rvWUpNxLrr+4bZqz9RVyAJsGSjOTHkbtUVRKkgAGv4QPV4+QrXd3CYLpcL/8N
	 YpzkXEkEM4MOKVtYpTBfSnYgRYhVMjHjFDoyr9OAi7V52ZVRYPXP/eqXxZKH3+AKKatmb
	 QmRYi+4YnFv1WZnav7Rtegm0T1RsVGayqiLgUyPoa87hD9nuQwlToUIb5qx8UT+1nUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TaiVq/mI";
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0660A6F56
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A0660A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TaiVq/mI
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843cf077f10so2138252a34.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=TaiVq/mIPAg6+Jyd108oR2pAFJDfk4HuUEeSWrolZPSZ5cea0tFfaKPA50b8W8gDQR
         4ZGe2V34H/YR0BIuYT6fUwxmjO4DzPFxcMAXkZvXKtKH7auFEKyZTtwPs98KDdA1oqco
         8E9NOBNVc8+NeR2pnY0k5Ic7sJoW4g7UZcM6EeHCQuF0Xv2DQfpaA3uHB6Dz1vkYLS+D
         iqYJfIuiW0oDI4LKWPpNEvIblmf01mrg1yxVWnNU91NLGhicRAezZbVa2lrriuUtnpSp
         UGZgfZhiLQmNPERIdSCSpO3RZGAWJoIg1pTT+OgqRrybURITQ5DmxkkLgx7yjNyPRoJE
         U0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=a3bSGM9jvQGYxwu/KnYvC8qqwqcahaWKqeYPUUgsl1/GkCCB0HS75mRDq37avprr51
         XIAFgT9Ayfsvn5B4MUa4NtyQADucEqcLn7LQYEHteiOIcFV0zb8rn2BVBfDNWIuiHB+u
         rw3QMMRmsI3kKpQmxH8YQD0eIarCP0MiObCGcIPtLHfEk0mqa7ToB+TFa+OZG7M4FHDc
         2Hnj0v42G2k328OZ0uL7a5jocJzsD31PaKugeS/zebne0Zcps3TDC9eZGZQD1ESYdupJ
         6jN2dQCiOyhtjqJghb8Cq8H6/+4phnm5gzbIFQH0gHwtzUckxwgtqHAp/PTNucesU5hG
         dbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzif2mu6bZmCg/By83d0MBfRzHy8FklVL6I7qtEIPbbDlKDY8S1JmC06VsU0v5wXpbl5hI=@lists.linux.dev
X-Gm-Message-State: APuU4Z828xObSL97svLOiQPHXtz6ALPKiu5QhpAzycgSzF7lcIq4lzGz
	YSAJVakVSdfsys3l1Vhqa/xH8PdQE4QLStapiY9XFvKbpM3bZ/lgNZSL
X-Gm-Gg: AYBFou2vgo8tPpWAtt6o8gbbyXTAcllZAwu8o+qGQlYRAEY4D8v6FNri2TIufKfVKdP
	IC9M6tCRZqEVtb1PDfgN8ngNUBEsz+YsLEXPM06px9bLCO7O3rk7y4dGbBSDa0uSGhYQH9RopSt
	ga8KF1vT+hEJoDe28nNvhpzNgzfs3oNF1SV77b8ZioQwvcmSoR4OD+8Dq9wpHtqJ8Ncb+m4bpQN
	cOs47IsW5p67518I2S/t9Ua3r1ttoWGkpypuZTN8cki7I9HOkJhDL6yZKH8ONNrZXdafacoy666
	D98g6bykmNDDo39gPYDofkal0UkVQqYElW0ofgIXyfpRydwOvQxlOHf4Ipu6giCJRNogT0KUvhX
	1zuSHaHXdkpxRTXvhERPqne/cfWdkS5DwGa2NcLiN5rLCDyMRQnxKktcIju9t9H0mXg1md9DoQK
	HGM7yLdI12/q3uq7sqiF/qzUGXCisnsWFDOwtgp0hBT1Xf4duuCGKeO144t9K98jpjV88esEwVe
	h3ldxn9/8+fpUWBok1qgrNk9vHBZH8/H6ucoUDfEu+QaTZYb7CDYYvm6vVE3juZ8wt0dtUJ8AmC
	dzN2z+GoPEHH5yvJYHZt2YxjJ61SFrADn+dGQ9pzkP8Xi+ZHh5xTQxIIRdoqVqHRvAVGXwNiSiA
	5T/HaECPKjDVorwtevhsJ9GDhX4x4mHejKIueq1eSSGmKaaCIKKGjeeY5DnfCECvVQYNVdiPzQy
	L2oHffR7TxUR/TNghYkP4WDqKq9X1ZP119E4HOxjXYRvIEeHoc95927PfCku1UZaGWT/jIDWnMM
	g==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
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

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

