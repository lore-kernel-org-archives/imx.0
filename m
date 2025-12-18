Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B7352F98
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071319; cv=pass; b=JBsviNBV4JjCOqeee49gsB5eCJa/CnOKMJaJqZ36sw7WpQ535e+Xu4syDqbCJeMwZb6ooojxalLT/WJIFgKpLpmM3OqfaT4VJQieBLjTICsoSLmZn1meKU7WLZD7rhPm2WObRJZ56LY9Dxriyn6E72O3FxQ26Kw599C01GfpR4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071319; c=relaxed/simple;
	bh=6cFJMMBpfqYHtmXLgEpDrCdBFuoUEsV5n0RZlhvD924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bB2SuqqYhfSe1PVFu/Ub/tv4oq9II/zwAeZzAJqlQ+phy2suSZmbNDwjna/d6Jcixv9ho1+c9Sdow+lmMs/cNCTXuzCdlsEELowlM20FHbLmQRrcZCSBUwxlEiUQetXXj+2SmPpDU6xVNk9+gQ6d2NJVa6JvQ2V2Ga7osuNPA+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MFsOegMh; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MFsOegMh"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071283;
 b=hXLXZhEW32i8NxQpE+ZEo/W3wmNl575IgTa8K0hQIvdjL/8PkpWDuZmQ1nmY6lsaUdhtFVkA
 MLv1GC7WtM1NnoxMiIajbuK4F9qswAhKmEvTJy9++cQmXU31d94N01ANSuywYIdX/o6JKkqvj57
 05I+RtMY0jYd3OGNTQt+ddkQJ6sPXoDDiCmO1loFJE+mWlksVV1n8IYvT8LK4H0rDz+yvtW4XPs
 DGHGuJzvt9cddZ78FlD7ugM8SsMLshuPBEvkUa8w7zYMqtZE31ncdaZVTdI7eEI0ghdcLr4REOP
 tWVhJEuAybo30ph+Hum+li+cd6zArlvcNKyvWU3pTwF8w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071283;
 b=QgZEC7u+YwbjWUFvbLJJxJXvgNu8kDR/obo5Xh7+SM2QjWYhz2715zY1X9rPY8Onn1L9a+RZ
 igh8tavevH5+wHrtp2BGW4PVWvSOT8Pv5cXxpVBXFFVhhNU5dfXSR9t9oDpwU2KKWgsEP0RgTRu
 JGXNOK5xT8/Y5NkKHOs8ukskJ2RNfg2RVxeIiNm9gpj01Eyncuo1C5xg55ER7a1ZbWM79JGKRfa
 DxZY2rYB2reeoWED6adRc19QKZ3u5mf5crD+IaJaEJyKh8NgCV7s1IYMjjHtJlE7JlilSRyqnSk
 H2VEwagdr9fdrmhKxewumFH0WOo21v0vfIjmqgcClMM4g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:22 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DC1C2CC0D53;
	Thu, 18 Dec 2025 16:21:08 +0100 (CET)
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
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/6] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Date: Thu, 18 Dec 2025 16:20:50 +0100
Message-ID: <20251218152058.1521806-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDs20KQZz3yY5w
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:af1e11a75574753d5df662a88887dfc6
X-cloud-security:scantime:1.983
DKIM-Signature: a=rsa-sha256;
 bh=718S0BdFz8xiVCzU8aXFCL2DNXNEbKnbIjEDDeQ51yA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071282; v=1;
 b=MFsOegMhCY5BqqFJbQQ8CzcYvtuIfD8fdyPTTebFFuNpU8jsu8PoWFUEn/holMf9P94lu01B
 mzhMuW2fvOQxy3Z2vaAxusXXrVn8Au1ofgvBQxs8Evix46XsfitXZ5JrKNeX5BWCHMtjHYj7dIk
 c8WhT8v+N7JnNVuSzVWZGfZUKfMYwl9LXrjo7QO7mmcfLAnY4Hpr4v0YdID+YPIrz/fkkPC4m2+
 P2VkkuDEUvMAscee5Y9iD6IWjflvVZFyWXFtk09ZofRnyPVrByexv4d//B2gNrvE4NxFmNFBMar
 FPN6XnAEMuNDcV7xlgZHMcN7s/b2t4WgU7mDJo+IRzINQ==

IRQ mapping is already present. Add the missing DMA interrupt. This is
similar to commit 0b4c46f9ad79c ("arm64: dts: imx8qm-ss-hsio: Wire up
DMA IRQ for PCIe")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
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

