Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046641;
	b=MjixHgCwBe6yuglhnah5SqqzA8sI+iYfzRaZGg/QfAVmCNasv0P87q3prxT26s1eJwbd
	 8E35cGTZCKEog2XicHQVhDywJ7i9gjA7oJKW4gMWAZUVH/sK48KZaVqEr9xkpNeokDefH
	 PmpipNdFVDNJMcp6W6oTmo9Kl4CJl0Xx5OhRN7AHoEiNI3G67uCGvOA/LLz4sjD6x7QE8
	 cgxDraN2jA1lZYypmVyuiO3kJEXs1mWMO7Es2nh2Xe+M74wYbVXZaBgyodcf6FIO8BbAy
	 Sj+EJiNGmprefHnZDhZTb8ZudTDou2vf3Ldc6+nglJ4FdL4FAb9HogMj+dHz6oYF82w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
	b=ABXI4OcDvVqaM25fUhAicl78S/O9i9f6080sStFsmrPBJ7gBfHUdV0dL61ok1oJ2b0yg
	 rSjsmQA8PXafc2rVEStVkYO2E1YE7jtdItlCz+Lm39b59dcXbqD9xfUR7WI2BVpqh6noQ
	 x0VP1Umj1IfxVHZmFPTkScL/PqPf7Rc/ND9hcS5pBGzhGhkbGU9RRzWRxyOQndUGljuVk
	 cpY9ycWAHjTbQ6Q5aXoTuGnPAaeo+UyCnISpzDPfBUlcuZcfWE8AhzCQ592aR9P9xGm8m
	 eSyuYodcSRyYohEDvyWnc5dqjxkxB76viYcMV+2IAXfZ2o+ulfN9msSqSakcjGFSDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLgdwn3x;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747B606EEB2
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3747B606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLgdwn3x
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1881998a34.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=hLgdwn3x4MZ/yO2Vln6J75qoyjSNGAB0c7lxikF9mQhO89fv3I7GUI89iudecPFohT
         iIgSKZcTFgTdEpzlQohG4JEjBG3NHIQzPJTZUksjZGotKZcG79hJ7BEd9C++kEJUBWCB
         iu5oEN4aIgSmz7xK74Db3JKRNPmelQMmzcornTfhlMlgJ6mbPZP2xlCEUPu1zgBmtS3a
         MaQ4oiFKOvOZgAdIDgCsw5tetbQIotEV6YVMyx5MzsgIf2J2QvUiCrcYq/smMJv4c138
         EQ97luEsfsprK+cNRNj8uip9K5rO+Uj1Bg017o9aT/uNqKt9cBBx9+zeKmys0OErD9uc
         v//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=1/e8HJSJqTynevT7ZswqwFhxzVKh81RSjtQdUcym3nxZS7/lwbvofouhGVOMQURWfI
         npeTq947fSUde4o4it4xAQXecl84dgg+uK9/LUw7JK2Rp6th9urSExdOzfhkVK6sXScc
         lKCNyMVRuauFbUseNqb15pqEeZWv1GUsp//Ym2kGCI2jngOZQ3AGp5f4h/2fDMeOH+DU
         98hdcQj9U+oGR7KPeSfLEp1lnRRBcr7SHYMhW6luc7cl616OLipldt0r9wb2tmRcSioU
         CcQtYsIo5S8tUmvJpywLxIdLygM0ZQ9KLuis1/IcPBMRztKLC63oMBqkkDL6hA6muwoC
         OmkA==
X-Forwarded-Encrypted: i=1; AKwUvByO0eWLeZiqRjqP9GrXzOORnJTB+Jto5t49cniHJRz3kUm1ZEvlpCutN/6uyyi03dIsZec=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KxvJ0U4Jsq5XcQhyuyZPDv1MhCbuju3h4VrfWzCAquZArlhZy
	RpHj8zUt8sZN3h4poOG2uIwq1PO0dV2ax2lDIDr9NbAxoBy0cARlrCLq
X-Gm-Gg: AYBFou005T3ga3YlhTAZ56/WAzwJAygzDmemEM56Rcrx7eRS3oRBzuA3/EmpQCCsF/h
	Pjo9a85XhaKoWynLU9Gfochoi79okzVVveLb0or45wKmb3UsUeuZHpBVlyXE08ZSOk0unkOV7lJ
	jOBujnSivnFvLpbuSO+UPPBr8/eK+APPZlKV51kfeUsBBWZ/9tp8/jdh3yo6FPKevGt9Ol0IlBT
	/pFfPYqsoNkeBEGS1h+L7o8VjM68eBwUhe514Bt9w6JXHwMdkuzqgmjuAA/gr07X6Z38AGLhGM/
	vwPIG2SW/SJIjvOLurI/ezWHRKq6szeQ9JGG2AcuEN0QmJCiCNx7GQ1yOvpj7NUc6rvIbnaUa1n
	w/IvPDnKBQX+oC7tuXr2VDaY86qyOqaVSDtsXzEQzeH4/nChiQaOjoJyE458gbPiELqcmEWf/1i
	B+fH4/qIHrMUyeqmdfheVj0s9yizVdMD1Ydz65RSjtG6kTToEZCpTER+RomR+0Gp98xETfDxwVC
	ftbr8OPfxGiA7WaOalePmjvvcfb7Jwb9RQ3QBGvQBHEiqSwM8Zh0l40W4jyVmMsgSRS9Mc4BNmt
	tdR1sZP69HK1+z/RuVCDhAs5qEFEL8Q6/+W2fKdA5Z1psrZy99tWZIZjosyj8stYYrCqj7r7gMh
	aAF2ykKvcJ85PHGPYVJX3vM/yhsWF8cSiHwA7y9vvisLM8wzKI+6ImYBy0b5j/YehjvJHB2/cmd
	fe+eGZQbcHuw9r8t6HlK2VKkKepP4UaCZrHgJVzx2jFz3Fk7B3DsWUvw==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

