Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC4F3112BA
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530010; cv=pass; b=urGecNiOo33Lh65GnBeYJkYFFtyVop7VvdtwxBW7JYlGQVrhE8qGOP17fSh88FyUb1R3W9spzwxSs2B+7+pKG6fPXt67fS4dHGiMZvD1gb9UzaqO2WifIMkKTkuABNV4FwhycLRc3jpDqMgJ+BiCYbUyVHC5fDhjlcgl1PiExKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530010; c=relaxed/simple;
	bh=WKBInquyslnsVUJK3IFncVat4T55trFVNhoPBVSI2Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3NOgdfoTPUDht6PwdBm6ZcXRB+A9r5oMaxb0RP1u3RQDoqt+YgtywQlBGUiytuO/ARFSmAU10PgRL8NYCZgCGrfYDvv8Y8qBx4rXW2H8srJovdKfJCCNfFGeGA8daiSoPQBjQISnK/xF4Vfp8y2a67mQ6muO0NgMZYzo3JNXxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iSrxJ3Bv; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iSrxJ3Bv"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=84P47lxHC3BLIWqL12zvfUpIKwtTk6oo/ph1IGpKWdI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765529969;
 b=IddViZ3MGAMoeQPQRXV5rqz+r671t0WggpNSC2l7lCkRp5S73C8OS58VB35EIgNKaR/RA7XL
 4OS++bWGzXsFmuta/wH03UrImTQAyy4g57xuyAwK9r/G4WaTw4v3FxYtGDQW9uVIOV9HtX7pXS4
 tMA987k0zKJkpt70lK0NvLMtKo7lSiBuvjbtOI8vk81J6oHK5sgo+UjyDwOsqOkV9+1NFR+h/qC
 yQJKHrZ5VBxBrZI7WY3Z9HSQ/9TzoPb/Em2h9Bis4+12qWxvQcqUwYjfF6P4mOuEeHWHazHO7IU
 0sX1Y2HA2a6tFGoTTd2UptwxR5+vuKcib0ktYsK4AIKwA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765529969;
 b=iWElku/bisSPnshQVsqr5AlSFY107omcGm/ixNZHqkH4zz0xgytE4WxGeQD2QmI2vkQd0UPe
 /1VRjJ0hDM5W+ARNiaBuTGSrJjxoo8ECb9Rqom1BbVjQm8kNzWFI+RhDwewf3AkMW5gPmuw4J9+
 hTD1CHx3mqKW22m8nowBtbFIQf0uS7swF/hvzNjoc8pFOYfSJdwlCUzDY2jk9JlwGhxX9Vhpn8Z
 IZGUZ5bxhQ0kKSZklAYm+00LEJe4OPRUBA2lXbk8Tn4cgMkvpwBOGvheAIcN+pVCQ6RNM59gn+u
 I7TwydQ93AXceHEOfktD86KMbwPDX46+Xg47r48eRhSzA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Fri, 12 Dec 2025 09:59:29 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 69CACCC0CCB;
	Fri, 12 Dec 2025 09:59:11 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx6qdl: Add default GIC address cells
Date: Fri, 12 Dec 2025 09:59:00 +0100
Message-ID: <20251212085902.103507-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
References: <20251212085902.103507-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dSNg41V2Cz4FKLF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:bb4a7dffaef21819fc1d7783b77528b3
X-cloud-security:scantime:3.879
DKIM-Signature: a=rsa-sha256;
 bh=84P47lxHC3BLIWqL12zvfUpIKwtTk6oo/ph1IGpKWdI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765529968; v=1;
 b=iSrxJ3BvmaeAVNlDhPvT+B4GESS7HdFRsQ5mhsLs29w2IpCnK8oXu7VAnRWnHgYw5o609+gY
 vIn4g7gG/ffjcRLLJBeczzJa4mvbB8gMgrYiBXo0uj+HE8l9Dslwqk0LqjGU7YStO9TkoJHA0RI
 /D9wIk9giRTDA573kHO8pvSPJMcsDLFYEOSR5Silff0weNcA0X2LYV6jT28bS44CHtlItX1sytS
 7tFcjwR8D/S3QfRrlfUvwQ1sRnNESxzh8g+DVFTxLqQKzGuoc84JZTjsVeQtzbp0HbKv1y3bdAR
 A/qtOKbsa0rJxb9s48aFxmc52KFfipuNxnZaaqf+ag5yw==

Add missing address-cells 0 to GPC interrupt node to silence W=1
warning:

  imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map:
    Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback

Value '0' is correct because:
1. GPC interrupt controller children are only power domains,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This is based on commit faf183a02ed6b ("arm64: dts: imx8mp: Add default GIC
address cells")

 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 45bcfd7faf9db..9793feee63947 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -875,6 +875,7 @@ src: reset-controller@20d8000 {
 			gpc: gpc@20dc000 {
 				compatible = "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
+				#address-cells = <0>;
 				interrupt-controller;
 				#interrupt-cells = <3>;
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0

