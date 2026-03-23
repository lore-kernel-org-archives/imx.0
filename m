Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A4C39DBF6;
	Mon, 23 Mar 2026 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270810; cv=none; b=AfjbASRGf4/RxYXpUn1bhhjokABMWH5hkVMyKP0kcQTc7lAYdQicZ6T5S+Dyf0sQT8BDGTa7hsT6Z9z8QnX/rk60nIgb/2tqnTrLCvDrG0wptSWDPvoZltnxtG5eiQPcJYow1NWve3yjUJLaa2hsoL+qVqrl1Ov0LwByNNbq6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270810; c=relaxed/simple;
	bh=zxkYEzBprAQ7CX9LLq1GnZjcF8fxCtk/0O0tSxN12bI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SedWw1kHRVXCoDcSwLpUYZww8TVA2oRwQ6PECmUUSYB6bqXVmzqUnVlRT7FBD6TPobQkuAluMuNO69PV28Fx0pPCf40VeYEn81wyC4GnyW2BGU0QibWSRz/D2Puix12dbLmYM7Z8zDCsOrgtR9gUFgld0vy1i2BOGjL5LJQzDIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QX7VVrBY; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QX7VVrBY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=E+lQ3UMGEmSVPIolXgNgOu9XRCtVf1fK9RjoJaMgZkY=; b=QX7VVrBYq2qK6WXc7sUB/4ygB/
	AlQ6sc9ElDGRL0KnG3q8A41jH/skcTi1rgKlttf0Ji9nlSsKd5dCzkhtrVmGhPew+wRd/5F9DR6aF
	g1j9lMEVGqCGrAi/VTNYF8pN9UYVlYEK9sUQE2/NR4g5kc0xJmOQjctQYQ2bJ+5135CC23rC0dbPc
	F4ZSIdERPsLlkDClYgRDMi4Q21RSEl2x08TZHApUhJ9G6KK/2lEGingYro/X9ZqRaFHXhiJytofXf
	EBPELlwSxSCAoPytD0teQJ2DCizDVJRoI6dYpz0wHeZxWZIBWrxjeoKbHiRqoBJMy6y2cg8uORDUz
	rYNPrV3Q==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4et4-000Jj9-2e;
	Mon, 23 Mar 2026 14:00:06 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4et4-000KoI-0F;
	Mon, 23 Mar 2026 14:00:06 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add vcc supply for BT device
Date: Mon, 23 Mar 2026 13:59:50 +0100
Message-ID: <20260323125951.611042-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27949/Mon Mar 23 07:24:47 2026)

Add the vcc power supply for the BT device. Fixes the warning:
btnxpuart serial0-0: supply vcc not found, using dummy regulator

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 94e2a7df35560..90d6b5ae215fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -587,6 +587,7 @@ &uart2 {
 
 	bluetooth {
 		compatible = "nxp,88w8987-bt";
+		vcc-supply = <&reg_vcc_3v3>;
 	};
 };
 
-- 
2.43.0

