Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=21V03BDvuEiJiHe/gln9DmhJslteLSC9yC9k1J05Tj/BgDhOASYwZqByG+aNBYukvCTd
	 nKOJ1t279Fz9GfsuAJtz46pcUPA8Jj4nNfMGsriX9vFPD+htVeFJIjDowAjY2uvd6TWUZ
	 0otRwHIMy8SVXa3BZ/G+sk3fuCe54PTP3EjziACYHUMo3cdDMyQ95gyW2jJYBvr9ChQMQ
	 rKucplKxz5CewxmaQhatTH99vWBEUupBsP/9fK9k5CpNEv0g+QLW2kh3paAN6toULABQL
	 r5jM5vjTmiHiKEc4zZZhp+dkLCbhPIoWJLnHeny+x8KNFLbuBBqry+Arj9O5QVHxIVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=;
	b=k23zrp+8UvSueRl//V//a6C7/JwtHHiNos2emnfO4WwZKhbehOAiyVzS37cjSFvEsG6g
	 0/sd4xJPB6yc/Vjuwo61u7I4nZ/QBoUv/rCJSUo4TwyQ9ROq+lIlZCUBoUaI6KF/os+lG
	 +x1XyH/yIoXcinHyTX2VDHCDoJpPisWZbkVFJaGxGzjLuLiVSQs2K1a5gwAeEk3zIjf6B
	 IQSVa8bz4fpYJzyGdFWtqJNFf8adLCG3WHip1kcTSOruOrO8Redx7b022orD71U3XebMR
	 qdQvFUIVJI7wybbbXEoq9iyU+wWnZQoEfNQ8mSJd9+vHUHrt0A2u06ynklFQVBym0eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="c7I/zUH7";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9802606A334
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9802606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=c7I/zUH7
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F57C231B8;
	Thu, 12 Nov 2026 16:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495765;
	bh=xmvLJrJyELZb8cY10zo4EC4FD4F0vTo2mGwICJdRtTs=; h=From:To:Subject;
	b=c7I/zUH7MjMR/q5YU6UvGZnrGGIprzYpeurMv9G7Bap6bMXnKYNs7ZqX0tYpboPlj
	 EibT5JkQWwT5ks/z34vci6AV3xNxzXrrw7F/nLVe+6hIIM9rxFqOQ0oKG1k+3iPBcp
	 XwBdDFhs7NAi+74QpkyQKXGbmJfT0DnSEZKRp45TC34GbTtAL535MZGG32YHJdbvzt
	 VAtZvI9uSmVMeCnSpcnEGsi00S1NUNNvdfSFi6llz3eLm84mId4rpHguwIvZNmxfUS
	 DV77FCj+z6V+WITVZl5W+R+xnk2SLosQhLLOPJCyf3YlM17GknaBywzGy0jlLQe7uy
	 luyHsFpYsKd+g==
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
Subject: [PATCH v1 03/11] arm64: dts: freescale: imx95-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:25 +0100
Message-ID: <20261112150236.164850-4-francesco@dolcini.it>
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

The Verdin family pinout defines the SoM interfaces and their
numbering, SPI_1 being the SPI bus available to the carrier board,
implemented by lpspi6 on Verdin iMX95.

Without an alias the Linux SPI bus number is assigned dynamically and
can change with the carrier board or probe order. Add a spi0 alias so
the bus number in sysfs and the spidev name follow the Verdin interface
numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index d13b395e98ca..d239fecd53c5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -32,6 +32,7 @@ aliases {
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
 		serial4 = &lpuart6;
+		spi0 = &lpspi6;
 		usb0 = &usb2;
 		usb1 = &usb3;
 	};
-- 
2.47.3

