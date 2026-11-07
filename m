Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046654;
	b=dq7dGdkU6s9DmmDasNTHTzp2A/GfiYpD7EiLbrrI7LPeUykooQ74mM8mDmrcxZhE9q17
	 RN7RGPZjuL36Ht9c9mpjrOvVi5T7MZMNlRe8xjGXHTuh20nwTDJulv7M0eDCaM0uNME41
	 K+rhY+vlhvjnvQy223Pk2Z7ijQGlyveyiugce8fyoRA0aDK34SXr2pIZrk0X5JHlyTwKD
	 eZUlX0NDdwAvRU/L/t2ubvrycVWVWbKS7GAdccLeccs3rVvrAaGcq5dhp/XJbbyPMbi7O
	 O3JcglRHpa8NuAGb2A7FQFAO4xlNp03LkLva5XzyW08u8D+gnNCdsfJ1Ql+Ejqkztgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
	b=kURErP6H3oDyJlsbcX1JU4iTLqOw2SiDt7v0+oNuJxdpDSUOBBHCjDnNsLLe/iPKt5Ha
	 AMfej58UiMbxY7GOcdQluu+fT7deslKYfJtzlLBpHdiGEtO7jDzbFVENspapqcPA1au/K
	 t66HG69cHkDe7W6axvGXV1yHmdLXlztU09YXlWimy5/tEDaTEkRRkIYlmSyOrco49ZFGx
	 0Z48gsCaaUEOJ5OYnuwvAsTCmqFTtnzcsjXjSalVXGCDxeUbt4qFcK8xebGaAF57Br0CB
	 CxxKIIN5GH9oFPrbEFAECLMCG2J4PWAR1Sl8FtZ9QsiIbM6U3eyah3HjzWiIxI+7KMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=00N0g8Ci;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D089606A8E6
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 10:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D089606A8E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=00N0g8Ci
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84d5e56f876so1044834a34.3
        for <imx@lists.linux.dev>; Sat, 07 Nov 2026 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046653; x=1794651453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=00N0g8CiI/p666kvQcm3BoW1l+cG57pzlAv9h+EIbfCRPyQYmryJlkg8KkazNRWT/F
         2FrmBPKlfWBiHYx1JH6Qgfj/ZlhOpkMJSpLl2CGclMZri0/vCIxubESJUgh6dgpNaze2
         /ZCw+UJMx1Q43mA9XpGwvYOe/r4z92st92k6NVYvFX8gLKwgo5/OksWLTegm3ztiIdng
         hEMkgZB4crsdxRxj4dxM6F2LNGPbky6q84ySySdFTi4fnWlU1h6i7sPmAoKOTEHWwclB
         2rctgm7okLKkUZfqpez+fEx0IftSzM4ZqjIDUTuPrziRhB5HNqVoBj4QCOlXR+rmn5XG
         ENDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046653; x=1794651453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzgbI8X4Voq5iI6HG1dOPbCOfJ17p492ut7p3i4sm7o=;
        b=AZ9emmLkDlz98souSFEBzPCpbVe5u2exkNVycM5rA/FfuYJ2aUKaDet504Nkx7LXli
         AMtQserc1XVSsj59cqFJYhr5SDK+wGQPJoCMaxhMcDUMUuFCVPXHGh4PngSKycYTXgl9
         LX0PmHV6yIsKgEzEo6xVA5MyaCluQ1Ssh2T7y1ATH0Fhov+1Jv7sE8uSD1/KwbrPUWuP
         snH4GBhYp5sBUgbcQNOpdiaSlU0WAhsATbVVhP1VTE/nq778WA4QslYYrdOMvhS2Lzmu
         L5hTyoCJX7blhZ9vm9MoEIQbHB7BagmHgdI1OxXD/N2C6Rq0v46URuEK3QoqX6rvA4nP
         miVg==
X-Forwarded-Encrypted: i=1; AKwUvBz7fIXH6mwu8Q3tCmc8Vehan57gRUfvJ6HLIaYe8oCYycppWXQWKbD2ZoOz+WyRuOBJgKw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+OUCsOc6JvG3j7A3mnhwkmGigLJBelHMOR+lMmwnj3bQM0z/et
	+OE3ZXmh10oRRS3CqBi02919Y4XuUXGfwq1JEpKRun7gqd2liYVSbZtA
X-Gm-Gg: AYBFou0D2GO38KTILLH31Ikf/2NBDvZomai1ZIIrv7JaDJAEg/MQRAs/2dI/OtclYuH
	PgsMpOoUVtOveMt6KlT+QVGxw0TuTi09t8lDCn3jK7l48rU3H3uzD4cU2BajEPXKBzkfN7V/4u1
	5W1ZKwQ4Kdhk1Wb0M7BSuCJY3hWkM/TX+kfrSX40bQU76yr4PjEUzHkqlzVIf2h7VEykjNhNJNG
	xNWSMigl09Ycj4xvtKVl4DYrJk4L4SfakT97DTHNfbLHqrJbDDQgikpBOiEZTUhoj7Z3AwOnAkF
	vlWBaQmDtuMAmUkVPJhmU+zEDjPjWElqwc0nvzWhutN/imM16tFlnM0rOlF0/Hne5wW4R3bm5T1
	AC+a9PwKzWsw/WYQThBznzrUVveQFES9HWryIcO1fFvu5ZrHF2KdmT0+3lZdwp/Y939fKaBSGPv
	+d2JrSmhHxwXNEoG1AVAvyzzpprdfCe9gOfFr/cOLJfW5NeSvpDPefC43xhyrsRUHwgiU8laT+R
	bkrGlmRVd6hTBC76fWFFDd/DO3bPCa253YIS0V5PJ9jt8NKAXfBjbBU6E0KAmj9UdcjEK7NmhJX
	oXKLbfALqE9DqyKTRvxujJNLcZw/WRBwH62qUt1yBcDWSipHXiB/6tfA/e8fk+UWgX5hCxoe9p5
	UEqxBrVIrIXa+i6vNaj+6Bf0zjBnmLyhnuzECVdwSIiDdxQ4hdl0aQxfDi2Ww6L2f4qgrb9jChD
	qB9nYrDxotsu+ZJ59gqrvFQ/MNCfM++phOAcfRnwSVVjrv5n5ChJ3lD77gRjDKjJ4Ymy6D+zeHx
	g==
X-Received: by 2002:a05:6830:2306:b0:81c:5aac:798a with SMTP id 46e09a7af769-85f1d000dcamr4738701a34.13.1794046653358;
        Sat, 07 Nov 2026 02:17:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:21 -0700
Subject: [PATCH 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-24-0181ef0cc4c8@gmail.com>
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

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..4686f28797bc 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -162,6 +163,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 /*
  * Probe for the NAND device.
  */
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct xway_nand_data *data;
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

