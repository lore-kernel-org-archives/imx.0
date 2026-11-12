Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495772;
	b=lnJJuWGV9MNsHEceJYwMstmkem230TqaQphV1NQNtkUSXnxV7yahpgarUu4845X+uwfM
	 oekYL9d9Eyvor3Iv/61s4fThfxXnIsmPOAtZTuna/1vXXBjrsNF8hdLY7Qh2w4Ad4b7n6
	 m2EYflXrDIi2aJ9nReZzo7fpyxdMpr31xuUv3O/HzqlztsY9KkUiASqA/skavjF5sIoNR
	 zaC/UgdYXKbBQ2sjLTh3YcN3ef3nWoLUo0Ybmk7S5UJAPbDoJVwtq6uWS+TcPW0+Thvhs
	 QpOikwqIuNGL0zLNVBzgN9eiNl+quClYLayBIzMFT0hEM+ThLBDRgLw5S+PT6MzMcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495772;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZfgLCA7ZrK/D1WTMEULX43MHGDrUY5pCM1cItjDeW0=;
	b=4uBr7FNC2M1DLGoCLVy/QNhb4b7IwO9om85ySa/3TcpuUfS5yCVa6YO3AyTnfgrxlI3g
	 aBiX/S7PjwZvo/mk0t5YMz86FGFGrn0iFR+bA+xNxoAS7mcYZksAUm51Bt7ilp1hR9Jkj
	 cND0xYj0kjUDFlyExiaMpjgn5RBabYnmji+NEYPJkEi/S6zyPhFv2glB5UzW7Lzo89G/r
	 9uXyuofrHHm7yaZfawh2rMsZhyPozJqXqKpkYUESLCrlP0aHPOdQwAMzoTOb85qmnuMk5
	 fkTGSUCAhKu4DTlHh+dTBwShfhiXbwRURxIhIKxt02YawZTQLw7YXR2tVpSie0vqMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=eYdsEyum;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8560A3827
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B8560A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=eYdsEyum
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0665C231B8;
	Thu, 12 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495770;
	bh=CZfgLCA7ZrK/D1WTMEULX43MHGDrUY5pCM1cItjDeW0=; h=From:To:Subject;
	b=eYdsEyumSKICw76OqGTQkGIk/92MV4LN5Q9pbT2bd7I51qdx85qVJjVBp/Qr7lwbo
	 pB2tBEtt4I2BRByAI6rjbmpX0BhR3uB/gsBGMSHNwpsk6cE9J+VsgHGtdbLSElhhCA
	 HvSQB5JpFbfb1oiM+m3zPnoHSsQkHgBJ56VGCA4Y8HnJkuCO24hxie0ZY1EA5Pl1jL
	 wHcR+AhUUglNSQNAdnC1OM2f+GYhrHLzht8EzHmcW6keOeK2kxiV7ZQJI+PwfwQN3M
	 HNjnlo+9HVLOvUaq7+BxDTYmMW/SFE/V8jLzUosiI7AHwjEJW60k7JtlBJ74UU1WAr
	 ScH0m7Tqyirkg==
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
Subject: [PATCH v1 10/11] arm64: dts: freescale: imx93-imx91-toradex-osm-common: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:32 +0100
Message-ID: <20261112150236.164850-11-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
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

The OSM specification defines the module interfaces and their naming,
SPI_A and SPI_B being the SPI buses available to the carrier board,
implemented by lpspi8 and lpspi1 on Toradex OSM iMX93 and iMX91.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
OSM interface order, SPI_A being spi0 and SPI_B spi1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
index 8b0131d4e6e2..f6fd64176893 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -30,6 +30,8 @@ aliases {
 		serial1 = &lpuart6;
 		serial2 = &lpuart7;
 		serial3 = &lpuart2;
+		spi0 = &lpspi8;
+		spi1 = &lpspi1;
 		usb0 = &usbotg1;
 		usb1 = &usbotg2;
 	};
-- 
2.47.3

