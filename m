Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363D23F40D
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338765; cv=none; b=GqMMJ41RZd///NXlIDjEnxbSsPd5Q/fonENrcaipbKE3ngwbzX6uoXDLx0ysqCMtIGPPpmS8rTHnQ06a7LMUJkV2jbpXlUoGg/1YJcm02N3pwTHqUHGV4DkMRYnwR5MXC1EvQwbZCli60doy6NKu0ih3PaPdBX+HOepCucpsl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338765; c=relaxed/simple;
	bh=0xl9o1h84gIFTnIAU72H/fovxHKsdOufAaHxpV0dfbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TvNESQMwt5ng4+K7C+h/H3tcp1XsagvvIUpmXzv4ebeqwHlH1w6jPSScK5I8BfR1x2IyAO6DH3rbhhZl1wpx3jaxqYPZGZoOjh41cXCoIUi1nOrwz63zxrTRUOVC9AeD3srJ5YwrmNE3DVIlg9FM6Qdc8MO5RmYaLJB1vtdKxRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XMktaHtw; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XMktaHtw"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 33646240028
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 08:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760338760; bh=uDDLy97KRncYr0keeDpVgzvm9n2KqzdF0fqDBZD8pkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=XMktaHtw+FD4c/Fc4rFQZPOGtGtfb2DdSDGy+CTToN1DbNN+TkYwTKQ0FEO2vpbYz
	 C49PaAW8kGSPt3CNoANE2FhFkNE9rZ91LgGUJSePZyUjZkwV07YOmNqljxBh2HFrw7
	 oYYd2RiP4uldT8wsmTvhlPVlxkA8tlTbbZKlQWRIZ7WALOSKBWpBA3j0as7loMlAza
	 HNLcaUrFhv9LVqEUj/DUVkthzQAFgVeG+Z4L2cYDA5FIm5aHMXhEA/yX6MhkpxDt1D
	 SKgGnjnw91NkD5+wcM38E3/FTPozuLwLOjng7r2MjSPKlrVulCHmZdZ0Sfe5hRZLkP
	 AgkBQ7xaUjVQA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4clSrQ2dVRz6twZ;
	Mon, 13 Oct 2025 08:59:18 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp: add idle cooling devices to cpu core
Date: Mon, 13 Oct 2025 06:59:19 +0000
Message-ID: <20251013065903.35216-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The thermal framework can use the cpu-idle-states as
described for imx8mp as an alternative or in parallel to
cpufreq.

Add the DT node to the cpu so the cooling devices will be present
and the thermal zone descriptions can use them.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---

hi Shawn and all,

SoCs rarely describe and enable the idle-inject mechanism. IMO it is
desired if only in order to have an example of it merged.

revision history:

v2: thanks Shawn
- add a newline between property and child node.

v1: https://lore.kernel.org/linux-arm-kernel/20250715055903.1806961-1-martink@posteo.de/

thanks,

                               martin


 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a3de6604e29f..9b59f53952d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -80,6 +80,12 @@ A53_0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu0_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_1: cpu@1 {
@@ -98,6 +104,12 @@ A53_1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu1_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_2: cpu@2 {
@@ -116,6 +128,12 @@ A53_2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu2_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_3: cpu@3 {
@@ -134,6 +152,12 @@ A53_3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
 			cpu-idle-states = <&cpu_pd_wait>;
+
+			cpu3_therm: thermal-idle {
+				#cooling-cells = <2>;
+				duration-us = <10000>;
+				exit-latency-us = <700>;
+			};
 		};
 
 		A53_L2: l2-cache0 {
-- 
2.47.3

