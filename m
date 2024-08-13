Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924F19B
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536152; cv=none; b=a4dqvM3+AkAyhV7Pbkh2yHaLuSi7OrzOSe5KE+LTFNeivFehKAP1eHfKZEQ+CYFghwMF43Y+E0gsGo+aoTIyrueQRIZOk8eyP5G9OmiVc36tZYWDNUnn45KrIDdhz80hwCBY6lJRIURm2sXcz+Qo18t8Le0Ws/ImzXCzwTVG8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536152; c=relaxed/simple;
	bh=aNolctlY4FEkPyrq8h+vaS63dt/bh8uyQNVMknBP/j8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lhp/L+9MU0TF2ecK+U4SaCDUhsbIEHINe5rDCXw0vPCYaQx+wBLzGo+0UMC6UNOdgeePp4sb/JR6jlrHhpg2XMq5IdOav9gWhnw01+xWFx5eR4j6JM7IT1XjKqpJrAKt9vYoTCxW/ptNC4Ev1BdOKO/PjZJFDuh1d/mT3It+mQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 674041A1138;
	Tue, 13 Aug 2024 10:02:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D0141A1188;
	Tue, 13 Aug 2024 10:02:23 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8C04E181D0FD;
	Tue, 13 Aug 2024 16:02:21 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	l.stach@pengutronix.de
Cc: hongxing.zhu@nxp.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v5 0/4] Add dbi2 and atu for i.MX8M PCIe EP
Date: Tue, 13 Aug 2024 15:42:19 +0800
Message-Id: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

v5 changes:
- Correct subject prefix.

v4 changes:
- Add Frank's reviewed tag, and re-format the commit message.

v3 changes:
- Refine the commit descriptions.

v2 changes:
Thanks for Conor's comments.
- Place the new added properties at the end.

Ideally, dbi2 and atu base addresses should be fetched from DT.
Add dbi2 and atu base addresses for i.MX8M PCIe EP here.

[PATCH v5 1/4] dt-bindings: imx6q-pcie: Add reg-name "dbi2" and "atu"
[PATCH v5 2/4] arm64: dts: imx8mq: Add dbi2 and atu reg for i.MX8MQ
[PATCH v5 3/4] arm64: dts: imx8mp: Add dbi2 and atu reg for i.MX8MP
[PATCH v5 4/4] arm64: dts: imx8mm: Add dbi2 and atu reg for i.MX8MM

Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml | 13 +++++++++----
arch/arm64/boot/dts/freescale/imx8mm.dtsi                    |  8 +++++---
arch/arm64/boot/dts/freescale/imx8mp.dtsi                    |  7 +++++--
arch/arm64/boot/dts/freescale/imx8mq.dtsi                    |  8 +++++---
4 files changed, 24 insertions(+), 12 deletions(-)
