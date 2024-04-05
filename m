Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C71171E43
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330972; cv=none; b=q0rZzf0+M5z7sBh6HPKAXtVXRZ3McfHkD3xK+QpdbNukPSOC4kSJfgECk2wRZ10PAUfX7273zkWAFBbtrVJEGblYTjikdl8KP5lhgr40HZ8oKJ25GHIuJyroGh/SppQAzeJWKFv+6wgUa0YKp3MdrDZu/dDp/GC+VENa9rIuicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330972; c=relaxed/simple;
	bh=eTkke8cTaQuTil9Qf4Y1E+o+QFAi4UuM4kJMCq08Ef8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AF+oRhixnhGkrnL4X4jW9O1vVWPmEXGOOc81Xd63X+GKJUoB/6UuYQaFLQWfNsBnj3uMQhhhXqGe4vOai1jCsaIIBH0Cugd6/A/VpdsRpYgtBNZIgojxXPTUABGrTTxjbihvednmNGq6tEXlqY8E8CZMaXWsst2JeKqUoaLgkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=a7LDeQRN; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=FR24ZxCQ; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="a7LDeQRN";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="FR24ZxCQ"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV5-ynZKb9-1I
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:07 +0000
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
Subject: [PATCH 2/6] arm64: dts: imx8mp-beacon: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:56 +0200
Message-Id: <20240405152800.638461-3-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0479 (UTC) FILETIME=[FC4AB370:01DA876D]
X-smtpcorp-track: 1rs_V5ynZKP91m.EuMCjfTtD6xKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330967; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=2+Mlo/B8JEt+9O2DNgOncVR4IzdOkeJ/dXwp0ZpjBmA=;
 b=a7LDeQRNltQmWfTVP1ecxTYqLQ4gVAEJuWi/aIq/csdSDSMM1YnZDUtQclkr2PvnnRgAW
 42DbkaI8maGQhTHeIP+VBWLHjaWco0LbeN+6y7FFKT/l47VAWL3oNaHKmjH3ZQJEvsaNASs
 C/ikE9UDYYhXFJehXg2N+CZuiQ8/27Djx0C/L6BJ2Smg9kK83wnbtW00vPeHw0azQiioy4N
 nsXe5ULqKSThQIDeHQgmgVznm/L2QbG3uMnzhbgFkReqZar4h7eE4DW54emTbT42Mr/rg+G
 RtOCo6Q4ca+qQcf4ZKxUOoxNAHel10IfHRLyrzajzMWjsB9SifJnR4AoNkzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330967; h=from : subject : to
 : message-id : date; bh=2+Mlo/B8JEt+9O2DNgOncVR4IzdOkeJ/dXwp0ZpjBmA=;
 b=FR24ZxCQELoenRoDlTynF2O0uAOUQ7Vo0WHPPTcUCFLxB7vd1v2rixVJHkfkdvtjRlXa4
 J8E4dCgVi5gN+88v6/b0pS1iIqTO+GuEfbkPAzD0BBvMvmxUXbc0zHApljpiXhZfNlUVEf7
 Cs6l5HXoOko8WdJgdwSJpJnTYZYwJgfDIR+pB/ijXxC/RSxpfN36GwyHWSP2ayF+Zl7RZ/r
 y4axOCgiGZ5m8ZIYe2a1QnEol2s0SOGCflK9XVT+d5vIH8ua7MKnoF5gLl7gw6SE4xyDzqg
 yB2RhWfNoF7DHxEYDRa8OE9dqwwptlXx/dgMfq/st3IzXLIuBHtMcoKRkFuQ==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 8be251b69378..34339dc4a635 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -106,7 +106,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

