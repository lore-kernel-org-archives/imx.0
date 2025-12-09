Received: from mx-relay06-hz1.antispameurope.com (mx-relay06-hz1.antispameurope.com [94.100.132.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B642F6591
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.206
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277648; cv=pass; b=E2obHIEKsNrvyjJC5Dgi5uBBF9Zh7fS1gsT3/WKhyma0kkRs80conUkNPqj6B09hLU6vyriDnILwBSJIpWph+grL9ksSfpkgzaKrZujx+SMuaKMfgvKffSXAKG67kNyylNPeTkpHV1oR3Vx1aKZ6kkT2EIw8IKqmz+XqTQRv8zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277648; c=relaxed/simple;
	bh=dXDi0s+km02ebBe7AWt7DzqybHNlwTYq4q7yTrzOyeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOLfcT+9uP2pEnEAGOpBo9IqdrWbKMCvkoylIVQgiks2pDTHlUw7MxmUcAgWMl4rUPpSe+/+IECxAB3qLuUUXoL3KxaIXFD6R5xiaStQsuPKekQs/BwfwQ71vU/MgiIOvZYASq3niWug4ooO82ARxRKKgrdYA9MdxZZ4OTeAfHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lTEK3QdC; arc=pass smtp.client-ip=94.100.132.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lTEK3QdC"
ARC-Authentication-Results: i=1; mx-gate06-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277617;
 b=rqxtO+xbdb7X+h7NBm8Ah7ljXSax2MqNaf+Niw1G54o00AFU83ESe1MPPDstaXnHHi4cYmFw
 7v5I5VUUscp0j/tsCRfN/oAhjyWAIF+tYCpJ4VApJCj7CzSMBeBab1cr/gTLtWPacCJIs8pC24n
 08BqnNLhqDVGe7IQeU5xiRbtmK+KWr2iVFmU3jmY/KbKRO2xedUpbJRoGU2U7D/XmptJV/VuJg8
 hZ+rrkehfwZ24q2HBlR58zOec3rZf0CM5WGOVl8t8wQRQve08LBYVwKaQLwMcYILdkHQToWskTW
 zdRPaIaCje7le6GApd3e9oqCDkoiwp8t9PiEndOpUXTWw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277617;
 b=Uebl3w93xpzzhqQwrxoa7fwC08jPBSE3+qQkwudroESm6QHenBMVzy/OXffEXKyxpJlReycF
 zGwVgRPqm6JIm6T/iOltDThwsyDywWwm1U57/8z7BzegmvyzdOJ7jern0Z3wVr5noGZuSdWy5Ug
 l8pWTEbXrYj4jC7j+TO3tFKWuqNQJ5L24uBNmtCEnBEgIO8pEtwe94iNI+zrPUC3GMOylX8kbcc
 cO+Os3H8jQ1/5psLfL3mzXxKl1duzcZKIdV11hi1Khr8UCENdPIM5cl6nSutRX2kYSnIOTVrjZ7
 0Z2rSrRmFTL5LbSDz5JOEzYIRmSPsCaGLMEVVqI+Xgbzg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay06-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:36 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 78D3FCC0E92;
	Tue,  9 Dec 2025 11:53:26 +0100 (CET)
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
Subject: [PATCH v2 5/8] arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
Date: Tue,  9 Dec 2025 11:53:11 +0100
Message-ID: <20251209105318.977102-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay06-hz1.antispameurope.com with 4dQbLH1DFbz4PRJ9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fc01c51da6ede21ee2d8c257f7bd177f
X-cloud-security:scantime:1.956
DKIM-Signature: a=rsa-sha256;
 bh=nmy9fyQ6PEbPx0XQ71lGiSv7DepEPOFim0DYw8pJHy4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277616; v=1;
 b=lTEK3QdCDiGK7TkHk9wAl+z3HfefqtwzTFJcRw9MKS3O69wJk2bn7UJCysSyTb5+fdA9TNa3
 R52Hh6N9yXkFppbvEwFjSvxw3fRWWJ0DumOGLQG6sF/qN8d5AxJfeq+Lyhnb35bI6q5XRERLkHJ
 wsa8Au0yd1yANXo1G4T2OHPSZXR4XA/eBc0FZI46UFwZCKuaM5Gqt5Zdd4aGEbY0HAFYn20t+47
 y0uquZCj0xGtvG9vPcHw7xHZ26ROMSy74fC1zApoBf6ADyKorJzssenaiUtjrlG6t59uUgTd/iK
 HDUgtHvMRtPxtY7bE8WXE/8dHX534ZSZ/KZM7AgTovpXw==

The event out signal on channel 2 is available on pad SAI2_RXD0 which is
connected to X63 pin 13.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ac889a69da69a..fdfe246c56407 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -807,7 +807,8 @@ pinctrl_eqos: eqosgrp {
 			   <MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12>,
 			   <MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12>,
 			   <MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x12>,
-			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>;
+			   <MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x14>,
+			   <MX8MP_IOMUXC_SAI2_RXD0__ENET_QOS_1588_EVENT2_OUT		0x16>;
 	};
 
 	pinctrl_eqos_event: eqosevtgrp {
-- 
2.43.0

