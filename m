Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495769;
	b=oYXsjl/MmF2ujGGENG6cuXxaTdQEGSP+lHHAbUL8WIUZ6Q0UBVmCS4vVyueoDwIckHIv
	 QDc87u6rkzoVYDhiJ4gQDZPMw3LYC6GYAnsUXj/hOBiC3A7VU+IYN/UNh5ZUGCgENa/YL
	 qSuInaihKHmMu7nq3WSO9MAhuNZ1U23UgImwShN1mdcXynIKOs5bZ8oPye+wY8Jzeti1C
	 7emnJnlQIIgLf8YuB1fB+HP4Ecy/H9+cj8uq+GzAOL7iu7GRb3sqMRIcD7ZojyRuQFCH7
	 L/kJ9BBW9K6l3gpfjL5+LvZU0miTiIp5Hs9RAlJl3sPbg9R7GkpbGibukvplbOQHOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495769;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ylShe8HWjM2yCOaQXzQ0NGIXs6JPh3EhfmIe6mjqzT4=;
	b=YHizKFaAed1mOFuG7olUVvgElIYRBICGPm2lBH4BKl9NTLESlD/geIrcQdN3xEOg93wk
	 DuDDhn7rbv33Tob7iIdv82XevWgYxHAEVat5bwoNrVlpRa7n3f4fC+PArMn5cTWILXnGx
	 EwZVYEbWceKGL97cW3NHUFNu9L/TCrlbZOuK34usDHNIV8eqLkPyP0jplC2ktCGnvD/vL
	 Unz+lupsvvfj9M4Wwx3IgN6hCDt/ZML08RZT+PlSFA2Wo3hX+sOC3hMA3fO64hJDZd8dZ
	 zb+hmG70wobPx9c2RXcpCpGa9eZY/doqtVfakF9+SWsBZZUocwPy9uvaPteFKiYVuaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=elmq5Boc;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A5606A8BB
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D99A5606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=elmq5Boc
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 29323231D6;
	Thu, 12 Nov 2026 16:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495766;
	bh=ylShe8HWjM2yCOaQXzQ0NGIXs6JPh3EhfmIe6mjqzT4=; h=From:To:Subject;
	b=elmq5Boc7mSXRw2ZQTiTmd30m7eQsb+OS2hWtcZ3oiz63c3BMJw6Ny+x37NSYjkS2
	 HF6vSxQgq3QmAa8WS6c7SKtA7lid9km6+jkAhIvgIBQ3+NIsXWqG75noYVFdloh8cX
	 Qjgio6U/oIqyJ303sYJA/9OM+5hY2HxK15lUkzn3vMtVuZtKQvExV9JWFApgdnRc6t
	 S5kcx+wF2wnSPrzK5aNRjfw1hbBphVXPUS2RvLS+LU3azIBx8J6Gfz+WwvaQxAT3b0
	 MnLXDAORdGORQp5WctvByzVuwgYCSbTf9PbvNvjGqkxqZh1pUrPVzTD5g7ORnEycPV
	 qem1R07MpJf8g==
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
Subject: [PATCH v1 05/11] arm64: dts: freescale: imx8mp-toradex-smarc: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:27 +0100
Message-ID: <20261112150236.164850-6-francesco@dolcini.it>
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

The SMARC specification defines the module interfaces and their
numbering, SPI0 and SPI1 being the SPI buses available to the carrier
board, implemented by ecspi1 and ecspi2 on Toradex SMARC iMX8MP.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names match the
SMARC interface numbering. This replaces the spi0 alias imx8mp.dtsi
gives to flexspi, which is not used on Toradex SMARC iMX8MP.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..f3d21d788b85 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -20,6 +20,8 @@ aliases {
 		serial1 = &uart4;
 		serial2 = &uart2;
 		serial3 = &uart3;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
 	};
 
 	chosen {
-- 
2.47.3

