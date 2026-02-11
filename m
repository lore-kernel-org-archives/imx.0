Received: from mx-relay24-hz1.antispameurope.com (mx-relay24-hz1.antispameurope.com [94.100.132.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FB32E745
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.224
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813786; cv=pass; b=dSykq2Uopz+E3VV1gZQO5z5OXwr2s7pW2MO4qxFck5V8gvPT8gd6TpPVOVb2SQFELsdQbvm4/L7GRYps51Hv1VpgGpa/IaaHHHSW+Oumynw8tDnq/NULb8pwxqIyK9bn5Z23rcpkNX+Sx6H4vb9EJKNDSXTl6wb7+hE8CVw3Nc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813786; c=relaxed/simple;
	bh=mYfcH9xWbwIpe8Jl7XbgaXGWWaW7rRpZQJHPj+tY8U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckNtIcRg4AMVjlT0Ra6xqctVJ2iILtx5S0UQQtnfobLMYME0TO4xR70IrGpLin/1O15dHgBY0RtXlsFl9+et6Y9BBE0NmoxzEUu1dygDWoRF5aJzo+2Lvn8tRpZpb2ti+wRHH7bMb135B676L3mehKGADl9U5DKldeqE03RzhWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Spm2/vkS; arc=pass smtp.client-ip=94.100.132.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Spm2/vkS"
ARC-Authentication-Results: i=1; mx-gate24-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813735;
 b=R0LVouqQx6z5/SD0AROKkdg7nC1mQEVVatC5LPfNZBiNfF5kJ6ryEKikuGZsyz0ELhucpFJ6
 Zey4UADNaB5knh5KDTuvhyi5vqvZwEPdAQq73hqtSiUetCvM8x/zQfyPJytAEqmmoCNwjjNx+lZ
 l/dU8CcNp0xQ9rXCV/D9nAeUh/AhH35Q0w8dO0E5QAXHK2w0vuIBXU0olv/cZlvQebvuFf/Gs56
 AjiNYg7lMQUsZLk1WExsshwGK027cXJCfZpgW5E4D3CoTyr/PC5IaESVmlyVvK5crztZmMvmOyA
 Os7ZGllEgn4q7xaQxJ1jRAXrsKqmsO4QfcG4aIRlCjH4Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813735;
 b=UBjRxZGeGRbwQ8RLrL17iPC3pODdwAgF85pyGznPawmO2VYgQlUX7FJwEm4peMgwiGmL61aM
 knqzQLJBa/Evq20ersSeOBK0Pw2PqyrE/rQaO8yyT/BhHSrgdIK2FO+luMzyvSyO2qSLAiyzbmq
 fGTOLzMbWsxdBj9Q8ybWrQrr3FGTM+G1d2jotx8dnrfubiN9JhwCX1QZ4nxPzjqU5fjaWHZ+mqz
 jtxFBAeculyNrx6jFuduKdkPM/Ot9mgGyCu+AlDonOknFO3WXxUaKvTObMJq7on0bx7nynNyQE4
 BTJX/qTwgGhK1ajksKro2k6nQbKX1sVqL7ugQJ2s5kGAQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay24-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:42:14 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 940A1220535;
	Wed, 11 Feb 2026 13:41:56 +0100 (CET)
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
Subject: [PATCH v2 5/5] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
Date: Wed, 11 Feb 2026 13:41:53 +0100
Message-ID: <20260211124154.1080135-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay24-hz1.antispameurope.com with 4f9yjx5Qnhz2ff2J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ebb129c93538d71a139afec21e2b08e4
X-cloud-security:scantime:1.798
DKIM-Signature: a=rsa-sha256;
 bh=6py1FlyDVN3cYWCSXt10KIIllpLulnoSlCJdgJBjOeY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813734; v=1;
 b=Spm2/vkS1dmKmuWe39Ic1T53MskFZKodx0umVjyT9vRrgH66pcZPohfgNljZF85Rls1dgurZ
 L50y7Q9sJgbGp0HSRGysXAAzQ9Ir1ldjAI6uFSPA7nvLwcX2LA7/3pSfT3//yNo+scJzET6yqVk
 FBE6w0WLxvrsAsZ5dk5f4hj/NtoEh6DxbPV4v8rfCHANvw9eNXWqTuSq/yKFXvnWUbnObFntfja
 /hZVvCAX53Pi5pw2v6Dcy6HukI7z476xYNjQcDO92kboW9Z5Eun2KRCPm9l1PAwGEgzCMDH9j9t
 XFqaZI25uj+xH9qVNy4+bSzw32LuudglQfr6pxw5hRTKw==

Due to missing workaround for "ERR050104: Arm/A53: Cache coherency issue"
disable the whole Cortex-A72 cluster.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 -------------------
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 13 +++++--
 2 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ce5a4657c4230..25274cc76fc56 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -297,45 +297,6 @@ map3 {
 				};
 			};
 		};
-
-		cpu1-thermal {
-			trips {
-				soc_active1_0: trip-active0 {
-					temperature = <40000>;
-					hysteresis = <5000>;
-					type = "active";
-				};
-
-				soc_active1_1: trip-active1 {
-					temperature = <48000>;
-					hysteresis = <3000>;
-					type = "active";
-				};
-
-				soc_active1_2: trip-active2 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "active";
-				};
-			};
-
-			cooling-maps {
-				map1 {
-					trip = <&soc_active1_0>;
-					cooling-device = <&fan0 1 1>;
-				};
-
-				map2 {
-					trip = <&soc_active1_1>;
-					cooling-device = <&fan0 2 2>;
-				};
-
-				map3 {
-					trip = <&soc_active1_2>;
-					cooling-device = <&fan0 3 3>;
-				};
-			};
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index d94605c999915..f0e398eb2aad7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -15,6 +15,13 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
+	/* Due to missing workaround for ERR050104 */
+	cpus {
+		/delete-node/ cpu-map;
+		/delete-node/ cpu@100;
+		/delete-node/ cpu@101;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/*
@@ -174,6 +181,8 @@ &mu2_m0 {
 };
 
 &thermal_zones {
+	/delete-node/ cpu1-thermal;
+
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -199,9 +208,7 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};
-- 
2.43.0

