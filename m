Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6818AF9
	for <imx@lists.linux.dev>; Fri, 12 Apr 2024 04:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895291; cv=none; b=nN+Sq8EaNOkBvy8ONqdpYwWUKN3eRHSd7Mxml2iIcFMRVzTU2Pcy+GTbQR3JFVfS45lieh1uj/3XShorBZtbyYkQkFQLF5elqoflXtSbGeCjfAIj+0HdtN0v2J9iWnjlkisHn/8GyJz+pKp0GUAXcsCfbsi5hncKsIOWOa+7SOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895291; c=relaxed/simple;
	bh=gIvpBVDdOYjlbsqtGbic3vWnwDNFVdIU3HpLKyKZOzE=;
	h=From:To:Subject:Date:Message-Id; b=cxNN35QBIOUb9fxXesps7lqu1FgNJwMF20lTfj3Y+FrMLt6ZSziviySP2wNqKQOk9qne5+2qoqrMh7ap06gP11mV61JASyBhtjfv5xR9bfKFGsKmCPygW+i/Ih8rsk0hom1WEnJMWJ1dHmCPVeUlBIbvHdTQdJ+6uHTe5zXsa4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AE6922003B8;
	Fri, 12 Apr 2024 06:14:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 770E0200383;
	Fri, 12 Apr 2024 06:14:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9D1F0181D0E5;
	Fri, 12 Apr 2024 12:14:44 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] convert imx-audio-spdif.txt to YAML
Date: Fri, 12 Apr 2024 11:56:50 +0800
Message-Id: <1712894212-32283-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

convert imx-audio-spdif.txt to YAML

changes in v5:
- fix typos in second commit message

changes in v4:
- change the enmu to const
- add more comments in commit message for second patch

changes in v3:
- change file name to fsl,imx-audio-spdif.yaml
- change example name back to sound-spdif
- exchange the fallback and specific compatible string
- update anyOf content

changes in v2:
- change file name to imx-spdif.yaml
- remove |
- add anyof for spdif-in and spdif-out requirement
- change example name to sound

Shengjiu Wang (2):
  ASoC: dt-bindings: imx-audio-spdif: convert to YAML
  ARM: dts: imx6: exchange fallback and specific compatible string

 .../bindings/sound/fsl,imx-audio-spdif.yaml   | 66 +++++++++++++++++++
 .../bindings/sound/imx-audio-spdif.txt        | 36 ----------
 .../boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     |  4 +-
 4 files changed, 70 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/imx-audio-spdif.txt

-- 
2.34.1

