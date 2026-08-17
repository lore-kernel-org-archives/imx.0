Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4483C3F44;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955729; cv=none; b=Y9/qUTn3eTEWigQdrs0G2XDa2o9Qn/jdM70lNy9tGmAfqVNI+tjYiLAAq0yLea0ZwO20A3pkxRtY4j8v7Jg3djEQKmcJ/ef0PVrAdcPnB+69a7PLVSbsJ2kbtYcIF7/xInNK1k/SI+jkwNhf+nD48wJOOlXBueMQpE5w+4iC/h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955729; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ni8OzfWefecf8zSdE8IASsuvdLV2yInUcIftD9ut8MZP4QvDJFtyLZsoJwHn8YUbqeloM/JpclAhexUntV1Y5SFfGbqDtsGaExRDwFsvlWeiSjOCrNHW9t8uPTx1PMh+qPwulypyp31nOErETe9v5lQth+AQbTjPMNUP+eqlyBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWA7/VCt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWA7/VCt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5752CC2BCF4;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786955729;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bWA7/VCtwbRYsD6+O8bnlYvM2i4e1iXd2/7e9soZS6i345NgYs025t9H8gM0tRanK
	 NF+A2ILww07UKgM62ra7piBWwUqpeKsAKMeP5dv5hqgOhqoBkdxGrj4MSK7RCml7Ag
	 8JLsPkR3ikYcTU0eb2FdF1pw8BKtj1orN5J/dHl64qT8sF0dL7PcJyP3n/f/o85p54
	 ojzBaunohN2yh+1OrCmQpghFdWqJJbO9XC3+ETYL0jg88hUWhdeqNlYWXOtPPaUyNr
	 kvEXmU/PPx8fWT1Ee8U2NTEyfNiRYwlNIOQPF0+nMtEWS19OJ2ObL+GAjjVZytfUDj
	 tzs1Ci816yuwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4285FC5DF7A;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
From: Pankaj Gupta via B4 Relay <devnull+pankaj.gupta.oss.nxp.com@kernel.org>
Date: Mon, 17 Aug 2026 19:36:04 +0530
Subject: [PATCH v36 6/7] arm64: dts: imx8ulp: add secure enclave node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-imx-se-if-v36-6-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
In-Reply-To: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786975564; l=1532;
 i=pankaj.gupta@oss.nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=w2GconMBd0dYHTE5ApbdfS96cndjnT9e+BGyG2V/YVY0xKMDWfdvitQ5lILGfSfZXkAzjAZS7
 braODXjroWhDNUeY70fy9gde1aeSyEflbE+MkBeyA1NfiXWH3KQSfyj
X-Developer-Key: i=pankaj.gupta@oss.nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-Endpoint-Received: by B4 Relay for pankaj.gupta@oss.nxp.com/20260817 with
 auth_id=955
X-Original-From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Reply-To: pankaj.gupta@oss.nxp.com

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


