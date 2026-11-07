Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082458;
	b=Lny+9Uf8crxIwmMlUNXyjZhpNMHfEJVhDCYuA3st3FDuWDrYHKXyUL7IfqQdeh/2T9Jz
	 qOVVKTiD74fE4wOIZGIPdukWwsnYPd+SNJgtqPdwa8gWv8O9s2vCaXFC43nO2X44fG/z/
	 YeTal+Z+AZwZ5F7R2WLQXJJXbwNuDmqarJM+NicrciF4FMvHU53l9YlP5lg2KddoYI17Y
	 ZDWMOPhhyqxs/XwB+4P7WeyoHBjbG4bru9IZtsfuf+pnY9s7Y+b5h/7nYD68z0Jp/wzd+
	 kHNBVOAORAYBOesQM67XNYitOrg6pdtWziJ+3Akk1jPy1+N1ftKPAW94F8flbHVPF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082458;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
	b=JHkAjFoEC1TV870ckwQ5yp8IUrC5qJkkxLtIaLt/DEV2Q7gB5+JBvq1hHwvu85crsjAt
	 FKKIdZRo3+zSHahUDkVX8bQ4EmNMig7UadrGEk6GQXBJJkyGgvAiBacTuybRRvIiSatrw
	 tZeMmPemCw9wpKEbY2N3V12Z6eu6zjMRp2NHaTe4aAF64Zl0POvxxECECbrTRKKZOifLg
	 JHSyC1V71wVPiBxYnwfWs/zAWQ3h6G8IKoe1YfhQhckUG3RWuZ8dlTm/uVfG/Y990yXP6
	 Jd8DY0Bl38nLuzu+7JIfbpoBnc7Pi8vsk7Sw+3aj/HG599HNw+VsobVWyOcqwf/jgMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A586082BFF
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A586082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so7839fac.1
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082457; x=1794687257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
        b=eRGKXP+NF0UOn1hvIf+CP6jqM3E9vOfPKfVXIjWZRkVMU8hOhNzSoPamq66bgpmq7+
         eqmryEPG+HFMLzb2QUb8WsGV89kfUlWc5yOAFQ5JALg0RVbdSNP7cheFLgTQ3L7FShM+
         juyYjgrI69aYkQA5H7eKEl5arbHKqCIzfRS1LD5nUMtMxabULi7Fvx8vh4ly7LJta2oh
         Qq6ycseu+tYohh+dlhdq9N9G3nyXDpTaVZrIBSl0ZVOtRyemTfUQI2ynGw2aEGLCd3Xv
         cQ7ylWMyWzQ2b2wg0qpQmj2MVJYL9Sk6qi98pR5EtetYMhg8zkq3Xq9YYo2K+C5n9uC9
         c62g==
X-Forwarded-Encrypted: i=1; AL+hErFicVbe+nQWfkBO7WpKLXtepb4dIOtlo3zj8OEIT1D87IwA9YlnU2RpLuuvNC+ZesgwbeA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KYAcHEJ91+GCoNLt10rQl7xznuI4jYD/kAMNsD/F1Zt86kZDd
	328+9+5LYhUQRgxVmbkgt3xW0reuJGAavjFYxr8jlxXcqaKklQpbKfIWsPGfk31EUA0=
X-Gm-Gg: AYBFou1SWBD6kWIIFUkznOBZxVXD+PJ8Ua99NzRJ2F39yjTDdaUbHmjVzVL9RKuHII1
	A4IoZbvIC+XTfJ8RuSUu50Z1KN5L/H7MuwrrYzICj1hJwF7Ehpgr8nyZl6A6s/zLKaqjPhXIkDa
	SjAduN46UUam51T8n8+NZGp0Ez60T1ad8PgPxmWnIvnso151yaqxUCGF23THPnji9FVueJqJLjM
	7TN+HtJ0cOOQbBo73519tjVE6fqCyVGebsZ2Ob1Q0+jf363Bk5Jt2gx71MZ55AOdKy4DmzxPALM
	cUxtQgYaSf3qCvXJTpLn0VVVeYbcILl/CYCuRjI7VvDk8zJ+OqJdwheoPAfLQJmRINtUZWxQIvn
	W4+g4S10vuIVBRoVjl2CMy1G5eSpnX8q7EaokYsxlUea6NFhh69Fe7CLZNdqPda9YWYQBuoCse6
	xOi08tu1s9PBdh8B1I+p7VwvfUwEhzvIh/6VdlZTBaB7mfaA9htEOdji1/SIpuQC/Gim5ivGIkZ
	9OVnoBke86cEAriyNWFiAF3RIuWsJ5m32AjH6kH04yw1UH+Ls/7LvIhW2HuT2UUGhfRh0bBDReQ
	Ud+ZGJVXeWWamD5ab1qItuq5zh2Ur6nj2dKnCaZSZq43LasecCwHdiaVo53Twcxx6kaXJOEl73/
	igome6g==
X-Received: by 2002:a05:6871:438b:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4ad98aab859mr3931286fac.9.1794082457245;
        Sat, 07 Nov 2026 12:14:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:53 -0700
Subject: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
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

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..39fefd83cd85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2253,6 +2253,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2262,6 +2267,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2391,11 +2401,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2412,7 +2427,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2430,9 +2446,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2449,7 +2465,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0

