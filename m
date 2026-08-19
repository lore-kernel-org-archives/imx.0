Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F73CF69C;
	Wed, 19 Aug 2026 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119896; cv=none; b=HdOzaGkkyqwNm4PduEh9ZudYSXdnlpRCTaE4N4MKzVtNphUtJnkRdfiO9f0dlv3a0Meb5+OMMg+Vun5ZpcSsVPBVQ/Eup1hP/Fjs/UzduP+msTWjc7AD9EEzk1wpmIEVcim1BO9GGjDegLU8a1Dnbw3chQRE2oqY5TB/XZGImcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119896; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AymCZ/2okmyv0uKpcX9hCyDvMqKMm9M9ztvy/lc6FpkiKI0KE7L3ykHX7urbgSK8i1thkMyTo+q0NZ4XggvxciCpg3sGSazE9ppXNLbgQYggGHzIBiI7cDxhbw385u8eKkxx86W1/Sv3e3N1bNbrqEO2uSY78OUoqsd+2v3FKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnzRxd/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnzRxd/e"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33612C2BCF6;
	Wed, 19 Aug 2026 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787119896;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnzRxd/ejNSKg3e7GiTEUffPZ9YVqQ4CtY5hGrfnsMiz0ipR85BJ4I8O9zoyO1FlM
	 sdyGpn5QVGIrcXueRP+eplQCcpllZtL1vvHnI7NePJOy/OuaqGxkt9/Cu0kY/3MQ7a
	 Z/8IigaSCxksJ3J3+5ljs75Y3t6Wbet30fvd8cWIGUOTBH4liuJlcmMTR9dIp419eE
	 pATr8U+mqd57V1BMi1Agh49g6i9yuI2vCcFwUA0vWkx5LONPbDy5AGoozsRXoCKXdr
	 wj6792lpI8+fKvX6ADfJz5Jo1c7Dq2wPuCeQIt5xr9iB++5bSaz8TFE4DEl7DN7cWV
	 OaJHtZTpTM6JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE9DC5B572;
	Wed, 19 Aug 2026 06:11:36 +0000 (UTC)
From: Pankaj Gupta via B4 Relay <devnull+pankaj.gupta.nxp.com@kernel.org>
Date: Wed, 19 Aug 2026 17:12:12 +0530
Subject: [PATCH v37 6/7] arm64: dts: imx8ulp: add secure enclave node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-imx-se-if-v37-6-5ef5de9ff1dc@nxp.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
In-Reply-To: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787139727; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=BnwimiJQNaboqf4SvUefnOP0IbjRhxbbgIwU454eHhCs28OwGyzXaz3kLMc0ryjh+FKxLeUA5
 OQ6sxD/msfmAIjzmZEEU4KGGR/oLb4j+jtVeZAJ/A2rOCmjH0HgLObL
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-Endpoint-Received: by B4 Relay for pankaj.gupta@nxp.com/20260817 with
 auth_id=962
X-Original-From: Pankaj Gupta <pankaj.gupta@nxp.com>
Reply-To: pankaj.gupta@nxp.com

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


