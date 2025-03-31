Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C341DFE00
	for <imx@lists.linux.dev>; Mon, 31 Mar 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417114; cv=none; b=HBmbAPxlkvEW3upOhMzJxPeYga+VG0XLY2wsQjkXCD9B9XXJHzotoJXHzo6LlegVkE+9M4YHzXdkQ6BF+yoDNBoeNV16Zw9TX2VnyR28B0FX5Zu1YMmVRTHYB/vWL7g0UJTootL0STtw6UQUvo100Zqh2L5mzCHXuQi3OL5Fkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417114; c=relaxed/simple;
	bh=XzktveYIQyILOursaynb7gIpEL6ihJvMabNJJ9qx4+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CiQ/tE969ZCLPzGxuTlUn5FbJ3as9DeFl/WKY5WM4Ohz1G5L/n/AenqmG9N/XR7hTbazHGhJMHNSVTZRAo1LXMpJX1DUCsYmwyCeCZGXrqBJsUBENeVr1uGqRmrboZ8Nj2LqH3Il0gJyUcoykCl1VIklLOAm8+7rHms7wo64Wds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QM4gKkGm; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QM4gKkGm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 006DF10252BEC;
	Mon, 31 Mar 2025 12:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743417111; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GGShjO7hQBTExt7fUgvPLyYsosFKagGzgAx5eN0hYW0=;
	b=QM4gKkGmU6yXvGHLNPrt5YEh9frQsi1OIipC19nIMlu/7DaST98znafx2pXwYt67Q7qXze
	vqRz3GLwua1n1bI2c/wzPK34K9HYO46Eb+Brvi4KBHfC9B7/i0Ne0bbx3UsOQmOx8d2dO0
	Pr7moHo+G/2cuRkg9QdVdLZj4KYHYh8w9NGWd3S5lXcBuwM/rPAHW1qi529AOYe6VC9wZ4
	BY3PCREQUT4XRX6+1bsyb3dBVyj5Y9qh5KBV+jIxz766+Pix24Q+YVp67jEXBL5c8NdE+l
	2aICupGZ2KjkyhBObiZRe/OwSLXMUQjqU5GjNv/uPjFSriB1SsVBr4TuqVO+7w==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v3 2/4] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Mon, 31 Mar 2025 12:31:14 +0200
Message-Id: <20250331103116.2223899-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331103116.2223899-1-lukma@denx.de>
References: <20250331103116.2223899-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The current range of 'reg' property is too small to allow full control
of the L2 switch on imx287.

As this IP block also uses ENET-MAC blocks for its operation, the address
range for it must be included as well.

Moreover, some SoC common properties (like compatible, clocks, interrupts
numbers) have been moved to this node.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- adding extra properties (like compatible, clocks, interupts)

Changes for v3:
- None
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..4117a5003b36 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,12 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			compatible = "nxp,imx287-mtip-switch";
+			reg = <0x800f0000 0x20000>;
+			interrupts = <100>, <101>, <102>;
+			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+			clock-names = "ipg", "ahb", "enet_out", "ptp";
 			status = "disabled";
 		};
 	};
-- 
2.39.5

