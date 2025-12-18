Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1C312813
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037403; cv=none; b=VKFTvcYvg4hQNhV3nlXCDLmJS64XNEswSrNjVvmlACKg3ORejf2FQIL7UM2zKpyISBFIcYHs9JMswwiylFBMbtFjcdRKS80qFchLWR7d66dgEU/z1s5rjxkYgTbzjwGjYzzCS1OCxMTaATKQTfNpVdTKfFKWW13hujfEp1GKNVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037403; c=relaxed/simple;
	bh=67DEaW6RDZrattoYChlas5jD67OOmeCLl/JFoGPVb8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZQh6/nC0uZjmX9b1LlsqWS4CgPR9ngTS0ccgvFTs+SYEFJC61mHCAcKz5Svbq1Em53QQyJ0jbytt5uRqdy7ELfHY8o1hpsmS6JXuCBDPyZQUy8hv3Ikx+6kKygM1p1L0GZJTogO9/0d6VNBP1O5xodEJAyQNVpPfLS+5bu9n0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28AB120208B;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EBDC1200736;
	Thu, 18 Dec 2025 06:56:33 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id CCE9F1800310;
	Wed, 17 Dec 2025 21:56:32 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH v2 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Wed, 17 Dec 2025 21:56:27 -0800
Message-Id: <20251217-127-v2-0-67cb12e56242@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuXQ2kC/1WMQQ6CMBBFr0JmbU1nYgVdcQ/DosBUZmFLWtNgS
 O9uZefy/fz3dkgchRPcmx0iZ0kSfAU6NTAt1j9ZyVwZSJNB0q1CatWFO2OQu3G2DupzjexkOyq
 PofIi6R3i54hm/K3/fkallbHEPF5vDo3u/baep/CCoZTyBTo2njaUAAAA
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766037392; l=1219;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=67DEaW6RDZrattoYChlas5jD67OOmeCLl/JFoGPVb8E=;
 b=lK66SOlkudbpxDksbfMH0bDDuoSv8y1cQqfod4CfntqpLVifHqFEEwEeHkFMDmAxhN44gG8gv
 qJLJ1LPS/WcDPnbTO7O+MTRXI15iIc2bJBjtvpP30tUln58N6DhwJyi
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
Changes in v2:
- Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
- Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
- Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.

Link to v1: https://lore.kernel.org/r/20251207-127-v1-0-5a2eeb69f150@nxp.com

---
Lei Xu (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 963 +++++++++++++++++++++
 3 files changed, 965 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>

