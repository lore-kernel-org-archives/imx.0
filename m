Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800681F869B
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259109; cv=none; b=bizXCFvj7TtvRPzy6qZMemqxUJeiKrSDjqlk4fbP+f+P7h3tsrutujDTsz7dUZyGXgIfHbNG/m3Fmc1U0Sp8JU3R5czorQH1YxQSrYxK+czAUMnwIF/xAZDwh+K5iWuIHd2RJaO3X8fehFnu1hi8bjjeZNdy8yirIoy3Udt8/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259109; c=relaxed/simple;
	bh=2c20P/9s6xkLEnFd8QsozQ2ld/F4yzh7UVB0W4thBLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AAjPkUcOpW5+xej/qnMt5sf8HqODzHDuVLHkvNFrDAqt13Szbp6LWtT+A5de3P2yVy4Vwj0osvUvJqj81vxYeGCvJK0OtCtt+oDNYJfdZ4ht26xY8joHXB14C0iIWAhekhmppJaKJwvCvwhRepXB8E85QGGuYXVt9lkjUiXCSJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ASJcIhbB; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jyBMhS0s reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ASJcIhbB";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jyBMhS0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736259105; x=1767795105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSziykOcETJXtRshvlzLyAefoSJQU3xBdNaSEbesj9E=;
  b=ASJcIhbBPoa4a34RZbaWPEa1DyDjiVzZskzG0KnCGM9QuX8yr29aiifV
   OpO/ipR4r7w0JK/AvHLMda4wWn253QSmtF7FVr9dULRvoh2hkdlMNr1Sy
   wgyaQjyRtVadyYnJIVbvIFrN48OHyGEW3n4M6EXaG9jAXSBa7cbIFEDI0
   14Pf9+K7E7y5trht7CyvL8rw9XUxZR1mO+whioDlzUH/nE5E2BuG48z56
   whaze6gZz4/mHspUxcrYtnNJvgwS/vtg8f72Red5A3bf80fT9c+5lPVOO
   fe4ISHLZGsQ9gS3D2SjF9dRegOa2T9zbyVIciRvj4D4hcEXNXjbSUrp8n
   w==;
X-CSE-ConnectionGUID: kxMB60KdT+G4CuezQ7yFOw==
X-CSE-MsgGUID: LuXc4tIoSFawpuNEB/hR9g==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896504"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:11:43 +0100
X-CheckPoint: {677D361F-12-1CE016C0-E589DA3E}
X-MAIL-CPID: 8AFFBE8325C1AD0394BD2359E8593456_1
X-Control-Analysis: str=0001.0A682F1C.677D361F.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F9E6164748;
	Tue,  7 Jan 2025 15:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736259099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSziykOcETJXtRshvlzLyAefoSJQU3xBdNaSEbesj9E=;
	b=jyBMhS0s735JCtIJr7ZDTkDUkB+26QdwHBy7EZGM6S8O1/GphbirVWkkwORkGsbVrhW8gZ
	ZOGNICOnoYzuGUd9lj24BmhwLlth5UpxtlPaY236jNfI/NsEIuriA3Xgdfnx5eqV8IDE0c
	rJTC1U48IpDkFSJlslZ54VMncwNvOiTANbtTmlutpK9k0Bs7ScqoxaKzpC3XeLSdJ9qafk
	KnlSTw8UETN9sCuf9cplIV8Ix7BuVk2gUHeWzXzdY1Acz+Fnr9CwwZuWQbWw7J4pncn3Sr
	H3VNn2NIHx7eiAjHHMDsFNny+554m9RaLSfGuIf5WXcg8DugQ6+Joy36CAT4SQ==
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
Subject: [PATCH 3/3] arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases
Date: Tue,  7 Jan 2025 15:11:17 +0100
Message-Id: <20250107141117.984652-4-alexander.stein@ew.tq-group.com>
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

In mainboard schematics ENET1 is eqos and ENET2 is fec.
This is reversed to standard aliases using base addresses for ordering.
Adjust aliases for all mainboards accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 6 +++---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index b8ccc946c62d7..ebbac5f8d2b2d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  * Author: Alexander Stein
@@ -26,8 +26,8 @@ chosen {
 
 	aliases {
 		eeprom0 = &eeprom0;
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
 		rtc0 = &pcf85063;
 		rtc1 = &bbnsm_rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 2e953a05c590e..9e88c42c3d170 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  * Author: Alexander Stein
@@ -26,8 +26,8 @@ chosen {
 
 	aliases {
 		eeprom0 = &eeprom0;
-		ethernet0 = &fec;
-		ethernet1 = &eqos;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
 		rtc0 = &pcf85063;
 		rtc1 = &bbnsm_rtc;
 	};
-- 
2.34.1

