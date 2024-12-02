Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2362F1F9F52
	for <imx@lists.linux.dev>; Mon,  2 Dec 2024 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733124087; cv=none; b=JpNx4GZJ0wfJ0jBi45hVf1IBtc2+nG8g6oMCXgUn4xNo4C8Ik9QHoSKRqBQ+ikHD19BVadbyVCphEvTX3Z6mqeLUWfijaxhSnHy0730B9Bcx/rKsSjULOqbYQSIyCaLJGnpLWUkzi8TUnUE9R/MYmtf9a8SpZ5ErOjVIzawf05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733124087; c=relaxed/simple;
	bh=5aS+kQ3fuMCc6mYDKrds3kIW8WJ+z3d3u8weRi1p5W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jSJ4btAAt4MsqZBoIvgSqrNT+ebbnxOTmWqJwHskwZ1NY6jmiwzM1BdmfdHvvosKHsR14oSX/LFGBUCimGZVj7W4Wuolse8MMpGzsla4utO9vz++fw3Ker5O+/yb4weZiUPuGKW/iu8xrU5L5LSNjUw3T6al1sc4xv07LRuNsdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=creA4t+d; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="creA4t+d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fFFhsPR2jwgATzk6H/1QdIQ/5f4mZuTc1MVku5Udg+U=; b=creA4t+dfuRzwPtsKyFCYdM6TI
	wpTMD6vuXO8mUBl/ZwU6DcYukRhrDAmtgroj/kNyi67gWgab7K8Kx45sqFTCCcne3UUQ/C/XxLx79
	vx/HeXtI8ouR1auhiQWoel+RcLtoXmbPtAL2Vz4GyQvSKj3fHfCnYfKBHUYaprxWJAKng63CiLpN7
	MHgYskr7DmqXp5ygZLn8hzM4ZsJC/INA/ezj8dGmevrxzcgjRljb7EhUPUpgwDsQ7X86hxI3cHY3y
	qydLYxpz3V4RlAJhPK02bIp7sFpdhq7xsf8iMTNXLOOp7IonN4PgKN9LhFGTOO3g3kS7gFEUj8zFm
	c2zRuXVw==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0kA-007Bva-1P;
	Mon, 02 Dec 2024 08:21:18 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 07/15] arm64: dts: imx8mm-phyboard-polis: Set RTC as wakeup-source
Date: Mon,  2 Dec 2024 08:20:44 +0100
Message-Id: <20241202072052.2195283-8-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

RV-3028 RTC can be used to wakeup the system on phyBOARD-Polis-i.MX8MM,
mark the device as wakeup source.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Reviewed-by: Teresa Remmet <t.remmet@phytec.de>
---
Changes in v2:
 - added Teresa's Reviewed-by tag.
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 6c95257119d6..7aaf705c7e47 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -223,6 +223,7 @@ &pcie_phy {
 &rv3028 {
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
+	wakeup-source;
 };
 
 &snvs_pwrkey {
-- 
2.34.1

