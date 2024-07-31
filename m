Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C51607AF
	for <imx@lists.linux.dev>; Wed, 31 Jul 2024 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406220; cv=none; b=KEHexN7iAP/YOzQ/Dj0+EnKsnfJUa7lLZP4URF3oKA7KotkZsgQ2/YU7a9QS9lSPDLZrNpW3+Z+0d9ik2vhGCwBfPsaaqd/RraMw/+D2dY/jkAjWpGvS/OR7yxd099HhV6CMIg83TzaCUHWrkaP8WkICx05eehTmqyf/5ya5Dic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406220; c=relaxed/simple;
	bh=YO2r3V2odSzsbhtcqk3n5+lS3Z+YCx9z56+lzLquCFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D5UudL64lQ/LHN8easJ2w2w8SqH52ynNU/6JYIsP53xVu8vYjb4qfY0zNWOFdvgNyhH1sxSdFp8epdXGI5vQaomITnj6gPTuDMagTxbktn55sye0zcRgMYuoJuXI/QQgcsuND5FaqS5GL5BOG4q67b3ZD+CdeZ4URmnOdRGzq2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=QoNZjsYA; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=F3WN1anS reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="QoNZjsYA";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="F3WN1anS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1722406216; x=1753942216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I+IjmRSHFT9092jQXqLQkEJ9RgRr5atsJ4FNP8n6k6Q=;
  b=QoNZjsYAMQbbyq2sIopaFJ8xah4OF0EKdaAJNF7r8Kh5iEjJdHzboDUv
   bzty4qwjnCqR59ai+6KU264G4A83Pizb52ojqxyWlJAw3i6NVii5bTqud
   hxVElG6MDhfE6V7PQxCMRVo2wC5K9TsWzNmlz849Q+xaQp3gnjL7uaMr4
   FFVqw/fddQV2hl4egRPkk5+KDtlYf4L+5nntUM79OORD/Tu3dJE8wzaqF
   c3yxmJxdy/J29V0PeVXKf4/hW7F+0m19XGFhrnu2Src4BkfdBBb3prX3r
   dSH2obZX6cw+Vkb6La94Zx+0E4WkYCC/gc37bsJIT+fi4s2oykEMyL+YQ
   g==;
X-CSE-ConnectionGUID: VmZnERn9Rumknvgp7/ewGA==
X-CSE-MsgGUID: ASxSmmMVQIiXuwyGRdrT5w==
X-IronPort-AV: E=Sophos;i="6.09,250,1716242400"; 
   d="scan'208";a="38161191"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jul 2024 08:10:07 +0200
X-CheckPoint: {66A9D53F-31-CA1431AC-CF855369}
X-MAIL-CPID: C7074174ECA8638E2C3C0A45063836FB_1
X-Control-Analysis: str=0001.0A782F19.66A9D540.001F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8280C1656CD;
	Wed, 31 Jul 2024 08:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1722406203; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=I+IjmRSHFT9092jQXqLQkEJ9RgRr5atsJ4FNP8n6k6Q=;
	b=F3WN1anSGymuxpWM7AtvbXAadr/aNOAkrRYL9oegZKvE31ipSPTrdqkWOIIa9d+le83mPF
	HME1A2baodn/FrZhxeqEC4rNY85OC98G5vj4XHGRBtmbWNrQWBf5qDku9IEomKEBrAsN+F
	vg8zk+BOson810TPsjYQVL+WY3T6szC+nOxkiz07rMHAKanMNcIdGuFZWEJJHQOJr1sRsm
	kSy2YPTp/uocKVOaN0/6wQ8Kke9Zz8/ZvAkVhDZLV/KeNxF0yaGbhIcPhcyQ8lcwMuVU4b
	A0AZaZlNeZKoa/GIvBARZDM9ULOPaWZ3EV6lIVIu0DM0ssbTWo5d8OtxrBzfFA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Clark Wang <xiaoning.wang@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: imx8-ss-dma: enable dma support for lpspi
Date: Wed, 31 Jul 2024 08:09:58 +0200
Message-Id: <20240731060959.897105-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Clark Wang <xiaoning.wang@nxp.com>

Add DMA configurations for LPSPI nodes on i.MX8QX/QM/DXL.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Added missing space character
* Move 'dma-names' below 'dmas'

 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 1ee9496c988c5..575be8115e427 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -34,6 +34,8 @@ lpspi0: spi@5a000000 {
 		assigned-clocks = <&clk IMX_SC_R_SPI_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <60000000>;
 		power-domains = <&pd IMX_SC_R_SPI_0>;
+		dmas = <&edma2 1 0 0>, <&edma2 0 0 FSL_EDMA_RX>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 
@@ -50,6 +52,8 @@ lpspi1: spi@5a010000 {
 		assigned-clocks = <&clk IMX_SC_R_SPI_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <60000000>;
 		power-domains = <&pd IMX_SC_R_SPI_1>;
+		dmas = <&edma2 3 0 0>, <&edma2 2 0 FSL_EDMA_RX>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 
@@ -66,6 +70,8 @@ lpspi2: spi@5a020000 {
 		assigned-clocks = <&clk IMX_SC_R_SPI_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <60000000>;
 		power-domains = <&pd IMX_SC_R_SPI_2>;
+		dmas = <&edma2 5 0 0>, <&edma2 4 0 FSL_EDMA_RX>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 
@@ -82,6 +88,8 @@ lpspi3: spi@5a030000 {
 		assigned-clocks = <&clk IMX_SC_R_SPI_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <60000000>;
 		power-domains = <&pd IMX_SC_R_SPI_3>;
+		dmas = <&edma2 7 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
+		dma-names = "tx", "rx";
 		status = "disabled";
 	};
 
-- 
2.34.1

