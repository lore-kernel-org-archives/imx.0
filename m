Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492963D994
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832435; cv=pass; b=WFIjqwoGpVo59pE560niHXAGWS1zJYaPE462YM4z4GL9unv2IZa9BLC6d1S4qMczuku3y/IH43yInBFlJbLlPhzamJ/QEHbTORNffDqdJnkXGYgM0cLaoHB+kTmdnxExPurDUxSMkmUanJ96ov6P8kKRaBYctIMz76LHtzmRr74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832435; c=relaxed/simple;
	bh=vSEt8sKRMJkJ7G1x852UGcOe5J/Jb3KgwI4p2Vj8AwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9RSsOUArwwDPr4YNbkfT1M/qixqsFMTvzW9kKCeh0A2vAazPKKsg6WRICWVrHP+oB6sdbuTceAngrEacNnPA5SeWQxURmIg3iT6Kpj5tMIsa8IuvXxxXsjdv2t+P8dxdIp2Ud9dJdYF9SUFgX1nuR89ZeJqVrhXiNZ3tKXX/Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=F0u9l98P; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="F0u9l98P"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=kOaQn4zUTWP9GdeQhCdCgUXwFC1T+DHJft+KqyFqp3A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832415;
 b=XiIeIgsrEbpfUPV8+gOxQ/JNrCdFb2cdOofwjJNlJslQPt7BFilMV2BCIxtuzc3mKkWuavjq
 m5DFuYQq5vrq2OKYNU8cckUZPXwAsq7ijJyb6rQyVGkaXRHK9y17QGXd5+s9XVjdU03BAThTIbn
 l1nvcs84tqXTR/fiRnf7Pjs45aq6dqbLs4zEWedGUGpIhD1UtdcOIlY0tO5XxQR0uTil3JErSvL
 7aMp2PMTbyjVNh5jwg40EusYPUQbFDl+9BBnTLBn7j/KhbDNr2SVf268UvJpBEJcMrGXP/CLzwD
 r9FxvjWIOk8AclYVUpsbOwOAT8yqOSMabouOMMtxtrZTw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832415;
 b=QFOL/jSVc/iC+fYQekXdQHwMYtB83+BSqDqhtslQqCm5mYwWF56dcXgRDuQmZJHxkYv9Vufv
 CBYt/NnRF9HRcWT3r/bDh5h5Asi9/ekMG8b/rTqsTwHqxMBViWuOhhgauDYRGnZn67qoym+CCjf
 79qhc/R8ZO2/slUGX/cuRDd5+7VeXJkWOzlGJaw9r+hwYfANjFn3d5Mo6bGnTCYvlaBRDdHcy2i
 0Mu9hFt7EP+fifLpB0SaozLUZ3s5nLf7GuxEeQbUTkyy90HVdngQ6fnFOQOj33u1t28RljD2u81
 j3wbJyHTe3lP3qbKBb+jKVFKNjIz39r5osiccunnQPsnw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 30 Oct 2025 14:53:35 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 50BEE5A0994;
	Thu, 30 Oct 2025 14:53:15 +0100 (CET)
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
Subject: [PATCH 15/19] arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
Date: Thu, 30 Oct 2025 14:52:57 +0100
Message-ID: <20251030135306.1421154-5-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4cy5DP37Jqz3ybG9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1c794a8416528de567ccb6017bd72231
X-cloud-security:scantime:2.053
DKIM-Signature: a=rsa-sha256;
 bh=kOaQn4zUTWP9GdeQhCdCgUXwFC1T+DHJft+KqyFqp3A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832415; v=1;
 b=F0u9l98PhvQHZPMcgPNagLMh4VLhHwUmkdVKnf6SfW5Rx9P/AbBe5qtDwl80WwpdX0CDMZ8/
 p55wP7AxkuquC8Rs5VCrKZzfU/UH1RhWVmp9zvnSSh/+i6EM/C5EhfE2iEH2We+0oTS7s+QR2Vc
 k2POmTkChCHWz9PQYs8XqaI09rvtc9XIaPwfkcmIkUDocf28ngrd1ohFOjdwTmd4WR1Bc8u0HhI
 U6O0YcT5BrhM1oeXYIEGnMvrFeviAZxC74yW7lHlexKHgUrPl3B4BnNEn4cRaIQWj/7g9Eo0Plc
 +5vTNvqTGh3J/wahS+BmJuTw/p8IWXXNKyhcyu3lfVt2g==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The special ID device of the EEPROMS needs pagesize, too.
Otherwise only slow byte write is possible.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index a4c6083ab43b1..43418844701b1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -203,6 +203,7 @@ m24c64: eeprom@54 {
 	eeprom@58 {
 		compatible = "atmel,24c64d-wl";
 		reg = <0x58>;
+		pagesize = <32>;
 		vcc-supply = <&reg_1v8>;
 	};
 
@@ -210,6 +211,7 @@ eeprom@58 {
 	eeprom@5c {
 		compatible = "atmel,24c64d-wl";
 		reg = <0x5c>;
+		pagesize = <32>;
 		vcc-supply = <&reg_1v8>;
 	};
 
-- 
2.43.0

