Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DB31282E
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421468; cv=none; b=i5NRp8yCS00++g4L18TYb/cA+/A5Y+uRfrXiuPbkhqjFTmcHM9Ei00648vzpTSqxqLPodKUsiT47V7aw3zd3aakzqVWUL4y34A5RkCwZKWHE9h/WlxQB5Q7MLc5ZFZOLr/1a/+Loe2taSx40dr0C8PFHVzyAwMGMdu18ZFY7JuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421468; c=relaxed/simple;
	bh=VqfdmbS/NowLoUF6IELM+UUM8aCTyUTi6eLEIqQdY8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irQY6PwwYlEa9LXjZMPU+LDUot9+5lH/yJ1q+xfZdBBgFCLI7xrUHpEGbQH3BzGWWtOvy2PxMAW3rf/SiWMGxXa5sM0sfGYlErzM8WiNO3DWLP57c7TF3iiZvEt2w1TTpBofIkSd/Yi0o118WcI6VBFIesjeVgnAeq8NNFtUp2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=MHXeV1uN; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="MHXeV1uN"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W5XQvr67ppKEv7j8lI1OxJ8VB1al1Zi7HovSXR/21hA=;
	b=MHXeV1uNtdW1YLFHFyT66YlUJwbKIAtBas9rb3Uge3Y2URC+dVIXW5xcVXxUdgUl3IlpD2
	nKFfaPO9Wroqyi7wqUB4ec/m3Nn0w1ZaeZSk3WAtbYR5LBp2Ac+rzMLv9S2jCgTgbydWab
	rMJCxqcq++eXq04ZPs34TtExr99uQMGpuxI5c1RKl9kRlwqFQfiZ1XVzfddFNuMx2MPs2n
	lSn8S0oUNDNwp2VQEMH8/HCREEpOSqZtUO8Jn/YE4d5zpluIuLtWWySgipvpWPwTYS3ZoV
	udpNQ9I0LACTlMsP3wRN8XnOf/FN+SOFqkSNAVSXRAX1tbnQISdib2n3wQRNkQ==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Wed, 18 Feb 2026 14:25:04 +0100
Message-ID: <20260218132519.74570-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This contains three fixes and one cosmetic change for
the Kontron i.MX8MP OSM devices.

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (3):
  arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL
    devices
  arm64: dts: imx8mp-kontron: Fix SD card supply on SMARC eval carrier
  arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 26 ++++++++++++++++---
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |  6 +++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     |  1 -
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.52.0

