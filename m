Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE6342177
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828668; cv=pass; b=JKi8a1rEKycFGKep6ZfA+NjpanfNya4H+9DHUDBZIuEsNTCUdiOx9n0XY4CwlfYJDHZCd1tpzem/4zJqeaifrq/9y8TfpNMsDxZgYhkHTwE0xeCfbBkSRZ5PfxEkI2awy1rxAzZ335DK5MQjZrw8LGYP7izjrI0ua+uVwYz7wmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828668; c=relaxed/simple;
	bh=MxFVFohRZKm6vYmHBOWCpbni7KD1iEQ0SAmlRMH+Sfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2t+y/Ab02/S60XEkPDot8FmLbM55fAD+vGgLFB9SvM5U5C9aE4PgfpznaFjJWHHWCXL3sMjtlkk5e38QO2VASwsI5VrMaeX8j91O25uAv4RhOWuSO/Eoei75TX/SCNCDiKRSPwmSNLm63x7LsXQhnWsshN9w75eh3A57SEXNY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dogEg61X; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dogEg61X"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=dJM31IhVnkrhRCrb49g6ODItYSKCRzC2GROjcDOi1x0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=WdewHqPqseS8SmvUN16GT5qCzc0ba7r0s1389BUOr1xw6alTqZOz/lrFajFOr1diffTsePow
 Ouyq+rEJjn5JoU2Z2wS4VVSWcdkT6MNX5zHXK12LPU13aRZv/0DLUXgaEL93Kcp0EWmK8FPqU90
 aapemjvsL6jPpMLg3s1O/kGuSUUPNabppArx3s/4zZVUC23OhsPQbkHN+kaOFa9f1V9JcLA80E9
 xTdPMV2XNmc4Xs4QFFQJyUwDOwZzyArliOGTfHhd0cbiXZrr0xjdY3sWJ9d3nXQADaTlBSXFPnZ
 L+qBgDagfYruTg5aq/+csW/5RxE8D69N75cv2UlxXf3yw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=F9aakgye8qIIY5jOFN4fbhH9avEB+eKScp3DYyZziiYf5nyFJBOwIBtKBkuQRXZdMkprY2bb
 8zi4xtV6UAK6zoB5nUOniKRfwR4EewHLY33kooSj5xD3eZEwPUNEeknddxsDEJJ7QW+ykG6Qdkm
 RLeesUHGqbekrU560EYw8e/LO2R3VEqNwMYQqf/dXz/Ugfi+wlGmYRfWItoD0e3OG8f4cLXjW6Z
 FLq+kXyvGc+WqTMDQ8oV20Y2KwZ9j4v+gfgG1KSImPNzOe5LaqFnwPkvAC+Q0WIsBJn/iTpCeyF
 wnj8VrJEJXpNv2xPKZWGRlnGyEkJmemiTxtbQtIH8i2XA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:11 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9F4B6220D37;
	Thu, 30 Oct 2025 13:50:01 +0100 (CET)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/19] arm64: dts: imx95-tqma9596sa: update pcie config
Date: Thu, 30 Oct 2025 13:49:16 +0100
Message-ID: <20251030124936.1408152-10-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4cy3qG2sY6z1kNh4N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0baac1aa37dfad4f2d55415cd4bd5fae
X-cloud-security:scantime:1.795
DKIM-Signature: a=rsa-sha256;
 bh=dJM31IhVnkrhRCrb49g6ODItYSKCRzC2GROjcDOi1x0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828611; v=1;
 b=dogEg61XZgS1MJguqySCN5AG5Ght/dPk0TwccsQKSeekVf/ZJUtuMBjgewvSHYf1LptdTdLx
 iL4hqocSLkPTeF9ayAxKsvM0Im8NBvtLZXLGsSnXC7NtBIIQthzhhVfouzmPoVrvWJmE8BB2KBE
 TGeTJQYBWLlY3Iwl6Ep/E0r/jI52Ij2Y7NUNGsuRERPU6RFdKzlWOiLwB8i2LCJbsNr+te8hlBj
 fD3t0PYIhOxhvLj2z266o80V8BGVO6XBRWFirStxQJxoxdwg/GXgp5SzLb5Itd1pfgSk6QOjuNe
 mdaRCcA9vm//YCl2mGZ+ZuID83acRPiMij3orikuc1T3g==

Fix pcie clock config and switch from deprecated reset-gpio to
reset-gpios.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 832c753abcd75..36da8ff8d1835 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -395,22 +395,24 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
 	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 1>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
 		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&pcieclk 1>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+	reset-gpios = <&expander2 9 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
 	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 0>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
 		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&pcieclk 0>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+	reset-gpios = <&expander2 10 GPIO_ACTIVE_LOW>;
 };
 
 &sai3 {
-- 
2.43.0

