Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798323E1CE6;
	Wed, 11 Mar 2026 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242576; cv=none; b=k+FC0St5JCEFgfN/LHDu1XiOEvGNRTvchrQrecUqQi+b2yDfcDeseKMtlcRlZtoyULB1qGHlK/cSbH0zjOWqZxFanvLhH9P1fQxzzlHdKwxhXoLhc5A5djYY5fTF5tukegAfbGnGYz45LVA9qtLxxOABRvFYgt8p/OQ2gL2CXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242576; c=relaxed/simple;
	bh=tcafdxy+zY0tElRCt9gfbvIai4s1Qh9WzziF/i/uUJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqSBqIz1JgTx4zJ4xe7rLICdskoiszliev0R72lgMwmiCgbsMwve/W28CykehZJkd7Lh8I+06l+X2CYm5ZamhFmckYuS+ve/vNxXr1Xzh/UBssEf0TSg63IV8BDePdwgrL3oXX+tCXcq44sldBTltGzndGwTrqjnJZIUDjqbJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZEylRor2; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZEylRor2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JLc+yx65hX66ugvu+hwobBKk69k+gvZreIh9KT+TjNY=; b=ZEylRor28NRDqzNhEbdQTGS3/k
	hILsNOBiNdiszXNLTrOV4H4o78LIe19POYzO8gpQWvzDEOwqcKc3LllSLtlnmv+rX2Bi9I0ARvKoM
	7sXcTsgnxlcqfNYlo3XH4nuRSerWi1Tqh6DTKPr36OohFHiraLs8lvyrRhirLAtb7FslpZ0CeRbKd
	sKCJn/3jVCaS6Uy7GBtsPXjHrZybSyynROabTr21Wd86PEuf46v5FwlzXc0yeuzEjwb0bAOh2ehR8
	ZBOcTgyM8NHKj4LcuqRryfDs/WU3tSryx3liqs35KsSMmcUulAvDiHfsU0uPeJZuNAlk81xWTzet6
	wy33Kk2w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvF-0002IJ-1j;
	Wed, 11 Mar 2026 15:52:29 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KvF-0005cY-0A;
	Wed, 11 Mar 2026 15:52:29 +0100
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
Subject: [PATCH 2/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-tm070jvhg33: Remove compatible from overlay
Date: Wed, 11 Mar 2026 15:52:16 +0100
Message-ID: <20260311145222.1749655-2-alexander.stein@ew.tq-group.com>
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
 .../imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
index ea44d605342ba..f6aaad91d7f8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -8,10 +8,6 @@
 /dts-v1/;
 /plugin/;
 
-&{/} {
-	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0

