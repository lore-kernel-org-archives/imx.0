Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762A11C07F1
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455447; cv=none; b=sjeSm1ZG2wxUkCzwrn3QUcqh04L2CRGIIfiB5UeXV5A0NdWeV5WuxaTX+a1FbBhwkP1kq1zNmzprVxJey01m9GDAZfP+nweEItp8SboYqLdRYUwNpDsGkeUygrhvYBtkKhAPAKSqzMTpm4RS+ywVLvSo5aoGNowBVlb7p+uzmvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455447; c=relaxed/simple;
	bh=y/9WtCwjY1asJUaJ7F6fIYTYTnnFPQ7VO65IbB+pg0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AiuwWugR50WLySmfHKdtd/6j2rTeRV8g8xDUp3DgD+g8aPpUeibEq1Fku1zepqRyXW+/gCDO97FtW+paZ5qDgYSUus7+CyuN8MohbovFp8G9IE9ZrgSfbdkqhySJFmCnZzqNEX1Y8ns52vLoI10RPqjPCYDB5wSo7GeO8Tk/UdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=U8AznLrr; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=sx0RZGSj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="U8AznLrr";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sx0RZGSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455444; x=1768991444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vlr5cUwPRRPdmdrxfHfnoxx2HdPSWBufIchZ2vqklZk=;
  b=U8AznLrreKhakE59wO+UovLAnKfysBW7Xj9/o5w4LCbaj6896CKb1obC
   tAHlvsyflB91IHxeL2qEf6874+Uv0GHeIFKJdLpLJ7f3oqtQf2q9hlb9c
   jImJKoqQ9mwVxp/JZlxVozy3l5yfVRzaiK/gQvKjf+D1BfV2dwf0U4vG4
   c4+U4Ce00FehsVCkhoS5v6P1KbhX90claDzA5gFeaZ0dHa92N4YTFso0U
   oqm/lZUm9Dk37QbqolQOsNMLsGXgy5Orsa40ncJ6M0mZVKNu7zapL1Fss
   aA1uYFBGiC/Rn5ru+VVMrScV+AXSoPE5dUDjeW4WsuWcj8vRE2Dvko3ed
   w==;
X-CSE-ConnectionGUID: VLxxD6TwSP2QjGRQNpkVoQ==
X-CSE-MsgGUID: NOYYOwoHRY+NVxiinLL4Tg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196365"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:41 +0100
X-CheckPoint: {678F7751-A-31397509-E321C4C4}
X-MAIL-CPID: EA44B9009F17B461DEBA4D0C8EEB203A_0
X-Control-Analysis: str=0001.0A682F25.678F7751.0071,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 433D2163631;
	Tue, 21 Jan 2025 11:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vlr5cUwPRRPdmdrxfHfnoxx2HdPSWBufIchZ2vqklZk=;
	b=sx0RZGSjlZosl5kPDCZiO1SYdeThTPbiGYy06XUhzZuko/HoS5jbx6IVui/+0/PDbomMPn
	W7Jgcx46OPYHN8x2l3T1oBKXM8FH6cOllWOn57YZgwCXE+ieTukBtb6dWyl35bnZSPZ2K3
	n1fbLZ0miOhXbvZPdB+aK8THlLt+Aqvx5s4G3ZyDE+iHdE7clkKbBC36+BM7aieEK8RW55
	w48q7gZ0jmJCSiGwW+CbEV8di4kZrE+x/mHFXVzuiBDdpCTugw3qIijpgB766Z00DBM0i9
	EpaSADrkj2NMx2zS3/k0mT2/13CLSZGvI7rPG/qgWK4I0njjVzJAjUUl2YFXOA==
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
Subject: [PATCH 1/4] arm64: dts: freescale: tqma8mpql: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:22 +0100
Message-Id: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 2ca87d2f0b590..f00730ba4e1c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -50,6 +50,7 @@ flash0: flash@0 {
 		spi-max-frequency = <80000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1

