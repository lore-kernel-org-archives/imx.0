Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496141;
	b=iLQSLaXLGHHa/DUkIhL/3I+blc2o4wsJRUslrg9EF6FxYcKxXnU/wMsSLwmPZxskBtLn
	 qpHi7g5FoQ4azBrvEKDq7NkkEtgE67Eby67hVVhoYeFnHDLFaa8l7ugiyfVukYlg1H8IB
	 X8ikahHzfWQxdIGF3cfjZVoPmFgx6YlvqLfHWiapOZ8UKO7MF9BABsaXgaL5cgwhaqPre
	 Uln1ZwlZyAtORZm3JmiiIFhs8h6NCQUr5JqMlejaKra/hR9owzwOyA0BoxyslHNCyBOqJ
	 VHqCpcsDQafuNlmKx2K3rTFQ6T7LtvulM61fTzGCJb8WSiH2UqAfJ2Y6iow6mSnJ19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496141;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=;
	b=eFWaUGGEJzzNRgjI0jX4oUtYxynj/4I1z/sLdLoru/7OtITV6FLKA5xxpWHelMI3FIbI
	 b+06fkDU8BPoHDXm/WPZSGEREljtfoMWk3FVidF3NGXDIhY+bmDrxmGziGJyGFaR+Is7B
	 BQutPHPvEYYjivTmXvfke0ZFOCaG2EZHBw+1K76JQdvsgLZde7menlSkIbj2QckfpdGIR
	 rdfrVNc8Pib4xfjjd8aEWshxQ7ZPnZtohvmTrAsxrRkIKqYLG3HK0IydInNNti0fO4VSp
	 Zmzy65993zraPJGzpNph7FgCeBoIK0rVXUQsL3bSYDwTL6GE6zEmV3ttaTNEH7JHzkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=e+xOaV2Y;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5A606A32E
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C5A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=e+xOaV2Y
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 88E6B231B8;
	Thu, 12 Nov 2026 16:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=WXzyXPsawQzAas62KuytGi1NmXYvupw3UlaDFU2Owg4=; h=From:To:Subject;
	b=e+xOaV2Yn3fSU1ElQlbhub4LN2nOW/WuOUHPn4JLGSCYZKTEEYKOfTzm15DXD/XOo
	 9PvI8pfuxxxTQwJKox6EbKRls2EvYzg6MprHwrEWkVmSbUYrXXGAQNUfk3GAH8atkr
	 aDnMeWHBShRDnL+AUzVWL0P1jGppKoVlYhS1UJDZ8u+d8ovI7POq+6ixOPNwOf6tzk
	 uBayUXetUES9dX3rpa2V1vvgUvo+iaJLKxJgGQzP2hT0QGTvnv1beFqgsKr1E4Sgh9
	 08Inq2yM7v1VR1L6oyb12n+iv7NUISLaZeHA0Inqq39W4o/1bMgIDi6v1WUDHmtX4s
	 BR/zMkMyID+pA==
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
Subject: [PATCH v1 2/4] ARM: dts: imx6qdl-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:46 +0100
Message-ID: <20261112150849.177133-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
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
single SPI bus available to the carrier board, implemented by ecspi4
on Colibri iMX6.

imx6qdl.dtsi numbers ecspi4 as spi3, so the Linux bus number in sysfs
and the spidev name do not match the Colibri interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi3, so ecspi4 is
bus 0 and carries a single alias. This replaces the spi0 alias
imx6qdl.dtsi gives to ecspi1, which is not used on Colibri iMX6.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index c9e539f83f80..0c5158e6be25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -16,6 +16,8 @@ aliases {
 		mmc1 = &usdhc1; /* MMC/SD Slot */
 		/delete-property/ mmc2;
 		/delete-property/ mmc3;
+		spi0 = &ecspi4;
+		/delete-property/ spi3;
 	};
 
 	backlight: backlight {
-- 
2.47.3

