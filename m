Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CE3DA7D0
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903357; cv=none; b=pf8JiprLWKeSW/JAzkyPzuRsWDWahDjbZgM2HXnVShwEpAHucWJ93zbjr+9t8QJbYf5UQ+205IGhrzeu84eSNHahe7ESKwPXogX5Hiu4ZY9Ni4E2J1yFVXGd7m4lN5Q8ujkIIDqmfTNY84GSbEimwiKX2Jtgh4C/fG/vaecsiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903357; c=relaxed/simple;
	bh=9EpXo9mJfLq62gWnbq0y8rqmR84/Ag97tDfBxlzXkB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUtA50Lkuy2q2NMLblmhuAMuhC6JLWEuT3HTaLWY3xsu9kcJOOYVVa8wP1QGwTErOosYNYmHzQ3ytFjnBYkjo0/f9aeguJdDfYoZh2W3o5lL83WWy8fSsi2PwdLUevI9C+/6bF16WKsRnktQwy8Iyx+Q7szekffKzWYHyDgvhGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=nXcYyEHE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="nXcYyEHE"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 95CA11FA75;
	Tue, 20 Jan 2026 11:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768903346;
	bh=S7951CmhBfNyeg6X5oFR/k3HQrKbwIeGqG50J+wopCs=; h=From:To:Subject;
	b=nXcYyEHE74KQFgZYlqNEYOwELUmuiRjg5OfOpQzSJvGrksJAWOIapHaax/BFHmdNC
	 vOaAziDCQq3TIVmDnugwbW0XJ2MKVA1pw6krg6+geqjdL35ykM3PqyEIs9otZRD2LT
	 u3JEsfuVeLKiMCPc0hocUoKRafgn2CV46g7diXpLkJZRL093EqxNPOEuvU2RCZA16X
	 nbR+kW27/OcRIovle8po3kwtzEuhEXrP8u+qZoXByFtpI5cfV8DmPyAUpGSme9T9xn
	 svducdGRKvgP5kMeMQxLK0U5Lvcl99tmNh+gnaigXi9OsRV7eyreWaXVXF+wlUOeqW
	 0QLZ759V9jyWQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-apalis: Disable the audmix
Date: Tue, 20 Jan 2026 11:02:20 +0100
Message-ID: <20260120100221.47274-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The audmix is not used on apalis imx8, disable it.

This solves the following warning message

  imx-audmix imx-audmix.0: failed to find SAI platform device
  imx-audmix imx-audmix.0: probe with driver imx-audmix failed with error -22

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 4 ----
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 4 ----
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 06790255a764..6f5af37ba9af 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -22,10 +22,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 7022de46b8bf..97fcd865fe3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -62,10 +62,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 12732ed7f811..b70cf3e8f8c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -94,10 +94,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
-- 
2.47.3

