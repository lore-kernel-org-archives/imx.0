Received: from mx-relay26-hz2.antispameurope.com (mx-relay26-hz2.antispameurope.com [94.100.136.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11AB32D45E
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383088; cv=pass; b=OHtAA9ObqylVC9dJKJcpW+7PUo9hZZ8TJ1HYoOVg6oaE1sIn5+EXqcYGIYG6w/YbVDXKIa/w0vOrHUjoU4ZD1bInrBioinMLkYjyjAoVUn8ncn6kGyCv1qlJ4q2JZOGetY8xuVaGGu+Nmv/v692UT5caJO/Dc906cces69n7eTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383088; c=relaxed/simple;
	bh=PpAWKVuNgKtQEKqGLkxH2In+DG4oYvwEX15NccYojt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfbaQLuDI7KtcddlQcsjMQnb5muaF7aZvcUNde0CcM9g1CZp7lTtpDIfVVsv3KWcPPRJZ6/s586OGl3+xWv9UPRF+u1kR4xHFIJ2mEHokWtLHltmosIlzcoAOKE/YmB55Jle1SLcFenohjb8BNw97gYif2Xj2MCbQTVUSxKTurY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CDZroq8M; arc=pass smtp.client-ip=94.100.136.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CDZroq8M"
ARC-Authentication-Results: i=1; mx-gate26-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9pJ5eqwsRiOt65RV7so49519D0zNC8o9Y8EmhxoJEHY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383023;
 b=aIERoc5mhisDpb5U9JBCbdLChdO/kiCgwfWj6KWr7FLz6BkXpmX4xf+0NleAcoUumes7BiiA
 4sAENd3YYO1xWQDM8xZY1dV0NdDjMUPArr/rjZz+LNXp7nEz9lfmjBpvI0SfNWZUz1OLbGs+P02
 WOG2QP1n2OePU+A/SOVXo+eVb+yXoBi7wR1pSEiOP7LiiDVJ69UrvRNM2Ycf46/pMtVlbq38x0C
 MA+6A51TbRxQiMH5B5y1fCTTCTWETwsR5sDuoZPxBlmRFMIzOgm4t/mJT565JzGMTCm/xVSBUlC
 MW6BRrQEfTPUtPUDgUtuOxnND1SfDXu0E12SuHIrix8zw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383023;
 b=BYB1/xz0936zaauOCu5+JaGrqdZLl7q5Qy0SZUhbu6y91QpXa34qtBpluf7mgdodkYzfUIzG
 ivDXqIpXpjQ5glO+30MMc6ERlISdTw7gHYGV1YcjXomt+RAx6v2O6Qsikm20gLfMttPAg3lpICU
 1mZ6pywjSejGMfd3WFoF5zRZUelCrenaWa7K6sEbAAOdhCr3eYoTYwfLE3I1yJzGB2BrZUu0/f2
 x7/tpvsJnnZx2boNMGVoSIYsQ+dgnnD9bpsNAiunRpEoqklxvJ19vTtLSCP5H9nmEsvnKMOcJ/K
 ffu5RSDpj8EkzRShXYaCMMKrEn5UBYdlQUug30TddX4MA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay26-hz2.antispameurope.com;
 Mon, 17 Nov 2025 13:37:03 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E4E9CCC0E93;
	Mon, 17 Nov 2025 13:36:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
Date: Mon, 17 Nov 2025 13:36:30 +0100
Message-ID: <20251117123643.711968-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay26-hz2.antispameurope.com with 4d96gn57Xmz2CqVx
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4c76057e9791c4f80819dc8ef33cc562
X-cloud-security:scantime:2.123
DKIM-Signature: a=rsa-sha256;
 bh=9pJ5eqwsRiOt65RV7so49519D0zNC8o9Y8EmhxoJEHY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383023; v=1;
 b=CDZroq8M9Y/ewyAqn0pixGK/8GsW/tnqf6jHRXgPWdKzQZSZJEMI+1RpS7vWugQehpRzQnrA
 fGQ8FVF2Rzpie0HsaoPd463V9EXchu9aL2RBbpBd0kE69/Q7BPLvz7p3Wyo1Fe8h+XHufrE65pI
 CjxoW3FUbhMEHE44KUXiUbnrlofvmK14Ux7OlJodtMBzDnTcrBGJ+C8dfPVt/kDcyhbaqp8BoY0
 HUgXrEIt75aktMQLHpK4IGvURV41EUPHUupQN+srMEFfu62XOvh3jCcUKcVWM3ncQlHVWD1mIqM
 okFJG952Ti3ZmTuSnkZuj11rvm801pd/oGy0So89aMN2g==

As per datasheet of the HDMI protection IC the CEC_IC pin has be
configured as open-drain.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ff2bacf24bfd2..03b75d4cf699a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -868,7 +868,7 @@ pinctrl_hdmi: hdmigrp {
 		fsl,pins = <MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2>,
 			   <MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000010>,
-			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000010>;
+			   <MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC	0x40000030>;
 	};
 
 	pinctrl_hoggpio2: hoggpio2grp {
-- 
2.43.0

