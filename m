Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496142;
	b=QIWKi5j9ECJHjfK3QyR4quCB/6ZcP3uHv9xci46OFHgqkQZFu/rKY43qGwWha5GoLipA
	 bWfcqznxvwp5xzon31SY7WFra67fuJ4BAJ5DrWJfqYUQbF/0t97zFk1Qp1wmhE42dJDB2
	 T9Pr0fdZmYGtOKXXNAlngUD0+XqeOGqgez1QJ85F7D1s2XNso9yMzwbjZVDVC3mJAYhSf
	 Z1RayQv/2GCFcDmwWvY4rI/w5Melg9yeNRmOocNRB1UYAvXTdNPRaYZnUQji5mBaIv3gC
	 equveC+6rpCfV+uZaGerudusp7WvhXsk1/jD2yH1txn969SdG6B+VgvkjlaMQfKVGRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496142;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=;
	b=lH8pB9hbCpZhimiKBtg5619brW1Qmi0Rzz16IvoQDYHl+Oe5+qD4ePawEnDbq6+IBgee
	 P6sLtLClvU47SalItb4F1dJoOvNwfmuZv1GteGliQwisehFJ2ufhPHrmSlZD92jEHiHDO
	 cqaBGWiabXDbU3YmOBYLt0GB/ZGBeUYZwY9up4Wk2lLVHQLSZRqzs7W1hYj4ydIBYPu4w
	 8AHR4neD1Tu1otrObjthgvjJO2wQ9zaYH/RgiFtBMCntli59SZvRgvpVJoI55iLiKATPt
	 WOyiFnSE7DI6ggE+5cTYjGkGoF9609VXIl13ZXTvqfDgRZ3jDa9l4zgpfyKlU5M7Llg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=GQrVkre9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F65606A336
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F65606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=GQrVkre9
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2957F231C8;
	Thu, 12 Nov 2026 16:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496139;
	bh=4BLb/sTmHcdvT/KPX4mCF8s9/Po9DtJLecT3pESMZQU=; h=From:To:Subject;
	b=GQrVkre9+v8hJLbkaFxXKlOzi4d/GqdyAYCwlRboM8YntBXYzqVqru6QODFmonWvB
	 UYIi8nkth7OrhmX01+hZyG604iUDOcq1hD3aLEfjEW1nfBnYLZ/c7mI9KWN4ZCcbwi
	 ZWkoXqDBgC2wJOUsjs5euJUaHMvGDscTjUuuD/HF4j+PqpHW/S+gjLMOb1EvE8VyPO
	 GKL2suoYo8Z/CxisoTw3AR5ELN/SAMJuqq/eXmZEk2GmfIpVchoXIm9h+690PUEOul
	 CYBUZ/SlibCmca0TsiWCFt7rga2k3+kGn3Lq4Dyf7zVfTcK4BqKmbssG4zXeZ7b3K7
	 fCaMFMqXBxFUw==
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
Subject: [PATCH v1 3/4] ARM: dts: imx6ull-colibri: Add SPI alias
Date: Thu, 12 Nov 2026 16:08:47 +0100
Message-ID: <20261112150849.177133-4-francesco@dolcini.it>
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
single SPI bus available to the carrier board, implemented by ecspi1
on Colibri iMX6ULL.

imx6ul.dtsi already numbers ecspi1 as spi0, matching the Colibri
interface. Add the alias to the SoM dtsi anyway so the mapping from the
Colibri SPI interface to the Linux bus number in sysfs and the spidev
name is explicit at the SoM level and does not depend on the SoC
default.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index 1eb1cf2d7395..6de474e4f73b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -6,10 +6,11 @@
 #include "imx6ull.dtsi"
 
 / {
-	/* Ethernet aliases to ensure correct MAC addresses */
 	aliases {
+		/* Ethernet aliases to ensure correct MAC addresses */
 		ethernet0 = &fec2;
 		ethernet1 = &fec1;
+		spi0 = &ecspi1;
 	};
 
 	backlight: backlight {
-- 
2.47.3

