Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21E2C15A9
	for <imx@lists.linux.dev>; Wed, 22 Apr 2026 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892189; cv=none; b=uNRQCSeBXXibBuvz5sZHlVh/xhrpuWRxd12wtADILUsP7kizN42JUxNHNFvSEsSE06MQw2vL+VPTcAoZae/Cxb8iNjM6Cx8k7YipHSwbHeQkq1g6yKu7FpYznwbEjxEOqDTmor3KEWmeqr0maP6UNmsdzxnIX48onPYaH1zwvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892189; c=relaxed/simple;
	bh=R0opaX48wUreBeuxHqlthloldDcFH+ss36NEjGWYK8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pF+LUmk3GcVbOJg+reolGaUTj2XjIR52P9hh+iOcyLoMDtO2ZldYO9Ola92Ts+N453pamO/x8gP3GdiK9gpfPyDm80xJFrSHsHty6LqEN96CwXOgLL6vZyw7KMh/LfrGM9y/QVJd934HIsmFS7E+v2V2H1655CxcAaWAh7Dnrn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=U8yigYDT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="U8yigYDT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92417113395;
	Wed, 22 Apr 2026 23:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776892185; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7T6vZhHl8TSBdOsriXfUWP4e8No8iyNMWD8GABChdsk=;
	b=U8yigYDTgYCWMZeC9D8jqd0KyXII2RErOPStW0UwZiq3Uc1QkfsOg93lqRwG8dv0/v6iFM
	2rVoL8pKVrX8rCJNk8CSvT5sXeLhW7RD5HblkMBImK4dfThnY+mOEkfG865ZxKFuf8Wu/M
	+HujQcW1h1XzZ/6gu2uzgm8K9r706qaJZRfTOwbhWWGBPBAJLgM/x7yr6iYzQsvP9WVZTp
	Thai8UqUkq9TGLZ4HWBXvVnhnWgYTg2lBKvJ0I1GPDLcclOg+XxXI9u7S0uBvyPC5GRFrZ
	p2IVpPKYORKZqnP7nmZl8LT3T+01/S7QQaTDIBsmACjIrqu1mRZoH7GJUc0zmw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile entries
Date: Wed, 22 Apr 2026 23:09:23 +0200
Message-ID: <20260422210939.81012-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Sort the Makefile entries alphabetically. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..1a08c5202f0fd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,10 +206,10 @@ imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-ksz9031-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo
-imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
-						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-adin1300-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						   imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo \
-- 
2.53.0

