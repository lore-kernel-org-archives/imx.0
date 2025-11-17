Received: from mx-relay145-hz1.antispameurope.com (mx-relay145-hz1.antispameurope.com [94.100.132.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335242550BA
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.199
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383088; cv=pass; b=mMtdFHwZUtKJUydnpaUzOlOs9wBK31lWoqhkuxzaCAPLvZUszNQb5Tg0sKaP0Ex+48mxC3AU6yo3Tbde+acgbtY6VTASLh2qbhQyMsHyjMGhZmkSCZxdm/h54fFop2VcAUG7eTUcFszHOq4TpiPPjYVJOzWhksxIiFvDV5z1cgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383088; c=relaxed/simple;
	bh=OreMUx8tsLMnCWCJGptvTAVbbagI5B6MtaZEHvHhcJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRuSNgn0xzZdc20BrHGzuW7CPQ4XXAFy+vQGI/L1OhgH8Y3nHSgJmqclJIfBHt+SDBRkYksOZIFRot3XqG84iqpwKQQgLWnc/UWqjIkqhAvojEA5ojtRcAbIIX3S180WN9Fh6gv2vMSrrDB8a4tZCCDinrm/o+Z1vZcAYKrMBE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nwShOwcw; arc=pass smtp.client-ip=94.100.132.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nwShOwcw"
ARC-Authentication-Results: i=1; mx-gate145-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5OLdSYVCdTLS2HuLb5QQT3DyBBHRkyJ4iL6VN6xx+YE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383022;
 b=VZ9PyaqSNG8Nh4WJLqHaM3/DTK0saSAVI6jXajZRH4ycACAQYEI8eCVQBwTAnO2lGhGieyyA
 Ls1ze07n1M1Mp808ySC50h1C7KahCg3mL3eTaO/HYBJKGhe/EoGeejEU3odmJriQjSLaVlje64K
 /fiABEBnNYbbdG5az4FMSArluh3OM4Tq73wkaaQZFVsAvnsXc4HJBTvD0010l4gMzlMgpSg5dlH
 evC8uyDxaZgmPKtdbA/+MFdBKJgMKPrGdu9pFHu0bqwvrnjA2Vw1QxaC9bAKsdLFu6cm6pOVIKl
 ywvDT0VYWGrSRw2QlHNvDoQd093Fvd3iN9b4Itc5wkyTw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383022;
 b=GkfZOYhjnRkRY/v1UXOrYQigW+cW2zLexYOadovmwm1o93mzzee+F16C39re14mT2DjdIqIi
 jsgsK0nlqpYSsvUbAw92RYeTmr0AW0H9CL10XkEDXyvDfC/IcTHz+8pfbHmRt7eC08/2wA8ppG+
 jdFZwcAMfTffnkXwmENmGpnKR+SGVLYB2W72IgG06sSomdHsi+MbOci7v5+bc5ul4HdPJ2vCq3X
 UxFeqZzcDDCs/9Gh7N9c0E4QR3jdOIag3pjQ5gNxe3Oh4Gl1GQJnP9i+H03+6Zp/8WpErtEm1uA
 llBK53WHUmpM5IGeJpKM6i4WDl/C58s0AyimbhpymAnuA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay145-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5E984CC0E8C;
	Mon, 17 Nov 2025 13:36:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
Date: Mon, 17 Nov 2025 13:36:29 +0100
Message-ID: <20251117123643.711968-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay145-hz1.antispameurope.com with 4d96gm0GPmz22k9c
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:9fb16085ca7376dc03f1681f369c23cf
X-cloud-security:scantime:1.993
DKIM-Signature: a=rsa-sha256;
 bh=5OLdSYVCdTLS2HuLb5QQT3DyBBHRkyJ4iL6VN6xx+YE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383022; v=1;
 b=nwShOwcw1Y339McDW7G5URj75VoGX1onrdP76+RdwdJceiSmhq3JHFyq5hTcXFX+iUUv2IGa
 Vw2S47fDW7t1d38vdZmPpj2dSphFuRAz/Q2Shvijn1Vehl+zvcXU3BiytcDj7ytb0ET/hm0HwW6
 YIOflbc4ZRPsHHMpsiuexYNExocUMaYNk0KsoDUVZRYQ4I+3ISIRDEvwBlntmhU5xdDULG6wKwS
 bFlqSSEQxKytnLSs++OL8CiEBTWdEKMTDqIPF32z9QB+vLo2KEwfuk2RxR/hjmM5eXKU4MqdafF
 oqewQaWtTf9DgCgB+2QMdaGQAChaCxYT1MwkwRFcMHoDg==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 0605cf2faf83b..ff2bacf24bfd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -345,7 +345,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -375,7 +375,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.43.0

