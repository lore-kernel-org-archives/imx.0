Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E0488231
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964713; cv=none; b=IJ2HgY+cipn6/B5+03Do0GbDfZ3M3+jAEDJa55eom7cqHG+SLcK+yiAqrsHhwF8SsVhqnR0jqJUcRUbAp320mFwNawuqG+VjGdgxaogWqtHk+KoscWTdmGZKGyey6ZeuFSaa92A/R5+xeyZwelh4EtQFXcN141fB3+e6pA59i18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964713; c=relaxed/simple;
	bh=j8znPYvO8T/miBT1BL+J/7PHalINMcufRdxFNLNw4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5U+0GtTkznbupoIO5/eTC47NoqkKj9Mjcq3Xts80FptwP1RTAVBMprXBG5jqXeHXl4HFeY6ZR3ieaeQem8g064ZujHlZSnhTk1aVX8Yl6cF0RHfA4nWc7jX0UcUX3aKHDqSCGc9t0TwftuEZyiMmGc6+JIhBcnXUjbW4cyP5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YQpi4LNQ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YQpi4LNQ"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 42C4F22B73;
	Wed, 14 Oct 2026 09:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964709;
	bh=Nv1QRKVD0rhHN7pKsXLPrsiYoxShZ0enIr7QyxQJp0s=; h=From:To:Subject;
	b=YQpi4LNQGJxIumQ2T5EsXikjrwl07DOxUA6tybUsS8Q1OCAMNEVEFry5Z95/30zQ6
	 XHIgfQ1oICc3wceqlCd4BhvE4ar2yaB+PCF4hqKDkOXpiIXl9GslDsPGfLDF/Ebj05
	 D0C1ZO0BX94XScAABV+JWSYNJv0McG9Ke3c7Kn20TWkdqJzYRFA5LkMIYMN4RD6I3J
	 OOjCkDtPEwt93ho8SoKSJ5iBsYtwEyzJ9YbSP2hCCSFIKNZqOvlYNGn1cMtQ/Og50B
	 DEJJiVqiuxkufOU7iIR0c6gCyPaiFuGNMvbhLwQbLNsFpwPDGA5YuNm5EuW6MxoUka
	 iPwg/ofD/9n3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:10 +0200
Message-ID: <20261014075812.29154-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014075812.29154-1-francesco@dolcini.it>
References: <20261014075812.29154-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The OSM Development Board is shared across OSM modules. The Ethernet PHY
interrupt connection to GPIO_A7 has been removed to resolve a boot strap
conflict on OSM iMX95.

Update the OSM iMX93 and iMX91 Device Trees accordingly. Remove the PHY
interrupt configuration to use polling, and move the GPIO_A7 pinctrl
configuration to the GPIO controller. The pin is now available in the
jumper area for general-purpose use.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..24b4bf579835 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -93,7 +93,7 @@ &gpio2 {
 
 &gpio4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio_a6>;
+	pinctrl-0 = <&pinctrl_gpio_a6>, <&pinctrl_gpio_a7>;
 };
 
 /* OSM I2C_B */
@@ -262,10 +262,6 @@ &mdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3

