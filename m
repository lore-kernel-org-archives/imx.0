Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31817F4FF
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954076; cv=none; b=ZTC6C0nI5awcuO76SGXp8PlMUEpLdHvQ999gGEzOkvRCYGG3Mh80PNwr8pxBiMv4laT+E9CMG+4hsf2VQEkjzpSQ6UDCwgp0BS/PK2Jb1o8w6kvdH0uQswpzyqeXfWT+qKYzec/dpzEJt6PwXzOVyF+7vNWYMiA+mZ4eM7V/aLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954076; c=relaxed/simple;
	bh=PcOuKkLdV318ux2SfOeH6WRx/invjEp6iYls66ameqw=;
	h=From:To:Subject:Date:Message-Id; b=AQJuglCYjPiDEdoSOmeAuV1+yeZLCImq4JLHBIZ4aFFbJpwr97eeYE7XR3AT3SHF3QcxPEeAInDmQYdhvrlYCochQRzOPXHYTOhtlICIGwJMVOiX+crTH4gzFiT7u3YhOq0Q0HMzmGFsURlpL042+lp0Lr5Rr55D1PdR+QhQM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E694A1A22B9;
	Tue, 10 Sep 2024 09:41:06 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BA6EB1A227B;
	Tue, 10 Sep 2024 09:41:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 219B0180031E;
	Tue, 10 Sep 2024 15:41:05 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 0/3] arm64: dts: imx93-9x9-qsb: Add sound card support
Date: Tue, 10 Sep 2024 15:19:29 +0800
Message-Id: <1725952772-30357-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add sound card support:
wm8962 sound card, bt-sco sound card, pdm microphone.

Shengjiu Wang (3):
  arm64: dts: imx93-9x9-qsb: Enable sound-wm8962 sound card
  arm64: dts: imx93-9x9-qsb: add bt-sco sound card support
  arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support

 .../boot/dts/freescale/imx93-9x9-qsb.dts      | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)

-- 
2.34.1

