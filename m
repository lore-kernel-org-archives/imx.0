Received: from mx-relay139-hz1.antispameurope.com (mx-relay139-hz1.antispameurope.com [94.100.133.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6C222597
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.185
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710386; cv=pass; b=H2Uo9a8HME8mc7UC6wSXQq7ZKPFD7QBrHOG1NT2YrBAzYQA/iXd25/+R9Jlx/ysm+DeetV2fGtAfn0b/3OaWvgQ1XSCvKjanXB3/P7cquiqdna3CtN/NlvqrCbSut9mGsjjGlNUTdY4l9exEEwlCqN6PsOc0K5TBFQfaU9u0Yr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710386; c=relaxed/simple;
	bh=irY4+aQ29QnkbeLn0nQsrvfY/8RJJ2M64NCPho3lbeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZtUvMDGIowigwaaX3IGJOBYTRQfGAL1Nthx6mO7UUxJjRXrxZUwOI8UPbNo8yEoSA65dShe3GyZdfNBp8Fx9syGFiuD/sz6ZnxDQgPY/xgED8pHm9qLqjsfqb0KPtg8dYUMsidcX3pyhfQec2RipOIdZW8O3aNgc7ImRxwcbt68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YUp/TqQQ; arc=pass smtp.client-ip=94.100.133.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YUp/TqQQ"
ARC-Authentication-Results: i=1; mx-gate139-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5Dqt//Bb3x/Y5eSf+OIeQhron5iHwkVjbr2ny9T+e44=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710316;
 b=MdOLnBo7c4K4WO03wzO/g54idFXPyIx5ZyVWth5Luoz9QYQoWZsQ1sK//zlnKLVXsFjF/Q1n
 nNg/WIvji+QONGLWJGqOa6oOy5wyUIrR3zcfXmz7XN4Cpe1mo+fObnvRyttHdNszcVyG4rflyQD
 WMBy3daaOEKPrMqHoVDsbtxXcJQwx+APCzPg01RSQM8aidpgiD/iY0Ln912iPGPIwY7Aye42RpX
 a7knYw4l4Ju7wGq3O6qcdu/W2I9tA2RwxJh6U5/JNCKRzFBT3dx7p+fZl6BvGkLRb3tvA0k86v0
 PTfmkIHogAFYirXJikhQz9tcGFb2V5BLvSFPCJDgwsZeg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710316;
 b=HAGyTavzoWHZLLQp2kLsgNSRV3+os/Hkv1uITjGassCddj6Ky3Ruc1DlENoiFkxwBWlNRmHj
 PC/tAi3jR9VT3sLy9eaR6NyKhapz+/qL2v+0OdmPTAni6WOHgnZONMdfqBOgiSkOaNO7BZ4m8GH
 Tp5voAuEq6l6iaTiNJUJULZC7DwGziQK5+dtjIxlorPubAjxIrwa4Br9P946fdu9B9jfPIzWtOu
 Xbi1fdJ8QrqvBVd6vrL3hobLZVCkFoH1SVuBr8DyzrWxSBfltn5dP7hri7N/bNH5+CFQ/mvWXlr
 gbQ1EhBkReXDbW1Za7iznj0XFFI0PP0VVcydhqJIVw+kw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay139-hz1.antispameurope.com;
 Fri, 21 Nov 2025 08:31:56 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 382945A0495;
	Fri, 21 Nov 2025 08:31:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
Date: Fri, 21 Nov 2025 08:31:40 +0100
Message-ID: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay139-hz1.antispameurope.com with 4dCRjs6s50zNwSv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:56853c09cfe5c0363f0c70f3518d825f
X-cloud-security:scantime:2.285
DKIM-Signature: a=rsa-sha256;
 bh=5Dqt//Bb3x/Y5eSf+OIeQhron5iHwkVjbr2ny9T+e44=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710316; v=1;
 b=YUp/TqQQJspQy+No04LzWv89AO1Esy5Taf9tk2ERrzmyXXjdK02MxrjH07mlPC6FQaokh4m0
 dMB579M1pSPftVqZ9SxR5WcO/sGveyGekF+gzLwUBvaq5FrD13otz7QzDPJ45vsk1PWdWFLMIG0
 SRRZsSI4nudN53DYGSgbgA78PdMf/B1U4wANAplNWFJaJJ/uiVwiMJO51YsNcZ3bZiYtjUwKzzi
 rHgC6qzbiChWpZ10vRTuJxA5q0UKuD2KNuXez9uu6mIVpdD/d/1jDWD3HVdxU3C5xWCvFLtgOZL
 oItaUB1V+pffQxFKtrUNlNbH8IkbTvMvdixhrZjcKuyQQ==

Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
numerical value is identical, the LPCG input is defined as
IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
consistency with the LPCG clock naming convention.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index 2d0a329c2fa50..ebf20d5b5df9c 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -406,7 +406,7 @@ &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-			  <&sai1_lpcg 0>;
+			  <&sai1_lpcg IMX_LPCG_CLK_0>;
 	assigned-clock-rates = <786432000>, <49152000>, <12288000>, <49152000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
-- 
2.43.0

