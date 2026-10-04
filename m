Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E890230264
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122524; cv=none; b=osOyrC34COZ0icQAKyEKcsbrz/qrEe+/LvXIRSRE4P6vJCbVr+m/k0iRPYoeatttK6Cm01COL9x6zqGRAXn83f6k3YpnwUWMvVNLLn1J26ixq1shg1IBC07nMiZ1d/dOPcwYOA6S4KtBy3hbv6URQTaPwrEW8Q/pj3ZQ+lZ90Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122524; c=relaxed/simple;
	bh=sZxXdn/KJs9wX6GX4jMsXBcMofGGlt7EXI22XFQuZDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6X7YjECJtOKLRSsGlBdsU0HrEB26o2/fI04pKCFmPsW3FEp/eJ4BlNYteOuyOors0FpJn1gD7Ax8u81qF1A2u+zz+B1vYfe0Apc+JLtYEEXfZRz2x0yKlEl4eqMM6YTszJns9zWBmHap2MQVBtU+sP+F8JTV1NL5TLYYF2aSiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PHZuHlJp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PHZuHlJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122504; x=1791727304; i=wahrenst@gmx.net;
	bh=VYFLk34uVtGFDat1qS7zz5oRfl/hRyIEck4Xu28Soa0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PHZuHlJp8u6v8rjLNH/gzwDF/qmK7aXXxwuHUSlFLfv9ZWv1XGNjH3PjLXRZitH/
	 oGXAcDBYN+bMh/rHJJeLu5VAadiu9DwLYuLR6tK6gx7EB7CX2UfwlPK7sbNQYq/Lw
	 KpIa4gtpQ2s/n0z3viwqrWKXtWQ3Gvp+wRw00OShtgTyl0JYtVsZ2D6NrBVs+bn40
	 dxIVWUIjkiTWeTQ4T3/RmSkU0jZ+ynSHkvrr4W7ewl9/aJrYHvqVa3FNnDND2QZ1R
	 25CvLTz2LX7QExl8St24Gg8c/DiCGNuwhFjx2pK231U7voTzRsavBLbzbAUcEQbOw
	 gaqwi8zXOgFt4zdmMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1xA0jM2dWe-00Tekv; Sun, 04
 Oct 2026 16:01:44 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
Date: Sun,  4 Oct 2026 16:01:20 +0200
Message-ID: <20261004140123.46461-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004140123.46461-1-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rXE5yY0OGPQve6+nbcEzmDYDuz6KwQBgqrEK2+fIeH0DFphIenv
 /WPLqT2jwC8zWY5qqQhYkIgEZK72GAwGTqWi9Wng9oBnIr94KgMF+hmuOrI5x34qTVI8o4J
 7z1/BffRf/4VkbeS6MgeIABarr+R9l+2UP6OkEUPDeKRgmX5LNywnQu1E0L5XDrzZBEShIq
 7D5OHiNo2j09NKIwFcLXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qjiPKqJrXUk=;bmwxYkC4EQ1EDPT84GTLz6WJiyg
 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

The commit 57ec5a8735dc ("net: phy: smsc: add proper reset flags for LAN87=
10A")
introduced proper reset handling for the SMSC LAN8710, which is now more
reliable than the PHY handling of the fec driver. So switch to the generic
PHY reset handling on the Tarragon platform.

Fixes: 5e4f393ccbf0 ("ARM: dts: imx6ull: Add chargebyte Tarragon support")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
index 5622f0ebb7a3..d2aa5285cd18 100644
=2D-- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi
@@ -111,12 +111,9 @@ &ecspi4 {
 &fec1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_enet1
-		     &pinctrl_enet1_phy_rst
 		     &pinctrl_enet_mdio>;
 	phy-supply =3D <&reg_dcdc_3v3>;
 	phy-mode =3D "rmii";
-	phy-reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>;
-	phy-reset-duration =3D <25>;
 	phy-handle =3D <&ethphy0>;
=20
 	/delete-property/ nvmem-cells;
@@ -130,13 +127,16 @@ ethphy0: ethernet-phy@0 {
 			compatible =3D "ethernet-phy-ieee802.3-c22";
 			reg =3D <0>;
 			pinctrl-names =3D "default";
-			pinctrl-0 =3D <&pinctrl_enet1_phy_int>;
+			pinctrl-0 =3D <&pinctrl_enet1_phy_int &pinctrl_enet1_phy_rst>;
 			interrupt-parent =3D <&gpio2>;
 			interrupts =3D <7 IRQ_TYPE_EDGE_FALLING>;
 			interrupts-extended =3D <&gpio2 7 IRQ_TYPE_EDGE_FALLING>;
 			clocks =3D <&clks IMX6UL_CLK_ENET_REF>;
 			clock-names =3D "rmii-ref";
 			max-speed =3D <100>;
+			reset-assert-us =3D <500>;
+			reset-deassert-us =3D <500>;
+			reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>;
 			smsc,disable-energy-detect;
 		};
 	};
=2D-=20
2.43.0

