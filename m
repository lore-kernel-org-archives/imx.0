Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51C387561
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307356; cv=none; b=hXTInbdKLaFkpfyJR9Q01bu02u1iA+xXruWNNl9cOisbzSTeM8HraUIFjvblSce1kZZyq09R3tgJhyEbrZAfQttqM3RBOj6NA0H6Tvq1WfNfZugkKhWAB/4ld10AdH032TQC95KnecZLCb62amjq+VYNrEhdx2CQFeWjzwk72dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307356; c=relaxed/simple;
	bh=jZcB6abEfwBKD3qPTWzpbKar1ogKuWa0CwuTM0sWGQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8N8oCJZ+oMh3AAV1Pk8U7MXwccMcicA+mu1+nrO2eygA9dRSe5yhemmUG0NRgw6K1OkSx5I2MEsFNkzeyU/SZMJ12dwt0tGRrSE+nuVQn3Jzf5ntvvk7nmJOAwHjVAEmT4Dgj6wmRao2ghSaJBP5OtHzUGjyoKxRxGKsVGFfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfdWG-000338-Cn; Tue, 13 Jan 2026 13:29:08 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 13 Jan 2026 13:29:07 +0100
Subject: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Some parallel panels have a pixelclk of 24.19 MHz. Add support for
241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff654c6481611375e3 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
-	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
+	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
+	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)
 };
 
 struct imx_fracn_gppll_clk imx_fracn_gppll = {

-- 
2.47.3

