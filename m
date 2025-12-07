Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5248299A96
	for <imx@lists.linux.dev>; Sun,  7 Dec 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765113977; cv=none; b=C1W+gDog9Hf/UHZE2udM7ZeopmjZRTzSO62MDdWb7LO89e/5SWtDljeitdGHEKAHiz2XPq2SSyoT42bmc7wczoMes4QQS9/4O9O3cPWTweSnadoVbAa/dkLsfbMX9y6P5pefX6jbP+7Y3lnxYpFo/Wjdjp/yachE9YpdTxsWuco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765113977; c=relaxed/simple;
	bh=mAQMidlfAh7acQminBmYENG65UBBRhmk24mxnH67v8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U7OJ2q1p2ZsbTObP2C/Dah6vTiSM+pRon8jutMvQ85uYg6dbkUBoq3/sPkB/itIrQwpkej8x16IhQwKtCaInR625FAATPH9L+W2sZcZLagUhiOyiwhpR5EcX2Yodeso5GW1IoEy8xI2ayqr87eqrkKRQUX6u5M4e1BQasmRIKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7719A1A028C;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 471D21A02A5;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 345181800321;
	Sun,  7 Dec 2025 05:26:07 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Sun, 07 Dec 2025 05:26:04 -0800
Message-Id: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyANWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNzXUMjc12TVAtTU8NUi6SUxDQloMqCotS0zAqwKdGxtbUAtTz3FFU
 AAAA=
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765113967; l=891;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=mAQMidlfAh7acQminBmYENG65UBBRhmk24mxnH67v8U=;
 b=6gOCQeJM99J4LOUxJfK/WHWpuJgWl5KrEnrG8KG2ytJv+Vsnt9J6SZm5G3loir4nnEKSJ/sHe
 DwEb19bhrZeDcxUzH6t09tdZ2cF9Q7sKnFt2S21bipXrhk2umNoVZD2
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP

The NXP i.MX95 15x15 FRDM board is a compact and cost-effective
development board based on the i.MX95 applications processor.

This patch set adds device tree support for the board:
 - Patch 1 introduces the DT compatible string.
 - Patch 2 provides the complete device tree description.

Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
Lei Xu (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 955 +++++++++++++++++++++
 3 files changed, 957 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>

