Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB3C2B9B7
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729162; cv=pass; b=nwrTpdFup5iE0FJ7Kj7IA15OEBwKr3XjdAeQUrbhqNGJFu8LuLbntLlTKmgJR31HG3TwZeteR6kvXHE7/Xe4kRE9OlVYT3RZtMswWFRLKMqb7D7/9s3/QDRHz1SS8xm/i3Gj+P5nWLBVTmljWZicjDX8ORuQT1TOccOEOD/WuNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729162; c=relaxed/simple;
	bh=E/ka3vjU+IKesjtIRgb0bA13iKRANnz0jbGWGiHx3FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKlU2CyGe/LPePyQ5ZVm7w+O5Kk5nmybPb1bAfQ00I2LYh5NjWINMgobL1nxqr7JcLkYHu+MJhnBSQN0VC4FVcbgH/GlcQPu9NV1pjIUVRy90aHiRgL+8kQzXs7lYBbDZxsYTAkzrf+W375QBtiebLcQRpan2lSxQeGF090W15w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CVQDzXcW; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CVQDzXcW"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qunvVZbr1OHnsRzMMjCCaBPW/FI5Phh9yb4tEKcRPz0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772729146;
 b=NTikBilsgH9iMscGbuU1B7xvIPbm2ptNvD5VSDucn3P1gCLxqeq0PNl6+AxPN7TnkR1Q/9NH
 Q2M/Hr+3usozldD3d1B7aec/Wy9UycyQ2rjghhxZrdSTrIii++sw6qWRwkk5SjXUy+WFQr4i0+f
 rNmMy6UgbfmPOoJbGordzdzIkEpMIAQNQ6hT3odvE2I9aMFOk+BatQrgfT6HF2HKcaG6Y8sA/Se
 D28jzd/69JZs4AmBiHhOdvRs1zr/4AHwPeZBrbUXU8haU1lOkLjIwVLKYS+Cr8PzCBHlFyv7I7A
 UAfuEJ++MvrL4qd2cxi04Po0VbO+eyrVfoU9B6i162QqA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772729146;
 b=M2d8DRCgJ6H3N6Lpkt5p0DZAWqb365oh/5FE0x6sYBJzQDSdpTGrtM6S3ghy0HwO/cMFOYqC
 CSZK16chThGnGt2IeuLv9CJlazCy0banfEyone/ueFKTxeysXiTViBUAK3UwARttGsRIhi3KmEB
 bqn7tqFxuY3FsUwjYil9UKFNVZz6MhCjAOfuND44I/nxN/y5g/jQXtlp60bLtqWQydCdpevvUY1
 5/4b6/Zyj0/5FbIWgfgG423Ebk4/qp5JtWGZ8vD/cXO6TnhUV1j3PB0jfamCvouQubGS0nsRECA
 M1btV3pGkav9eDHOmrqYc1U115VfFpbUZxkQ4t9bud3uA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:45:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C2B32A4079E;
	Thu,  5 Mar 2026 17:45:36 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: tqma9352-mba93xx*: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
Date: Thu,  5 Mar 2026 17:45:33 +0100
Message-ID: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fRb4x3bcbz2nG15
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:3cacf677540cba967126d9265231a74c
X-cloud-security:scantime:1.596
DKIM-Signature: a=rsa-sha256;
 bh=qunvVZbr1OHnsRzMMjCCaBPW/FI5Phh9yb4tEKcRPz0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772729145; v=1;
 b=CVQDzXcWt4Kc1l+FPrgcFbJfId0lnisGA34vCbuSDlmKo9ddkoHUhzFB1Esrrt04HCjefmgc
 HqIFSV8oakSata5PJxWcJUnMjVaNSv+Zm4OPwv8Oo2k+2VT0xEH1nNqIC/W83Wk7wMEuou6XIFJ
 XIauAczMtt0r5IyxGuZ2wjE5eqpqjCATYgBWuuAwQM8mkUbGnWuAd+8HaCLCMx0wYKUrN5sGc8J
 ceDKZfQM0UAiGwod2GcpO9oEKsGAb4H0GuYDGgPSKOvA5+B+OFqYYoOMGo8zZsqDY631okEtc0d
 mihvZKkivh5Pcn1dRTFaUsKb2T6UvVzNeWaHAV8WpbDHA==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Adjusted the subject

 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 4760d07ea24b5..9108181e6592b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -242,7 +242,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -275,7 +275,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 8a88c98ac05a7..a78bbc46c59b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -172,7 +172,7 @@ ethphy_eqos: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_eqos_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
@@ -205,7 +205,7 @@ ethphy_fec: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_fec_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
-- 
2.43.0

