Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495770;
	b=YsrercpBWeu0kIsB9Xyrw4tLU0EnWQoXecIOOEfAkstXh4gF8bGsEKgg9lncM9oZuTtf
	 CwtEBfyCh+ANYAoKTVOZLiwohg1IfOZ08Et06foklTvWGBksuVGzcUHE0njFiEKSRJYf7
	 laA3xdT96O6L5H0LbjBOFtpmoZAE1wZNvthBiIHSCo32Bt37zisS+8eBIlmrYQgQHz8VO
	 qTrwlNzzdqnNo3pTRBfG8Dn5lHlenBe1qgGTpZDZA+qW9iYF0J2JN4KTbsbirP6MD7wAu
	 h31X2on0C97rujz6FPMvTtHhCWVowm3vqimzZFUXdMGxYzZua6Ajj54NTa7X5+rPOtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=;
	b=tF3yat6G+V6Pyd9FNgnhXv9udwGYoGR+0yg3EnFKSh4WHSB/n0YIFZn1hBxZ5vn6fvaV
	 3gA1uN5oOCnO0sosHj82QpcHtcdg/FqfPg0IRiAvk8pGv+HUA7SMUSd68HhtessDrOy+f
	 s1vAznf+w4b4IwQ1pGx6EclhWWKQ/nO84lX6xbzaTvYtXz2uDnYx5k67DQ3iW3Pz1NElI
	 6kvHChoJUk2tozd/7/6A/m/Kx3a8GLK45DJOduVRuhUiZgBcFwLy1jCEZhTShoNsiqLwz
	 QYFENYTVzkcW7p1qt/2cZ1w1YKgJzLATG+hvjaKq6TdO2sEcKkyb/bxbMhVyJ6+stbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oJRTTFCJ;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269560A2620
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E269560A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oJRTTFCJ
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AA0AA231D8;
	Thu, 12 Nov 2026 16:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495768;
	bh=2uOiyb+Q8M216uUXx952IJn6ffOrIl5bI86rzJ70cYk=; h=From:To:Subject;
	b=oJRTTFCJ6ymHL57mF0t61n2pua8y/wVHTmyEMXPEHHX7I5kmswZOYVGWFkPjELho5
	 YVRa/DhbTS9ujQm3TbWT2JDlUWVZItbRhBfVMecxXZ3Dw+bdrfCCF5yM+WARy2tJZg
	 ceK2ZDk0jtQghiz2IWNmxQ7RL5P7Wj9r2uCs8DCKwSxavfDRp8+VaQ3hOBAvCdEW8M
	 7Q0EzYvQRImUbpHo/fPT14OPTQAM13dKEr7/7tLq1S0E0N6nXQBMzUvnPH4ulvgLr5
	 aMuGb4un+s8R5B6Jcc26UwDH/cdUAZPsLiryFlt5NfMx+gycheEJy/gUkkyI3xv94o
	 8XzoTBLMBTqGg==
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
Subject: [PATCH v1 07/11] arm64: dts: freescale: imx95-aquila: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:29 +0100
Message-ID: <20261112150236.164850-8-francesco@dolcini.it>
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

The Aquila family pinout defines the SoM interfaces and their
numbering, SPI_1 and SPI_2 being the SPI buses available to the carrier
board, implemented by lpspi6 and lpspi4 on Aquila iMX95.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
Aquila interface numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..e7c20dfffd34 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -31,6 +31,8 @@ aliases {
 		serial1 = &lpuart7;
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
+		spi0 = &lpspi6;
+		spi1 = &lpspi4;
 		usb0 = &usb3;
 		usb1 = &usb2;
 	};
-- 
2.47.3

