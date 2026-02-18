Received: from mx-relay39-hz1.antispameurope.com (mx-relay39-hz1.antispameurope.com [94.100.133.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1862D0C63
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.215
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421106; cv=pass; b=JBn17Ek/i75wQTGsde7QO1rSrCa8dJaL9wOGYP6pBbdzWx+8X44yPMgSSxUX7jEP5yU0L29j063BfMKFpWw2Y30FT2d1lLNAA28cwHepdlc0FRZ48WnaJbyaOHbAZX/kw2ugWCHqas6WJhmsWdyCxH6gCG+7Prfbs6sac2Vac/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421106; c=relaxed/simple;
	bh=cTvhEtbKkV1//CEOQ3tCbx9vhfr+kG+WmHl2qSYKC6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZMN5w2S3mO89PzMU79pVemaQ9gMWm+jcnmbfZNaPqTOBPf6vvE1mM53RM49pUVco91crWY580wChqIUp8ouC8WbTKkUKHkES5kNu1JyouWzEsvo7nHLcBzcy4yukIWSGWT9bA+c/luG2Nv4aJA0Afr3TxP5FCVqKN3BgVZD4yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RI3GZWR9; arc=pass smtp.client-ip=94.100.133.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RI3GZWR9"
ARC-Authentication-Results: i=1; mx-gate39-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=mhpAHeK5WnP5K7fPONIfRy2XkHtMpwUTgs7kyE7vMb0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421035;
 b=onzoly5ROoaH73yGyxvwVvogyaJmpSPGPn8iaOxXDEk65GIhhYhqc9t8wMvI3mYcoxgkcYRm
 8EPOMHRkpNF5gt+aLeEh553H7/XAHnQevADW9BhKe7JWATnmdeLdrsNAnjS42V/3LdtI5L9qt1t
 KIO+sTg9zojrpHpny9PzjnvK+JXppAQaEe4vfclbXMcy1o342fEaCbFh0PCpaSrjuCo5tKKT0bc
 oQ9WKpxogVhNN8DTnQSfDERjk+j0uQniZHphdZ3ofUlH1EJX702xgx7ps5AQpV61nFDdv1+B9QJ
 jJp92UzSdjdFXMVkPjcn8ZeCSez/tiJTb2haFBwtYjfdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421035;
 b=thRrqsOOG73RSfmZt3dCMnJdCXL/v/L76SB+NPrkzIpFQcvxBMlXo1sDlXMZu2Dx0kwX5P0V
 /Fq3j88EENuKzkjlFSugvq32lQy/Hi7GK4eVxkPGNYCaXN3xF2pYBNwtk7aIBhaT3JqCYrNxCGt
 5x09MwsydldRxBqF7zvbpQ4TZ10R6hS+IGSNaoL8yZl7Zb4yiazRawa+ZivNkRfJ7661b7j9oXp
 uuySkKUt4Ufq/M8jm20JKVCH/vsk59/iwRzsZT8U/vJbRtagGNCsvSSDpRpzy8NGjIVXjpqFtZa
 FNad+C4W3EK+IH29XO0xpRsP6c1SV8DWzcgw6yU1Ms8mQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay39-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:23:55 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 846442205C2;
	Wed, 18 Feb 2026 14:23:43 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
Date: Wed, 18 Feb 2026 14:23:34 +0100
Message-ID: <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay39-hz1.antispameurope.com with 4fGHJw1fnTz18J6L
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:965d9ae517c88a7aee3ccb289887b696
X-cloud-security:scantime:2.251
DKIM-Signature: a=rsa-sha256;
 bh=mhpAHeK5WnP5K7fPONIfRy2XkHtMpwUTgs7kyE7vMb0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421034; v=1;
 b=RI3GZWR9hUx7Nd/WpYj3TKLVlyMFfShxOM1q2/MpEDQQSz6wlQUcbkZaXfeFlUAq2lnn1o8P
 XNn8d9vzIxbSdCtMg55Jkv1oiALzOSIpGf2tkGNf/mz/tMEhq3JsAqIgbc+sZxqnpR5kAO+faIj
 iXy/qNycKc6xXQvIU+7VmRjynxAM9yMLyttv3ZovDhQJdlWRqW3bkxyvGCD1DBS8/5K8hdQKKyv
 aj0oBz9ypvjnweNolKbmwQlTF6/zdb5kq01WcDMjPRLk0BMTM13BP76xT3VTP0fPINs8cBu10hy
 4OcHhPHgnjqvE7anMeZs2WyhK3uw2LfCGrmKnR3W+dS5Q==

Add boot phase properties from U-Boot device tree.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi  | 6 ++++++
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
index 6eb80f867f50..c745f30a9b25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul.dtsi
@@ -115,6 +115,7 @@ osc: clock-osc {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 		clock-output-names = "osc";
+		bootph-pre-ram;
 	};
 
 	ipp_di0: clock-di0 {
@@ -143,6 +144,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-pre-ram;
 
 		ocram: sram@900000 {
 			compatible = "mmio-sram";
@@ -202,6 +204,7 @@ aips1: bus@2000000 {
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -580,6 +583,7 @@ clks: clock-controller@20c4000 {
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
 				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+				bootph-pre-ram;
 			};
 
 			anatop: anatop@20c8000 {
@@ -745,6 +749,7 @@ power-domain@0 {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6ul-iomuxc";
 				reg = <0x020e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			gpr: iomuxc-gpr@20e4000 {
@@ -826,6 +831,7 @@ aips2: bus@2100000 {
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2140000 {
 				compatible = "fsl,imx6ul-caam", "fsl,sec-v4.0";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
index db0c339022ac..ba0ea10c7b74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull.dtsi
@@ -57,6 +57,7 @@ aips3: bus@2200000 {
 			#size-cells = <1>;
 			reg = <0x02200000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			dcp: crypto@2280000 {
 				compatible = "fsl,imx6ull-dcp", "fsl,imx28-dcp";
-- 
2.43.0

