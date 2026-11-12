Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495767;
	b=31UKc7lloCWxMxRvgvuup9s7AA0RMB1RcW/75L3OCX6QII6xi/m1Aa39qdisuLeYnmPv
	 j5SrC2UXaswAOzxz79Ef9CMckpwPLgdZyw1vf63XYGXHAmPREqFl7ACskf+a984aPLr2N
	 iCTQTQcj2n+WV3leqp36WlALIzIb0hkcX6dvJeBco1uWBFNeS9jo3wznIe2JsIOhA9ziP
	 38QKfc67bufTeL4zs79bKK5Af3v3ldTspGYwombP4GJLBA+S/vHQT69Lnm+W3Mwt/w4Se
	 0NpDfoBgsm99p05ZfhbU88IfqBcSyvjFDmQi5ZGUsCqyKFMORrVN9KKozHO1H1R0O3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495767;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=;
	b=5SFi4RxzrTFvLw0gEqNBQeGRuZMac5KyvI7Kg7OLLxODPPh3W1iI4Vm/HVkUVCwWWtyP
	 FJPKdIXRzXjL9hulzDlbZXCn9sOaIYsLc6jXC/TjL/p0fFonNju2wgDNk0Tu3h+7O+B4C
	 jvDca1Q2Uyew1mhllqXBsctfLNK7Cqw+rUESFSy61WXd4vo/jP994w6chHcN1KJ+bLxvb
	 BkQc+CCpoDO0/VUiNQr5N4mWQmULfb/44yKe5sXxcXCrvsfzdLhqt1kgEsxeWsYwQdmCS
	 oWi9zK/xUecidNvtlGp1zkx8qFV4na56wh1p1ZEGszekgHf6Nxyxn2zcjiNxnguUXMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BL3AKPo9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422E606A31C
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B422E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=BL3AKPo9
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 14D6523185;
	Thu, 12 Nov 2026 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794495763;
	bh=0o7zFUtmx81DYiw+KDuH3A0I0uPdMX8JtapZZwc/7S4=; h=From:To:Subject;
	b=BL3AKPo9yMyryBCX5BhmzfxiCyir9kfaobAaCP6Amp0Pxm+qNowYw+erMJ/59z+O0
	 rLSkJCbNhEOm3xca0cxc70ej/O0nihAygVT1pPKS/6bJONEWEx/2zCV8XDHWXRdlxh
	 Wjz5Ocn+HyPRArQV4z0pUU4VM88tilo6FhSE8HVeMcU0R+hwfXClPqoGbwXYv88NWQ
	 x7FJaMKST0ODaKsPfklZu6E5HfagLojO+xzOwgPHJML9oDcPRnnTc/QfoN+KEMeG6z
	 BiyuLsst0dFc04/575NpLgUdEkkunEg8J14LPFRKhpMw1tAHCM/+yXmUDrXsPXcdh2
	 N1xaS1nLN54uw==
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
Subject: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI alias
Date: Thu, 12 Nov 2026 16:02:23 +0100
Message-ID: <20261112150236.164850-2-francesco@dolcini.it>
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
implemented by ecspi2 on Verdin iMX8MM.

imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
and the spidev name do not match the Verdin interface. Add a spi0
alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
the spi2 alias inherited from the SoC.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1ac9d000d415..0369803a4d46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -16,6 +16,8 @@ chosen {
 	aliases {
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
+		spi0 = &ecspi2;
+		/delete-property/ spi1;
 	};
 
 	/* Fixed clock dedicated to SPI CAN controller */
-- 
2.47.3

