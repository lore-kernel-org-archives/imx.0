Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBCA13A41D
	for <imx@lists.linux.dev>; Tue, 14 May 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680406; cv=none; b=lHio6Y1FCf26yHcp78fw0bV+se/WIKn/PjUGG7cvQC5HXICGp6hRym7dRpgpcN+wb3YqAbwoOpf8sk8OUzOxTHmw4c8CIaIX6THXQoJHzOdZNwqAgK++aV5BZ9QLG2xTH/fQdH6AVu1HkrobSOX6tVhAq2S1AuB90EUPgfXNElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680406; c=relaxed/simple;
	bh=SECeU/hWqv/TiUa66e4a5CsD04TBkyJmeXiGLL2YMfk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=br0ttJRVcUbNC8NKxRO+qVqflrpzIFqhnITQrLZ5MZ7SiFTQ/w+KoMm3+8oCPRk3J7l+C87bYAIsugcyt+/sKej5UFL4bCkuP/skA97VLZYzwI0oF5K1nhyFu0UxhAaOwbPDXYooXx8of9rOtPyZa5AvgngRFR2FFl/MUksin+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EC3DD1A18FA;
	Tue, 14 May 2024 11:53:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A4AE01A191F;
	Tue, 14 May 2024 11:53:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5D7F5180222C;
	Tue, 14 May 2024 17:52:59 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	shengjiu.wang@gmail.com
Subject: [PATCH v3 4/6] clk: imx: clk-audiomix: Add CLK_SET_RATE_PARENT flags for clocks
Date: Tue, 14 May 2024 17:33:28 +0800
Message-Id: <1715679210-9588-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add CLK_SET_RATE_PARENT flags that when the device driver sets the
child clock rate, parent clock frequency can be refined accordingly.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b381d6f784c8..466b5b0d665c 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -269,12 +269,12 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(sels); i++) {
 		if (sels[i].num_parents == 1) {
 			hw = devm_clk_hw_register_gate_parent_data(dev,
-				sels[i].name, &sels[i].parent, 0,
+				sels[i].name, &sels[i].parent, CLK_SET_RATE_PARENT,
 				base + sels[i].reg, sels[i].shift, 0, NULL);
 		} else {
 			hw = devm_clk_hw_register_mux_parent_data_table(dev,
 				sels[i].name, sels[i].parents,
-				sels[i].num_parents, 0,
+				sels[i].num_parents, CLK_SET_RATE_PARENT,
 				base + sels[i].reg,
 				sels[i].shift, sels[i].width,
 				0, NULL, NULL);
@@ -317,7 +317,8 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	clk_hw_data->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] = hw;
 
 	hw = devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_bypass",
-				       0, base + SAI_PLL_GNRL_CTL, 13,
+				       CLK_SET_RATE_PARENT,
+				       base + SAI_PLL_GNRL_CTL, 13,
 				       0, NULL);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
@@ -326,7 +327,8 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	clk_hw_data->hws[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] = hw;
 
 	hw = devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
-					       "sai_pll_out", 0, 1, 2);
+					       "sai_pll_out",
+					       CLK_SET_RATE_PARENT, 1, 2);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto err_clk_register;
-- 
2.34.1

