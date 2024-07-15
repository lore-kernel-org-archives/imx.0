Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078711862A9
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721035965; cv=none; b=SAiPpS/qCDxGa3gxCSdRzj0WNau8MxKgVp+eLFqwROo+0qKcidC2WYGLFsgIVSmIOinoZnUyjf2iK+057PhoNFjs9OuqcYmjsqgBdqOcl+C7bu4CFdoZVRcoT4f94Tx7UHuE1o+N+zRpQH84A5JykgXjz4JbsF3zMbSA36P4LYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721035965; c=relaxed/simple;
	bh=nF58nNpcP69FIQX6pM1PBMKc8yOboRA2aAonnFFtDm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IGd7Pyr6ML7xIrkdXD2N9pB7JV5aH86eg8+li8F3katf6TWim5M2KMo7SLqx+wbzhYe4B4Q7pPT/fx22ZOQzxzdCv5U5H2wde7hRX6fjmjlQzOH422ruGELiAXRsYDsPb+Vze6xnFxynCs1gfqzwzdOly5qK/bhJ3CFIf8lgNe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sTI4V-0004SQ-KL; Mon, 15 Jul 2024 11:32:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sTI4U-009fj8-Ri; Mon, 15 Jul 2024 11:32:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sTI4U-007Uh6-2M;
	Mon, 15 Jul 2024 11:32:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux@ew.tq-group.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2] arm64: dts: freescale: tqma9352: Fix watchdog reset
Date: Mon, 15 Jul 2024 11:32:31 +0200
Message-Id: <20240715093231.1786257-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On the tqma9352 the board is reset through an external PMIC, so
set the fsl,ext-reset-output property to enable triggering the
output pin on a watchdog trigger.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

---
Changes since v1:
- Move status property to the end of the node
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 9d2328c185c90..2843cff669c57 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -150,6 +150,7 @@ &usdhc1 {
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
-- 
2.39.2

