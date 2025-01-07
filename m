Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C21F237D
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258505; cv=none; b=ZpFzEcTdVp0R/ngbWVcQDH/a/nTLPWKbDlrUXvGJphfVHhLNWM/0T3H45u74JNkPRn1+3FyBnpeH8gHRwH0dtoy2P2Mz3RzPJi/4ya4OY8ObnjjtH/uDEKJFbO1t0RnVU8aM7vUUhKnV5JQdAwmSGDkQFDj5nsWY0Gsc05ffvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258505; c=relaxed/simple;
	bh=dXsaCpmuyNm22DOO+WMy6aI+WmKcOYdTOnisiIf1bf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aqt/4c9jUWWURcyd48t4cRnYqQ5khhYsiPm8vf+eV4p/zQiILh4tSCOa1Syhe7c90lr5g5Wl2xbzYJwUk51mLR3bDOtQ21kwb5b0GTFP6qQZKbKCL+Rr5eMvwO9mKlu/BBzGvBssXOup4+ll9ggdDwa2HxpMz5Vcm1POstEQ+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HxhK8NZO; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Sjg0BqcG reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HxhK8NZO";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Sjg0BqcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258499; x=1767794499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GS3pClhkPDA+LwJhdHeZUgZI8RZQtDpKghxvyQ9FWH8=;
  b=HxhK8NZOZs+yFd9lDkwZTQB6XJE/vnSET1wyYC8jVIzf3p2ZfsQODgT/
   8Qar6ODULmKJ8jUF5kYpeyHRJdlF33g3tA4dMPABcMEMenm17tubxIglY
   tZCPQa492bSu94M/koHzZMopLmhqfaxHtgDIJvk0vVrIYXSpDRNLDCRhk
   gjOwpm7mpvNivfaDhnnBmjrmcYvS0BxURFrzI48wH4uUc393BhZgeANKJ
   0SrYlj3lkx+tiIqnEXDRSxaSaB8HAn/4ez2JNJP5Bba6mHRdh0ilXqEg6
   lF7SKMDyFoB0UUHosrg8Tm5NB03sbMreRpoCNjcGk/BnPwvFA6q7IQirh
   A==;
X-CSE-ConnectionGUID: sijIt1uwTQ2iWSD4Mcq7Xg==
X-CSE-MsgGUID: pQkbwoTpTRC8ZL1KtKdJSA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896224"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:36 +0100
X-CheckPoint: {677D33C0-4A-3C670366-E45AD810}
X-MAIL-CPID: E9B2B5707E61DDE3D759F2B39E22D7DC_4
X-Control-Analysis: str=0001.0A682F21.677D33C0.00D3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8983164F28;
	Tue,  7 Jan 2025 15:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS3pClhkPDA+LwJhdHeZUgZI8RZQtDpKghxvyQ9FWH8=;
	b=Sjg0BqcGNHUmWKsaSLDRySJbRiDoIzxHxmJ8GX637wdihyry7UUk1x9akC7kDvbEhIu2ft
	fBr0zXhcgJl7GGese07uUNALW6BLca9XhwS3oZ4A3iEODSOTbGAwvmVAK0KHnI1ITxnJgN
	m0bmdBsjM8wuEM1W9JQ3xS9Zwu5h26Ou0hc9K/hf0+tk/VcyQUf+YzmI0YhmnC33i5CTBH
	pJ43souOKQKCfj0bapOSopVAUhkAYpv/DEyi2cKeIZOlylRvAdGklPDpOsY0PQzIvCkTlQ
	g76g8CtgQnt+pkNoOWQRD2Gq8yK0luDU+Zo0OUqeWdEcweSyNlr3CbLbvhpL9A==
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
Subject: [PATCH 3/5] arm64: dts: tqma8xx: enable jpeg encode and decode
Date: Tue,  7 Jan 2025 15:01:08 +0100
Message-Id: <20250107140110.982215-4-alexander.stein@ew.tq-group.com>
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

Enable jpeg encode and decode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
index 86b4e2b75adba..50aa41e3b6d51 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
@@ -115,6 +115,15 @@ m24c64: eeprom@57 {
 	};
 };
 
+&jpegdec {
+	status = "okay";
+};
+
+&jpegenc {
+	status = "okay";
+};
+
+
 &mu_m0 {
 	status = "okay";
 };
-- 
2.34.1

