Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495768;
	b=alwaVcwPs5cIJUPyJZvkiGxdaNoi/m+QEWASS6+TMabEYp0jLz+FoBbllAPbZxrTGT5Y
	 Xt0i8Jkt3y8iCXc3XafREndSYv2rQVOGlvyN3vQ9DS5LsiV5Io7HnX0W/ISdBGJEin782
	 xhbna+d+cPuSi7BLgngvvHXWK6hsLat2uTl9Q0Y63mloAkZ7NDWPtWrzlCYf5eNFwsC/z
	 uEZBFT0zyKm12FjAmdfrB1D1gsfFnP75v0BerCLPdEOaRM69h8aEf8ApiApau7m2mqNuz
	 jO8CTj+Nn4CFBFCSVHELWQ+69vu/j76qvtfIRkTXJGScIofkRKfTL7OGo3deS/kTgHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495768;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=;
	b=ft01u2qgR+hANaI0rvmMABJgQImu5R1pcRBI3bBe53MN3i6A3+MTuA7fWkTbtIB1zPZh
	 y7+K4e/gChkMRKpnI3qH/D6arp0/ft4Sh4sgmz2NSa6TPo79nBblePxKkNotQYTNbkMHJ
	 NFHN8+kghJ7AwKwdefsLdvTknwsR4DOKh0yuQNbw55RipvaBAHnwhnkRpen4x3OUEq5bR
	 tE1W5C8eIkgBgp1c1R3JZ0eYKfmmP/ZsCq70i0zPRb0ZMQOiX2qbvNp+ru1PG6mqKSbOj
	 vzQh8LRdULgY1ukj4xI6J2CmnTbV+k+JlKK9GRoaxYxlaPCv+zkQcpS8tHSN9soSFxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=hf9VL5zH;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B6606A333
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4B6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=hf9VL5zH
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 50DDE2316A;
	Thu, 12 Nov 2026 16:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495766;
	bh=ZlolI9vENTEl6C1rNaluT0xNLPmhG2Q3ZnlKVC/ytPQ=; h=From:To:Subject;
	b=hf9VL5zHqWKbkMYu073oF0sO54UDfRzqxdjbI+Oacu/1Fhk4IbojbcW5Lw93OZIJ6
	 SF8qFUm5nXE3X9di6utHHX/xS7s5n1NhXkUl4fbEpLlyAyhX3w3ebpNPWmJikyMXaa
	 WSQhdUk19Bsa5WeB3cvMAm4RMy5bohFgTliqFkFLGX2bJLyvVSr7F6aekWru3mxr2L
	 IsCjQ3QcHvZzZGU+jZtnuLNwmnPfhu0fNFlnLXnQwqO/f+l7rIhOgNWaio/2kyirn5
	 jS8YEtshE6dxqAnR4agZvytoVyHowV3uR4YiWA8Xrgr8jb6lAlAnrRvzfoQRT2ylKh
	 Ym0/pxMC7D3vQ==
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
Subject: [PATCH v1 04/11] arm64: dts: freescale: imx8x-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:26 +0100
Message-ID: <20261112150236.164850-5-francesco@dolcini.it>
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

The Colibri family pinout defines the SoM interfaces, SPI being the
single SPI bus available to the carrier board, implemented by lpspi2
on Colibri iMX8X.

imx8qxp.dtsi numbers lpspi2 as spi2, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi2, so lpspi2 is
bus 0 and carries a single alias.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..8f04bc3decda 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -6,6 +6,11 @@
 #include "dt-bindings/pwm/pwm.h"
 
 / {
+	aliases {
+		spi0 = &lpspi2;
+		/delete-property/ spi2;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
-- 
2.47.3

