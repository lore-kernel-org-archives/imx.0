Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929B929D1C
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221093; cv=none; b=A3giYMNg8yBDvVeqUeQ8IckcN+yD6GEUYXZNTL7+1fxQtUwS+KcaSol88wq8A9gfNSxYCJCbEQg29V+1uF+LxW+0nsyo8ftihvfVJVLRQphRXBIDNorEGBoqakoJb5DhvPLlBx//xBjy26+VQwQ45wH287CpJroooW17hD6P1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221093; c=relaxed/simple;
	bh=WVDtzPK+J17RLFazAce4YI5UXAV7A3dkUvt1WEcLXy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rLyBb5/OwhRR50tXhnnUxxUxWcF60brsVLb13knvAIAWblKXdD+OnzBNT6586kL/kI6dwfiYzHUmpr5bXsG3qVV2EMYZHvHfppIrrB9/UPQrbLOauEv7GlT/mdUoaE7ZEqHe9Uk4AjScKTqMOsxkLH3ByiP9MMizqQfg12gFL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QP6TB58D; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QP6TB58D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=m9wfLN0/U6O/h9jSHSpgQxev0RktWios43AT403zDCY=;
	b=QP6TB58DvYcpoikETNbDTbQfhroTLAS3FlM83/d4ID+xbmWu8Hwz77E05FomxA
	92+HK14MKQYqx/jYVAxyCS/Dx7JqS9xgnc4wJmbQSDVsLMYTHPV9YDp+YPJSEDff
	zoR22aW2guXBEX8ACUUcG41kY4yHAxw0+/j7nxPf8V18g=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXP0N9aw5mz43DAQ--.14732S3;
	Thu, 04 Apr 2024 16:57:35 +0800 (CST)
Date: Thu, 4 Apr 2024 16:57:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.9
Message-ID: <Zg5rfaVVvD9egoBK@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:ClUQrADXP0N9aw5mz43DAQ--.14732S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWxXrWUAF45Kw4xJFW7CFg_yoW8uw45pF
	yfGw42gr1kCryrZr9rZa4xta98Cwn8JF4kJrW5GrWkJrn8AryqqFn5Crn5WryUXFWxXr40
	vF1rJr1DXry5Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuT5LUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQC2ZV6NnB8eRgAAsO

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9

for you to fetch changes up to 00b436182138310bb8d362b912b12a9df8f72ca3:

  arm64: dts: imx8qm-ss-dma: fix can lpcg indices (2024-04-03 20:44:54 +0800)

----------------------------------------------------------------
i.MX fixes for 6.9:

- A couple of i.MX7 board fixes from Fabio Estevam that use correct
  'no-mmc' property and pass 'link-frequencies' for OV2680.
- A series from Frank Li to fix LPCG clock indices for i.MX8 subsystems.
- A couple of changes from Tim Harvey that fix USB VBUS regulator for
  imx8mp-venice board.

----------------------------------------------------------------
Fabio Estevam (2):
      ARM: dts: imx7-mba7: Use 'no-mmc' property
      ARM: dts: imx7s-warp: Pass OV2680 link-frequencies

Frank Li (8):
      arm64: dts: imx8-ss-conn: fix usdhc wrong lpcg clock order
      arm64: dts: imx8-ss-lsio: fix pwm lpcg indices
      arm64: dts: imx8-ss-conn: fix usb lpcg indices
      arm64: dts: imx8-ss-dma: fix spi lpcg indices
      arm64: dts: imx8-ss-dma: fix pwm lpcg indices
      arm64: dts: imx8-ss-dma: fix adc lpcg indices
      arm64: dts: imx8-ss-dma: fix can lpcg indices
      arm64: dts: imx8qm-ss-dma: fix can lpcg indices

Tim Harvey (2):
      arm64: dts: freescale: imx8mp-venice-gw72xx-2x: fix USB vbus regulator
      arm64: dts: freescale: imx8mp-venice-gw73xx-2x: fix USB vbus regulator

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  1 +
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    | 16 ++++-----
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 40 +++++++++++-----------
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    | 16 ++++-----
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |  2 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  8 ++---
 8 files changed, 44 insertions(+), 43 deletions(-)

