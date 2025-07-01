Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E51189902
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351120; cv=none; b=R2pcKuwgOvyBSRrUZHVuGO8X90MTB7/lbLRDfGrmGpKhfAUYwLkkxh0+9V/ZEemPcYrXqKDFQQ7AvBzJO2X1XnHYUaIubiUo7q6BE/5VdFKIh9usUDWLw2ukSSxKzmI3rG/QJdkOUCB8PAXwyhLn1+VQrrpoUeGVYdazO2Ia/9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351120; c=relaxed/simple;
	bh=rc8tyuye3gQeIY3xq/ey5rCkeVFKBmQ82NEvW53M2g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6nrwjMH5XUgzsJJJSgmNXP6fN/stf3Z4D9HadUT1QJLJmxOB4bc9FkAFoccJc1mSdp4YvR4x3hW38IWiw42EK1toe7fgcwr6GJdIpmtbQKSidmjPt5bxpgTykEnh4Rvt70KP8V05H6mUF4WT7u+mvRifGLyPxord/XMZRCTwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=LrLLD4c2; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XIDj/1NP reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LrLLD4c2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XIDj/1NP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351118; x=1782887118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H523ibeLh/S6NSHahPUKbrVHvI6iw8O56D/i76Dq++E=;
  b=LrLLD4c2NSul88qHVnTRgqbEon22jWUXrz9lM9HIrvNol9k+XHMt65Lf
   gcLDD/AczlwQ/G7vbUPu1ypjteDsq5VEFKfrBO37QljxUxMrHvpGgK7Ij
   ZC/XdugvmW0O3cyvH4p9faSTDFnQe9QsPSgJT++agFLiRJAbZlYt+fYxv
   mluk5mTPV5CyhkyBOB3yQnhiH6dcoJaAsjvUUi+5vPO9Xr3UYUT4F1cpr
   AOpyZ1uzNlOK5EjrZDSZHAr4BDeMyX9C68HffsNno9eoBRyHgfX7r/T21
   4fYxWygOOUTSaqPzvJzFN404BD9/7NPirfphhjikkrsJxhGsLqXDYL75+
   g==;
X-CSE-ConnectionGUID: Zu4pZ2uYSzWWAXVq0P7Onw==
X-CSE-MsgGUID: dJ0oGTEiTnukOBWPnPIspg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943371"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:17 +0200
X-CheckPoint: {68637F4D-13-F34124BF-F8CE6E96}
X-MAIL-CPID: 4A7C7990F1446E38723108C6CB668AD2_4
X-Control-Analysis: str=0001.0A006378.68637F68.001F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8368716A4F7;
	Tue,  1 Jul 2025 08:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H523ibeLh/S6NSHahPUKbrVHvI6iw8O56D/i76Dq++E=;
	b=XIDj/1NPmZ0lrWzEH+bp1ZEoM5KuAM720Iyasl88uEZQohP0hBbJpy/S5tnVBDlDA4My6b
	FEhO+gODHnR07KQYAkFbRR9xhU9lkZX31JSNVT7cdRi2RztQB8E3M+Cr/hs1QvDZOlcMSQ
	3vKDt8mCtKUydW2bacL3ULgBTd35Jx1LM7lsLMXLku43YjqfCBStnQq4isXZtgV+QBuEQw
	lvv6nLLyV1L++OdZUe4WCJyrmC80/4c+W8EewcEogafRgKMD+I2rVwwJLRk9XAPWUXyy9f
	yh/CZFiHTGZeRqsgfWylz4hyia0hm/L6NlOaEK+OK37UG2QjaKQ4jKYCj9zG8A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/8] arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:49 +0200
Message-ID: <20250701062500.515735-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The jedec SPI-NOR flash node itself has no partitions, but the partitions
subnode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
index 12d5f3938e5d6..e39eaa1759365 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
@@ -17,8 +17,6 @@ &qspi {
 	qflash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

