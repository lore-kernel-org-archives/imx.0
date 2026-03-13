Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833872F12CE;
	Fri, 13 Mar 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385357; cv=none; b=kS79NqRL+HUIvIMQ135LUFU6sHzY01qhR43HSPePJeV63/fYzOKnMVtgVGiv9ER8hMLzg151fnTrpS0D3EwYLzlOy5k+XGqc9kYBnMrZkh2Im24QsZaNw1mmFkFSNkZH2JnTZyJcz0a9bAWyGfA+sRwOksAf3dLUwqpZNorSKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385357; c=relaxed/simple;
	bh=emtSXSS8wTAF0iWkEm+INSSXBpl/6lEW8FyKT/m4fKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYuCOjpmG9FYKZJNCM7ApUTzUsJVIA6e7YCe5Qilo9KAyUQsq24CURjoSELv/RYmPTqywM67ndtbmo5udIjef4L6mafpCvvDO7eLQFtarCj20EaznzVAMQgEVm7Mi2XdDXWD9LB3umspCFDiaZj2NwQVz3T2iqy0IOIpwYEffvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P8m9nR9I; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P8m9nR9I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RfLTpuDy1k7FODpFenJ5ACrwApu4AGvYnNGI/znSejA=; b=P8m9nR9IcxGxYesgsuk+SdU7mI
	Z1UE4KCsppbNUExYnayv1QrWfSf+RvNgmGwMjfuEEX6HCxRVzyUDOd+QO24Obp3E9gFPsaf98qBwa
	6qXRpxVyGVq/9IjRWNXbPZAONOwVD1JuixhpgHwz/IAj1tp5UJmvFPMNpudlhtCW/wYUqoZ0DFJk4
	i04A5lFdFu5abJUDx4LxugoVvflYuJULNhRnOoJUW5n2Y6wCZ/WQ1wHxGA88vwvMQnouYn/I7NQsf
	WHpMXQbkcYBrdPEv0U2gAW20c/YsEYcyUYDwTJVp/P5W3POwpGzHaKpmUEU+gxOmeVT/yX0AiTwtZ
	END86L4w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-000BWF-25;
	Fri, 13 Mar 2026 08:02:32 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-0005Xv-0P;
	Fri, 13 Mar 2026 08:02:32 +0100
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
Subject: [PATCH v2 1/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:20 +0100
Message-ID: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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

 .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
index 5058cd9409c75..129b02a69ccf0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -10,10 +10,6 @@
 
 #include <dt-bindings/clock/imx8mp-clock.h>
 
-&{/} {
-	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0

