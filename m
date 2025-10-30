Received: from mx-relay24-hz1.antispameurope.com (mx-relay24-hz1.antispameurope.com [94.100.132.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F682D1F44
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.224
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828666; cv=pass; b=hjLuZLNPJAt3NVRACR5M/T2sU0/hRRYU1Pv1qKt2hzubU76gILU1k4PAVKPPaMLAocrBhyaVvUqyLEh0SMH+N7ZazIgqmj3r20kt7cm9+revC+XdwZm/02KrpjzsjA6r27Ks5dGPDMP2X+Z8fJEcTplRi1pRDgLCoPac4roEA80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828666; c=relaxed/simple;
	bh=WEGW24WPzjWc2KNh4+viKAoZJgq3f6jFWXB1Ds1Y+bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4UPAOSmGkp6a/D7DO1APjvRV2d3EX+JUFgzbj7qczpFj8rOiE9wkFQYeixhNDhJBgAFVG37AzFqhJuGACFnlZY92pU7+qoZnD68/3nqN3ZZFaXnEEwjEYcFAGK8/YUH/jHpt9+lYOH+wvyHNM6dx2EV1dEyCKvlWpUFK4RHxhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GHlthLiW; arc=pass smtp.client-ip=94.100.132.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GHlthLiW"
ARC-Authentication-Results: i=1; mx-gate24-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=MLLHlgU1kgOKOY9uazP3g/sgaaBJysCOurDX7bu2Hg8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828607;
 b=NOpK+uXwzCaI8t4zKonnoYZFQ5WixSueQSwGk5Uh6mJL42J8C42pJyozzjG40Z28J1/9HgVU
 HEN2F8ZX8A0WpfBpnZCAqljqGrzK1OA5f4UC4emi5zxyf6Q9RvhtcmhngjCsqXz2FGRYBLM/S/C
 VO1CpsB/9FpgC6u3Yc8ieJANHDN9FVgxzHrXxVHvb7nVF+E6aUa19iVVNs5SupiFI1rAll6S/9p
 rYEbhsfjbeFGXP/SXczfPxjzgpS5XwGfARKRyEaBnZpS+bOd22/TSNxLVj5AQU9ppbegd1wPKh5
 AbqWZTOvDMm13ib5jfZKmyDGAdH77qG5Jn1fCD3SSI5PQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828607;
 b=nSNmu05PQ0+8PRJO5+x1qPi8zQNZlbq+7sY14Az9hfglnjbHZpSx7SmJyWKQH0mwpSZbb6oQ
 vkQDRcNjbAXFnePVCnelbMlccrC/hik3MF0KZIdXU4lVT1A6wVHM0GuwTmhVtedz7gRhgFLBBUv
 V3WLEnAue+B2njVoquKRILa2Pbhtp/0aGBgy6jLoXNXoSZPyUnniqosQZnoYUW9KtsG5vCR/qsk
 5iH9sUslN/0zfEdbYp6R77YQYIkqiO4aaETMW4Pa0sy5zOmaeEPK0rM0hxhVEB2xxfw8SvBT9uf
 6GSY3FPiQBmjkFV8Fp1sDTfkxXWeOn9ews5psuzYv8iOg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay24-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:06 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 62C05220D34;
	Thu, 30 Oct 2025 13:49:56 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 05/19] arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
Date: Thu, 30 Oct 2025 13:49:12 +0100
Message-ID: <20251030124936.1408152-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay24-hz1.antispameurope.com with 4cy3q90T5vz2fdgJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6a48f4ba851c95ecc7e4057f5ee77018
X-cloud-security:scantime:1.826
DKIM-Signature: a=rsa-sha256;
 bh=MLLHlgU1kgOKOY9uazP3g/sgaaBJysCOurDX7bu2Hg8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828606; v=1;
 b=GHlthLiWp10WfU28fYPi0sh1KXUuFAtwNv8kJeCKx38h3NzmoseuVTKgr//LqwWqM9jdMPfw
 VaREHbN1mfzIDen81yKGZtPLajeKqivFZJ0pAt7QcejtHfznrhlJzqZMSvQ5AooNFQiCgZndrnQ
 iwDlbi0bjE5nUCQsH7lGPuj1qb27v6QYBnZSn/jOk8F5PkhW7lb/xJroyk89GXmZUyeibQ4nSms
 Ho5Lpptz2WgoxzxKabxgyXjMD1VHR6YStIspj9kWtEAgjOwQfgAmNVMo+ZDaNF3dsw7W4hIRztI
 hH8dlQOHgZgP5Iw4L/5IdYAwy8pf9RTKHWok6X06oE+Ew==

The muxing is determined by SOM, so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts      | 3 ---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi         | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index e3c7554b7f709..43ed55e57d2a3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -200,9 +200,6 @@ eeprom2: eeprom@57 {
 };
 
 &lpspi3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpspi3>;
-	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 759a09a912be1..8da9e368c1f4d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -317,6 +317,12 @@ &lpi2c6 {
 	status = "okay";
 };
 
+&lpspi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi3>;
+	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>, <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 /* SER0 */
 &lpuart1 {
 	pinctrl-names = "default";
-- 
2.43.0

