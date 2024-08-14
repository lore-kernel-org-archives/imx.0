Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636B143866
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723627605; cv=none; b=Xo2In719y4uE+ynHdzqKNaHGDyYJ6lNEbwCriA1/VkhhWKa8stWKRIgMumH07jBrW5KchwWWR0uMQx4dgBYuud50EDnb1kLsMJCMFuXyDzeeQ1D8U9uKRHx0Rq4VBeiaFGGAalpJZH20FQ7D2vyKHwoRG0Q3vqSEgQgfTRnxN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723627605; c=relaxed/simple;
	bh=RAGQRdN1ExLCtpRnJRGT6u5E8iR2a7l1ClFQLp1XWUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tM7EYJ+yLcFuIDJN1XSvNKq4AkBatAbYgFMeaaIqiJs4uAC/MwpLzlS4xTF7RCTrT5Z5m2rm+gpmmnK17ow/2qwJCYafQXVjrP+SXYQIC7126bN5Fx8AA/IV2lXBbGWyyu/rhKzI/hSXJ/tVQiPgPG01oRZs733JRgxjLirotko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=pRYxwg8m; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="pRYxwg8m"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723627599; x=1726219599;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RAGQRdN1ExLCtpRnJRGT6u5E8iR2a7l1ClFQLp1XWUY=;
	b=pRYxwg8maDn2YeXslrH++k0SLqgK8+TAy36QiTkQf9pKrTXj96ucAEkauQTtNmrJ
	ZEgCgOAJaUdosKnOSvJyGFmAWxVFlTv/hAgIAvb37s5Dg4KUiwYeOB8wPLXwbUcB
	Pg80t2ysvW8q7M1EubFdO+5Djwd0Xz55EdcestXS+co=;
X-AuditID: ac14000a-03e52700000021bc-ba-66bc784f751a
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A6.54.08636.F487CB66; Wed, 14 Aug 2024 11:26:39 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 14 Aug
 2024 11:26:39 +0200
From: Teresa Remmet <t.remmet@phytec.de>
Date: Wed, 14 Aug 2024 11:26:09 +0200
Subject: [PATCH 2/6] arm64: dts: imx8mp-phycore: Assign regulator to EEPROM
 node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-2-e2500950c632@phytec.de>
References: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
In-Reply-To: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yannic Moog <y.moog@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42JZI8nAo+tfsSfNYOICWYs1e88xWcw/co7V
	4uFVf4uZ91rZLFZN3cli8XLWPTaLTY+vsVpc3jWHzeL/nh3sFn+3b2KxeLFF3KL7nboDj8fO
	WXfZPTat6mTz2Lyk3uPF5pmMHv3dLawe/X8NPD5vkgtgj+KySUnNySxLLdK3S+DKuPX0AUvB
	E7aK3ndfWRoYH7N2MXJySAiYSLyec4Wpi5GLQ0hgCZPEy7fvmCGcx4wSH88fZgGpYhPQkHi6
	4jQTiM0ioCqx9MExsLiwQJDE9N+XGUFsXgFBiZMznwDFOTiYBTQl1u/SBwkzC8hLbH87hxmi
	JFnixazH7CC2EJA9fdpdsFZOgRSJ6zfPsYPsFRGYxCRx9NoJRhCHWaCPSaJz2nl2iFOFJT7v
	XsMG0S0vsevSSUaIuLzEtHOvmSHsUIkjm1YzTWAUmoXkplkIN81CctMCRuZVjEK5mcnZqUWZ
	2XoFGZUlqcl6KambGEHRJMLAtYOxb47HIUYmDsZDjBIczEoivIEmu9KEeFMSK6tSi/Lji0pz
	UosPMUpzsCiJ867uCE4VEkhPLEnNTk0tSC2CyTJxcEo1MM48Jnr60bnYi3ERrJohT0wk70V/
	Si+u+rzfOTtHxv+5+Yr7UxIrRZdu+c3O6F6gsWf7Hr74CIYdLGedHtpNsHklu/l4TMu91WGL
	rESrkrK+LGmRXythl7p1Hr/bGasacb4Mb6n+RPk3bionnQ6y/zFQ5OUPdHSZt/9k5WXFZzfj
	HHfpbEvNUmIpzkg01GIuKk4EAPxWoCeUAgAA

From: Yashwanth Varakala <y.varakala@phytec.de>

Add VDD_IO regulator reference to the EEPROM node to reflect the
schematic. This also silences the fallback dummy regulator warning.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
index 9c5272c6931a..a5ecdca8bc0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
@@ -179,6 +179,7 @@ eeprom@51 {
 		compatible = "atmel,24c32";
 		reg = <0x51>;
 		pagesize = <32>;
+		vcc-supply = <&reg_vdd_io>;
 	};
 
 	rv3028: rtc@52 {

-- 
2.25.1

