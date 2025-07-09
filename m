Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536926E70C
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045395; cv=none; b=RGfBVOU8KGmZwxmt6vNmv4/xtdTWmVhC2ZsPffBrfvrJ9tOapkk/GsnJPmrTv+JY8ykta9d/J2Y3aJGtg/Fus9eypY8pZb1eeBH0tyTJj8P40nVIJnN0q2Z3q3IYwQXI0dxdYUV4klSnTFnOnVukuTcm8XEVKnD8zJYWivG4+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045395; c=relaxed/simple;
	bh=A5ydc8W1+SJOfpLi3L5jmQqQk81qpq1R3Ywu7SJuSNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbiMEyjInAoG5cK1OvLmLH0QLy7wIq+L+Si6rOEeAjweF5n5IsQ/FUdhBICY0x/FRDrV+v1Q2vPJWxpf6697Vr33CBuadPRBScgkICmiCtgNRACr5Y+46PCxGlsjE0Jbd566vIDPaBdftrz4WmscbjLg5cBf4zFL5/8r3JTvosA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=FSOuUeBG; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="FSOuUeBG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30DABC74C5;
	Wed,  9 Jul 2025 09:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752045390; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5/x0LQU6h5m+accG5yRCnevzY7hAOL4oLP0QEZKYMc4=;
	b=FSOuUeBGXiKRmEDs3WIpeRPvwFjwwQJhK5SDrMKnAiEVTQta6jmM0uGuXtnGzWk7nR4C1B
	rBBZLOPkI9IX2l93q3F0YAfOe4sSyfH9ppMMPKCRONh8BdhO4/tEqjmg6GUmOTOtPSUaIx
	Ui4x8hcW7c+t9E0gmKCzctIjkmS/KvzGiXbkevLhLSBZgy9tXEqPU61xbYgGJ2DEo0m7HT
	qFRv2gULnyo8eHr2+zr+A/WGmZ59xOKoddgg+UpTI+Dh44NDU6afZRvy2GiGMpHmN3Fel4
	ezMPeHmF0D6FphL90pTFED4r57B2yKS4S8dTK8igsxppyISpj8uDAqRKOYTT1Q==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Wed,  9 Jul 2025 09:15:54 +0200
Message-ID: <20250709071557.20602-1-frieder@fris.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Describe the partitions for the bootloader and the environment
on the SPI NOR. While at it also fix the order of the properties
in the flash node itself.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Fix reg/label order
* Fix reg order in flash node
Changes for v2:
* Fix name order in SoB
---
 .../dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index dcf88f6103466..779723b04575a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -26,8 +26,29 @@ &ecspi2 {
 
 	flash@0 {
 		compatible = "mxicy,mx25v8035f", "jedec,spi-nor";
-		spi-max-frequency = <50000000>;
 		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0xf0000>;
+				label = "u-boot";
+			};
+
+			partition@f0000 {
+				reg = <0xf0000 0x8000>;
+				label = "env";
+			};
+
+			partition@f8000 {
+				reg = <0xf8000 0x8000>;
+				label = "env_redundant";
+			};
+		};
 	};
 };
 
-- 
2.50.0

