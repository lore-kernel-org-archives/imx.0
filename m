Received: from mx-relay73-hz1.antispameurope.com (mx-relay73-hz1.antispameurope.com [94.100.132.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3AA22A80D
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832505; cv=pass; b=aqQHhc7AGkC5eDAKNzLA2R3nq8F5Jwj63QjKgq5DSVMHxzewiDm2Ix2b5waFq6MNWUSldvuZDTziKHLF0IQuPeDMVStcdNBIJGLuOhpfVDJguJNLcgqxg1f3wiiO2zfyAZHtkEx6LBbDoU4UMogwgnvjgjRQIhHTe9xWktjIlDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832505; c=relaxed/simple;
	bh=g49/BvHAHefGv2lXoYjQ4KibKwtcnMRmtDWXdeTybdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJMQI82/4YGTd/xiedgj0rdKrVvxvbjHFq06a6JPkugQufN/H4jQHybMtoVqYmAzxMqXehGaue4Iv9jFsdamV3feOBlpGIfH5VexY5+rXmz07dnFKbb7DQvm4YmlWVziFRQwPe9Rh0EBFMzyA+2VmoBJdw5SIybqOFcv/c39xZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nQnqsQf4; arc=pass smtp.client-ip=94.100.132.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nQnqsQf4"
ARC-Authentication-Results: i=1; mx-gate73-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=No66cNLUicbMmk4yWzYnf+xkWOSrPxLslCLwe5XBnm4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832400;
 b=CxYdKLGzJ3cpez9ArPXH0TrN1sflIJZ7DIKoioCa3egH0QBX39Ns7FnCxDXwxdn7ekBNe89K
 R8ekhrJXw61XPHmnjM3G5sr56nA0upz10EzIrMeQ8NjV2TU3OHtafZ9YBQZRmYyNhP6AfOanygg
 Vxhg/0EergB+uhJmt4U6kcg7E+bASRVYCGAgwrviHnZPwh9hO+kloSBoVYOZ84E2REmLjZRQcl5
 MjBVynp7fFlEg5I69vfoWgwfe67ai9WZj515fHjedrkT4cCcs/Rb8S7yn+ugJKi4IKJDleLiGsd
 kwbJkX9InjtqA2sSKMGbXkQp7s5+encN6CZFxG4hjg6TA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832400;
 b=SMJqvKXkJo35bQtrCCU1k0Vr5mi6Bg6kZ+gMMhL00v7Wu45lWevh9bJ1SP5c4CiknksKqRS0
 kxVFx+tRiq63gdHaPVcXlqetLQBMKm5wXcowLKtLhl3UHeCQBCgqiX8pqP2o6FMoyFZnD3W2P8z
 8qPTxAFlgeNVNhgtDJ1JL3PCJFO804PMRKWHNRDjoyR7MmO1f+HjzSB6iupG3PGYQfTXKLwhH3a
 QXy4e7eZHbkpINW71VfJ6z5e2IMDtaIG8BxkMn2YKqeC6wtdkiMpooC0jxtKuOsaMGBiV0ZCecq
 2joCFKVtC2g+mC+DAGJWJVa3tNyRSaHX+HaQNG0oj5/4g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay73-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8E76A5A04B4;
	Thu, 30 Oct 2025 14:53:11 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
Date: Thu, 30 Oct 2025 14:52:54 +0100
Message-ID: <20251030135306.1421154-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay73-hz1.antispameurope.com with 4cy5D82Hd3z14Sd1
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4ada1ca96b2637bf43c610ce9808313e
X-cloud-security:scantime:1.655
DKIM-Signature: a=rsa-sha256;
 bh=No66cNLUicbMmk4yWzYnf+xkWOSrPxLslCLwe5XBnm4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832400; v=1;
 b=nQnqsQf4rxddw29BW9zRbK6j8L3TNXQNUkX5uxBKri+9MXMCGjzI2Hs+GRBhEBe2tFh4p2p1
 8Zlj+Ad7IfqCJV2jjWzNU2HUSsiRz7wQS9DqcmUMX8QYyy2xcf53DfSgtmxX2nocjHWxCDNVvsK
 S/WmaPmIkgotoanExUNgra6lZ2GoBlJruEkEs+tHVtbN/t1ttK0VP2BVV/iWUSjUaaXQLXxcRMe
 eb+k2Y9C2Y2zdguxnVxHMXgRQh+ngp5YXl9kNbcmQKOXG69ADYKRKtseH8cVMVn6qhV/dmTuMfL
 UtRr2epHld2b0d89dvf9/4t6dXpI7BtkUhEOwczPWhNuw==

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index a6ab94208028a..cc251505f6280 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -493,11 +493,10 @@ &usb3_phy {
 };
 
 &usdhc1 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
-	pinctrl-3 = <&pinctrl_usdhc1>;
 	bus-width = <8>;
 	non-removable;
 	no-sdio;
-- 
2.43.0

