Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BB19D8BF
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 21:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709587; cv=none; b=RjgLJcZ9M13hV5RngWGuvtXOC1Sr+zFu2r9ByAaEEtIkkL94IbQTygxeliWRrKUgjwMuqnd9KrYeixaPttVhctcm22Sd46zElpD+VwEUrqBDR4Yq1qRh/1y8oU5xPV7PwSUeYNW5anGGv0sQuqpyXVNg8w/WDK42UPybgEshgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709587; c=relaxed/simple;
	bh=MSqEoZ9TxMtqZ2+zhwwZ9pYYN7UQrja5X3sZrLXfDX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdYNnEWkBRN8SD19FDfESYFv1kgCc+28UfobxbP76f+Rj9BgtT8j0phzGFTJgdVedfsUbAQMR/Fd3SOdDfYwHHTKS8Mxo7nsoIvXjFE+iHFWkx4+U1FaD9mKnrCja0TmegFuAg3aOCiUS8PZe+OCskZwBk5Z4h+ucjyQikNHHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=TtvsZjWP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="TtvsZjWP"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 474B22507D;
	Mon, 26 Aug 2024 23:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724709582;
	bh=Hj4hr0R1mObUNs2bkOBKYhNT+1JKlzVOa1x2fo7WPgg=; h=From:To:Subject;
	b=TtvsZjWPEfx96fucU9dWmBhLtA7ni3Q9QczZ5T7N2GXyNrf6teOb/mUBfI2TzOZ1T
	 kHcXG0L/HmtpFEcdnz55NF2EzOoWpWcj504AAdx2456cwvGGv7SB4OMeVbxUpYx+I1
	 lw6fEfQh+OT3oBS9LxHMaFbXnFXiFGsRCUc6KttDpMqVkCHyGqietzeXeP43hIMZL4
	 4ycJkcvBLOYUugM0bsCKaGTP9Q+2jI8OckH3UhBWStR9lTHSDorzN1g87Nad1LAhjK
	 qotRl2Lx2hjqDQmZ9+ILR3QHYNI/r23CFVpy/9Di6DI6dUxRCPcW19atx3SKecdztc
	 tWzhh8PjFHUgA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 10/10] arm64: dts: colibri-imx8x: Cleanup comments
Date: Mon, 26 Aug 2024 23:59:22 +0200
Message-Id: <20240826215922.13225-11-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826215922.13225-1-francesco@dolcini.it>
References: <20240826215922.13225-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Remove unnecessary comments. The Colibri-iMX8X doesn't support FlexCAN,
and the GPU is already enabled in the SOC dtsi.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 75259e8d48a9..42326baf878a 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -121,10 +121,6 @@ &enet0_lpcg {
 			     "enet0_lpcg_ipg_s_clk";
 };
 
-/* TODO flexcan1 - 3 */
-
-/* TODO GPU */
-
 /* On-module I2C */
 &i2c0 {
 	#address-cells = <1>;
-- 
2.39.2

