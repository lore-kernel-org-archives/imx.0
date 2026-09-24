Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427147F3C8
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255105; cv=none; b=qMNDEVmHL9Lo+noDVQCEN6+4qcWtNwuPndCywrHEjRcsJD0SbR/XaAB6SJusAJwNObiPOG0ephN2E0XD/vMYpUQm7mI4bYspONz300kC+DCyfzhUB8e6PQgn5Z/zV493S0tuhp2ybPMNrz8YJmbRMjR5rhpX7ZxielC09h+eUXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255105; c=relaxed/simple;
	bh=hekwDVgDeqSsXzkW28xH+CwqFTcrEVPALo/c+0dpGxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtdauKD29Pxd/nQebiF3nu5jrUM1t6X6Kzn86tFN08WM01exmqxBv/CxMH9tBP2Jbb8x5W5oczio7PYqvkBdghdIvNIVMnoiF2knBeUcbBjPgHN2/9KqVorlM2nBe0WCBdLWxmgXmO59jWyzazd/oKA71K3sL4cAstpPMB8BdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ndsuxRr2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ndsuxRr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790255100;
	bh=hekwDVgDeqSsXzkW28xH+CwqFTcrEVPALo/c+0dpGxU=;
	h=From:To:Cc:Subject:Date:From;
	b=ndsuxRr2YWH8zsx6KOWlqkSGf9p1DLaJPgazqUo83kX+5GJR0Do4ctrJhznpiq/lq
	 CX2/YSnLXFwAE/c2N9Ssitf7tcPIh0Tcv6PG7pycNh1FrHP5C97C2bQ9jf5KKw2ThV
	 jhaIaWfPCzdOsWdyyYFfUybGGkxu72Am8hEP0l0H5IG3nUAOXzaA1mBdZTWTDQaFan
	 uevpZMQTjpLNZnqnItyjeAbtKGQTDbLCWdTO4S9bCzn2xyNA/5saegfV9AmHEt+/oO
	 jgDMi3j0HORmVHrgXk+NMXwNnscjsfGNstzO4AacQPGj9emrKZXPeA0LS33OqPr/u+
	 EFyv5D4bpHuSg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B435017E04DD;
	Thu, 24 Sep 2026 15:04:59 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/3] Remove unused variant and code clean up
Date: Thu, 24 Sep 2026 15:04:50 +0200
Message-ID: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1

Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |   9 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 105 ------------------
 4 files changed, 11 insertions(+), 143 deletions(-)

-- 
2.53.0

