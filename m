Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA301F1934
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258495; cv=none; b=lWdun7tLrUlIZD2Tm7zrTbQ6DSI0daxAzNDkjKo1iunymFNLnWpuwDCJr+7f4dl94zCAhIuvZIL5kYOSR6NXLZgPJAdOpfhVMDfn8ythGXdpKYSqEesGCTz/TMI/Ijh95hsLMSuOeTf38XaFrFD+TwYvQoTL3LiEtprMpSBAT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258495; c=relaxed/simple;
	bh=J7vJi1WptM0LOSL51lxtJfg9x4rH3ODkXVRsnMBBYCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MbfVyDxeh3ef4nqBcAokW7CNYTS0wvmVjwj3mWWvo3qJ+QSCdjNI3U++BoTzeAt10GOWdjsDaJhVxGM2MoFfXISuH6BLre7UTW+dfGmNCJFXWPRHxeYmVUL4si8jQIRoH/8qrJz0Zpzi/lB0c6qr2G9kHUQ171lmrkeBCoAZDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=F7yKt0PI; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Yxdx8cij reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="F7yKt0PI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Yxdx8cij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258489; x=1767794489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nl2Wc4zXUTbFhL3xUOlfZV6Tk0P84aqkDxVPBN8GdpI=;
  b=F7yKt0PI1F897toCmjNRWmxENcFhqSEyiKKc0puJiNo46jmyR0bUBsdj
   aWYdxEJwISy9n+jXy5hKD+Ye6B8DwlnZksdObiIoyNIjELlKv5MpYtQXu
   uA06nTAh/thPswJgsHy1vQxzu8X6wFyS6nfUuGJ5xx1TGZWok+o15e2LJ
   LR/VxQvCdVzuY+pGCiqGbvtt3iLsEW4VLIj4XwCurj9SjnzJa3CPYLReQ
   9RSlO6s5jZsbaQkcEyuBTh2QARoJDeRT7CbAfwKjFIs7N760vtbxyuMrL
   8RYVDvye/teucK5RhBZzcvCzsEdXWfnOUfxNtNChywYN+M+cf3mAdmlpW
   Q==;
X-CSE-ConnectionGUID: 1IK2yk7QSOqvaaM0iR1QwA==
X-CSE-MsgGUID: AQhxRHawSISrFnO0xIS4dQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896217"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:26 +0100
X-CheckPoint: {677D33B6-8-C6D8D88D-F91F9E6B}
X-MAIL-CPID: D7D2787E713A3DACCFD60F87EDE56897_2
X-Control-Analysis: str=0001.0A682F15.677D33B6.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CD2D164EE1;
	Tue,  7 Jan 2025 15:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl2Wc4zXUTbFhL3xUOlfZV6Tk0P84aqkDxVPBN8GdpI=;
	b=Yxdx8cijniKdkyEuN+R2sxLiK3xugzxbK4keySoct4rTSGF4qyoJZUD7rE00B+17joOJm+
	/m133xHM+8oXgwonSSXzhYsAqE1YSWJMBvRslbSySNjqAN4WLKYt7nzU+VIisYVDDIflha
	QfD6L8r9jCajXs1ogWwEgYVH3i6iVhUPzV16oH0vAzYbCqFZP1ok5Dr0Yqbk+wNBSuvtsv
	F4bVR/qpd3hKmYiTjgENqsVAD0eErR2+5GDnWV/UFrw4fzvzRHwAeMmBZB2u/cQM1oehsZ
	tF5Jm82dk29g1ukfip/ZFdFtU602rQ9+creNskUAsYMgpP57MVWmWBK7glkW6w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Date: Tue,  7 Jan 2025 15:01:06 +0100
Message-Id: <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

IRQ mapping is already present. Add the missing DMA interrupt.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 70a8aa1a67911..4bdfc15487cbc 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
 		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
 			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
 		#interrupt-cells = <1>;
-		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi";
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi", "dma";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
-- 
2.34.1

