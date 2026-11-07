Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082373;
	b=2iNIL+dkqEtP3jWxiFemYDczqv/wif/ubLhHI9hTlmHhQ+mxl/7hO1cQ3AWlQGjQisN0
	 YWFxf2/zWb/WDIyiodX3MBq/PJuJfH8B6zUDJrc9H09v8/tOhM7uFEpnG3N+PglEIdA1H
	 5ZIuMkk2JJnstnF6U/m4jlxlLCqm8JEkMmpG6WmlnDIxGnolPvFHNVLxf0F54IaHlqSJ1
	 8msyxPfwF+ud+wGJx9OPAtiUZQcNzEOP5pIXdClMFX/eUrf6/9BoldBVUs+5yVAQuHmVw
	 UEgWLOX8K03LtaNE1KA4b5MjU0h00iDu7MEf/vrFbWG4RZQ804tM1dAyAThL9VV7Xaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
	b=h8RZ+kViPEyQt0AzNa3+5MhqAUZ6u5327Fl4kSeEhoNVPWu4kpytbxo3Q4M93QDFucwm
	 z+VFj96TRl6TVChIpqAQGyNMtI60MkOJXq04kVQjZ4kgaGwcXD3gbYs9HEhWCAjQOMYtZ
	 NuovyOMQ5AHMrUyglF6i74LvaF7t2NqZ3ysW1Rs9HPOPkxynYrhJsJX1d2W5R256945jw
	 s2RAojTaFQMnrzgSkfneQeKXeSBI/RPs4WcKFgZXRoLUSAbUS5ckDJuFHgbfmXn4yyUuL
	 pzpmX++nT+qXl0veMDgTBow0CkoHuZ9slg1LVqa7YFfkf2pTMUH5bSXG0TtHwTT3rDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE97606A32E
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 20:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE97606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso2065fac.2
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 12:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082372; x=1794687172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=GoqHM4bW/fL+39x/uEmfb+kxnGjkw7ccdHLDgILxm1OWCB7CMUpF6t0VAx3QwbTQBT
         IyNLFOm8U8FNt7sh+lEOIHpdTEX8BZ9LPd56hemPwLc83gkO8P71+DORR73R2nhgoJBt
         XiXjIWVX8EbeZG7ZVZ4mK+88HKaekj8s+o/akC8xOJT185H2isTPbcxIyFtyVXrRRBjW
         bo7AuEW+MRn2JBikTkdnDRiBixsFMQsLULLI4s5GwSFg1E+kupOPJH10Rqn29MCtCUtn
         myWst+UBc4H74GzIPNHGpQDqZ6a8Qz59gYxEU/qVd3DEbvWLSU7husMa6ljB1HmAR6fS
         +ZKw==
X-Forwarded-Encrypted: i=1; AL+hErH7d396J+lgM9BfU/4ca7IEQ4TS466FHyfSLfm8QHNpGN6iWMmBjEJwgxTnsD6vc6SFiYw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+3gUUtsh0crlnw8VWfzyKTuYg6nNIvXH9SB7FxRC/i25VRdHhl
	i7tC4zXn3DdaY1VFpAV/SXX9djdWBoj4nP4RtAePUUJxurHV+RJurCsUFrVpHr2TTsk=
X-Gm-Gg: AYBFou1m90PkJux5FOAJH/TIxIq9Dk4WdXV+Q6v71IfHOCFJmw/G1plfPjCIo0KcPfZ
	3a4nop8GuuLnFN3jKcZAK920gzyDnt5ayFJlFh1PPOr/pxZM32LJgJQnLRdKOTD+v8v8Fa4GoiB
	ksxezg28PoiN2gTvsEesncpuEwoIGyt88teZNK93UczQJ6BOSjYLfnsuVLmBS2yC0aoiNN8Eswb
	IBEFDiVHd1/5aZiZTAj1If9mdBY7JceOiCGJd78QkPzYvf1ISu6obD4wN5HJLceA5sGlnVVDfUu
	s96Whl/OqfPlNDiCZFI3hJLHreW3UZr82nszIipMrdtwFWCUOVuwd/hmR4Ic1GLldzlJ1ijLSYw
	Q53Y4HdH0lue57iZBRBh3gabSxf0/GhFyu+bnGwMWIBVMhzaLcVCmjlD+UgUqhOeaPVuW4Escx4
	cWZrqgHLLYoN8v3QNvSVVhrnAsbN4aAf7E2vcQrBR/44t2wIS3fPci2EQhNfgitiJ6S3upcs6XV
	YiBp0mzY5fJRgTn96WCy9jJ0FSmpJ/Sz5/N5rRXx13dGpu0neEUjbXZfCBUu0q0ZpoUea13JWnG
	Boc+YrG7D5ZzHizUBm+pB7xog9W5/aE6ZLiO89Z5eVQje0zDUFsxxfLt9T9b
X-Received: by 2002:a05:6870:960b:b0:4a7:4d5f:c0a0 with SMTP id 586e51a60fabf-4ad98c4a8efmr4097388fac.38.1794082371748;
        Sat, 07 Nov 2026 12:12:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:24 -0700
Subject: [PATCH 27/58] mtd: rawnand: technologic: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-27-0181ef0cc4c8@gmail.com>
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

Transfer flash-node ownership to the retained-chip helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a3294aaf43bd..a67f4d45f57b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -132,6 +132,11 @@ static const struct nand_controller_ops ts72xx_nand_ops = {
 	.exec_op = ts72xx_nand_exec_op,
 };
 
+static void ts72xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ts72xx_nand_data, controller));
+}
+
 static int ts72xx_nand_probe(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data;
@@ -139,11 +144,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, ts72xx_nand_release);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +182,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_release(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +205,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0

