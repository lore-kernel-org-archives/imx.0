Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51702284898
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652324; cv=pass; b=Kb304rppSRw7ACqMED8xti+Wc7xrhSmjOD1qaojdzWbIM1ZzdyO2kXDhe4ZaeexfXMeutijTDo+r8gZr3vchiFfDsOZXUN4cN7Y+W7VvVugEQS1UIO1ELM+VfhGu2qHUJAv9EM9Jazxg4djbXGnQytdk2bIVDTSxpQ85UHiZrwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652324; c=relaxed/simple;
	bh=PUBade4Y6tGh6DaS4uF6qIDPHkZOZ0u247o+96uhv3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cO5YRQGjFPGIklBV13D8nFh1hy9PKwjWRX1dVFhAYeD1GozA4GeoHDfiAwW1F1Yg06CVlqhij7tBFutNaEPeL/4qMFbiyht+b87T9bQHByvorPPWJ+Q2y1XMvQkKiZAfKZoU9D8zh4DFzCm07pjAg5su7uB0rEW6pMptcjksu/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Iz8aARAz; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Iz8aARAz"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fZ0sxb8pwA+FQS5pilDVHb1VPzHkkV3YHeXeQ6QgCVE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770652242;
 b=WNFCELclqFKZEAaTtBP40AiU0Dq7QnpFrQGZ3dFWHnjgVfS4kg/QwQO67mnXwMh7mS8RTqZt
 9/96E5suFxKBHLlsMi92+elckDiTdJo+aQ4ZWzsB2dC0hYCHWiKAuzcJMwf6lFN04CxCkAL4T6S
 atBUwy9RBGlpooXHzx8eFG4sbkKtZIHtnnqSB3jlj6xOgLyyJcGMuz5Kk1ZGsEmEjsqcUAqgWHa
 Nn77+bLl/0dPQTfRb2wcjz6uyXlmeJh1e/EE77dVat3bdnVbVVnzJVw6BZB/w+8MfNkv2WzLOBI
 f4mCrhzAUum+50CdHT1EagPIghIheF2ZorQpnyRF17Pfw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770652242;
 b=YFbt41HxkVibeR5D/sSbIrkjn/1y+wDsCjsqCfaYnjigXDPHYsPczw+Bfqx5Oa7KmX2E0s/R
 5wNCYkHjqwcilNuLofu6cSMiEl90F/4brFeh/o+bIoGSgGOTge7FcCPueWwbD1G6sO3yvTlYaU+
 ZlxHk/r24Dr7MXyLeVZbft9uxQV7/0nLim5YJODB6RgdNvb5nhXwaZ+2SeYhNELI3bkfapl0WCY
 Gt+maaiB6Fs9onK74LG1koe1MUzlwzw4C40VKqwaqTuIVfipyjpSicaqdrmDQlKXNl0zlYfBzXF
 Ap+q6EAV4cutOhyjs6mmBsT3jaCmlCmJ3ITCSKvyYb6nQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 09 Feb 2026 16:50:42 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8DCB6CC0CC4;
	Mon,  9 Feb 2026 16:50:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
Date: Mon,  9 Feb 2026 16:50:14 +0100
Message-ID: <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f8q0Q2HBTz2nJ8q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:69b280b034afb543f25d360d41efbc2e
X-cloud-security:scantime:1.821
DKIM-Signature: a=rsa-sha256;
 bh=fZ0sxb8pwA+FQS5pilDVHb1VPzHkkV3YHeXeQ6QgCVE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770652241; v=1;
 b=Iz8aARAzZhRD49c2gS964IYGaLyusBt2LBBJaaDXO1KR5z4jjr8CBEu40l26WeX+8lbqcZyW
 40AtOOuBak7+CTrgmBjYpAzMYt563pge+D8CshEqwGVOHL6TPvCgnNnqSsCmKeBmcMHLMXZB10/
 nCI8DmhJujGaejxTSgADGnxpLvflPldtO2SS46KjdzFdMmzKElpvPsxABFmy3B9CnDtrpTiV2/l
 FR797pS60sZaE8WaAzfjIKSzgkZfIUP4EJJQ3J3rPWE2MTn/9tXitAXhczx3XHnrNnc8BrEPIB2
 7kjIb7sDJMK0xxvYx0t9ZktUtQ+U4jbRrT12XZ7pUa3Bw==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
This improves stability and detection at low temperatures under -25°C.

Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad of USDHC")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 3a23e2eb9febe..ce34a296495c4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -271,21 +271,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
 	/* enable SION for data and cmd pad due to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			/* PD | FSEL 3 | DSE X5 */
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
+			/* PD | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
 			/* HYS | FSEL 0 | no drive */
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
-			/* HYS | FSEL 3 | X5 */
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
-			/* HYS | FSEL 3 | X4 */
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			/* HYS | PU | FSEL 3 | DSE X4 */
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
 		>;
 	};
 
-- 
2.43.0

