Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367989;
	b=AdcZPhH7LT2oITaCZeT1t1NfjVInpX4Dw7a7Ib8bM/tpjhi2UHm/B+VfcXr0knC4i5E4
	 GvLIxD3syGP9UAPh9az3cUmbc1E7sjWNQIzrog67dJ1GzIqEusP9bElE0hV5zZF5oYSIZ
	 QSKqmlWCmkmD2hhIhRQk17J5lDpeT2Lfvv9mVKbGekM8RhsZAdpyY3gmezFk/f7jb0SX6
	 WS9CrT6GY78+zxycx2z6u+0tEe+93Wp7AlFqTM6vikDZL+sYFCr1x42ZmKgii0kkJvdbP
	 gGDwpfMOinXCOIFpzaDWkDh+Ijgc7Ij2LpgMuFWuOIdgL54JmEUaJl97msF+Hj8Om6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367989;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=;
	b=uTatPFwPBPhCaAzlOo7QDgZ7GNIs2mcw4wpmrIvFRrwRs9YEEQrnEB6ZoKjLu9HQvS50
	 do63l0CJbA/X/oSxGWkYdhur99QGpkDZ6sj0hytFluH9SZ8QfpZUtM2KyhT2ua2ajzRRi
	 8YroN7oXHTRA+7DdP+eOw6JjYDQ7GFueQea8w9TwM9eestsv6VXPMoCecdJlk9ln/708t
	 9a0U7LXXjR0gH2CBjabtWeY5oWeuAkeV/3V6SRR3L6n4ttN8ivv0lXMpEzyDie9jP/C43
	 866CD5DVsfKW6sDslUQ9+NAbHdXWCKnA2d3vrT1dA9C0HHv7uStn3uc3m2TrnAkYIEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=dmS9OfdF;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB456606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 17:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB456606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=dmS9OfdF
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4894E270BA;
	Sun, 22 Nov 2026 18:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367979;
	bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=; h=From:To:Subject;
	b=dmS9OfdFg0a5UHzCXkfkYZwE2wiK9MjJeWob9RtMcaX/7D05PTUPCvL6AButrnBpy
	 50sgkGX8L9tDhZXv9FUDqn8NFtnk3zlQHnWkEV9P4nlhZ3Hfpobvr42tYX0ywYtVdw
	 ghtMmnh2whRRwn10/AwzeUEvAaluQK+CnR9xvzAgQdbVhBtD/DlzWnFTgE+Y2mCilD
	 QOKVLu2lem4/jXmp8v3JC3X1TMxZEtqPh8V5cPf0scWpIOKSKOLAOFoIQi9jB4X6hR
	 KrUswsSLmg0/GTdi24EY4aCoAupLpkyIAxsbeOu9pfoV9j4pHLWToT34blyD49/5WX
	 OD+UqVAxc3ESQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
Date: Sun, 22 Nov 2026 18:19:28 +0100
Message-ID: <20261122171931.295307-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122171931.295307-1-francesco@dolcini.it>
References: <20261122171931.295307-1-francesco@dolcini.it>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

On the OSM Development Board, SDIO_B goes to the M.2 Key E slot for a
Wi-Fi/Bluetooth module. The slot has no card detect signal and M.2
modules are not hot-pluggable. The slot supply is not software
controlled, so the module stays powered in suspend. The SDIO_B signals
are fixed at 1.8V, supplied by the on-module +V1.8 rail.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply. Without this, the empty slot is
polled every second.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi     | 1 +
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
index f6fd64176893..d273f4bfb96b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -517,6 +517,7 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_sdio_b>;
 	pinctrl-2 = <&pinctrl_sdio_b>;
 	disable-wp;
+	vqmmc-supply = <&reg_1v8>;
 };
 
 &wdog3 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 61a0f49f198b..41bc471329eb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -316,5 +316,8 @@ &usdhc2 {
 
 /* OSM SDIO_B */
 &usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
 	status = "okay";
 };
-- 
2.47.3

