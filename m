Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3C3BBA0D
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728754; cv=none; b=YxXImZrPYn+0GTH+gjp1gNyll63XFFHIdu/OZFQhbIM5/ewmLfQ2WcZvmFocAd6VkAvvcHUyDNgJVSY3U06f9sWPV4apChxi56XXNFxtmzaINa/XV7rwHOW80DFkX9Uynythb+9f0/iOTidauPv+6kvY9MdFIvUvNZbEfa8qIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728754; c=relaxed/simple;
	bh=FGZB5tmM44GHdRmo1o+lozVP/oTjiQOlknRRzAuLw88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJdBrGyJvQoHRrdInEWKrsAGEgUwc+CcXHf1sSMK1F2ZZ40vMq2wHdlkXbiajWVEqbzUr6W8DQnn0ONk3FLTR7q6Dmtl1KfzD8kg+YYkRBMlMLgtiilyqBwGDAsJvkfyHSg9dLTy+McMGRojZJrzlZ0JH9lV95XGKVFa+cCnQNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=iVu4hRNh; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="iVu4hRNh"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 1E9A320687;
	Thu,  9 Apr 2026 11:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728750;
	bh=E+DQm6KckJPpCvSQbRljrPwKFiy8QdB/i+JwiAKbMo0=; h=From:To:Subject;
	b=iVu4hRNhUbIgkyOyDEqGjPdD4NYsYhYWU3p+o7wb6z4bQ+uHOlwXDy3i6qKOhBG8r
	 92+Q5CjIhsoUHSD5CO5MNfxYQe7NuKK0WXzLfzd/Z5djXBkur+hJcxPXWfIU2MY+/6
	 WY3aLantMy5+bwhknQIGfPK5UIrOWZ9xLZw9PcSo9ljZd/j/24ZekzrSTPd6L02S1n
	 zmgkKFeRyT/vpY9x2Kb6b6O8EFqzP40dfvFmL/xccsBEUBNqiPShPxf8uQ/3oH8ZWC
	 FLeRDTxW/4F2lyJNAG9axb5wiZpm6b46Qz5MIihFMORenerDWE3YkThJmH2Ny7hidb
	 3Q7ZQ+bRFOrMw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 6/7] arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
Date: Thu,  9 Apr 2026 11:58:52 +0200
Message-ID: <20260409095855.61252-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Some carrier board reuse the UART_2 control signals as GPIO, split
the pinctrl RTS/CTS in separated nodes to maximize flexibility.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../arm64/boot/dts/freescale/imx95-verdin.dtsi | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index d3737956e2f9..72e7f1e88409 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -541,7 +541,7 @@ &lpuart7 {
 /* Verdin UART_2 */
 &lpuart8 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart8>;
+	pinctrl-0 = <&pinctrl_uart8>, <&pinctrl_uart8_cts>, <&pinctrl_uart8_rts>;
 	uart-has-rtscts;
 };
 
@@ -1058,12 +1058,20 @@ pinctrl_uart7: uart7grp {
 			   <IMX95_PAD_GPIO_IO11__LPUART7_RTS_B	0x31e>; /* SODIMM 133 */
 	};
 
-	/* Verdin UART_2 */
+	/* Verdin UART_2 CTS */
+	pinctrl_uart8_cts: uart8ctsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x31e>; /* SODIMM 143 */
+	};
+
+	/* Verdin UART_2 RTS */
+	pinctrl_uart8_rts: uart8rtsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x31e>; /* SODIMM 141 */
+	};
+
+	/* Verdin UART_2 RX/TX */
 	pinctrl_uart8: uart8grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO12__LPUART8_TX	0x31e>, /* SODIMM 139 */
-			   <IMX95_PAD_GPIO_IO13__LPUART8_RX	0x31e>, /* SODIMM 137 */
-			   <IMX95_PAD_GPIO_IO14__LPUART8_CTS_B	0x31e>, /* SODIMM 143 */
-			   <IMX95_PAD_GPIO_IO15__LPUART8_RTS_B	0x31e>; /* SODIMM 141 */
+			   <IMX95_PAD_GPIO_IO13__LPUART8_RX	0x31e>; /* SODIMM 137 */
 	};
 
 	/* On-module eMMC */
-- 
2.47.3

