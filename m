Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D916021C173
	for <imx@lists.linux.dev>; Sat, 21 Feb 2026 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771697734; cv=none; b=MNq++vyfojavVqgWq5DmPa7cxGiLKfR4vqPgoXxDyXxn8tf8nlC5tinlXnpo8QkPs22jrmRVr+L6aNZ7nfvMpY6QKR/OMCbA/PuJOoxtO6L2iEI1+omrRlqW8yo3ISGdkf59zsB3tuwdH75V+onH+A78MuflUa9mg71q+qt8ryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771697734; c=relaxed/simple;
	bh=C79fk9buYX7yCvQACmE0txqbxH9EAZk4H/4Pud3Yxv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+s3QAnB6ux/9nKZhtgRg62FmTjgizZf829RpqKcnZC8KMQ8b577WM02TLDVQFkJTx5td4Mxx6vZVzQyJD4/wNkUZzzFgG8qj295JIFt1Hsnl+YwSq5wMSTVKg5EKQ5Ywt5WQt5+pEL8KLX8WxMlVdbhOIT8dNOga5So610mt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=iCut6gKZ; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="iCut6gKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771697731; bh=C79fk9buYX7yCvQACmE0txqbxH9EAZk4H/4Pud3Yxv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iCut6gKZCAxoT0OJ8i71jEgKfnnjG6uPjfyTVvAHwNiLcJakc4OkHt2fNaVj8R+yz
	 Vl+iIWoTfnfXNNm6p8n3MMCQ88kaXkYocAni+Zu9dT8KQPelszUVP0eHyLCh//Pr7M
	 na2ObQ80iHTC2V/5ptPBec6bG80k6n+dMsNPTJ5BcZdUSKqKYCprpgzmnETZZ0nz42
	 Y//7Q6AWP6z/vWwDOWogaHsahHm8mlHL8JKN1uNL0EPsbQ6KZ20EzACb4ruX5kJ1Y8
	 Gxh7vJp0hJg1j9DDPLG+vOakRfauXrLFngGiaZL5wWCS61b9mJWeCLMCZ+YeiPdQ31
	 8TndeZS0JV1Mw==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 485931F5C0;
	Sat, 21 Feb 2026 10:15:30 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 19:15:18 +0100
Subject: [PATCH v2 1/2] Revert "arm64: dts: imx8mq-librem5: Set the DVS
 voltages lower"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-l5-voltages-v2-1-dd8885bb9331@puri.sm>
References: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
In-Reply-To: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2771;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=C79fk9buYX7yCvQACmE0txqbxH9EAZk4H/4Pud3Yxv0=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmfY/QvYAlXeTzXnItGtg74YubqU9KDhiDujlr
 rybx2UymF2JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZn2PwAKCRDo8jXPO9vD
 /zeqD/9emei1CMfBkgjXYjY2Q0/v76nJPILYxZsNEn5gcA+55aGRX2dMzFuYzpJtN0WdyS9KRbB
 Ky9gosOAlSZ+DkT/iDMlTFEIW8nabbVk3jqWPodwwK9IQEn9NvJ3EJm2lBv0gYyArFjj8ldRxwS
 Cfzr8mXCRYmC22BjHe/reSO08WHG4HjoDTnIUVcuIgF9V3+/a/kNtjreDZTSjvfCSndP7TOUkLi
 5YF30sz1QmiSQCBA9hkEPAdkjmlJetuXUoKbuvBQ6U6psE4Xkl9DgvbJkqMtXT6wwO2ZwbzL7Wb
 5s1RILLkF/jeKZYwUTtYJdR061qKqptdki3FVRxL8mu/h6Ui2ADytRnm5wDRLVun3ladMihlziQ
 WoPEfP8Jvv6LZd2am6HfChQJJNfyPu1SeW9EyFeB02Ao/d7VI7MY+El6RTmH5WbozhaVwrhB6Cc
 pceDzqPx/Fq0+rWUYUDosVQiTOQ4FfNJrQ/hoCau47zBIb+3kJQy5ndEbO73ZHOH9rIuh9H0Aee
 dqc7MwplmCtitzFiBGxxESFsTaNYS61x1f4E9DkMJVqI2n45FyzGqQ3M4akKsJVYaJ/9HJX61fq
 LwRtjD0DqL+mFOPnNEuR+mFmSC8DO5OnfPUgrRRA52eWX7zZKX8AYRscsvUmfc8sGsnRgqc0WAe
 Nsp047insz8ojmg==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

This reverts commit c24a9b698fb02cd0723fa8375abab07f94b97b10.

It's been found that there's a significant per-unit variance in accepted
supply voltages and the current set still makes some units unstable.

Revert back to nominal values.

Cc: <stable@vger.kernel.org>
Fixes: c24a9b698fb0 ("arm64: dts: imx8mq-librem5: Set the DVS voltages lower")
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 22 ++++++----------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
index 077c5cd2586f..4533a84fb0b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
@@ -7,7 +7,7 @@
 
 &a53_opp_table {
 	opp-1000000000 {
-		opp-microvolt = <950000>;
+		opp-microvolt = <1000000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index eee390c27210..7818d84f25a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -880,8 +880,8 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
 				regulator-ramp-delay = <1250>;
-				rohm,dvs-run-voltage = <880000>;
-				rohm,dvs-idle-voltage = <820000>;
+				rohm,dvs-run-voltage = <900000>;
+				rohm,dvs-idle-voltage = <850000>;
 				rohm,dvs-suspend-voltage = <810000>;
 				regulator-always-on;
 			};
@@ -892,8 +892,8 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
 				regulator-ramp-delay = <1250>;
-				rohm,dvs-run-voltage = <950000>;
-				rohm,dvs-idle-voltage = <850000>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
 				regulator-always-on;
 			};
 
@@ -902,14 +902,14 @@ buck3_reg: BUCK3 {
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
-				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-run-voltage = <900000>;
 			};
 
 			buck4_reg: BUCK4 {
 				regulator-name = "buck4";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
-				rohm,dvs-run-voltage = <930000>;
+				rohm,dvs-run-voltage = <1000000>;
 			};
 
 			buck5_reg: BUCK5 {
@@ -1448,13 +1448,3 @@ &wdog1 {
 	fsl,ext-reset-output;
 	status = "okay";
 };
-
-&a53_opp_table {
-	opp-1000000000 {
-		opp-microvolt = <850000>;
-	};
-
-	opp-1500000000 {
-		opp-microvolt = <950000>;
-	};
-};

-- 
2.53.0

