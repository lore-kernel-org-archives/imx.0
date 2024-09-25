Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1236E647
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727246824; cv=none; b=KAeSJcxzT/K+ICi5P4UXQJ0xkuQfnu5Y6o6E2524PIvOydUlr39/TbPRm72nTs0yaeSByQZeBgkZvxw83cHxboVrY0El6DzNF/1GWO4rJGco8ObZvNwS1qI2QMi/MeWdeI01IGOpS1jp/SaTxue81molSsV3+d4UpSlJ5YmMLPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727246824; c=relaxed/simple;
	bh=4idforpbTEOfIZK6IXKeMTEb84q9Hl3h6Javh1jSOgQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=b868uAAhxB8disduA4QhDgzHxSTFtUT8PGtMNmzIt6MzSSXNWGZWsSnzbjD3JAmjzhVrfmttQanA5/QhCy4p9Z85uMuOBgZDxU23VrjiYOI68OP2u89uKfoUm2xjIOCWatt7Pr9TH1fOAEP3hRWm1BuQ3uCwDte0I/IuWVCHmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5887A202A71;
	Wed, 25 Sep 2024 08:47:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 17822202A83;
	Wed, 25 Sep 2024 08:47:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 22AEA183AD50;
	Wed, 25 Sep 2024 14:46:59 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com,
	s.hauer@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v2 0/9] A bunch of changes to refine i.MX PCIe driver
Date: Wed, 25 Sep 2024 14:24:28 +0800
Message-Id: <1727245477-15961-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

A bunch of changes to refine i.MX PCIe driver.
- Add ref clock gate for i.MX95 PCIe by #1, #2 and #9 patches.
  The changes of clock part is here [1].
  [1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/1725525535-22924-1-git-send-email-hongxing.zhu@nxp.com/
- #3 and #4 patches clean i.MX PCIe driver by removing useless codes.
  Patch #3 depends on [2].
  [2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com/
- Make core reset and enable_ref_clk symmetric for i.MX PCIe driver by
  #5 and #6 patches.
- Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
  i.MX95 PCIe PM supports by #7 and #8 patches.

v2 changes:
- Add the reasons why one more clock is added for i.MX95 PCIe in patch #1.
- Add the "Reviewed-by: Frank Li <Frank.Li@nxp.com>" into patch #2, #4, #5,
  #6, #8 and #9.

[PATCH v2 1/9] dt-bindings: imx6q-pcie: Add ref clock for i.MX95 PCIe
[PATCH v2 2/9] PCI: imx6: Add ref clock for i.MX95 PCIe
[PATCH v2 3/9] PCI: imx6: Fetch dbi2 and iATU base addesses from DT
[PATCH v2 4/9] PCI: imx6: Correct controller_id generation logic for
[PATCH v2 5/9] PCI: imx6: Make core reset assertion deassertion
[PATCH v2 6/9] PCI: imx6: Make *_enable_ref_clk() function symmetric
[PATCH v2 7/9] PCI: imx6: Use dwc common suspend resume method
[PATCH v2 8/9] PCI: imx6: Add i.MX8MQ i.MX8Q and i.MX95 PCIe PM
[PATCH v2 9/9] arm64: dts: imx95: Add ref clock for i.MX95 PCIe

cumentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml |   4 +-
Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml        |  25 ++++++++++--
arch/arm64/boot/dts/freescale/imx95.dtsi                         |  25 ++++++++++--
drivers/pci/controller/dwc/pci-imx6.c                            | 166 +++++++++++++++++++++++++++-------------------------------------------------
4 files changed, 103 insertions(+), 117 deletions(-)

