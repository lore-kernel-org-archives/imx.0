Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1F241665
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819023; cv=none; b=jp7Y/9HQN/IIqwCpAJrtlw9XEeYacaVGhYzX+OheVhwe5ukX8skMfx2QvhbydmlCI7SkenkhYaJnINnB8si65iQUAq8KHtJSCS1d38hLqf9JbCWty296w6p0jJpkhxhsZnL62yLFIG9V08shJXVD3Y5UWcb+5pUCl6mTJzqZkow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819023; c=relaxed/simple;
	bh=Yj69HGmIYy3nvT0ZVc3rq7WsyzVw7QDHtEU7Odsk9lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1olGZrOeexdI/zw0cuozjLGLZGrLPxgUcPrvIkR5kuDbeGT8yolTTnWKelwth6uYCzxBUFQyVBSQwGkkO7KuTotufOvnA/wC9fvBDC1dF1enD/dZwABqNfRQPMgO/mwThIp81Cs8UAR9jOM9ll+eO1OkKXX5d/mNkNu9cBBiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=oxt9CaE9; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="oxt9CaE9"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7AC321FEB3;
	Mon, 19 Jan 2026 11:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768819019;
	bh=KWakkcnPAiFgfLU7LEKDx8wJs/Rl3RjR0sj8wiSKrsA=; h=From:To:Subject;
	b=oxt9CaE9CueoNB8KvnYHETcQXZWiTv5nk77HJA2Z1n45cpCZCSQJc7x4sBC2xPVnO
	 ZVnpgH4zUAauzHbw4uyha7mknRxRV8ASpmSwRF9kK3KM74RIqetaBRMEEkG1goP1Tr
	 OHs2f1F4hzSGKIUGdbWclCAZR9cBHguohZ82mwQWgeTVwZ5WEZ+ibUvqHVw2zcA51P
	 eaXsyVVVtY1a8D5bNOe9ziQUxudMHT7qXIgUSY5t1YOKY4tQHZA0lemu0FWufSwOwx
	 HQGxiJLkfzLItmxn4LHPCSE1mmwgHpPAso0MVhYWyESn8yufvozrNZrBsIAc18zZ86
	 pl3KtNsCCkGlw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
Date: Mon, 19 Jan 2026 11:36:53 +0100
Message-ID: <20260119103654.51318-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The GPU is supported since Linux v6.9, with changes in the SoC dtsi
file. Remove the related obsolete TODO comment.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 2 --
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 7022de46b8bf..3dbba219ec9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -89,8 +89,6 @@ &flexcan2 {
 	status = "okay";
 };
 
-/* TODO: GPU */
-
 /* Apalis I2C1 */
 &i2c2 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 12732ed7f811..0cae495a68ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -123,8 +123,6 @@ &flexcan2 {
 	status = "okay";
 };
 
-/* TODO: GPU */
-
 /* Apalis I2C1 */
 &i2c2 {
 	status = "okay";
-- 
2.47.3

