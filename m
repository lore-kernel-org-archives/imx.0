Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EFE1A00D6
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 06:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540678; cv=none; b=OViiWJuMbotFQ/XTvslzX1v2yuOE5xRY3E88+VaUnn1QDlRfhCZU44qSiIHHY8VpSOVIa0Hw8LC/ZYsIJzQjEXLxDJagAyYcImkO37EwRdRWZFS5kXdPm862YMQh4gsKcz9I7BS2XlZ+5OApVSjR4ETfPYBxDlLFoy8hg2hPDnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540678; c=relaxed/simple;
	bh=zdDSlWIVp+0RqFGuz/t8Xe3qKegz57MXBjABF3Guqhc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Qo2wN4PkB0uy+EVFL1BSJL2IJOXASmI7qjVqOhNBBYvFZhvYP8jy3lfIG3noCVVD6w1v9Ayl2BBgN3ovX2M2Kao+Ejr3p/RIggIyMTOFmdTuT/PXAVE6CUuhIIPCxakHA6D9FqCGHJHOm75E58eNtcTbBvMAZAl+o8kjT5XCUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA2281A175D;
	Thu, 10 Oct 2024 08:11:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 88EED1A28B1;
	Thu, 10 Oct 2024 08:11:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 05EDC1846660;
	Thu, 10 Oct 2024 14:11:12 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: jingoohan1@gmail.com,
	manivannan.sadhasivam@linaro.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	robh@kernel.org
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/2] Bug fixes when generic suspend/resume functions are used
Date: Thu, 10 Oct 2024 13:47:47 +0800
Message-Id: <1728539269-1861-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Two bug fixes when dwc generic suspend/resume callbacks are used.

The patch #1 is issued before, but it's not applied yet refer to [1].
Combine these two bug fixes into one series and send here.

[1] https://patchwork.kernel.org/project/linux-pci/patch/1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com/

v2 changes:
Thanks for Manivannan's review.
- Refine the subject of second patch and add
  "Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>"
- In first patch, update the commit message and move one comment into
  proper place.
  BTW, Manivannan found another potential issue that suspend is entry but
  the link is in L1SS stat in v1 review. This is a new story. And it's better
  to be verified and fixed by another commit later.

[PATCH v2 1/2] PCI: dwc: Fix resume failure if no EP is connected on
[PATCH v2 2/2] PCI: dwc: Always stop link in the

drivers/pci/controller/dwc/pcie-designware-host.c | 31 ++++++++++++++++---------------
1 file changed, 16 insertions(+), 15 deletions(-)
