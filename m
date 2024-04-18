Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C515F323
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443370; cv=none; b=fdxVYr+91X+Xj39x6BNC7WD386l/yodaIqYamgcvw0hVzQm2wYe13DDX0pRp2sZCAHMy6KAfO89hr8LexqKohg0R6ESAbeFzuR0MuhTA6+ST85+XXGJwI+9qGv8cP0FnCypKhl2+a36P+vUPvKnv0JmD4OT1T3InENmurcKpHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443370; c=relaxed/simple;
	bh=l/h1utOfbotcxoY/Yz0AnE/9+hUs1hBLejsycfSQgr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSk0mSelohBtoZU/P5fOl3mlSDJPyaWwrpIEOFFjOFmw4NaP7WmIDqYxCGbeL42xiDrKbr0xGWtMKX7GfAnJ/qnf8CQ1eFxQeBKcD9uJTIomNj1bo16XKKRzgIuny5kH5lrlrqNftcysMZaeI6bODJJBgccjyfF7S/ACZvk8MP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=AYWwmTox; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=LxLSGgNh; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="AYWwmTox";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="LxLSGgNh"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtK-04eUW9-15
	for imx@lists.linux.dev;
	Thu, 18 Apr 2024 12:29:26 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 18 Apr 2024 14:29:23 +0200
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
	Flavio Suligoi <f.suligoi@asem.it>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-evk: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:56 +0200
Message-Id: <20240418122859.2079099-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0689 (UTC) FILETIME=[0B993590:01DA918C]
X-smtpcorp-track: 1rxQtK04-lW915.mcmnue4m1pbCU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443367; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=fXsxedbQ0ISYSt3uugliVFnw2OGttnVGjhOOYD7fjmM=;
 b=AYWwmToxIqeav1WH5PGfEwsZDsiujtT4C86W4PS7W7GICDmQ6G1vratAN6s4wyV4MGYiI
 7zkIjhHfxaqDNbEy1BNByIneN2oxkfdBg3J6lSEuGvstfUTZ/0eeDO7xnHDlX6bwONbl4d0
 gZ2sf89BSFQERhPmWXNcwBfZl1T/FfkMpZl7Jk8KyEE3Ty0gg41+PHBu7Ch0AOgpgJc1lpJ
 zgPAhhWBWvYEvxEILqtrPQ0sn8e9ImJRk9bmVBlFv6LXoXnxuhQfXyPXwg2eHcOI5fzt1+6
 m1qXAD8UOGhxR04j1rco4Li267FpMZKHat3U9WhuEJTgDkvwk2B3cwYiC24w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443367; h=from : subject : to
 : message-id : date; bh=fXsxedbQ0ISYSt3uugliVFnw2OGttnVGjhOOYD7fjmM=;
 b=LxLSGgNhHG2VLetAOgVuia/98xgggQbmzPK0kLZAGDqbfEgKatrPmr2TH6NmUJ3FE92jF
 e2ECVrnqg6iOU53MAUyKDPMbSh00qN3AJki3BkGlVBGBlNeWYnwDXG8jjtkCYXnT+xlSOB+
 qnlKLGtIgql6a1S7C/qZWOQ82H1DGms+dkSGU1ov6kF3NEGQ8TkmgIKfZEuolfpjpqUmY3F
 GLydslR08+WgOUaBN8U9tgHW6p5kJcVlUDxzPHnycYBaK1sAs2FTRWUUGlD4WGIEdhf7KeJ
 2mF9pytHG0MHRInY3ImQcXo1GLFhCJPhMbe8ajN0gt9v9S+wJxSP34bJ8h9Q==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 9beba8d6a0df..8747c86689cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -226,7 +226,6 @@ ethphy0: ethernet-phy@1 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

