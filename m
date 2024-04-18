Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B315FD07
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443374; cv=none; b=sbo9Wb4f+9x3a4tyhN1Ngiq/LiAXfBsm+b06wtlUzhRrVNR/1Gk5MbNhsExrY/uz6tKzspybCcU4s3TGqMAnrPnYgmnrmTGcByb05wrK+Kt9I1sXYJHGcLyjdjf5eRcVbtMaRSuhX/pqUzGNvY6oGE8ilOzUP9YJjiYZZ7H+74w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443374; c=relaxed/simple;
	bh=7YaaphZZMBLHKh0x7dUPDPqq2nvh8VeZ8PMGp6jM9vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iB0793jaL22M3D1TKNaJrKXdOLIAzxryX6KHHA550TynkYhzOjfb7kOoqycbFcUf+sGTGU9krz7Qocvn0WHSWjHl1eUbxOr5/WsSZKqxcH6AnqsUg6ikn/GesGCmNKd7acyC9Xx1vtF+YQ/J/p3rOVYj/XzKN3rrM/o1Lxzwn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=xQ/jrsJt; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=CXp0RPkO; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="xQ/jrsJt";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="CXp0RPkO"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtK-04eUW9-2w
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
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8mp-verdin: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:57 +0200
Message-Id: <20240418122859.2079099-4-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0767 (UTC) FILETIME=[0BA51C70:01DA918C]
X-smtpcorp-track: 1rxQtK04-lW92w.mcmnue4mphIWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443368; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=xB6lptXkbDQjGZizWOcUacyiIPjTOrnbOEU8DAe0Dnc=;
 b=xQ/jrsJtApZrbHd7xDlXcRx7QoxbdQi6AJSAZuawzSDi7kKZoEJPZYFoiD19PKV6nV433
 56IvAi2KkbkUNJqV7JPJyyGHrr6aG93t1YeFgCGZUNTuGMIIDLtgC4TsMOMHDfwhlxwqY/5
 PzCPI0WjeBK5H1NQ3dHmFLGGa0wrs/VHIALj9dfp9OJWE+m2oId1Oi6iv3MHUdnl0MfAEWN
 L0YHEUAJDLMcDBcsd72LJkK36pb1wiN5fQmfbq7VIdLXg8sTOREtKQGMxJsZT3DNP931Osy
 TDQJj5IoSFw2QmqNiYJCTORObgIRxuVoq4LgumykwzT7zSfW9kbXZMY63/Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443368; h=from : subject : to
 : message-id : date; bh=xB6lptXkbDQjGZizWOcUacyiIPjTOrnbOEU8DAe0Dnc=;
 b=CXp0RPkO/tupCCZs2L5g9FWimVcXBjaMaXgnZk/QsscnjqUATZr415ZNZTuha4JK5YBAB
 ouqoebG4PR2HL2Ck4Eysj25z18KnqkRPuQFkZ2ZvBaDHExdSI+iP5X5F4P/rGuo653AlnxU
 mq0+jOFWIdWMHlLSSwLTG3ApcVoY0cMDOYUiTMVGr/PHV4WGVnxWAUMAOyNuE34MxJi0S4R
 /zPWqKTT+6tHGK5Hgwp6xOCbWIzX/CCsK+qeOvayl4aN4mgz3CYlW2uXyLGbTeq9Y6IVx/5
 1ElwlFQt853Xspn4X7GKDPF6M0fBHafO/FWBkAdYDBsnNgidEeMqNocELEtQ==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index faa17cbbe2fd..21d4b6a9a1af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -260,7 +260,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

