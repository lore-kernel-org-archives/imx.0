Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268C1E493
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 02:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729218974; cv=none; b=pWJ4xoYOqrwVrEfEQ1QmjDAnxZEfuqyOVKiYNI80d9D++x9Yc9MhwN9y4ZcTQVKKaDWj7N3CP/N2gUW6Ps9olDCEBBctNRkc86R2c00Dj73vx1XEhcZsYQBHahKqi8dh+dNRSOtTJYcBf7175vGq7zVa0UqHVIdXS6y+pxzU0B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729218974; c=relaxed/simple;
	bh=o4Kvfn12XX9NrpP6BrQaJS81tIY3gNv+op7HG9DmURI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpviPdAOjXZmyOTuLkIF2ayhNNQ3S14nQkFPjJbGSYZPlXg/IH3Rc8O+v99yUBrbi6kP6mK6nK1NEm1tqrsphMZpQT5iY4Ud1zNtwREIjaddqa+8Zc2k/E5HAMLGEFhR0vS3w9eKxGgctGFaR+EmPSfsihwYzlUTZ5igaBlHx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=REVB/AoR; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="REVB/AoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729218913;
	bh=BjRaaSai2G2iHtrp/+Culq3SNsWU3WArJjBOYoHBSfA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=REVB/AoRN9gxjCdL6qr63pogz/yALkTrPXk4jarkWP+8obOs+4vwAtgEAfFM4sXYq
	 Bz52ITochv/v3qdOkmEiFPAnBRTtnBr3fEK0FRAu7Y8EgMrUYdmnGHF0/3Gr2CydB3
	 1r0ofFrCNPbAEKgMFwZoMzKuEKSECdRnsAFhr6SU=
X-QQ-mid: bizesmtpsz12t1729218826t6acsk
X-QQ-Originating-IP: XOMl48OX9mOYQrkXy+on8GCDlffWlqK1JaGusn6AxQg=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Oct 2024 10:33:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5756514911803189014
From: WangYuli <wangyuli@uniontech.com>
To: robh@kernel.org,
	saravanak@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	philippe.schenker@toradex.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] arm64: dts: colibri-imx8x: Fix typo "rewritting"
Date: Fri, 18 Oct 2024 10:33:40 +0800
Message-ID: <45F06B5D4CA9F444+20241018023340.47617-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OGRTx1KypL8COEByY1l9EILDUO4BYz7/RSxSrxYJzPskWURkuw5Y7d8Q
	9ttTRyTH3OPMO3lIB2ECtLvEOuDi3th9ekY+zom5+wDMbX0uyrthgRJmzpHrsOiAuUDfFYP
	PmS6f8GN0l904Cdk9DhDORzyYc4GNHm3BT8W+6j0ex5APY8M1u3jfd26BiGGoNmQKYsg5oj
	Sk9oFMhII3txr2TM80e+Xgws9FQXGGF3+IG9DTmgN/AOXIQ534gLIwJ+O+oMTt0zWjowhjU
	kvOBmetmJbpEv9m/auTdues2WQ69ZvESHeGg/BQ69eQrDiebtECOWeV3wkZRd1IGU/3sILx
	SOmq7jNu7ofzeDyPLMB4rnZ2H6twXZDhz8rAs80hGyX+BhCCQozJnsudq5djiu3XPIo41gc
	x2d9pLdvjVtF70UXTiNavOpJMmu74ECP9xnE9vcD0UtTxryq5r2KzjvjwoglbUEV3RVtVF/
	QSCWBIkSRhuzxZo4wORC5XvYD+ApLBF+tNdqYVA87h4bCkIXYjjIy7OCz5MPaZxhcKu9/Gz
	++3duXzt9qhT/mdrSvUlp4Xgz1mSEMWNazVU6ANGj79PJzSJKgG/GPk6OUCt9CqcpP10AFs
	MTXOonm16qXdSZYX9W5q0uzu+PS+nWK9qxsJiYtWE/J9ngzUiC+RN5rpf4VA4itxXR4dj3E
	XQ9TgFnWyEe+A6K9FKGSSAj3oNpkhSfw6MqgSUg0n8xUGjlhV1jO/nNhvtq4Xi7DE8ZWBUI
	9zqzcIxY27OOMah+8y93XkP/E7fqPVfzEKkpQOfuoDrLljhIH+ILM1EkcT11AEeiyXqBPgQ
	XelOOdyGZ9z4taswuzY6Xd5+pMi3TP5Ro7MpX0TVYpvjStyR+GAjRlu6pcDKMRzlavtsgQU
	PLPOBsK8VLPdLtH2iaxoMsC7pKM8SOhUl9vaBB6Pl01uoWyUHqS9Z7Irc1JQrsvi6FCkS34
	sTLSWGZhMe/d/4/fUMzZGBo0YzK2oZAmszjHQdurT4PvWRG8EZpI0v90x//7pz1a2rzo=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'rewritting' in comments which
should be 'rewriting'.

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index edba5b582414..425ab37c01ea 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -698,7 +698,7 @@ pinctrl_hog2: hog2grp {
 
 	/*
 	 * This pin is used in the SCFW as a UART. Using it from
-	 * Linux would require rewritting the SCFW board file.
+	 * Linux would require rewriting the SCFW board file.
 	 */
 	pinctrl_hog_scfw: hogscfwgrp {
 		fsl,pins = <IMX8QXP_SCU_GPIO0_00_LSIO_GPIO2_IO03		0x20>;		/* SODIMM 144 */
-- 
2.45.2

