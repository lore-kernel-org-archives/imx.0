Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42E39769E
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127377; cv=none; b=JUq0jTYpOUnpJlKTTWnm+Tf3s4sqt1KKrQXRb1/C+3Uj2VXT5W2FkhybFz5pgYL+tVi710x/Z0WjAoJg3tjPSXSkaYDO+V9DYOZm9vZIPijMEKPM3HRqTIffVDUfg//CISEHBoDue+rvp6lvBLiu0VJd/UQ5YdL75ayE0CzOk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127377; c=relaxed/simple;
	bh=9EcbegmdJVnD+T2W+Vt1SnOeAlQOR/d7tThScDFsK0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouUy9WzgtvmEfKAknFlvYzyfEzmXumrsxayVqQGte4BsD4YpgB40UEAHeM6Wd5LqkMCiHaQhiS/JCnrjeUhyiP0qfhNnkq1AqTi1ztqftbIl80kn1xe+V9BS71JAkrpK5hRWWZa6cYkV8NKJVzCO/dkA0TDsdh0Va7jSGk0GX/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=aafphOAj; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="aafphOAj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OjwHf/y9TmPHoA5PmDsnJWIwaDDDm6wVm3D9G4XLFnQ=; b=aafphOAjR85bdn7ZYAHE+UM1Te
	T82a5jNN+f/j2eEbCQpQvmPuJBXMVVHWcGu0k3y8dewYnoeC5EJvFIuOku4gdV5Xpjuc16Kl+iKO2
	i+3BitC2Q4yCJPs4JMRE/vbWyXEiAFjhcWkfonrKo0dQw6boYmIkNg6B7UUYZDMCUdjA7vHec0lVp
	eVIXJdK4HEFQCB4nQj0rrYmVJdpF+0UDKhwg6hAkwLxXl5VbYJM2dKQxlC5b2h8fsJwdLWVNPVWim
	DUfowmbt24WEeMGGoilm1TyiyJ1QhN74L2il9CHDOOA4f8ipfgUZvhcKMYlTZszwa8W6G7DVgvcEe
	+2SAis1Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-4955;
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
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-phyboard-segin: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:13 +0200
Message-ID: <20260402105613.1303871-5-florijan.plohl@norik.com>
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
function on the PHYTEC phyBOARD-Segin-i.MX93.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index a982606de1ee..4e4356397ba0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -145,6 +145,24 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED", "I2C1_SCL", "I2C1_SDA";
+};
+
+&gpio3 {
+	gpio-line-names = "SD1_nCD", "", "", "", "",
+			  "", "", "SD1_nRESET";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "CAN_EN", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "RTC_nINT", "PMIC_IRQ_B";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-- 
2.43.0

