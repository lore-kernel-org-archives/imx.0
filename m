Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BB33D6EF;
	Fri, 13 Mar 2026 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385357; cv=none; b=s3RVOcFqVBfigtR6M3mfFCWcaOjWKdpOpWQ+Z96bSAjCnC5sHtahdKre0qnqY4bSf5OAyzNO/11GuJxMxtD1A+5v+31K2gkCcGMsJbOYPgkamerKyVrno0eqnOAqky527Rkz8MDANm7c5V1GSLPjVyDl0wXRUqoZHYaborAle6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385357; c=relaxed/simple;
	bh=2ICKoaSt64e+DZYeIIt+Qj0kYCA+zpWycDN7q5JSHPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Db3cycwtHCB4uYpT/F4pGBIibar/03prgmIpT/rcp9tzcurranhueJc7E2I7+zKYoIlJjD2+4TF5LMt8BygNUmsenRHI8o6w3epd/2+dMHCGFNmG0NbUBP32eVNowpR2Chlw2NjpRZ8jn3TFFMxrM1SVzYU/flztFmbHqPbIQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Wzsa58Ce; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Wzsa58Ce"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tGiEKHvG0g+JUevNm144GYTeOt4tfkfBWS8EbLISuQs=; b=Wzsa58Ce4qlLYJzvuUqM0NhVZV
	qw+otAaDsVs2CC98o/wa7TmwRmr4bZhFvwHiU5vBiwGvE8amYSYY4VosNRkCXO2I3UrBWUslQNLVz
	VhJnuFehUbGOMhrT8/rH4/dTYWLoM3S3ChjWdpQti77QgO5vnMKF2nNptE9VSVnERT7ivbPPbRVPd
	P4mLIa+P0KjoCgx3MWHwsoo5YWkBuh/mV6kCbWY6KNYyuM4iYe/Iy8rmCpJRJ4yBxy9sRhGwfyykU
	Ax9Gs+wmO6sb+VbfY2O2wSWG5CapvLfeibtVYmcAz98/uzTgqbND8oOF5St+RNTWZX2+h1eT3C0pJ
	EZaZnYQg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXa-000BWa-1B;
	Fri, 13 Mar 2026 08:02:34 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXZ-0005Xv-2j;
	Fri, 13 Mar 2026 08:02:33 +0100
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
Subject: [PATCH v2 3/5] arm64: dts: imx8mq-tqma8mq-mba8mx-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:22 +0100
Message-ID: <20260313070226.579939-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
index 306977d6ba0cb..78f24f72cc690 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2019-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2019-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	compatible = "tq,imx8mq-tqma8mq-mba8mx", "tq,imx8mq-tqma8mq", "fsl,imx8mq";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0

