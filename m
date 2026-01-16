Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EC31195A
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553796; cv=none; b=XZoSwVPTFYKUfpqtkAKAmPPAWAuu1lecSGJl2V358H/FPpb8jhMNeCnJvitiJGR9Uu6WFMI0K6N9Ec2hsxOJC37dGCv+KPN2wDYuF00/C/UQPbQ+RSJ41A0vOEYhuhRYhW9M8Uojp9i/kHFgEFyh5gmQabDibQryXSXg20boU/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553796; c=relaxed/simple;
	bh=L41wFS2FXO+gmq1auWSbWfGL0NY1XhArgZGklZ9nx3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l29xEk2W2HMZGoYGnA48AQdnMRUXsJDyCeUdFEVNFfFagEQaqQBdD95sRgIz4KFjbe2RyUjOOnjgfCZc2OzwenF60jMmIapt0HOIsSLlC3pB3n+1RygXJXbmCnP9fBnPzBNdKzrqR4J/+IFkDnU9bff5GWOvdkG53sHV/qDod08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C71901A0BE4;
	Fri, 16 Jan 2026 09:56:26 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 949561A0884;
	Fri, 16 Jan 2026 09:56:26 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 6A0ED1800309;
	Fri, 16 Jan 2026 00:56:25 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Subject: [PATCH v3 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Date: Fri, 16 Jan 2026 00:56:12 -0800
Message-Id: <20260116-127-v3-0-3dc49545a745@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz9aWkC/1XMQQ6CMBCF4auQWVvTGWlBVt7DuIAySBcW0poGQ
 3p3CzFRl/9kvrdCYG85QFOs4DnaYCeX43QowIytu7OwfW4gSQpJVgKpEiXXSiHXXd8OkD9nz4N
 d9pXrLfdow3Pyr3004nb99xGFFKol5k6fB1Ty4pb5aKYHbDrSj8CPoCx0ZTokVppK+oqU0ht+g
 lH4xgAAAA==
X-Change-ID: 20251207-127-4e8551e8bdaf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768553785; l=1381;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=L41wFS2FXO+gmq1auWSbWfGL0NY1XhArgZGklZ9nx3o=;
 b=lMjXEfNbB/R8BTFmceqt+HWx0U93K1cwx5QXC4cak7Gn7K072bwFkN5n3aqbfccAidV2cynIK
 S73pxG7VKNCANYuBky69qB21MtG56DAP0NWzDaFkmM7RukkZaGJ+pI9
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
Changes in v3:
- Add a blank line between the cpu and codec node definitions.
- Link to v2: https://lore.kernel.org/r/20251217-127-v2-0-67cb12e56242@nxp.com

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
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 964 +++++++++++++++++++++
 3 files changed, 966 insertions(+)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251207-127-4e8551e8bdaf

Best regards,
-- 
Lei Xu <lei.xu@nxp.com>

