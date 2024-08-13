Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F199419D076
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723559031; cv=none; b=bw6DkJ2gZ5Yw2py4Ys7PsAW9dcTzvrsxWnP3DjSDkN2Lrbs22F5Fvee5bMU5gKh99O1R9iAKo+x3ETYSyHwpiYFULnLJkaVRQ5KibGTIO+JnqdhLKYMva8tSHAAjhaugktElUHqBsVqF49Po9bOvwpr3GDROjXHHCwpO8Uh9o5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723559031; c=relaxed/simple;
	bh=i8604XNN9W+BEGXigXZlkZvPTJNteLfB7vh/HAPFGO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K10h1403ZKRFbcTes7VLJ7+nRLpf1eUQHV2qAJFxtjdr5i9CrcWIzv6OXhpr90WN+d8b80UywoGSH6Lwe/sQWPWSPt62F6dvpEQuDN8GU3rBieCdJLEjkGf39Y/wt/zHKHY4sLFu1s4X/ispBRUvXTiFfbvlVu7v3ODaJ1iQJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=apjAnD12; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="apjAnD12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7y7FTN3y7R4e2mlON2AVKGWnnhTPLzqmdhXN9LPsCoU=;
	b=apjAnD12xZcZxdIam9g9rpwNLF1JvGq+dBf1SbFE1zuwVdgjx8UGLO9JIIcw8y
	222WtTkRN18VdvL5fnU/2CMr7n7yb4RPipKF/J6ABa6aMrKg+4KwFfFSbv4E6+yr
	2xAX7LVPq+myte5Brgf5Qm9LClw28epTLAU37Y6ZUPbO0=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3nwhMbLtmkKAeAg--.15796S3;
	Tue, 13 Aug 2024 22:23:10 +0800 (CST)
Date: Tue, 13 Aug 2024 22:23:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.11
Message-ID: <ZrtsTO1+jXhJ6GSM@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3nwhMbLtmkKAeAg--.15796S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw18Xw1kXr1UAF4kKF4UJwb_yoW5Aw47pF
	yfurW7JF4DGryrZrnrZw1vq3s09w4rJFn8WF1UWrWxKrs8Aryjqr1rCr1fWrW2vryxZw4F
	yF18tr17twn8XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVfO7UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBU6ZWa7PexpgQAAsq

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.11

for you to fetch changes up to f149be46e4c13e277e013c0fff13cb2aa7a4399c:

  arm64: dts: imx8mm-phygate: fix typo pinctrcl-0 (2024-08-13 16:37:14 +0800)

----------------------------------------------------------------
i.MX fixes for 6.11:

- One imx8mp-beacon-kit change from Adam Ford to fix the broken WM8962
  audio support
- One pinctrl property typo fix for imx8mm-phygate
- One layerscape fix from Krzysztof Kozlowski to get thermal nodes
  correct name length
- A couple of imx93-tqma9352 fixes from Markus Niebel, one on CMA
  alloc-ranges and the other on SD-Card cd-gpios typo
- One change from Michal Vokáč to fix imx6dl-yapp43 LED current to match
  the HW design
- A couple of imx95 fixes from Peng Fan, one to correct a55 power
  domains and the other to correct L3Cache cache-sets
- One tqma9352 watchdog reset fix from Sascha Hauer
- One imx93 change from Shenwei Wang to fix the default value for STMMAC
  EQOS snps,clk-csr

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962

Frank Li (1):
      arm64: dts: imx8mm-phygate: fix typo pinctrcl-0

Krzysztof Kozlowski (1):
      arm64: dts: layerscape: fix thermal node names length

Markus Niebel (2):
      arm64: dts: freescale: imx93-tqma9352: fix CMA alloc-ranges
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: fix typo

Michal Vokáč (1):
      ARM: dts: imx6dl-yapp43: Increase LED current to match the yapp4 HW design

Peng Fan (2):
      arm64: dts: imx95: correct a55 power-domains
      arm64: dts: imx95: correct L3Cache cache-sets

Sascha Hauer (1):
      arm64: dts: freescale: tqma9352: Fix watchdog reset

Shenwei Wang (1):
      arm64: dts: imx93: update default value for snps,clk-csr

 arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi        | 12 ++++++------
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi             |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi             |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi             |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi             |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi             |  8 ++++----
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi             |  2 +-
 .../dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtso  |  2 +-
 .../dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtso  |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts        | 12 +++++-------
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi          |  3 ++-
 arch/arm64/boot/dts/freescale/imx93.dtsi                   |  2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi                   | 14 +++++++-------
 14 files changed, 33 insertions(+), 34 deletions(-)

