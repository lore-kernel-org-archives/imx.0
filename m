Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DAB43CEC7
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610842; cv=none; b=aGMEsKwYtFn3e+7wBiQqDyvHtN2d6yhg3ylUKmPAwTkqvVCJ/bzu5LtOdhRoSSXrP5z0FzwDBKCe/Ud+VUlpGmo+uoD3HFqgUKTtRU2nEeKFmTL/+12W3eZpm0C7i+9vvZgpdno1roTptbLnOREFXmt+cSwY52MnWkTFV6c9zzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610842; c=relaxed/simple;
	bh=0DCKsdUalAsGo05Bx9MQ+qtAkG+A7DDNQpFiRxjXSwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSDh0aoCgnNq2M+Zh3Hi/LJyVloDNYY3roq2vTcqQ7buWqb2z4FOfgOWbOyPC2tbMGYuY9m5cFwmx4IxBpo00ToQFj+/t0aiWSuJ2Cl6tYwL+9eXzH77JGicxSNdfZFT93CgbnhKOINCER1UrFkI8PwnHwfkrlGcX1rXEVtZyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=DHMSseMK; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="DHMSseMK"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hU8YIoeCokwUir5l6JBbBnRVU2NEusOFrAG3V5xH2ps=;
	b=DHMSseMK5A4EpAK9wbtViUhq+s3lE1urscjvcmod2yjizm9blj29Imfu2864Gid3ittmcO
	HPOfvAIBN633etN/oqyldoxiLOTEtXfDM6Pmmzfrqpcs1noW02z6Y2GGW6Dd+qEFp2oGDD
	q5TTxYc4j30VD7PvKlJPr+qOAVpH6tJOgbaf4PjTPtyB0HI1M0gwiQQq8HG4M7KOCZyaRG
	aYI9Dj+rjlZXZK1bnmKC6ceciazTKxXZMf9RXaP4ivV2cbDwsqbXc8fdN8NA/ORjJ4Sacz
	GX3x1abHiqav1pkg3YzsOsuXcfBb81Tu0d7zuIOD6GAxU0XtJK6E4U5vAazGlQ==
Date: Tue, 16 Jun 2026 13:52:19 +0200
Subject: [PATCH 4/9] nvmem: imx-ocotp-ele: Add keepout table for i.MX93
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-4-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=2s2qFG/UKE+uvVpLXJDTOFmKlFqFB7wcshCOS50LsOg=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMvRrwBSjORe5irRs/0x563760nrhR5s/309w3z1pV
 WpL1tLvHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABN5fZHhv4vGr6WXr8vo6LzJ
 13u3mkPzn+vS6XG/VleVJFozJOzbZs3I8POJtdWMtpVdExP44p84ZXlHeojXRcTNtLu4eXKMQfl
 CdgA=
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
2.54.0

