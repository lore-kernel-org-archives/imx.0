Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93228302777
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764922326; cv=none; b=GYgHoIrtvxp1M5GVTBSV9S4UTgJAwPefQg1Yp+5qsYdUEgZlzafx8CoTvfzL7CPpQAKUNqGjUpihm/HbdfquVdM3cBFiN2JxM+g5TRz+xluUYH0Goj4j/rmbFuWDPsg1l7ZniC8jnSqRWR3ilEwPj5ITi/L7zhIS592T1KKuImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764922326; c=relaxed/simple;
	bh=d2zmFOf8MzVNNVznnj/CaVvJLkXTZi4n4HgehrscTF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGo30D30BchUM9Weo/Zoe2DSiOdBazul9WlfKJU8N5nxHWKrR6sABFSnEJy7SH9rQUqFBv/Nv7QrHaR+frvflaI+XDzzvxqSiGnJ2iFjwNmscllGsF+2Y3121wEeQNF3tFSd6sfJHyufuUre/GU4/YlB8O48B9Kgjl2v7zHrAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1BFE81A11D9;
	Fri,  5 Dec 2025 09:04:21 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D66991A18E8;
	Fri,  5 Dec 2025 09:04:20 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9F779180007D;
	Fri,  5 Dec 2025 16:04:18 +0800 (+08)
From: "Yanan.Yang" <yanan.yang@nxp.com>
Subject: [PATCH 0/2] Add NXP FRDM-IMX91S board support
Date: Fri, 05 Dec 2025 17:03:57 +0900
Message-Id: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2RMmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNT3czcCkvDYt20opRcXaNkY2PLpORkozSzNCWgjoKi1LTMCrBp0bG
 1tQCg7hvcXQAAAA==
X-Change-ID: 20251205-imx91s-frdm-2c339bcc2f6f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764921858; l=1206;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=d2zmFOf8MzVNNVznnj/CaVvJLkXTZi4n4HgehrscTF8=;
 b=vuk4bfFnP6+HR62Yg+1qgGUEqd5b5P9cD1fSelSs5bwfmKBFyJN+tUsMn20Z1X0j2QaJKquF3
 GZxnqhEuM14D77AuPnPiLkwAlKIjh1UIkOYVleflOInA4PiTRNzWJqR
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP

This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
variant of FRDM-IMX91 and differs in several hardware aspects:

- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

This patch has been tested on FRDM-IMX91S board and verified for basic
functionality.

For more details about the FRDM-IMX91S board, see:
https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S

Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
---
Yanan.Yang (2):
      dt-bindings: arm: fsl: Add FRDM-IMX91S board
      arm64: dts: freescale: add NXP FRDM-IMX91S board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 692 +++++++++++++++++++++
 3 files changed, 694 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251205-imx91s-frdm-2c339bcc2f6f

Best regards,
-- 
Yanan.Yang <yanan.yang@nxp.com>

