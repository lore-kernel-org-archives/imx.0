Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D191607A3
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443376; cv=none; b=FWZm8zH7VaRYxylsnIAUe+jsliTCYflHcTckDwq4olK0dN3nIPh6XPqu78bFx6eyQ2GlYci8MjSD0HmS8GP+T9YKX39/icZ6CkqryM2EZPD8hvlFYpPW0HjvVa98dhhepz7jzam149uVvfJtmphMhI+tGQG5cffETJvhBXHUeWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443376; c=relaxed/simple;
	bh=derKY/X+teh30FJx4b/mrPAzhjIzp4HGT8MMH/0zktg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2Rl98RCjoU/yawBWHgLZTr+lkG3DR+aegpq/pWV8Q9GO/Dgw4B8dGaFnAwbA2YPdWS8L4PVwnmAUu2xde0GygyKY2iYcOfeQbCm+wcyGOgb9pJr+C2RBGUBxGhxea28+aijJgThxmo89XjEUuReGG/8ST+eh5jn+uBxiEaatm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=zRpXauVR; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=NdfP1fpF; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="zRpXauVR";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="NdfP1fpF"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtL-04eUW9-1V
	for imx@lists.linux.dev;
	Thu, 18 Apr 2024 12:29:27 +0000
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
Subject: [PATCH v2 4/5] arm64: dts: qcom: sa8540p-ride: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:58 +0200
Message-Id: <20240418122859.2079099-5-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0845 (UTC) FILETIME=[0BB10350:01DA918C]
X-smtpcorp-track: 1rxQtL04-lW91V.mcmXue4Jxy5_z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443369; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=KyzVo69ICVJHxwsHXC+wYoJ2MHvwOdDQY4E0c7AHxy0=;
 b=zRpXauVR5mTZdX29BhoH3jU7k+SwBk//dpL6ElV8MhqVmard7kRrZ+y5IU4bmK9XwtCrr
 KBnhEXMGpr3DhKoMyYhvuEbfOCQbf6vRKtjDjjL8YCuFDQv0oRKy5SNYY3Ndp7nNJ0HzjSk
 D+cNpPdeR1MBD0/fg8xIlUHInxblEomWT0z1ChKKLqDij7xO7gyZWXF3hGhZa8KevoQXWpV
 5jNR55PoJ2Ssy3yUOGP6iURcqYbULzBJEpSop9Rt4Qaa/29IQIrhCHVdk4QiSsp9TzvHXn2
 WwaW/q7Vm7sa6xPu5S+0g3tjvxLvMsJzOiA5oRcXeVtKRUFs1sRcFfFBk7wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443369; h=from : subject : to
 : message-id : date; bh=KyzVo69ICVJHxwsHXC+wYoJ2MHvwOdDQY4E0c7AHxy0=;
 b=NdfP1fpFITanVCZBibB+UCenrw1VZAD2dnYfDIK9Vuky/F6ZHDMsbxX1g8NiNkfXJVU2b
 bEv82f64AC5qogeLNYMSGscyFjQdeioup2rG+d5q60PQioZu6Yybrvvw4hfC3KfnZ6/LfiT
 mfsjCLHknG/HnC7hf3SRlg1uDYQYd6JNGy3wT1kjt5qKp+MSOpLQB42e4HL4n/bFbHy7c4C
 GpvpmnaWClRM0tzVmYF1bwZqfkVt6GeqPWwdLRUfd40kASJm9XUNXdbq/DAIjLzIFfSYuqT
 MsbANyhzEEuZLLfVDFx0HqX1V3TtAz+HsTOYItXmX9hI92TOACdOHELF6WNA==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..11663cf81e45 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -225,7 +225,6 @@ queue3 {
 
 	ethernet0_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -302,7 +301,6 @@ queue3 {
 
 	ethernet1_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

