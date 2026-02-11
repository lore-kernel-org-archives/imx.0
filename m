Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033631D7995
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813338; cv=pass; b=Hbcm3CBjDDoOsJ7S7rHol9dv5hacCAn7dmH4V5eWcTwNbbwSvGLGQgDrsgAWduokw9lNaRBojceue3C3GWOkN00OETAglzPvT3M1NGSSmQZR/KMWkXKvn1dZPlCVNyjkDvln7Yl1kBVooZWzaOFKg+3cImQZjBq1RcOY8ac9KtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813338; c=relaxed/simple;
	bh=DDxMMwSEPx4y7ICS/1B6rQvV6CMJXqzIvms5szSqGy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwil6Bh/T0LqTOQF+DEt16Nr3HD1Wgo9aLQvvwjDwVDoLxTzsBaTiYr4aQICXKKxDgkywm6eqnA65vU8g2XEMn5QRYnc/RjbjpWTmqZYP2fbS4SEi7+JFKMDOFmswCiRAIZXyyLEwH5nwIT6ECJtt4ShuyymD2drMcp2zCEvlYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=epqiAspR; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="epqiAspR"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=p7pDwaK17CdUZh/u5Iy4Xmvwxf0XguEjLtkZgT9LWWU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813302;
 b=IJB45u6XGINIII8zFbuyJ8MALSfKF72P/YevkWioQrPa1YLEKMxyDHRc38Lnjzp+s68r0BJQ
 RZXAFb/eBu5XdhaD83G3dX3AyA9B5BjOge5L9wn4emVFQ4wHwnVvqBxcSorlag/JJCV2r7lLvYm
 /noMOw04o76gQF8QgtKXetJtQNQLZySq11WZk5x1VUNBUIpS4sdYcaH+W/2kKK9lloJbJ9Kzn+o
 FMZwvdDVHUGFjIjuQamJAHsPEFE7yGFju0SAVtM6pVBuD2KjiFVjzqEdRMCvPzZP3a3DGLxDtmJ
 pUO3dHHpNTxWf98nvtXVy9dODPMj4Hk4N1q7b8ixXZicQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813302;
 b=qrzaqjvjS4L0bbkBpyx55miavWkedGxqQ/5h4AENRflkrP3NXVVB/Jcupp8oQcq5FAxOS99N
 ztAujqzKUbBWZxEBx84rl5PPznbhdBRjS2X2ZnLohy5CWhfqwoyA4ggZgutdf+xuNjuuz0q09Qi
 FmVpy2DIX2GegHwaTsv+gWxY8JVXevszcs5LUW7R+fRuFuWJ9qP0czLjox7GU129BcRSZJOlSPi
 ejvgsEwEJwB77kz23AbGrGlxtQAn4ErV4OiGtSCpcuKWDPCAjTZ2YW7FJ5QCCnyJvD9lGWpjP+o
 CJDH90gy2r7QnWkxKwORaYFqcYgoolzKxWzHNuKcoQw7Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Wed, 11 Feb 2026 13:35:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 01C7E5A1345;
	Wed, 11 Feb 2026 13:34:44 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 2/5] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Wed, 11 Feb 2026 13:34:29 +0100
Message-ID: <20260211123436.1077513-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f9yYf1s13z2nJDK
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:445cfd46aa584c7bfd22defe62d9001c
X-cloud-security:scantime:1.964
DKIM-Signature: a=rsa-sha256;
 bh=p7pDwaK17CdUZh/u5Iy4Xmvwxf0XguEjLtkZgT9LWWU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813301; v=1;
 b=epqiAspRIkeeyqX9BpUl2K8MUTbJvcDGDq65eLZ4pr4TtmpziIhUxUf22HrndsVBrMSjYtV5
 8+SrxlQPUAlx2SV+SUcjs/l1mfNQE2HeG8Jrne57TOlJYYroD2o/FaqYNgvDczatuI59A6XLZBg
 MytR48YsJHQ+HHNyclO0FqBo6tQxDguTklUl9AiRGok30Lvmtcs4FrNaHNFZ/4Ex9RYI9+mXF16
 gTWNje9se3W8Wnegl7Df9bZC+EiuKri1VX2/KpStzeXxcfbHPadEWGolH3hmELaM83ZZxFvK2Fm
 9mHuPBMflzYzhXyEOcvXDkl7f2G2dLf3IMNQZsNJo0dtg==

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index bd6e0aa27efe9..f2c94cdb682b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -20,8 +20,9 @@ pcie0: pciea: pcie@5f000000 {
 		ranges = <0x81000000 0 0x00000000 0x4ff80000 0 0x00010000>,
 			 <0x82000000 0 0x40000000 0x40000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pciea_lpcg IMX_LPCG_CLK_6>,
-- 
2.43.0

