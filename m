Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703215;
	b=Aa99VroEMKoZq6vthGFevz6d+YkvAhZLWOjuc1ob3G1a7FYmIoQNgpNDWEtFCDEzUPLo
	 P/0PB+n8eSc3vi798VmYWs4XtWiuyyoSyUHRY4EpfAgr4f8csaPlm11IZ+LYS2eVh6Oxu
	 wFX3P5rftlgAkYQlgBJacpjnDOqmSyDk+y38hhEGJQRPFqzrgQ4v/biqwXeQKfwCrK5W2
	 oZUMibpQvDFSlai0pyJ1aJKSmZjqIKJiVD6sCWl7DnDw9OBFffpQYx+ammnkOX1fllayj
	 BEfXakCDgglVwgHMb7wcjlHwceW8l3fXLZJG9S7rL9bv7qWmFBpTSvHJKFJUjIVQo+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703215;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=;
	b=1IxWR2cSVk/EjE60y3g8CU7yVnKsT88/R7Gc9Rs8p9mTyrfThxOlgYwaTABt8kcZZbyl
	 4drDaPobH6rZnF8+i8sIEfWxTElPMgxggxRfWKjyN9cQH6U+gseZc38PJhrOHMJFSiZiE
	 fe5gQRi6BVUWrR8AQFAbBxht00pd9HT+Aw5MXWNSA6J3A8Ufg19WYXiqwLqhzY0DghwSh
	 YGlN13sSzbEKGOd9zYG/1iffwrZc9mukCP2T8lzbg+ewH8fPGjrn+2N2aAilUekqiDQh8
	 75AyezaEjGXcIoqW4ztsCrdInC+sn1AtTDeYqcyds5qjBuZ+eOE//L9Yr08ci2pscqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WEP8wv3l;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4C606BFBD
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 10:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F4C606BFBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=WEP8wv3l
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 8EEEE1FAF9;
	Tue,  3 Nov 2026 11:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703213;
	bh=PucKNmxJ8X9KZkuPjiBnnnSe7Sz0Xqekz5/GdiUHsVA=; h=From:To:Subject;
	b=WEP8wv3lFTmygkOzEkmDHEBLmlgoIuB8rpg9pTv7+LCG4jMd3E0ULkGhcE1YntdjL
	 chSHcvrlHCaTXqDCH8+9sLMwDaHOpX7pyMcniFinvcOEAXMnhkCbD8C443t2EiqWNh
	 dNRijXurmNvW0K2sTKivo6UENcEXQw6Xl17LXCg5gm8o/7yiKA+a1EbuKcllsAePph
	 RiMDPxiIQLLDCYt0zl6UjzsQQtDxkiIJAY/4qF2ienx+PziAhDHOlbxkBqfEF9r7ap
	 5OTiLDPiFkgDPVOHrdOFjb4OE4lnSqAnZk9ZhrOBgbeksBrMQvv2+dJYo3hgK2NjPa
	 wLP29x2mGG+0A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:16 +0100
Message-ID: <20261103105323.2394012-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
References: <20261103105323.2394012-1-francesco@dolcini.it>
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

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 07bf53240958..37fa107c6fec 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -41,6 +41,8 @@ reg_dp_3p3v: regulator-dp-3p3v {
 		/* Aquila GPIO_21_DP */
 		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "DP_3V3";
-- 
2.47.3

