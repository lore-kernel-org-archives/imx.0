Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B316FF28
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330954; cv=none; b=hOY5uiYntyPNZCRT0VfM4nhcJtfbKkH3XqWVOX28HWEh1YiMAGamp4LPZ/rOfIUIN26p4ZfEd1I5FAhYmLRaYQ9asQRa3nARr9SzdLi7nXjMVA+7BZUIAqh7ZIi/mLn2cb96scRaO8mciWpF9TgKW3KNFeiJlSaIdxihck5Tmt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330954; c=relaxed/simple;
	bh=/85FrgtiGyeXI3NXKIEzWRrmclnbRTUZJ58KJVorq4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m7O+oFXi+gUaoVe9D1VYIWshLJfssDFlLU+cAbneljQT8IgXrwNDBDqyaIZVGaUVsUJzyQgxoonSWR0SG+pPzs4uwug1SfSXE1S1FynVuG5QpYqecRlG7kZlo/+hDup6hjjo9wvh74Ingd20h8OjQfTRKRYwjdPRnbFOiq2avFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=W2QLZuZv; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=nEp/rRS9; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="W2QLZuZv";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="nEp/rRS9"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV7-ynZKb9-0X
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:09 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 3/6] arm64: dts: imx8mp-evk: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:57 +0200
Message-Id: <20240405152800.638461-4-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0558 (UTC) FILETIME=[FC56C160:01DA876D]
X-smtpcorp-track: 1rs_V7ynZKP90b.EuMEjfTrJARZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330951; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=W2QLZuZvrhCtB2ncpz8mCA1qWnJwdTZmrfzQ/apc4FXYZqRHgUlbOjegcbkXDP0PO+Ivc
 oYSaC22JG1pysUOOQSBYbfEoyWtOicTATVQPUAtYFP5uP0lBZD+TsuGELYk8yZ54SxxcmRn
 nfxFt7P84CrTiCXX8ESvYSGqvdZSRZHqLiTSny93b4l3wOtYGR4pF8fkvL+jzczMPZUg0v6
 DsaeD1KYH25NW47oup1Yhj6JB4RR6wifA/ynVMjf1KVHgolIFeQL4VyjXUrNrXVfjAJPHOX
 McUG2RMuaregzktJN7wI9WnLtYYqT8iMmiPKZt02j7hBfNIG0i9rcF0KyqJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330951; h=from : subject : to
 : message-id : date; bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=nEp/rRS9bt+xdtfU2OS1UUY7/5p2zG1x29GJgeE2ldrb6i4nxQ7cyLvx+CB+j9BQ6EN1C
 UgRJbEzuo/LPGhhg/IREnv1py2XRFVapHzDSX4wKpGfK9h5RCBxX4LCQFpkP2rRfnx1kTTP
 NoNZ3Sf4OFcocVi1xpX/kIB4CKqiWiTBNUIOF0t333AyrMdRTDbsA9Vy91k1NgAhyNVjzx1
 8Iyz3Fa7QdWI2jUxXR0Ribq14Ex5ml0U1+wsV6dXRBG7enlvlPJ+6iZI97af1qXOOisMOVI
 msHDOTA0MXjayQIekhdMaFA3XNx5iRFmW3uCESbhV9LwVIRkuDn4iW8YLwSg==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 8be5b2a57f27..bb1003363e3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -251,7 +251,6 @@ ethphy0: ethernet-phy@1 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

