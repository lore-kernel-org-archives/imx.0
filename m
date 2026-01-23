Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B9337692
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769150600; cv=none; b=jtt4VV3ZTv14HH1ogDhwS+9gZ38VhD01a6C+TSZjVfmZvZc8Q8ScorVXXEcy5YpOcBSzpPeMjynpqlVoBLFnBde+lCIu1oUnSFiVCpw5JedqrBxt7ucOOUeiJixMCY4IdCHb6GrOb9Ygx2YtKxa9+7Ijak73GHf44nep1/pBN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769150600; c=relaxed/simple;
	bh=67q89WD0bKZAOBMLjge5JhBMek2CR8lI575BsdEeo1g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jNyRJkMOaUCin++3G8f19nY9zq6wk/4d2eO1jXDoTlJj3aQpimG/l4VduIOppddBIYwF7WRTy5NVk8hg3ZTAQ8c4zGpZBxcl3jk/UwBvgRGSMIizFBvI7xr8KLbA6COREpxD6HeH37q2DuyPrvqhdCng7kIIe26SRAW3bkgWFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3DA5C201A6A;
	Fri, 23 Jan 2026 07:43:12 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 06633201A58;
	Fri, 23 Jan 2026 07:43:12 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 33F661800098;
	Fri, 23 Jan 2026 14:43:09 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Subject: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
Date: Fri, 23 Jan 2026 15:41:58 +0900
Message-Id: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYYc2kC/23MSw6CMBSF4a2Qjq3pvUDxOnIfxgH0IR3wSGsaD
 GHvFhKjGIfnJN8/s2C8M4Gds5l5E11wQ59GcciYauv+brjTaTMUWAKKkrtuIgjcet1xVHlOjVJ
 opWVJjN5YN2216y3t1oXH4J9bPML6/u9E4ILXVkulBSgkuvTTeFRDx9ZKxC8JPxKTPFVEstF1X
 ZLay/wtpQCQe5knSSdZgTayICw/clmWFynZPG8YAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Xiaofeng Wei <xiaofeng.wei@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769150588; l=2468;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=67q89WD0bKZAOBMLjge5JhBMek2CR8lI575BsdEeo1g=;
 b=m6aU0YC/6tLLPp25SYwaax61igDTFxTO3DMgGOxCJLOEyn5QiPmAZHze+aMwnK7N7l8rPQDIH
 xll//jyCjQCCuORqPqQedqRcpMmmXDibk0bq0D9/gSmpf1sShl4AB0k
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

Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
---
Changes in v4:
- Remove the board-specific "fsl,imx6sx-sdb-mqs" compatible from the sound-mqs node
- Remove redundant address and size cells from lpi2c2 node
- Link to v3: https://lore.kernel.org/r/20260116-imx91s-frdm-v3-0-98671de64925@nxp.com

Changes in v3:
- add bootph- property for nodes should be kept in bootloader phase
- add code-review trailers
- Link to v2: https://lore.kernel.org/r/20251215-imx91s-frdm-v2-0-87996bdaa59c@nxp.com

Changes in v2:
- Correct author name: removed extra period in "Yanan.Yang"
- Removed aliases pointing to disabled nodes from DTS
- Add "rtc0 = &pcf2131;" in aliases to make external RTC the primary device
- Fix DT node name: change
  "usdhc1_pwrseq: usdhc1_pwrseq" to "usdhc1_pwrseq: usdhc1-pwrseq"
- Renamed LED node from 'status' to 'led-0' to comply with gpio-leds binding
- Replace regulator-based transceiver (reg_can_stby) with CAN PHY (nxp,tja1051)
- Replaced 'xceiver-supply' property with 'phys' in flexcan1 node
- Adjusted alignment in fsl,pins property: used spaces between pin names and values for proper DTS style.
- Refined commit message in dt binding patch to clarify board differences
- Link to v1: https://lore.kernel.org/r/20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com

---
Yanan Yang (2):
      dt-bindings: arm: fsl: Add FRDM-IMX91S board
      arm64: dts: freescale: add NXP FRDM-IMX91S board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 769 +++++++++++++++++++++
 3 files changed, 771 insertions(+)
---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251205-imx91s-frdm-2c339bcc2f6f

Best regards,
-- 
Yanan Yang <yanan.yang@nxp.com>

