Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A2B1F76D4
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259105; cv=none; b=Wu7ZKgaNUV15KRmRkhqxU14cwxr+3ahe1gI+Vg7tdZOvzU1AxTAXoE/11VT2NkMfJjzmmKtupIIjJH9eX+LOsB6MT41SNhHaOXp439etteYpHRjjCgasng+CgHulzMX2fyRVAvpVDlHw6rvCkBlufJxeNlED1cbznUyjFguT8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259105; c=relaxed/simple;
	bh=q7cG0ViOYoEe4JcSfbFJSrSliJabuqPBfw8dtirLMEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTdFzOAgPcsMHUG0BBDd2t3O4oqoONpejzJTmeHdFl2P5Bw0aRg+X8pWxE1aTIZpB2pCX1OcuaPPMt6g5K4A1VyKQK1XS+hOcn33lz8smr1c3yHfgY3IQCKxSLHvYlm2sXvJVgx2g+tGLOhy8U8UpHsvdi/14sDi9rKIsKJ38ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Zf6iNX6v; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BHFpyrnk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Zf6iNX6v";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BHFpyrnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259100; x=1767795100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NBfi6nrpA1yiNxlW1XzcPEAvwphmJZY9mRYoq67HWaM=;
  b=Zf6iNX6vzw+isoRYSPAtWBK7mPocpctVR1BCV8shUD5FRr4uqvrmm7hT
   LegEcXMSqVISnzF9ZpdLsCoIIvdG8rPxGc6TdstEKJlZr0GvhNyvw14d9
   r665zS1yU9jS8mjuxchk8oDkd1by3dw1OotTIt1NIwnlxc32n/NflLfug
   8XPoxxYEbqfbfpN1hA/kx1P92+r8Yp6wO0J52FEirZy1NsLu9Ww7etkGV
   F6m3PETK9b9XUAd0aAA+CZBH2kLIWvj4oLjETm69dz4vOOSgZwIV7a0Y1
   0qJMEG12UoA0C+yBiV3llv8WDqW6fcpSX60JQH0v7aHWZdRR814l/hC1B
   w==;
X-CSE-ConnectionGUID: fnW025m9SOKxylZKA12b6A==
X-CSE-MsgGUID: aPb+SQZ6QYmf9P5Sl7cikg==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896503"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:38 +0100
X-CheckPoint: {677D361A-0-1D00F64B-E6C57517}
X-MAIL-CPID: E308D1528F3988BC39AF5B8E3116FC19_3
X-Control-Analysis: str=0001.0A682F1A.677D361A.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39FCA164D53;
	Tue,  7 Jan 2025 15:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NBfi6nrpA1yiNxlW1XzcPEAvwphmJZY9mRYoq67HWaM=;
	b=BHFpyrnkOHJ36F2uH3q3AHY7fhrPDB77ME2iay/1WZv55yua3zRrj+/dZB071xFx+oYY7k
	MOtaJTgTfaeSsxlAW+esronyOGVzTx7xQ+YIQ7qrSUmMpOrIMJgOd0YP4VRykfZRQC/Uzp
	oHiViB0IQJS3gSnIk4OZDH956uWlDZILfyut7Rz6H7REqGJRvUmyrpQZsqO2IlJFwfBdon
	2e5ENYnTZtlEP5+gSdP/ppbF3fK42QeyIjBrmyLgfKQXQzn3kT2cGk+QRbMrBN+bS9rM1m
	wNkaQOuMTJtscCGS7NJTljN5eArgabxhYpTYh2b2dWlqQf4Dpe6yYLPojNZ4Qw==
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
Subject: [PATCH 2/3] arm64: dts: mba93xxca: Do not assert power-down pins
Date: Tue,  7 Jan 2025 15:11:16 +0100
Message-Id: <20250107141117.984652-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Change the output to inactive (output-low) for active-low pins, resulting
in high-voltage of power-down pins. Thus this enables the attached
devices.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 861a028a1b165..b8ccc946c62d7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -448,38 +448,38 @@ expander1: gpio@71 {
 				  "WLAN_PERST#", "12V_EN";
 
 		/*
-		 * Controls the WiFi card PD pin which is low active
-		 * as power down signal. The output-high states, the signal
-		 * is active, e.g. card is powered down
+		 * Controls the WiFi card's low-active power down pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-pd-hog {
 			gpio-hog;
 			gpios = <4 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_PD#";
 		};
 
 		/*
-		 * Controls the WiFi card disable pin which is low active
-		 * as disable signal. The output-high states, the signal
-		 * is active, e.g. card is disabled
+		 * Controls the WiFi card's low-active disable pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-wdisable-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_W_DISABLE#";
 		};
 
 		/*
-		 * Controls the WiFi card reset pin which is low active
-		 * as reset signal. The output-high states, the signal
-		 * is active, e.g. card in reset
+		 * Controls the WiFi card's reset pin.
+		 * The output-low states, the signal is inactive,
+		 * resulting in high signal at power-down pin
 		 */
 		wlan-perst-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 			line-name = "WLAN_PERST#";
 		};
 	};
-- 
2.34.1

