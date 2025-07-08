Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598E2DCF6E
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979398; cv=none; b=BpenIMoQMDEfbmXcHxa8M9K0ZaqnNZRv6HxwWTn4QwUE+/IE9EtEpiNlo9EV19TZW9xKL4OgF3c/Sz0nG5ZO368cH/vBNYfD98a11vFHAXkrSuMkQfiaDqQAcMFdNr7jTTRg2qNAOCB3t4OlkyuEnsJJxhDh+5uto39jSZ1DVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979398; c=relaxed/simple;
	bh=/kxqqzpLlmJ/N9K1NP7qRVmX2I84Vcb3b5VUIBH1vzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3tEdC5qUw/l539ObicfmAHznJY2vLNiCFWT0CC4CIBgFBwqSy4qH7gUvE5kgQBoVgWv9wpV9xD1BCgvyA+Gd7M6vzOzEklutOrBtT7G2LqfPSO7AeKpkdLOxATaUo3OLAyJf4BaO/ITfZdM6ritvZOnr4ljSrZ164dU8GR34TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=gzme/i39; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="gzme/i39"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30CC2C74C1;
	Tue,  8 Jul 2025 14:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1751979394; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HunfPC7TUaBGnQyNIJ7LjqpsqsyTSijzgEYKwmwZIHQ=;
	b=gzme/i39xeeEDCV87FcoyIuCQf+1WHy0Sf6OdeNTJvVv9My29N7bF1yJAb5gA67BV3Myxt
	Jx9xgTP1sJKeNN/f7V8tFDatkda8NYL5mrrrr554f47zWp4f6SNf4GA4P4mz4Yh+9nPoGM
	v4V6uAzq37EJ76U9xDgIHdVhu4deKte/eLAh+aEKLNrwOfC1XwDPQ+oiuuquGIiAGRh79S
	jNJKnUcKT5mwMf76jyQ3B8OJIG5w0xsPxTzXoGw8IUy2nEkz0APpcZFhj5yS3S3uagfgNZ
	X8UG3PMpmwgNbcovmX9pbUyaPe970TXnfN9Dj6BkwuUmtCq6ldEVMm8KLRCj5w==
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
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions
Date: Tue,  8 Jul 2025 14:56:04 +0200
Message-ID: <20250708125607.66113-1-frieder@fris.de>
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
on the SPI NOR.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* Fix name order in SoB
---
 .../dts/nxp/imx/imx6ul-kontron-sl-common.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
index dcf88f6103466..ab149c40a9cc1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi
@@ -28,6 +28,27 @@ flash@0 {
 		compatible = "mxicy,mx25v8035f", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0xf0000>;
+			};
+
+			partition@f0000 {
+				label = "env";
+				reg = <0xf0000 0x8000>;
+			};
+
+			partition@f8000 {
+				label = "env_redundant";
+				reg = <0xf8000 0x8000>;
+			};
+		};
 	};
 };
 
-- 
2.50.0

