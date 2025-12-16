Received: from mx-relay21-hz1.antispameurope.com (mx-relay21-hz1.antispameurope.com [94.100.132.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F713BCC53
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891033; cv=pass; b=rP4FsoDyuNKgnzGmWTaoItoCyGDN/uGtXhlW2/nUhfuq1SmEh8lZ4+Hq1LA7n0D/nTzJiL8yfNSg1c/Q6fQH88Mui+2TzIGKRKKlbKIw9wP8DHeQEgzekSD7ym4dMy0ZAJQKSj2+wDGaE2bfQrY2HF8i+sotdvpun1MNDWnbChY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891033; c=relaxed/simple;
	bh=zxxZrwSMySnJ+NOEKeTKxWL2NpOTHlJHW6Jdr7nLoak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAczO2RmTawUi2jhjfuHL/H2CjC9Rbh7i/JKA54Z4xa4euamt6mWKxJ4ZAUPPryT9n50bp5d1jstj+vjt0dEXVqxL0axfzO0Vl3Tv4ZEg8+24XBaSnffQ1SC6fvwIBVzlpFmpSIiP5eY2pPlFUwy+gdyzuTBu5vaxkdwvtAiw6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ELXMGcca; arc=pass smtp.client-ip=94.100.132.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ELXMGcca"
ARC-Authentication-Results: i=1; mx-gate21-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=J+XQ7ergPVCzcXY29psvIoBrucP9oMPTCH1A1rkDzxM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765890943;
 b=KIv0oL+tab8RsYq6f/Wni/aaWUjD3yJTdZ+XVHTiDYiVACEUNDzZitrgRbn+zWEp540tAD2f
 CArio44Htz8c/9FrT9UuVOe5rttnPEGoQxOzBBedXZZhoeqdWpEDz650cGSD7jVPq2g1VLy5+3R
 +5YBOrIKVnIwGd70l3X9mD8yVkPc4ha01wKPqpnBRZwB7LQ7Q08s3tj4Or7vBl29b2C9NummlOr
 seqbfnRdQlkJqNjA8sAMXlp3jf+O0IECrl7t5l7544zP7bDrmNtm8dTTgPjwKloAnXlwE57RCtO
 OZOzvgEss/FJiEko25+D1KxyL/G2UKHbuGytiVkcJrrAA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765890943;
 b=iDvGTBgJhuebFgHFYSURSjQWPRgj12KOrQjnYcnySnk0Inn+Yk9tqr5oUOVAt7DyUkwwjFg1
 /Ngh3nWmsdwkZ4pmsEVE/e+UFIjTL64+llK/lPT2Baj48Nupvco3uDrIdzpGah4fXXW51D5pVup
 0F3E4FzomxRsLJNogf0n/blqJ4PHbJtIDVLUE7g+ShE7bRrzd5oquw+9t/iw5Hn3Z+ojV7JiHub
 /uYKQRx+ABRUQpi4YJWTWs6qj4fT5yrOHFADpNdaoW3AusES0M5nwiOMOW7md6IIbq9N5GfccVA
 EeUvZH9iF99J4d4w+3ltFad1t5earAhxtQ8LDx9G2xjJA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay21-hz1.antispameurope.com;
 Tue, 16 Dec 2025 14:15:42 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8B5FFCC0E8C;
	Tue, 16 Dec 2025 14:15:33 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
Date: Tue, 16 Dec 2025 14:15:28 +0100
Message-ID: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay21-hz1.antispameurope.com with 4dVy921b72z41r9H
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0fe9136366c4b6928e5776230e78d4b0
X-cloud-security:scantime:1.648
DKIM-Signature: a=rsa-sha256;
 bh=J+XQ7ergPVCzcXY29psvIoBrucP9oMPTCH1A1rkDzxM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765890942; v=1;
 b=ELXMGccafBOOtLrv+A2QuJ/eulqVIlWIdjs/dJqombnljIZKd2jowLKHpH53sx9rtkh4a1c9
 tdEIYHveKKGqbUMOgboDckO3iDlK+Bwc3jdUnmjyfrmPm5D4aqihOYh7fYHLIDV6x+ld4Lz/4h6
 6F0wtnygybIShXduEqGrSQAcfsgv8tfI7perIS676KmbVUqL3rRhkuIqUt6TDQDbscIBTgHEY/1
 v+u4z/7Gw87vuhGYWadyfUawPk/LzRUgGEV7vTTAM/CP8HBnyIAXdBONHRxWvffR2xQcU9don8T
 5hOut16ujfxaNXjHxIO+RRKLR0hNeTW/rmiWhkaRdrjhQ==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 225cd2f1220bf..10d5c211b1c9b 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -192,7 +192,7 @@ ethphy0: ethernet-phy@e {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <500>;
 			interrupt-parent = <&expander2>;
-			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.43.0

