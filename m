Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495772;
	b=Z2tvK5ShIHRP7PPCcvEv40xcS3XV/UnB9vTZKJJ9kyiiZRDEQjVwzPJg3iRa+rGtH0UR
	 /efuEF0cgBSeoUAQkObMJjcR/JQPysRUjMa6/ZlBqe2mhlp8Ue7CLDnwokrz3eYhp0fdd
	 gQFiLjhWmO6Smz3+XEDRC1J7wWrTVr2j2eqUR+Q6x4rxwbYycViMq0c5fuRxNIH+WASdz
	 91hy1NM9HUS/TAZAQr5btjjq+B6DZ1eF2uV37avvgW52Gr33f/Lyt75QdhPXiTaN4HZSv
	 RCknhCvqxYmBKPvkiOnGZ+DMHTzsAxJmNqoed+rnBZcUq0lrcpKQIvvGmhX6nI8h3IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495772;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bXxxB3rqDxEKVhGVu6wJYN3vPgjqaFYKkpwYR+FN2mI=;
	b=VooR++DPUd3uUAc1x3VdTs6lgN1yS3c8JRLDgBTyiPMhhTJXgbRnn7lO5g1BvsDUUgZG
	 MFeLvIfuu7vgcFFqELd2ofbiwQPHJzdWo98z4aoucRA25Ya5wXFxpn9hU5fynz+q7ZTJ9
	 VSGKxGrdqRdvejg3oZxUfZxW+McqgYvIh5Xpj8unrNk1ZL9yKFMHUEELXxivS7aUedgBP
	 G+c08/cc75+lB5gqei2DD7HMqO3To45bORWjhdLdkYamy2JbL5OqZi+SgwU+v/htT3RB3
	 JS9AagK5lyzRorWrUN3JZif6Dl7qjydovEDRh36QqoBXfnFswDSFZBzHtv2ydLiqTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=PGWszLJo;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709260A3813
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8709260A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=PGWszLJo
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F715231C8;
	Thu, 12 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495769;
	bh=bXxxB3rqDxEKVhGVu6wJYN3vPgjqaFYKkpwYR+FN2mI=; h=From:To:Subject;
	b=PGWszLJosj/uFqQOFJlsqGur2rZMyu8pzg+1+dnGZEh6wmR19owa0QBJInmlJU+uU
	 DaqpHQu4cT4CfWQk+2BTR04oiUbwinSfI0FoGEGakXRH1RZjQPMteNUufL5o7UAhEh
	 Tju8vNZeLieSvv13yxKH7BCYMw4u3mv4w4L3aayDq3Di9A5ODYlGLydCZ7UH9zt42H
	 oM4vFWOXKmHdZ4SLEVscKmhMKJZ7YIUKyb/SYH/05O/eBpzc06o7h9s2bTbS6DxgGL
	 NrQU7aI1nwo1Hrp75ElA4uFOlB93QPqqfS/4wuvksR1ntIUeVgYOtc5sqdeBKSpVdy
	 GBu8T29HgGQhw==
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
Subject: [PATCH v1 09/11] arm64: dts: freescale: imx93-imx91-lino-common: Add SPI aliases
Date: Thu, 12 Nov 2026 16:02:31 +0100
Message-ID: <20261112150236.164850-10-francesco@dolcini.it>
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

The Lino family pinout defines the SoM interfaces and their numbering,
SPI_1 and SPI_2 being the SPI buses available to the carrier board,
implemented by lpspi8 and lpspi1 on Lino iMX93 and iMX91.

Without aliases the Linux SPI bus numbers are assigned dynamically and
can change with the carrier board or probe order. Add spi0 and spi1
aliases so the bus numbers in sysfs and the spidev names follow the
Lino interface numbering, zero-based with SPI_1 being spi0.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
index f8f13f785860..787df739ea55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
@@ -29,6 +29,8 @@ aliases {
 		serial1 = &lpuart7;
 		serial2 = &lpuart1;
 		serial3 = &lpuart2;
+		spi0 = &lpspi8;
+		spi1 = &lpspi1;
 		usb0 = &usbotg1;
 		usb1 = &usbotg2;
 	};
-- 
2.47.3

