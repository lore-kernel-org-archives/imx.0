Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E839659A
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127378; cv=none; b=QzCvEFbtQXcgGrxU3jGavqOHyqtoD7RylmOyVuOw281spfWv2nSqumdWFe1hKp8pfLveYR7E0I2BUYhznyrgTg46wpuTwmCMtR9BL8hbtZ5qmuwSfE0k95IXbe+Af9+2qdLD6N55d0oZaW4SWMH2CQIhcU7L02Rx6P8CE2gGOjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127378; c=relaxed/simple;
	bh=se1NbwLgkKepQEgClAtuOlG9UWWIHCEediGM/ZRTUpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emkOblvRYJkAisgantavJft5wbiy1wkHaqz6tQ52jVvIS1yN+SHpcxZh8ufHjrbikXhKznA/RGFsjOaqYikw4pjr+gDp+ithica+giWJjO/xlOEODR88mE9bJdnc2O0KB80bu+WnBUEJJ/BsvOUzVVQy26EYMtTLnZ7vEdPndJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=V0CLWWY/; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="V0CLWWY/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+BoXlgipnNG+DuSePjmrCMzbqdgrmzoaZUj/nX6RrCU=; b=V0CLWWY/sLKZOW2STEH4RHVwE5
	lJ6E+w2HmPYIM1EE63oh4TJY8ytqInDyDJQUSRz7tCH4PC4p8+97rtCDGi6YU4lrzNcXI4eUCFHTG
	nthOkKpkN4rgKQzG7FIHX3BZyfR2eVX4W72Q2r02PFnn3oZAHo1lil+oRmWICWezomRWpXTgiTnye
	TlvSbl/iVm+2ato1WcY75+2qn7PiJyNeF7umexTr/E8noK42Buq6hVCqQ0AXJVynkSNvQ0cvWveZg
	avFwqOnUemws9/jGto7K/UyUOejlkabJjyM1becDskHnwbV1huaUGKll/zCAMpXNemkzWMy5eZL5/
	ni9TaIOg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-3jLJ;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 4/5] arm64: dts: freescale: imx93-phyboard-nash: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:12 +0200
Message-ID: <20260402105613.1303871-4-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyBOARD-Nash-i.MX93.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../dts/freescale/imx93-phyboard-nash.dts     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index eac389ed30f3..b82192f25498 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -141,6 +141,37 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED", "I2C2_SCL", "I2C2_SDA";
+};
+
+&gpio2 {
+	gpio-line-names = "SPI6_CS0", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "TPM_nIRQ", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio3 {
+	gpio-line-names = "SD2_nCD", "", "", "", "",
+			  "", "", "SD2_nRESET", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "nENET1_INT";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "nCAN_EN", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "RTC_nINT", "PMIC_IRQ_B";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-- 
2.43.0

