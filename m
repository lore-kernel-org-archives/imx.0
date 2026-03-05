Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA833BED3A
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729167; cv=pass; b=M6nz4Qp4fAq2gckD0byislu8TFUw7HCVM7w9Dw5FoaqFoQAsiL/N1hhgY0uvxxNiqgCHSiUNsWdjjrLEkr/LpRs16nahPXOeBOrUI8DyDg6HfezC6+qtM9loNmqDZzohoTdFmhZREUNzazoNuq2MmddjP240lxJunE0MZy2ZnGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729167; c=relaxed/simple;
	bh=HRkTxuwxJA0Vyf6FQfWmcnVzESo3nj9aAWXNjzeyn4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6Q2J42pTPKFnXdU0h3u92ISwkCDAw6f+oJ/L/51RL5fJrmH5GrJ9UEFZ3F5bYKt1wwvrYRM8LE65A/1tKm/96P7tI1PwH1ip1MTSfqGqOf4nD67ATj1gyQZgkgNl2AUctcGuoW8Pu8v6xRYp0g46zhUCCI6Hw4WY9dukDsA8co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZG4cpoS8; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZG4cpoS8"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8ngiLaVCA85hGhw8n+Td0yCrIRvJxsFDKHVUsZ1Svyg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772729149;
 b=qJ7gYL9j9iFM8IIyRXrz70A6CunleWHEZ7BXeuFJXjnK8bM19mIQ6p++tEW7one23lDNdO2b
 FATxlf0c6ds0HKmJGN1C4Y3viXGB2IeWie78aQ+j12V4A6vhOPrh1UUVfm8RH9AmZN3lzDYUPDs
 l+BjJM4mMXeayqIoRduQtHTe0Bi7BibTUxNRkQDd267fRYebiEvN52s4JpRRp9a3M3K/cGU/HMg
 ZRTk6PLCd9teIzpOYPoHL4G3uVkMCNVdpC1jv1RLofuyBTtsH/g7xuNzIfL5zl44qFcVdTbT0GH
 wFj6+iZiOr9MtD/Z2/sxfLl+0Yv80Pw60c/l6ss5+azAQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772729149;
 b=h8oDG4mKhpJ1oMCj2xhRfwIQDVa5/mP3zuo721h7Uz1IT58Twq5WhG/b5q/cXg2uHAvZp0v2
 HKTgVeIB4cO5HotzZnpEe1jNQ3LdR5tL0JNlpYYcW0SNzyqHFZXocCUM4Eqoba7o0Q1GtpmRzO2
 MOSqLlSVpHcrLY+HEAvaQ5EeEjThjz1hraUZezKUyBrtgJeeAODQ+0CBI4PdSOl7QKkOymlz7sA
 8+xgCotcFeRLzJN3iejLUO2GUETFr+N0rXm+xHZi1RsSapTod4kFyN6KPDseIVs0ZhzxDSVLDZy
 d/XrKsLhL3vLHhXNHEa1ycymWOMinryF4nPTUfyzg4/VQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:45:49 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E957CA407E8;
	Thu,  5 Mar 2026 17:45:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tqma9352-mba91xxca: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
Date: Thu,  5 Mar 2026 17:45:34 +0100
Message-ID: <20260305164535.2653745-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
References: <20260305164535.2653745-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fRb4y4zlgz4MYsQ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:2cfb841dcaefcfe296d25fd5cf87c6d3
X-cloud-security:scantime:2.057
DKIM-Signature: a=rsa-sha256;
 bh=8ngiLaVCA85hGhw8n+Td0yCrIRvJxsFDKHVUsZ1Svyg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772729149; v=1;
 b=ZG4cpoS8O7bbx0wAXj34qF2LSg90JwKI0YWCyTSmHL4Q+fh7aTk+GdxohpK2ZHdFAXgwvbMT
 3awKkRKriRUMZKYbjcg/LiVLlLhB++dAzC/fAFiycRlSTQas2XwZSCKMRBe/TIdpsmf1L0Qzi1y
 /P5rvNDYANU/kc+/QFHVPzicsh+k34IaLDkG5Anmb2yxJ/elAOM9Qa+rDJJ2n/iemb4qBBSLdj9
 tt5FG6wMLYULMDP8rAvaRLu2fMphoDbTV87heOQchGlw9p4QeROGpgYkaPYyrqlu2vXhCGuDfZX
 v/Q2B7W5jdf+zU2NwjmWPbVOZekzzxNJ5R4Dn7yND4NdQ==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Adjusted the subject

 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 2673d9dccbf4b..737326ba1b2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -232,7 +232,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -265,7 +265,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
-- 
2.43.0

