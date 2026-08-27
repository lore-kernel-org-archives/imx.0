Received: from sg-2-5.ptr.blmpb.com (sg-2-5.ptr.blmpb.com [71.18.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692C47DD7B
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845412; cv=none; b=dF26LIuq67t34mQ0mVYIgiL/9FdRa94H50GdNOXuxYwnfl+RFrgPoTIbsjKZZMNskGyqFj/oIFs2uOnw/K/xOCsL/nDHXb/ZnSyH/m9cL8JRAtCROznTl5vBBaj9x+7LZSheibVWbUNI+d7kyp5sOEssVY02MhUUUPPr6coYhbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845412; c=relaxed/simple;
	bh=Pg4NFUX8JDPIXbUkkwq0Ml6GLH1igP4ZUMKg6RWzpA8=;
	h=To:Mime-Version:References:Cc:Subject:Date:Content-Type:From:
	 Message-Id:In-Reply-To; b=DIxRdiYB9FuNwUJxbWHQPxYznpc9L/ujBorJ1FCBQPglu8n/eiiBpWE6a13El2iZYO5cq9ah2Yc/SzS8RGzMzR/Be/VuqW4xNiTMJ6lHkZzdt6uquX1f2a10JLwSNy4dwkVgGkb6Qgmqmvj9x8I9CrfVU6o7rAj3JsF8ZVwvogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=hRfo/+JA; arc=none smtp.client-ip=71.18.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="hRfo/+JA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845398; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OOFci7YOWRONRU2EkJ/P6bDmKOzzj+GtBTW31kETtbg=;
 b=hRfo/+JAVjLKlzsS4SxiGLQzJKUn+O/szLDgLqQwnP3IvCNV+IbQ2fL05KaAdvV2GGcRxS
 V++0JZmCazu9q34jjtknWEhpBZocfYq3PHlCRGn35DXTnDhaXoJwoVq2Lh4eyh7iVmNeJd
 awasnakxT820dUAVk39gW3DOVsCbPVVadnK7nQZiyY5bzLNaHVUE7+srrDd/WDSPx9pEG2
 7mZFGHW795o4atz4ekhVg7j6t7wA3nGVCGbmmRWk3RqBzAMGHIz4SfbiXf6STZPFbbZcel
 H9fxf4Z/se/OXHinYVASncGItAygVUpRMshhRy4opCMIx5AvWRFgK+GclWQ5bg==
To: "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>, 
	"Andi Shyti" <andi.shyti@kernel.org>, 
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, 
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, 
	"Claudiu Beznea" <claudiu.beznea@tuxon.dev>, 
	"Wolfram Sang" <wsa@kernel.org>, 
	"Ludovic Desroches" <ludovic.desroches@atmel.com>, 
	"Oleksij Rempel" <o.rempel@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Yao Yuan" <yao.yuan@freescale.com>, 
	"Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, 
	"Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Vinod Koul" <vkoul@kernel.org>, 
	"Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, 
	"Praveen Talari" <praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:15 +0800
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
Content-Transfer-Encoding: 7bit
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
Date: Thu, 27 Aug 2026 23:43:03 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.16.0
X-Lms-Return-Path: <lba+26a905b14+934e05+lists.linux.dev+me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>

geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
returns without releasing the channels, because the remove callback is
not invoked after a failed probe.

The adapter-registration failure path used to release the channels via
its err_dma label; that release was dropped when the probe tail was
restructured into geni_i2c_init().

Release the channels on the adapter-registration failure path, mirroring
geni_i2c_remove().

Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..45c770552bd2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1189,8 +1189,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = i2c_add_adapter(&gi2c->adap);
-	if (ret)
+	if (ret) {
+		release_gpi_dma(gi2c);
 		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
+	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 

-- 
2.47.3
