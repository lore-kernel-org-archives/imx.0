Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EA340D93
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828621; cv=pass; b=jmHIx9ICuGnVuXTjPrla3BF+/zkpY8UXO5Qdl8C9ClmORl45eBUJz0Hd+XDuLQNFWhf9nwNtJWbaGeo/SbWbZ5kA4SgfzutrHr/nLKxZ+O6u52j22JfQtK9eFW9kulFm8rAj4E59KTxIeCzP5BjafI6QHYi/1/JDguQt5+p1mJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828621; c=relaxed/simple;
	bh=gsntOPMD2rPmRjXq5D6VPWvyhyUwrWd5WBIPPuLLrjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7pUhK08KhglBKnKwbFT0HVvtCqH+Yx+fQS+HmVPLAlm/IuQVy2del4ROjGPP+tRuxZ/sN2j5/ZJjyh6PsRIFkTGL4uJ1xTrNRnmf93i0akhmfCIvZOIidX6KkHKJ4DJiSGBdfjieqIT0Z22hu89UwTh/aYk6id2LO3UwBUN4XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lB3EgHYW; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lB3EgHYW"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k7CHMivira0x/FyH+Ow1E9d8fqnubbrxUxidvJeHW7o=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828602;
 b=IgB62SkO6MafWzVc1DO/bGvmy5oL/aTrSlFyRHYOiQmzdRyn9x/gnKViru/uNYQnkos2hiGz
 qDQFZrmtdGNWHV7E+scZmaKnAZONSzGdbXkj6TjVlGKYzvLlPFyMkpwG1DW3PIyxgNt+LIrrmll
 PPT2dFrE54MVULUnonSAAWHeHRuDU03JrrsTpZZMv5Bmqc1kneLVTrRO9Qjh3xtHwwN7ExNAfL2
 SHwekR9oNl8jXBzR9kZg0TdNNe4lQFJWycIeQqj8a0UBhkUr13h9+HYmN486u2qD9EqjbDLgvu0
 f4PYL5LYG8ezZxAbRvR+C/L/weOwSxDaG6GzTNOd3CVDg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828602;
 b=JiKViHpqQhx9vB7npXDGv2hk50KqQ4RftpJDJLFm8AitLBmU/xKYoLzjp2TnH3sxFauk2mh7
 WQGBQXGQeFrtsYH2K8gbLH0TIU2cGz6uetFcdDDQmeKAK5o+QepQIeQWPhOpDpnitSP0dtQI0fh
 xna+8eoyB8i9HWo/Sk5HwmVE6KGW7hYQz5j8bVGlIDWOm/HN6pBnmUz5tIiNpF3auKtuIF3PQUe
 sEYBCKfRPwcsfJhc33HPEY9y+Rmx9A5J/t0dfFvG9TUqgtcPGBncu2tkotR0AU+fGEx1io6zNhW
 xsWIRH3+1Ke8mcRSHdA+wy21FiugUQH0dPWKrRTRuneGg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6035B220CC1;
	Thu, 30 Oct 2025 13:49:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/19] arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
Date: Thu, 30 Oct 2025 13:49:08 +0100
Message-ID: <20251030124936.1408152-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy3q40Wp6z2nHFG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:c734b9e42def97ec10e90bed4c62542d
X-cloud-security:scantime:1.998
DKIM-Signature: a=rsa-sha256;
 bh=k7CHMivira0x/FyH+Ow1E9d8fqnubbrxUxidvJeHW7o=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828601; v=1;
 b=lB3EgHYWqzaqjOqV+PDUIa2wD3ZvdJFFX1zCs6uFdM7fYDKXxe0ZfYUu13GJuid18KlW1sv+
 lIadz46AUqXovtLYCAuO/4KhE+Mk015sR6ycW5BFZ4fPpq1BeFX0/KE10f8SjQkFanau2RpxE1Z
 I8XMSD/hE2kOcrtT59yHK1zqvtvWTYEM8czeM00/4QnwrjC1KmwCgVqmXE+/7Yipa++BZPxDcj8
 goK/T/NHbcjHyQAFbNIwAj85CwUoQzTH/BJGV4iIXWhMG1p0YliIgto0PrUffde4PJxyhADZg/G
 3JgsmS33QOgOvalE7XAMh4UomK5FcM/+IMIAbviZg9OuA==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

tpm4grp will be overwritten. Fix node name

Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 180124cc5bce1..c3bb61ea67961 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -617,7 +617,7 @@ pinctrl_tpm4: tpm4grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO05__TPM4_CH0			0x51e>;
 	};
 
-	pinctrl_tpm5: tpm4grp {
+	pinctrl_tpm5: tpm5grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0			0x51e>;
 	};
 
-- 
2.43.0

