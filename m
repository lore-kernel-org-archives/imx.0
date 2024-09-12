Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF035894
	for <imx@lists.linux.dev>; Thu, 12 Sep 2024 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726107696; cv=none; b=J4SIr7/xWeRuZ6e54bYPwE55tdxWdtLjJzyIjMy1oXJ4LiT5OPDjt0RGiYuJfaVelPZ0liC8yvbI/aSk3+zaWXcuFw5leM4nQxR/rybtNo1Te7jt2bo2r9wW3H5rpH+lRZ8UFyREht7l9rMkWjcscJhbn81XwYGztSIONRaBOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726107696; c=relaxed/simple;
	bh=OwMxa0vZfNdCfcBN3+So0s0M5n2FfphZssLUCSKA2IY=;
	h=From:To:Subject:Date:Message-Id; b=gPYALiLVRQvIQZDeGhNaimf2/IlULxhuybeQgMZfn7vn/JM5NUgbcU6oMI6BbYj0vyBUaXOMQQHGxTFONLwmlHzcge8hgOLOi1nq1TLTw1YNdGINRDUMK1gcRRxpsuKxWMSmwtuBA0DOOIByMudZkYA9Hgcf5KXIG/ZFnCFPnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D828D1A1B12;
	Thu, 12 Sep 2024 04:21:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EE161A0A6D;
	Thu, 12 Sep 2024 04:21:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 011B31840308;
	Thu, 12 Sep 2024 10:21:24 +0800 (+08)
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
Subject: [PATCH v2 0/3] arm64: dts: imx93-9x9-qsb: Add sound card support
Date: Thu, 12 Sep 2024 09:59:38 +0800
Message-Id: <1726106381-1138-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add sound card support:
wm8962 sound card, bt-sco sound card, pdm microphone.

changes in v2:
- sort by node name

Shengjiu Wang (3):
  arm64: dts: imx93-9x9-qsb: Enable sound-wm8962 sound card
  arm64: dts: imx93-9x9-qsb: add bt-sco sound card support
  arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support

 .../boot/dts/freescale/imx93-9x9-qsb.dts      | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)

-- 
2.34.1

