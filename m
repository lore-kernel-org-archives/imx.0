Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D02FC896
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109643; cv=pass; b=rhIyTK2ghUBKtWj1Cr08ftDkQjDvU9IXQg/vAZ38Wq+1Ymtrlg6ebW6PCWXCakvPir94LJytuTUqrCHNY2sK5O0Gq1+h44fZZ0DzXA2/66x9Ln0GMSD+xa3BhYVUPt4CTt/Z3MeL0Lxg5f4nYfNtLll6PnzzvV0IH7DNnnUNp1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109643; c=relaxed/simple;
	bh=Ra/5m92uB7SXw4M21jf1shKnl80L1lF9SDNcGq+iH6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SjHC3+WvIh4UWPfNej3b0OktXsJ6/9O35R3vNkm2WRfG4QnV9TfYwwMnHetTzNu2VLD2zUNJjH+to6G4j1wA4A1ngFU29qk0+82SU0uDW1RmujeK75JAaVaNY/dfp/hdKSchay/DPxV0oiBUUjJlHmeeB3Pzcv4tM6ZK+jcQ3O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jwGBaDU1; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jwGBaDU1"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wFG888Gb9Ru3OuBdwJfnSjD0IrRTCToX06LrZpem+M0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763109623;
 b=fSFwH8OwZ/93AZbRhelkecXcLz8Oi2x1vh0ugH8Le+3Nl1UH7VxPJS4BZ1oOcn+6sgbWVNGa
 L272F0bbury/j0oqJTA7RqEMytdCJhlSwDMgaia/AQmeD6Th+jHNqmVcTWZSW6PQBkJvLsQdgZQ
 FZddqvoljzTiw9zQk6DeerhcjQvmB50adMHVgJ4I/NvNrr2AWZnjHBF/9E98vOf1ZebgrMnLQgL
 uq2N8MNeeslPz4pRAUhAYhiUQR6w/Z+zbrEkulBcVf3X2ODJWps/e24OOd+LsuRPm7TIetW+Wwn
 C6K+RLSrCnjXLSPxOFSLFTge0lYLs5BmOUqOgxgkBuiIA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763109623;
 b=WlCLPjRyjZzbhtwpwsfTwfkiBhPzgk7Bc45snsNbN+S2yQ4j/Fq68pZVZP3aP66s3Nw+BGDX
 9GQGoiqzLDbsxCLXrlglEW2b1nKBerjh+tA1+E1HjKgLAZWJcPlYd+GNBgO43+HO/5QRAe4DEOG
 jVjXKHD12XKsZWQasgI0dGgJ00B8+K9TtVuiOtQb4/2U5hN3aeD3ZX6Wowm80XCj2NXFrUZ+kfW
 PKpR8RFb4pDYa1a/fovXpu1Dt5E0OAdTlVjPSpgegIEnIjZjhJMzGhmDEP2/n/njNQr9znLMAQP
 VZkfduEuzOT3WkdCgpjhITX6K4f6kqkQGpflMZF3fvjGw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 14 Nov 2025 09:40:23 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B0F20220D04;
	Fri, 14 Nov 2025 09:40:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: freescale: tqma9352: Add vcc-supply for spi-nor
Date: Fri, 14 Nov 2025 09:39:58 +0100
Message-ID: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d79Z33Zbfz4MQ5P
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3960ebd3158cf10cca87d14920876d23
X-cloud-security:scantime:2.484
DKIM-Signature: a=rsa-sha256;
 bh=wFG888Gb9Ru3OuBdwJfnSjD0IrRTCToX06LrZpem+M0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763109622; v=1;
 b=jwGBaDU1SxbMwcllHlqKYq6RilF/YpdpEEn/I9GV3VcKWn/LNRggfcAIoJOB/SEk31est+dY
 g7I9lqygVu7CFZsihSuSGV8jC6clXbCgUNEL8JONaWPecPZF5Hwjfj/pnShpqDUhr6G6I3/hbRl
 d/0/l9BXjyBU7HXg9Sc4DwLYpvvm9paI/Q5FPROhqnFGXQ0SikYzIyjSRXdJf+aEMPr2ZCEX2Ss
 u3M21/n7dXNeSSoIk1YTRLlin86e1VIj0eMkJKBPnkh40iVaGHWC+Zlmlx9WMUyrV7w66ccJ071
 I9EI0hZSsFhiA04K5FsYx6hoBu6QWMAyev1sOF9mxYv8g==

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 82914ca148d3a..3a23e2eb9febe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -67,6 +67,7 @@ flash0: flash@0 {
 		spi-max-frequency = <62000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.43.0

