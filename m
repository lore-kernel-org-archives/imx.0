Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495773;
	b=JbJUpY1LpEZAceFBxSUAq07acbmLXLRIwC3g0hTOpThoLyBZlMf6TnEJ0zT2jzN26zwm
	 ZK7PHVSo1Qt/vp0zgVZ6xEQ0Z0mnU6wLbKv/CZWPdTxv00zB+IG78huNnnXRfoDwIO9kT
	 cBURClTZM0zY3AaXO/ABWSvmM5oBPsuXoUEt3KE9qJMNVVyiTm8pn4PCanaK6z7chKhlh
	 5qAqwbPVXZULheafrX6ssYm1GIfBjpjgz1jwX7HP2UHRn9xEIoPKJE/CU/NgFaGjZZ++T
	 ZDR2rnvmjLFFmvnKjzrcKCQFvR0ETgsUIH5dhPcvc2sEV225mv27bb2kZdKlgz2vBEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495773;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=;
	b=uwC4jy3JC0VKk+eaAnMv73/KcCuSKVWBr+rXjeBxfN6h1EJHRNTguPSqb5XcpMpWhwLR
	 YuIcfgzEbFIIODy4fpLabsFjq1IH1qpkhC4xPw3FD6PgqtN7ShsnSKk5oGwlISCFPFXXe
	 kyCQTv3o5hUcugLtc3MAdxITdQTTFawui9i155mOf0uDXZTKy8HDzOt94EguidF4blvKx
	 WRncf6Z7sRjXy5Pa+AJA6uPZEnuov/rkZz+liRoEVnUOJM9qTryQbd8bJAoG9Jj8UEROI
	 J2Hmha8L8fmKwWszpZDFGci8kWgVLTjkb0ny2ZJ13+C3KEVbSIu4X36xDTxvW1ue74g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EzyZIlwT;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF660A3827
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAF660A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=EzyZIlwT
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B91E423217;
	Thu, 12 Nov 2026 16:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495771;
	bh=Ixcj6PNq9GxugAmLZbG5bwGiWeCce+wGaPCQOB8zgAE=; h=From:To:Subject;
	b=EzyZIlwT/mow0+EAlGqUhjrokW4rsCObajWVJXNA2QkM/m+z0BFHrRzVGYlxdikMp
	 hBmQHsu6uUZtEM27h4mrO07vWglFckUbcimpKBDm7UYXCIQOmEOV7AREUkcrcSuHSo
	 3wN7d1VEtLxOrUfll1iJDxNpylABcPMKDyUsExdn/aA0E3tDZrTiaCzqFAdQwCDjz9
	 U5fKxDKf4RxwaJM+GtLfCpMl7xhP4dvugByup3BOogf84IGz0Lc/OCZIpU2ZyHaOA1
	 KuH0Hr4ef12gZ3m4/e3b+qVnC+TI4/Af37mOXtkInNh72EQm4I+kUF5lJIfQ+p0X4n
	 gWavjqiGVrdGw==
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
Subject: [PATCH v1 11/11] arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:33 +0100
Message-ID: <20261112150236.164850-12-francesco@dolcini.it>
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
implemented by lpspi4 and lpspi1 on Toradex OSM iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
OSM interface order, SPI_A being spi0 and SPI_B spi1.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
index 8eb7ea4ed9ee..dc2ef7035246 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
@@ -30,6 +30,8 @@ aliases {
 		serial2 = &lpuart5;
 		serial3 = &lpuart3;
 		serial4 = &lpuart2;
+		spi0 = &lpspi4;
+		spi1 = &lpspi1;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3

