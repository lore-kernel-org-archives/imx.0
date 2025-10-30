Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA3343D6A
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828668; cv=pass; b=ZiCIk4jBOL+bJv3rhuA0cCUktkKaG6GxnkoYaWY386j43HXStxHp0BXieTCugcku1jSZ1+EWx0xesE+MxqgzTT8c6VzKN06ncFY7B8MjmdjXiMtmSB66YKyXyg6X5hSWrG/TLdQUh5HgjmF0o9gV5OZcsB7J1Ej3hab+D8jS2b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828668; c=relaxed/simple;
	bh=RXYjUkTJGEzey6bj9duMrj1tLyzMQrd7xG/D9di9Oss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPo+p8/iMQGtizXhbvZ9EEIFjs0Jeo749khSA3VEUJes4fzmeEncnxAXdWT8aAfXaj2YrBseVaGfwzeM17ha1y80I3v5GXZjseusrHyjMAwo+Zm6u2J+SJWe/+B+UQpWSaoDWz+yvpCXnrbP+6qpOtJHM6tDZxIwLG7xedrKo1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=anAsF3rm; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="anAsF3rm"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fa0W+DLjU6OOWbYOutYrRj99tl16LW0xzYOEJzrNODs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828608;
 b=eI1BzNKx+3g20LOBbM51YV4iKWACtWv8ewM9zPI8wKWZKGpiCimpyRxKQfrhPn1tKrDym3et
 Akrq+ZX7gbQr3COjfFlA2nfZozNzGOCY5JozxClragVwslj9qIoT5MP5ey+PRhg4rxanN3yuDgP
 Sd7buZxck0wsUZT/5nD8VsMWjB4W56zwc4dUEcu/KpDeiytCfh1ms10ZBRpsI6F2fjHC+xnoTKY
 O6MrWaxfcf7nzJ4N90YqFGma9sJHX07UhKnsUrGjhyPEQHnPKRb91ixYcWWno/WqDpiviOA4Nz4
 E19r2IZst6fl7hS4r2ixd3kRCxqbv/rfDwEuscUNam2ZA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828608;
 b=fKYRJWNZjFJyB/cXcKdCdHQDjpLhSOpA2O9ETulZe695Nc4EazVAe16zKnp3wGflLVzhPM07
 bxm3mJSFuD8/J/hB75dTA4mIhMyLYbaS9HMZdN5TL1mdZ+fpwxlFY7ofovH9ta+KZixYPE9IF0L
 343upc0jELejYp4LruE0miDUz1G0ek4S6CZcgP4Y6N7qg0zt2sGSk0WWLzaTk1Pfq2ndfqKTRfT
 zt8rfdoWC6MrHTCPH532Ek5NMLWOyU/m3WeKqf4fUZt3JznGKEDdSiYz56cl6/rLM+n14k2oQx0
 qmgKWGtnII8/I25NzR3Wv/adiGo93YNK0pKkSBi89pd1Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 00EF9220D32;
	Thu, 30 Oct 2025 13:49:54 +0100 (CET)
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
Subject: [PATCH 04/19] arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
Date: Thu, 30 Oct 2025 13:49:11 +0100
Message-ID: <20251030124936.1408152-5-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cy3q7583Vz4Mb31
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:690fe049c6c3fd8ba19a2c0a294a5505
X-cloud-security:scantime:2.329
DKIM-Signature: a=rsa-sha256;
 bh=fa0W+DLjU6OOWbYOutYrRj99tl16LW0xzYOEJzrNODs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828607; v=1;
 b=anAsF3rmpZJa9mCioWQdH5f8mzxFCDtpmp6rvW1e5DvmopgqOrGL5TqXxhD15R84Ew+ucxy6
 vJOgArrSYIlWzDX6K1UZ1wD8vvyH/17NDSvejj97Md8jqMgznvgQXRm2u9UgzCf/zXCIephD2iY
 wPl2CL6w/aljBwRBwUjhUoFDW4gJbTNrkeAHWjEb9vGPqG05PuETbh8Gbk5dXIKHC5PiTYeTa6P
 fq/M9W19YVXkb2K36cEsVScqhdu12YgB0nNLgBQ+GU2SAt8yKtUsgoRiUyZKMnvhvmKXTJ/nwHi
 1W2WYWUu47xTITHfSfigI0xEzXIt7A9dILHzUg0DVObaQ==

The muxing for flexcan is determined by SOM, so add it at this level.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts |  4 ----
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi    | 10 ++++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 5b6b2bb80b288..e3c7554b7f709 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -172,15 +172,11 @@ pcie2-clk-en-hog {
 };
 
 &flexcan1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
 	xceiver-supply = <&reg_3v3>;
 	status = "okay";
 };
 
 &flexcan3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan3>;
 	xceiver-supply = <&reg_3v3>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 52355a65a62da..759a09a912be1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -106,6 +106,16 @@ &netc_timer {
 	status = "okay";
 };
 
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+};
+
+&flexcan3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan3>;
+};
+
 &flexspi1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_flexspi1>;
-- 
2.43.0

