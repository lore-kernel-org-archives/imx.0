Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14622B5A3
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305979; cv=none; b=N+a5M4UBPPJntkIr1rZ/uprumaRE1TzvKh59ckI1Z69s7euuFraYN703sKfTM6S4RrSCbsTY03fNSsvuyEpSn89sMCJgPaqEL9kp+HfSPHNgdJIqrKnW20xR/KTDTx8nvtZxKVjz0Bh4Ra8RGoSnwaSYyW6ixbZb/u6BK5gB1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305979; c=relaxed/simple;
	bh=4NejS/YFsqMdyl6br68502mPfPaLMjz4bZByJd90VT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o0YDl7C4M9d78keAfiZIagvEoc3lKf2SW73uIVQMg0YTCpuLvN27rT1ZUNlQ8/WBYkau4TUnxsdTef3YeGw3fzmQh8apy9aWv/+SGKqQYbg/VM5FjgXMnwU91LIsU4udLVYRKIQaiUj60HRrq621bA00Eb+xMFKH3tQpZrtCHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-0002Zv-NA; Tue, 22 Apr 2025 09:12:40 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-001Va5-1K;
	Tue, 22 Apr 2025 09:12:40 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u77o8-000iPF-16;
	Tue, 22 Apr 2025 09:12:40 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 22 Apr 2025 09:12:35 +0200
Subject: [PATCH] arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive
 mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAGJBB2gC/x2MywqAIBAAfyX2nKCL0uNXooPVVgupoRBC+O9Jp
 2EOMy8kikwJxuaFSA8nDr6KahtYT+sPErxVB5RopEYU7HLvhA+Ovb0qV9GT2hYjcTCdhtrdkXb
 O/3OaS/kAzJCKomMAAAA=
X-Change-ID: 20250422-imx8m-nominal-noc-8e1db5029574
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

When running in nominal drive mode, the maximum allowed frequency for
the NoC is 800MHz, but the OPP table for the i.MX8MP interconnect device
listed the 1GHz operating point for the NoC, regardless of the active
mode.

The newly introduced imx8mp-nominal.dtsi header reconfigures the clock
controller to observe nominal drive mode limits, so have it modify the
maximum NoC OPP as well.

Fixes: 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive mode DTSI")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Support for &{label/node} syntax was first vendored into Linux with
v6.2. It's useful here to avoid one-off labels while still ensuring
that a compile error results when the original node disappears.
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index a1b75c9068b288a2fba73bbd96b1519a50df85a3..115a6da08643bc1b23731c146df9c9dc36b4e85c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -62,3 +62,5 @@ &media_blk_ctrl {
 			       <0>, <0>, <400000000>,
 			       <1039500000>;
 };
+
+/delete-node/ &{noc_opp_table/opp-1000000000};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57eef9489645f498a89f4bd8f3388d5..7c1c87eab54cc632643f206bd80ce7b7b49505de 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1645,6 +1645,12 @@ opp-200000000 {
 					opp-hz = /bits/ 64 <200000000>;
 				};
 
+				/* Nominal drive mode maximum */
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+				};
+
+				/* Overdrive mode maximum */
 				opp-1000000000 {
 					opp-hz = /bits/ 64 <1000000000>;
 				};

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250422-imx8m-nominal-noc-8e1db5029574

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

