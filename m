Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E437F726;
	Thu,  9 Apr 2026 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729895; cv=none; b=N8Jc9AkgtJCa+yuph8vqMvzzW+SQ7XbSdQBlXV+txBS6BHVDfmAZPBgcPqA83AQRQszJxlX5k6A7WmIiKmBKJlRIHwiojWcprkvw3UtZaMWQeGlcf6lN5qsWmJi0W6BUhOu2bGHoRwTZzx07YwADe6UdXFMjgvAd4kkmyi3Qn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729895; c=relaxed/simple;
	bh=jc6SP7O8WBRvAHXApukLlYFJwm9H367fnx30CF22FKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmZ57m41JCpYf3R7XhriswX138C2/MkaIxH76GQM+YsA2kOueoz0Sf82TTiTgmYZEG66BhyvJkMJEmDEOX4JnYpiqDo8xSQs0BKOsmVPkbrP36yG2//We1k5mOmwRqR1AoL6f+6F4k3eaA724NOYZXnwJNMW50u1Af9Z64NuBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lmD3ldwB; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lmD3ldwB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=86el+SLw/QgiWOEupwoMilPrwU17U7TooJ52U2GyoRY=; b=lmD3ldwBZT/G/8ilO/sURQ2035
	qDVZLKQPRAsz4WGKddDz1weC2WTp0WpEE4ZThCvq56e3V4siH00SxmRcEUbswTv4QPWorTTKmP/v5
	edyFfQK515zZicg/dRcTWpTdSz9/IAK4dPJr1p5h7R5vwQcTKy8bOpVTanI2JXVBBmaKU0j2x2kZT
	OYbLmbNk6273Nt9ab2F6kQMb0prGHtb60uGCPL8FFk4GhF0IaljmJlTUJYbbVBNMLgbIns5Urc1GG
	837beWnyXa+kQJdo8SWvEESQdZBc9/xbDaMdrTngo5ZeUJXAuXuQ+hvUtTd/a5GjZYXJsA3+xuH+G
	J09upCAQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAmSZ-000CCL-2m;
	Thu, 09 Apr 2026 12:18:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wAmS2-000NIs-0Y;
	Thu, 09 Apr 2026 12:18:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] ARM: dts: imx6ul: add #io-channel-cells to ADC
Date: Thu,  9 Apr 2026 12:17:57 +0200
Message-ID: <20260409101759.4159324-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27966/Thu Apr  9 08:24:43 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This commit adds io-channel-cells property to the ADC node. This
property is required in order for an IIO consumer driver to work.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 24541fdf49ceb..d2bfa08b5e767 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -951,6 +951,7 @@ adc1: adc@2198000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_ADC1>;
 				clock-names = "adc";
+				#io-channel-cells = <1>;
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							 <20000000>;
 				status = "disabled";
-- 
2.43.0

