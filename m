Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635A3EDE6C
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792243; cv=none; b=LbdAwJRCghoHQP9+IVsq6UpHOsIsgAsTtbicBWcKveE1uxGlDAICak6g3X1O9AaIhEoh+u/AszZhzm8XDH6X2gI5Ly+aN/fhK8B38/5kLTMcXqjuf7JxF7F7FV4vSPsG74NjOGntUiMN4++XeoEqnB0/T9lCgKzyZy7qPmAKtic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792243; c=relaxed/simple;
	bh=BX+Sel3Ae4XusHp2wSzv2dwsS9SdIb3azp5qa3pJZL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STm/Zz2b5KPNHxsoFgCxfXDNJZW1FmcqiU5r1e5bLymJ9fBxdVWPuFGDbuF6lbErV4c9SboieGVZTQr+eN88PjBvlpKt9BpX2KNgMh4Wxt+LExTfXTth4LHJXrOaaa8dpmUEdKgZYyGOzzy3LkUg6/qBB4hhAO2mV4EN2B8jM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=ZPxvfK7q; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="ZPxvfK7q"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=;
	b=ZPxvfK7qZCxP4NrsCCoFXhFRbfwafjiGoiAd/GHB3WsEXh9WQEIndemApyWPBsxKkRWBvB
	55FpGfmDFGQM18kRRpXY+hNM+Kq5Eh9FoFZRK62CqaIgcP7SdtMW9TnN/W2XJV5BEkam/8
	4aXQcFNZhccijeX1SteLHaoOVo20Uaj5rHwl5hoPmhB9iG5IAUvG3oRrG0RFpHUJRkWLMf
	HzTxcsXvA351CXHzsjvP7798/MByy9fuMBBYD5mNzxtIYJmaa+/yYeSQNi2EDnfmoYs1Y2
	2U7leuUy7J8B66oLwZMqH4+37LxlN/9v59YK7eMOKH5MJGHjuFZPeLWNhCweKg==
Date: Thu, 23 Jul 2026 09:27:26 +0200
Subject: [PATCH v3 04/11] nvmem: imx-ocotp-ele: Add keepout table for
 i.MX93
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-4-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
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
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0FYmgxpXr/RVU84/ld9ma3fdTXH6/jatMwtu7+JcP
 0GTw/dXRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwEQSNBkZLjaubgt9/m9Ck4Pn
 lZ3XgtdqshyYGsNy9ZXVFJN7h8Pe/GVkuPF722cLPRfP95N3p79Me8qVXVenXsF2wqk0lM3a93M
 FFwA=
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

