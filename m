Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0D83CD5
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871940; cv=none; b=p80k8PBJg3CRZKRN818ieboDGbV8nT6vvfO5NCact2Twjap7tMPFOD/A1adaBDR+1kVEKd2Pw772Z2N4kpwEw/EbOaZxDxr2Pkdm7E+6zUyxongfE5XhxTaPBhAC8+2WxtSxe0h9ifWp4agjj5T40EuBV+xiAP3FJ96bK0v+xnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871940; c=relaxed/simple;
	bh=A8JGaF3N6+izHH2NLVJpxGLzwWpau3xfnnyuJHXdKKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4oR+L4MnkDzsMbujTXCQNxol7WGcFX9pccrIkOWio8BVm7iXG3kuxTqekbSlZOeeJWQKDENyGzLHeyzEuLPZA3vNAMP04gAf1UXpynnkOhAc4cOM0fQKOaRox+WDrwMmdl8Mp565EZ+QGRmm2tdIwG6Hpp/1ESX+HidKRG/F78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=PLeqLZNM; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ohKajoup reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PLeqLZNM";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ohKajoup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713871938; x=1745407938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QdSi3c2hCk307uljy0iamJEo2vwFvN1F0/IRX/AWjy0=;
  b=PLeqLZNM0wp9k+Q2tqs7DL91ah06m3hoQf6nYNWHkC1SjryxR1YPAprN
   nj16PDQ9LvVIscRVClJ+FlpDk6rUrV8Lfy3FVLmftv2IGAmjskcLdK9Mp
   hGNtyofXB/yLgW1wIfaFIbKFqMche5QKA5JMUqt5f+qshg7k1WWI6pYVU
   nmEjPpZAto0pnrLTgE4+y/2U0Phfn70XyoRo/hiApLXoRLgiYj8KQQ4DI
   8RFUXzCwc/ef64my1zGU+PvpMJGgr6Ba4yG5l3aP3vnKohWhsJ3PtY5pf
   NCnv4GIfsSlU2wnEMY3c4QZTnHHLVli6dynDa5Fgb0m1c3ndIzJR+K6+G
   w==;
X-IronPort-AV: E=Sophos;i="6.07,222,1708383600"; 
   d="scan'208";a="36565274"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Apr 2024 13:32:16 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C00616FD61;
	Tue, 23 Apr 2024 13:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713871932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QdSi3c2hCk307uljy0iamJEo2vwFvN1F0/IRX/AWjy0=;
	b=ohKajoupL97ZlAnUNCkDo1O1Gqxt1a912/azd5+H3nqxfqBdZfRpwpJ1Ai8KGgCheApi6T
	Bc1C/Pz6bmsFpNRGim3LflGUA0cdmVrFQCLDBV4OvCcbcRTvJBOfqWijOs1Mhk0SeXVLoD
	PtxYuu6T61zPaknB7ibMQkZ9GwwZqZ2tfmoHLmXmpneaaT+1PgWk7UJqtbIqBJkpoU7o7k
	EHWrSENH2w/lZ+oN0vXEV4kIId8Wn/pJTCYCt3Rn/znozqoDWDbCfH+bH42y623u7dW3SG
	hOFNUbgLPILb6JwKQUfc2sRcceQ7yVgsNRM0dYb/9syUUGix0hmseoAeqUVuBw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: freescale: tqma8mqnl: Add partitions subnode to spi-nor
Date: Tue, 23 Apr 2024 13:31:48 +0200
Message-Id: <20240423113151.2145120-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423113151.2145120-1-alexander.stein@ew.tq-group.com>
References: <20240423113151.2145120-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The bootloader adds MTD partitions in this subnode if present, or in the
spi-nor node itself otherwise.
Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Fix all this by adding an empty partitions node which the bootloader will
fill with configured MTD partitions. Remove the deprecated properties
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index fb24b9aa1b938..e68a3fd73e17d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -60,11 +60,15 @@ &flexspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.34.1

