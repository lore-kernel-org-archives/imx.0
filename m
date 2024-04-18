Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129415FA6B
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443372; cv=none; b=qVZ3OXyHjiempihn+wzgc8MZ6lLAExZAs2gh+zntLDtdLDxrfLfVYxqNOz2AS/pe8Qic8BOGaTgkdeju4OiYBj2LJKiNZlyAr8d0R/FvOTP/Mlh8QPzzes7UxyX4R+3+5BvbUFxq7CeXRDBK8FxY7JM3OL5LOAAzoJaNR0Em3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443372; c=relaxed/simple;
	bh=NL31cErW6LI9swDiDlefCuluc3s0/yO0eHrCdufFRzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCGLf4i/m+5qr9pyRq1XFscBO5YG1y9He5kkQ+JsdN1iz/ai5vWRBPUEryaK4A6vyNnaMmrrnOIrQ1NG1UQAai6egfxM9MobmhY3ShwCX67nK1sIFdergG8UvaI9qd802e4w8qWPIZdV7SiKkgxL6hYOEyg40l230IGbgCtqzYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=hwTVnOyn; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=lb8KLTx3; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="hwTVnOyn";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="lb8KLTx3"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtJ-04eUW9-2M
	for imx@lists.linux.dev;
	Thu, 18 Apr 2024 12:29:25 +0000
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
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mp-beacon: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:55 +0200
Message-Id: <20240418122859.2079099-2-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0610 (UTC) FILETIME=[0B8D27A0:01DA918C]
X-smtpcorp-track: 1rxQtJ04-lW92u.mcmkue4LdF0hU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443367; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=hwTVnOyndJn2o3VR7+o9a+qlwl1N2te5Z7teEE8D5t9i9n4uVP/ms0YCepUKs9n13ZM7c
 iXaBowz8OflX7nQE4KGWjQuqMtrWgQalfdM70x7C0roJynbuVuQ7BIQJQGLa5mHYqWW6kRi
 UZ/Ygr5ThTvE4p5gFJEpFU0Jq9rbv/qbv7NPbXqmH/I/8rlNGFTTS8yqko1Wiw1El9t8+k2
 t+y2MqJzEauZOncAFnfvO2uNqQbDJbmyt9qMhtTLMtH6wAur2BE1U50wygdI05g7H6sZeU8
 /bApK4YGP6QYcDO8LGVIs6vYMsBS9H8MUwE2VsHg6XK8yOCeiiD+VxqDnZPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443367; h=from : subject : to
 : message-id : date; bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=lb8KLTx39E97sb8t6hr0Qwyr5m/N+RBxt9fe+FUa9HKtSmXcn2N+SykvK6ehEu8CQ7pRO
 rKUULHCITUI4QwxGpumXb188dqs1+gucNpFpT/JrIEHFq8SgtB2AFGhYYKfOtgQd57t+pZo
 ammkzSjAoulQMtTdo8/8/QV6Q2+xQfA04ALdnOK/mNpVONgkypSnj7oXRcWRzdqx5QBTTK5
 llk8awDZlqjn92gAsIhIGM46qhdxbzhLW4jzCgDJsOpX/iXKtetxQRFovl9RkXIpn1aom7p
 8a3vaS8bwA91lNfc6vImFFqHlfEREJH9shlX1Bhk/KuhvbPVr7TEwJlipm+Q==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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

