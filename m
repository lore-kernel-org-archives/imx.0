Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4533438A7
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955092; cv=none; b=Ee5YhxE3y+44AkSvHM13twZTLRUtXl1/dX4Jl/CRI3xOsVFmTRHGN7SdBmscXMJeqXLYYVCPDD8JCzdyi9V5xGMl+IluHqGcV0ErQbo0fQ95OTwW9TrNQdwWeKkBScR22mZ4ubYasa1vc3ST0Xe5LcdVS5W4IHNbqpYspJb1NXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955092; c=relaxed/simple;
	bh=BX+Sel3Ae4XusHp2wSzv2dwsS9SdIb3azp5qa3pJZL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIY1jBsVSEWu5tDcNEPKnGWYZNr2yUI98I6vfdscXn2S15TmXqdppVtG8hw1XbHwTjnWQDxp9NAVh4pBfeC1zSZOcpqKNVkRDOcShKmK6I980jBWPMJWqDI6suRFDLKj2nWYK1v+hU3Ms5MfmT28vWM9sa5c9CbNp0xIfm9Ky4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=G7c9ahl/; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="G7c9ahl/"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=;
	b=G7c9ahl/vLqHu4vqSrFbE8izXxayNR1IFQQH1ZqM6dGxNuyiucKn4bpDKL7JqPp2gwZPYk
	iL4drDrblYmSTZrOTEQ/wLIqDZkMFgoa5xDOwKZAbLX/7QybE7SLMtu9J1UXnvnITbCab4
	adKjd++zdegxDI9EXX9mKt6ln7rtq5OYJkF1u6o2KbQ/BKP7lxbM38tYC2S95lS1fH+TMK
	+RUDqVxNmYVBY90633JXQImAsrB+vFyWez47TdyzfAqC3y9tYp0Uffa9UGL0OlCE52eEcO
	WvKl+TYseh8t+W4ImBChYa0YFKrElTR4DrlJ/f8G5kB/FNhYicHVLmAEbE4J0g==
Date: Mon, 13 Jul 2026 16:53:40 +0200
Subject: [PATCH v2 04/10] nvmem: imx-ocotp-ele: Add keepout table for
 i.MX93
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-4-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=uWHeQFtm8hXfW7ZA55vuDeShYnRX7s0r6QBPlDcypKQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT+CycqEz7e2v7S7N5+beclevY/7JGR//Oau83PdSN
 LulOn5yRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwEQWzWJkOGH1wnRq3p4UlRcW
 Srf6BAPFTJutao+XHqzNmFDhvmPWTYZ/Oi8D1GsmJvI2bTH7HpG7u/PKNsu5XBuXMcslzTVfa3q
 TAwA=
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

