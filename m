Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5EC2D3ECF
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157311; cv=none; b=nRRJ+OlZSBZJbvzE0ahf8m7LnhLFiRimP0a9cHM8fdr44hCXxf7pLq1Qj8pGbNHWNM519Tv7W5+C497Su9o5FR87/wGhnUxuC12MsDa9iSwbeiP1X76THN1TwJfh85rfoEJf8DDVAmvrrzTVXc5Xsxa6bXDdDsDPO/5OnKdne+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157311; c=relaxed/simple;
	bh=BX+Sel3Ae4XusHp2wSzv2dwsS9SdIb3azp5qa3pJZL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5ldyC22UaTx4e3dtbnJRiIQGPhYCjTjQoctj8otbnmrl36hTDD4pocJjYpakvbcWHTMLhm11g2gA/wcdn3SGjjcplaYjJ+juk0xtSQJCjwyO9YpIHMp6+RuX4qyR0jc27lHusWHDO72PVeRwUoT5wW6X4hSTfUYqoTlJsGU9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=eRdj98dR; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="eRdj98dR"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=;
	b=eRdj98dR2gNRTGLEUcMd4wvGKfZ/888segVmzD4knEMYOnkxIlATOkEh9npSYnSZAFUhb7
	4KraqSO9K3HZj/6LxbdQSGB+3BppWRsgnIHAp3qpbmHAz08W7QvK11Ev6Rm0bzvJwL4c+m
	NcJfEStht09FXlXiPx4nzY9JJyyg8030a2CEAkuYsFrud9Svn0jBMdTZl0/OJZo+/aO3qf
	G+xZxrzg4u8uFN38HE2IFk1cfpjxT6yzrvSC0aVQPFnmqIVlys+JlpFBwPd/cfAqjiVW5r
	2jkPd0iQoyWYwvRFmbjVw3xYX+fbvO3paqarWa5sy86Cqb2xOuXmmTpiHi23RA==
Date: Mon, 27 Jul 2026 15:00:47 +0200
Subject: [PATCH v4 04/11] nvmem: imx-ocotp-ele: Add keepout table for
 i.MX93
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-4-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=uWHeQFtm8hXfW7ZA55vuDeShYnRX7s0r6QBPlDcypKQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNVbXg0NPtmQku0GRWk7hO9WJ6xKX/zGU6ZUWaznj
 c1+U+eOUhYGMS4GWTFFFil+i9e2ZrE+8seqo2DmsDKBDGHg4hSAiWyPZPinmmWwt2CdzfE9p09p
 R2m2NzTFtXZvrWJ2NHq9ek7swXt9DP8T3HYF/LR2sPun87Vz0tWOc83183+Ib1rT0bdZ4chDh24
 uAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Add an overall keepout table to describe which fuse registers are
invalid and not accessible. No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index a0d2985c6d03..dadec19ca252 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -34,6 +34,8 @@ struct ocotp_devtype_data {
 	u32 num_entry;
 	u32 flag;
 	nvmem_reg_read_t reg_read;
+	const struct nvmem_keepout *keepout;
+	unsigned int nkeepout;
 	struct ocotp_map_entry entry[];
 };
 
@@ -163,6 +165,12 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.read_only = true;
 	priv->config.add_legacy_fixed_of_cells = true;
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
+
+	if (priv->data->nkeepout) {
+		priv->config.keepout = priv->data->keepout;
+		priv->config.nkeepout = priv->data->nkeepout;
+	}
+
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);
@@ -172,6 +180,14 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct nvmem_keepout imx93_ocotp_keepout[] = {
+	{.start = 208, .end = 252},
+	{.start = 256, .end = 512},
+	{.start = 576, .end = 728},
+	{.start = 732, .end = 752},
+	{.start = 756, .end = 1248},
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
@@ -185,6 +201,8 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 		{ 188, 1, FUSE_ELE },
 		{ 312, 200, FUSE_FSB }
 	},
+	.keepout = imx93_ocotp_keepout,
+	.nkeepout = ARRAY_SIZE(imx93_ocotp_keepout),
 };
 
 static const struct ocotp_devtype_data imx94_ocotp_data = {

-- 
2.55.0

