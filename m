Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A41A9B5A
	for <imx@lists.linux.dev>; Thu, 21 Nov 2024 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732210909; cv=none; b=YGLosTaSpSMlCTTE7Ap5o2B7c+ILsjTldFVplHAz95CxelQVP2blqUfg1wiui2LsATdtTUpgD3UiGLZn2XcMXzt8UccVp1g4RXWFvnupvj7YiEQQw1RKHY03kUIAfQ+suNb0dbIV6+HFVj1XB+ktTePiRInWtu7OSjzthbXSbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732210909; c=relaxed/simple;
	bh=vZMGVlzPw/7v2ZFp7bgQck20bK9sg0BZJrP7XmQ9X5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciXsb7GXyE6YubmTC3AZZ/xavpQ86FfSiUxkdExdu3YrZrQfjE18d4L3iAIMQdUfYSbSuo+Mu/749p8gYi9v6dso8sa3/boE1dvdU+Q1TnvaC4sbtabwSXnQB/gunDA0Xq45Ik3mknhTf1VnVwen3GFSN280k3S/4oMqZckr4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KwoxBPvC; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KwoxBPvC"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B06972000C;
	Thu, 21 Nov 2024 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732210897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNSGIUDWKtHK2V3krzyRKB3CsE+LudVK/AtAMHaXQPM=;
	b=KwoxBPvC0Zrft6aR7f763oIRvd7CMINTpkCKQP/bHCyzyolyQ5scMkb+NAdB7DBIqOVf3u
	Xlz3JO4Wu29Ce5OBWtm1j8aMzum1QQQ6tmCz2blMejXb6VzQH8b5aVoFgeLG2OtB4DAYTv
	b4ldBapMLak5ZXgUDWFzMm6rhwlllZ0GY1J7NOF/ONOOOX5auLPJ0oY7llWLk6kC6V8KSc
	8FQ5aUTIt8ouNKfTUAjx6M6otK8zTYlRYFrqVHYhu1UF4Oe7/Zkr717Dp1YXjZOQ8dH/kD
	3jbvJcIzy3wSucOaOWnK/ywWQ5pJcTI74TZ+u4DV9UN+JGOKredQvaCh6C0F/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 21 Nov 2024 18:41:11 +0100
Subject: [PATCH 1/5] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-ge-ian-debug-imx8-clk-tree-v1-1-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, 
 Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com

From: Marek Vasut <marex@denx.de>

The media_ldb_root_clk supply LDB serializer. These clock are usually
shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
results in accurate serializer clock.

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a356f293621b371b9ef9b9bec90a4..2e61d340b8ab7f626155563c46e0d4142caf3fa9 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
 	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
 	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);

-- 
2.47.0

