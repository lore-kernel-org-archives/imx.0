Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA123BB9F1;
	Tue,  7 Jul 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417292; cv=none; b=MrGA1xYecA6XcUk4rIFdVFxSttmxB4PwdbY2jvD0PnO8D7G0ve36RI6Ugz0jxOvzGX3O84A+asmD8YXY+xtMfOcLeqGpHqe+s6jBo/lZIko+FvPwYDc1P+gOikLftLVhr3le3TxRSZc+1MNdDpSHn/k+N7yU4fuQrxEKVDz1XC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417292; c=relaxed/simple;
	bh=h0po1Os8ZunCzE+ZaUnP35rATp045/rLREFpUqiStww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTicr6EQxC9Y0lW81RijscS2jZHihqZZEToDokcDNQoa5ZEs5sy02+hMIsfC/jll0FUvlQFpHRUCFrXxMxk2b2xW20IpklSw3CyjCE29fz6qpjZEedBsu4mirQZCaxAbbvQjoVAM2FqIESEb8r1d+6rHYjlRrjmqg7H6d8sotUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mPJhhhlI; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mPJhhhlI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=v9NXiIWq97CSEahGJjuUvI29ZGrwLPU2keRY+33LcSI=; b=mPJhhhlI56T75SYEhfYWfwOqEq
	kJoGB6le84rtACnnIWrrYt6AjvnoXy3upKM7sn3Qsf3UDVv/fNc1VS6GgTQ6aVR+Xfei3Ub7PW186
	YrP9rEDl7Jw76r9ZP6k8rQl2gaR6dYSZkmRY/8ePA7zyfIoDvajISiadFJZQGT44rh3CIjKqYhSkJ
	mC7t7+Vn/3KHJOPORzwlVcO59kjt7unu5a7AkfHC81Q0WoMSaLsX1QCtMxiVrAjrOxkcpRNXN1HzS
	cxlvS8ho0dgWyyFlqYf4TN4ZjD9924uuWKgJEYI4cXC1qU5UTzMs6BB8Jtfr5Q2Slm/XQzOPOCIVe
	MX5cXaGw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2Iy-000OVg-27;
	Tue, 07 Jul 2026 11:41:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2Iy-0007v7-21;
	Tue, 07 Jul 2026 11:41:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr
Date: Tue,  7 Jul 2026 11:41:25 +0200
Message-ID: <20260707094126.1738410-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

This device is used for 'sound-dai' and needs #sound-dai-cells. dtbs_check
raises a warning regarding sound_dai_property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5ce2825182fdb..9cf9f6f08654d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1599,6 +1599,7 @@ xcvr: xcvr@30cc0000 {
 					      <0x30cc0e00 0x080>;
 					reg-names = "ram", "regs", "rxfifo",
 						    "txfifo";
+					#sound-dai-cells = <0>;
 					interrupts = /* XCVR IRQ 0 */
 						     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 						     /* XCVR IRQ 1 */
-- 
2.54.0

