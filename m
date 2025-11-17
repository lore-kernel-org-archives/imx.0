Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983127A444
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383050; cv=pass; b=UvvlmVfUr0LI+3Vc4iSxe692aKhLpfVOPXnkn/ecG6h1rgJGAn/lII/ZHrHPpUif+T889RDMoiJpPV4LKgt+H+JiTmU/jbF+l4gCAStaGauOG/4klgD4nOBrDqcoLttuuUT3xGg3WQzedUMWBYfMrk27WWJvm/l0W/4zNddC8o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383050; c=relaxed/simple;
	bh=nmPAFYlLwYdLHsbfcU9mSYegvCAZChpys2/gU1VqB00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLoj/9FR8JyBDywSmdOp5AFlZi7pfCzzOWEfVYA1j4EtH+UaE2drMNUv5OGmSOQ5EpdHmCoXxEsrEf03t+Kc+5VWb3WDPoirKRTTp/1uk03vf/HntuZyuP4Ipduc3N1nTOduhPCklh9DHeTIoo5qKecxmjj7C5v+45yLMMzQZQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ANDDrW3j; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ANDDrW3j"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383024;
 b=h5TZpsH8QilNhki23BNogGPJExIXPDGCdZlmhTErRobXN10P0Czb8Q4kx/KwFAjvs1G6b/B+
 NKaHz+JJXdcxfqwil/Ask2T19EYsj1ndUUfr0neMN0C9WIAzb64ilw5/TTy6MML1uOpamdBJL57
 JfHV3n9br2jwbWnbIb+C2j2Y70ALRKtxZ0uZG99isveLXQnn2HwF2xpL7CwKwvLuwK/j987+5du
 IsXcgg/N/+GJ07z4jJ5gLNsCAFfn1cKjuXsY08iXPa0WU2i90nGbn/bCX171e0PYrIQJiyy7OwW
 OdR3oWma8kiJcUGMnl8WTVCEDZ7SoKwUne3hmExFHgWpQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383024;
 b=D1GO0v1D60D0RzrUvB8+gBIYC+abKLNIoTk68XKGKdZR5dFJK1/gSOP+vg9tR/Jydn4Ub4XX
 6WdDosHolkyfoghw+qi9Bk3Nkw7/HolYawzH76ajAMrMntD92RICFm7FdVyUVW4ubDFnf3H7xt9
 r3h69+5dIVBex3Xa5UZ98rLLpgeHVGWeVEKJW1An/yrB/isRmxMANtPJskdH6CgUNztEInCqPN0
 rATCG9od/vgBk7Gs/ti1XoHrM+45MgnPIDhpgppTYQVGgYUVsE2DaSZGolKJ1SOJn8yXm4jTJBD
 7G/ALE2PW5i9o0M+8KZR25SJjd1BFQmAhuB4ZeRTx0Bqg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:04 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 82C15CC0E8A;
	Mon, 17 Nov 2025 13:36:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
Date: Mon, 17 Nov 2025 13:36:31 +0100
Message-ID: <20251117123643.711968-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4d96gq1pMmz2nHWF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:963b827203f1c42a2a4c49ed014a0b11
X-cloud-security:scantime:1.906
DKIM-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383024; v=1;
 b=ANDDrW3jhMDj6lpryZ1CxayxyoMLOZgdldhZCZxDfXA/8e32EE54Fde4qS6hRR6slGm8zUCi
 urnJmt+Xl2cN8jrOakmHdVh8GdseoWofRLol/JV55SrYEdlq8deiXRZ8k+xd/X4F0bLAn2HpG+X
 Ll+o/2LUW+XbEWsF1Q+0dIFRVfN6/buPUHgv3af2Jgu95xzSRLfDSHSabLjhqNlYpAQpf9InwvT
 TVKmWbivDPPuPPLIbTGwuTKZOAwE+jko7k1SmvS/75o1UbOEw9oStm5AKipncUlGHdG+j0DJiom
 775unXzUFtDjc9Y0qgYFUaA0lIbDqbCQivrIxY3EYyiKA==

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 03b75d4cf699a..ac889a69da69a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -248,6 +248,13 @@ sound {
 			"Line Out Jack", "LOR";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -290,6 +297,10 @@ map3 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -486,6 +497,10 @@ &gpio5 {
 			  "", "", "", "";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0

