Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9147047AF5F
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845405; cv=none; b=B13ZQddS+tvFTR7aiJrp/5o5Zkaw+oUGWET3NwWXe7tTf/qD5bFcYXQZTenfXOZGuvpAjz+nIEsApH0zlCpqRplf+ITXoN0BqqJXp70CHc4pUZT1Yc6ZkywQqPVCn0X7JnTha1ljKKr5swcIy3PcR5/czr9QOUpk8st77mjyr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845405; c=relaxed/simple;
	bh=+M+E2k6W7sbxIgI8b2cThwx7W/ppMQUI5X1TQ9uxJo8=;
	h=Date:References:Subject:Content-Type:Cc:From:Message-Id:To:
	 In-Reply-To:Mime-Version; b=SrRIk0ZpsrfZteh9AGb54wElzGwoLpOxxZ8HVIqm/fVFzZef2sdzIV+/h47oMgN2oRqxUY9/uZcuT8PnwxKuZT62aw2fe1y3yzJJ97KcaZG8ReZ7A0zFgYEGFu0Tu23d3QYVqr8sWCHk5wKzQZAkUdksYyh+hlr3YDjUD1IFDuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=spdOKRzX; arc=none smtp.client-ip=71.18.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="spdOKRzX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845396; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=t4JSPZHi9ydke9/rPPt+tNOeEYeI6jSjT/5oE9D+9xI=;
 b=spdOKRzXbQHQxQh/Y7D8+9kzXcXo4tN2qoGCYbRuYSuSucv0YbkeTMhCrv1WZ2Xc72QQBS
 9wAJ1a27Z8tnGiTf6z0Y+e7VWUJi5A3cVlTLmiKwccNnXAyKquy9LJgrZGH5byOM/HI85A
 c2FqHzjobhy4Oi3LTeg495EO3xNvDLC9IzgY52AdmHCTNYQDDWmtNAzzRUkAAUepHndx1m
 elT5+TX4BdZn85gbOxT6vc5aG/HEcP0FB0S0kwnA7ymBxxKr7eRmUYZYQKF1AuMCRrWAGL
 c4gT7U7CTWB1jHWeJclCcEegGXGqLPGFx5VfxIEb8PXDDijlMLRLMzt/jWzgbg==
Date: Thu, 27 Aug 2026 23:43:02 +0800
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-Mailer: b4 0.16.0
Subject: [PATCH 2/3] i2c: imx: release DMA channels on probe error
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20260827-i2c-dma-channel-leak-v1-2-271d4adc03a0@cherr.cc>
Content-Transfer-Encoding: 7bit
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
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-Lms-Return-Path: <lba+26a905b12+8826e9+lists.linux.dev+me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:13 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0

i2c_imx_dma_request() acquires exclusive tx/rx DMA channels and is
optional: on errors other than -EPROBE_DEFER the driver falls back to
PIO mode and probe continues. If i2c_add_numbered_adapter() then fails,
probe returns through clk_notifier_unregister without releasing the
channels, because the remove callback is not invoked after a failed
probe.

Release the channels on the probe error path, mirroring
i2c_imx_remove().

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00af..c24d9201a60e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1880,6 +1880,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 clk_notifier_unregister:
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
+	if (i2c_imx->dma)
+		i2c_imx_dma_free(i2c_imx);
 	free_irq(irq, i2c_imx);
 rpm_disable:
 	pm_runtime_put_noidle(&pdev->dev);

-- 
2.47.3
