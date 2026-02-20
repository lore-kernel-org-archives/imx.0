Received: from mx-relay116-hz1.antispameurope.com (mx-relay116-hz1.antispameurope.com [94.100.132.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D733B958
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599606; cv=pass; b=bQdC+Az++rhfPJxpoVpXY0Nkvnuhbm0S9CAG932n1ATJFxRe8a+34gFa53f5Ihbb7+fqe5UsA/d/NnWI4coPMBBq9iA8zsMuvehMnlq9BUiivPFxJXTp/4cvOLpMEx8z3hUv2qgvC2pqdZNBhqh+siWk4pA1cmLE/Ztz2psj0p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599606; c=relaxed/simple;
	bh=apIPLWpNIr79/REjp6Ox0yJLQ55Z8pQJ2XbzCvjz4GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R37b2IMcalINqnbCR4bxd+0+r6WHlYac9gn5pAXGQI7AkkM6bteVkPSgIS1BpCAGR9jqlFKI7TqNJhSj2UnnuxS+mbUYTFtZD/LTvFvRxrzcoFBuWIIal5NFGLeaI817YHrbfnS96RtoqLsJRHZHJUHwjDInb/WiQs4lerVQ/kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=og0jeS3s; arc=pass smtp.client-ip=94.100.132.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="og0jeS3s"
ARC-Authentication-Results: i=1; mx-gate116-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=lhvqRKEdBFpg6Tb3T3Vs34pdHi/UJgksuj201a6fjtY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599576;
 b=dRF50OzDvLukIESV19H/I1d9eIxoD7MXvrts1Z5RQW/om+ptP7cFy5ryH5hMJZHHG4l66lgZ
 rPlT2R2NuQcIE10//r6Z8kfF75NRxgvohwvuqHOvM59CC64bNYyvSQ4C3pHoUpSph8ThWcQAJG5
 XcHhfx3nP/g9KHDZyHTqtdnGJhPdue9XAvz8qLPHb1ul+AP+1P11R5hPwohalr2GuR0dPvyGaBD
 F5H2hHIGES3J8qEZt+5kCrgavTT1C7tSigM/I4qdFh2uvGnDjsQ+4jcpKc6I53QShLofxEsr02j
 QNf5nOnW33LUdMR1AwM7JW92u2I/5D1Av1I//0ILzx/3g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599576;
 b=QG4R5JETNVKHsG9iHgmRBtuvvMHh/ZzG/gNtyzKDU1wSMkgVPpJLg2RLmSIBZnkQIaSTX/FO
 hIkSEQFEgC1MMiaZcKRnA7xubb/FEiPJ5+33BQ/7OIJGA4uQUFFsE9NY5xl1ottHRo317Xezm1M
 5+5u1UyUkcX+PLwk321HHeIkU+A5hpIWQeaDA4L8ZoAzkwYSfhpSN418Bt9xl5lpfzZbUQ7j74V
 UrXVXRKlSWKrEtEd3jaI+g70+04ub2KCaVMSyMNh1y/hSBERg8zgE2/UsxkHp9vv2fWG8wdYwtD
 sTolJLCGSyVqnhYOlFOif5wPLgUEmN6oczHzoVH7HzhhA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay116-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:59:36 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9BEB9220C4E;
	Fri, 20 Feb 2026 15:59:22 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <alexander.feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Subject: [PATCH v2 3/3] ARM: dts: imx7-mba7: Deassert BOOT_EN after boot
Date: Fri, 20 Feb 2026 15:59:09 +0100
Message-ID: <20260220145917.1797286-4-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay116-hz1.antispameurope.com with 4fHYLN53sMz9sQ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f11760d955dda304ca308bf5bc77bde4
X-cloud-security:scantime:2.105
DKIM-Signature: a=rsa-sha256;
 bh=lhvqRKEdBFpg6Tb3T3Vs34pdHi/UJgksuj201a6fjtY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599575; v=1;
 b=og0jeS3sy+gRjlSJSp9G+T+ZDHVzTxyZ+x5ekl8QONQy3zAO/XDDYnJYiDrzgIK7eeldbRJo
 HlPFTMKaMnftezvwCUGlwecKTCD6UCNoBeb4y2XLaM/Eb7RVQq8uT2yAbZyceQ/Z+5Bamm8akJ6
 vBuKSnvch0Tl5NaRF5j3k14VJIBoRKTb5wkxZ1fPVTlh4DlhFWKs1CbzevJEDiaF78M9M83I2h8
 ZIE5e4d/p8vh6ugclNLpbolcAaHItOOxvVUTE94QEsf87r7o0E8hBJUJe5IiUhBNPBx8WX3XlhI
 4loUomS/s/QAuzKw+I0Tv7MJWmU2SFZKnKMtQOx8kIhiQ==

From: Alexander Feilke <alexander.feilke@ew.tq-group.com>

Deassert BOOT_EN after boot to separate BOOT_CFG
circuits from LCD signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status = "okay";
 };
 
+&gpio4 {
+	/* Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible = "national,lm75a";
-- 
2.43.0

