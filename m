Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89C149C40
	for <imx@lists.linux.dev>; Thu,  9 May 2024 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715232862; cv=none; b=mo2xhFQ0AQie95FoQ9yCITPfEr0Rl25DIT6HUzm7aBxfOTRbZ4EXLzkjITl+T3YDD9Wk2syE3WlbiXgwSgxe9w3OIt0QRWSrH7lysM5vTAazrA0NwWzlzIJDMCZR7lQzLckkUnbehwAtZ6uV/Y3SiJE5YQk3O4BV50Kza9NqrzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715232862; c=relaxed/simple;
	bh=2/t3Z4b0GAOUkX6lvbYOVj/e6wNgV+ILmPK3JK4zn6w=;
	h=From:To:Subject:Date:Message-Id; b=kkj5t+viqQEXdrK30GUXsQda73T5EMG1h6AkbKUd+t0SNQCW6HaRxbzfTeFhLoU8VQU0DlVqaFE9/7ugZp0I4GO7CKuAyqClsR3LgjjjmLd/hE7glj+smUi2op7RShOsPngluFyeJl/bMawht6lGMisngkTCCGaTgHraAxwadvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2120C1A1FFC;
	Thu,  9 May 2024 07:34:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE2191A1FB1;
	Thu,  9 May 2024 07:34:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0063C180222F;
	Thu,  9 May 2024 13:34:14 +0800 (+08)
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
Subject: [PATCH 0/2] arm64: dts: imx8mp-evk: support bt-sco sound card
Date: Thu,  9 May 2024 13:14:56 +0800
Message-Id: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

support bt-sco sound card

Shengjiu Wang (2):
  arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem
  arm64: dts: imx8mp-evk: add bt-sco sound card support

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 44 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    |  3 ++
 2 files changed, 47 insertions(+)

-- 
2.34.1

