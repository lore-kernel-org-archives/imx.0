Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA553DFC98;
	Wed, 11 Mar 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242601; cv=none; b=nvF4OoYY+CPA/naNXphziElDqn6lnHqc7R5kNDixiiyrmEOxSX2jdrI0H8eRNdIS/l4qSo6qk4wHDyPWRXODgIhuEJJGvaa03YfDHm1i9qCAAxlEOYgVasNaFsEUm/dXDMSZgTt+vv/E1JoqDVidJ49G2B/SDmot/0u+Hof648s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242601; c=relaxed/simple;
	bh=7ASfkemfYL7mcvkVMnRR/0Wsjp8kvdVk8EkTaKrKM0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7pUlwOeS+lexbd7fAdy/0+J37HqB+U/Y73R+MwgyIWi9hgs1Ts0ANEbu388TADJOUmq5KT/i3SIxGnulfnBagn+XOmJmyjQ4Q2fjXBjPJBkfb2ycE8GC8k2utG5aMVHlhbDliyE1Rp9mVFFAZ+ga+5lRNr+kQSiUN0HJAeWCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OOUZLShQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OOUZLShQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DyxOCOREEZhu7FyrjZh7UOjZ2zrzUppYbjhxwg2uC4A=; b=OOUZLShQupzj3Rm6TleGsZH/nl
	nojdNYfIeBIRucvA0kRqCcenpuUv0Y4Ts+Ek5ZnUgXkSS15ywnAgzsY4s8n6TkwnqYi173aQ8l7Jg
	rrU+fKW5paypK/NgUZjjP0DZFEpG2g6ge4ph6TdN79LDQrzWEO7SiGSJiJGUWtY6IRGiJYj2zjbPI
	pbjLuZid3wU13QH8gAOyUBUZ9ZQpNtpUD9fWupZLMH3jvGMdobg6mfJpitA8Q8u12cNyz4+AP2Wac
	IeVvvgGU1WFenwDkvRHLJ4BLR+Pf3n6CqxiglJ+VbPQ74a96BTFQ4r/WFsnqWa5/bJZ+q2RM33HN7
	xpv29Faw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvI-0002JS-09;
	Wed, 11 Mar 2026 15:52:32 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvH-0005cY-1i;
	Wed, 11 Mar 2026 15:52:31 +0100
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
Subject: [PATCH 5/5] arm64: dts: imx8mm-tqma8mqml-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Wed, 11 Mar 2026 15:52:19 +0100
Message-ID: <20260311145222.1749655-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

There is no reason to override the board compatible in a an overlay,
remove it. While at it, update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
index e44249c6d8a09..e5425653ea7ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	compatible = "tq,imx8mm-tqma8mqml-mba8mx", "tq,imx8mm-tqma8mqml", "fsl,imx8mm";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0

