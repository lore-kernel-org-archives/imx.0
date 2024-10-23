Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5BF54670
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653955; cv=none; b=LU+91SASTXTuU9OwIWzGXr+yH/UlroNqO3By1W6ZClkIVXyWhZk+LnDa4G+WLn5v6+g58X2CZV9CCT4xDp3qkKI8WxDfmV5r5ebhSV7aBLHi6SCbomQQ3dFvSYwc57ZEdZE8sEDE7hihbKAgZjHWJFvISQpnt0DLhTSbC2KZ+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653955; c=relaxed/simple;
	bh=9ODiL2pRt1ViKWu+nMBIQLFnub+25XaFUeXv3t8jRhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2tCIgmqnuiZSsv6YSZBf22jaFxGQ/ngrzUt9uFEx6SYPn3W7gW3QcnrdY9mmZ/0dncmoCbYLoKyzkNcj88G2wRteBYHLnsynDHg620giAmx4CGqGFlS5YpxY9WY/erF3rsXjbbEqC/kjGAehbKz7qHYn/dQ7fVFmuP9TAzaRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jDnYIw2Y; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jDnYIw2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yUdVLiUDkYG2IBd+ChMSiXpSOZ90QuZyC03MDrmos2Q=;
	b=jDnYIw2YwY+ziNep7L4/rpkmjyOsEDorqJeBtyC8JF+kUaNuH+jgmieDkYMrUS
	/CmYpKITidm563fiW4E+CZv0yxR6wtSh9dH9j1FO46N8z/tfDE7x1SaoLZ/zcPQ+
	+OS88RUqiH1QB84YgHiZNtHjAlRw6fMYtTnp3BXbzW1ok=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHZ+uebBhn1MGmAA--.6111S3;
	Wed, 23 Oct 2024 11:25:20 +0800 (CST)
Date: Wed, 23 Oct 2024 11:25:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.12
Message-ID: <ZxhsnnLudN2kD2Po@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:M88vCgCHZ+uebBhn1MGmAA--.6111S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Zr43Wry7Xr1xur18Grg_yoW8Zw45pF
	y3C3srGr48Gr1IyrsIqws2v3s8tw4rAF1rGF13JrW8Kwn8AFyUXF43Gr95Wry7JrW7uw4r
	tF18Kr9rGF18XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEReBZWcYTLmoVQAAsV

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.12

for you to fetch changes up to 4fbb73416b10778adfd2c1319e9c5829780d8535:

  arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz (2024-10-22 11:22:15 +0800)

----------------------------------------------------------------
i.MX fixes for 6.12:

- An imx8qm change from Alexander Stein to fix VPU IRQs
- An imx8 LVDS subsystem change from Diogo Silva to fix clock-output-names
- An imx8ulp change from Haibo Chen to correct flexspi compatible string
- An imx8mp-skov board change from Liu Ying to set correct clock rate
  for media_isp
- An imx8mp-phyboard change from Marek Vasut to correct Video PLL1 frequency
- An imx8mp change from Peng Fan to correct SDHC IPG clock

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx8-ss-vpu: Fix imx8qm VPU IRQs

Diogo Silva (1):
      arm64: dts: imx8: Fix lvds0 device tree

Haibo Chen (1):
      arm64: dts: imx8ulp: correct the flexspi compatible string

Liu Ying (1):
      arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Assign "media_isp" clock rate

Marek Vasut (1):
      arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz

Peng Fan (1):
      arm64: dts: imx8mp: correct sdhc ipg clk

 arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi             | 12 ++++++------
 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi               |  4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 12 ++++++++++++
 .../boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts   |  1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi                    |  6 +++---
 arch/arm64/boot/dts/freescale/imx8qxp-ss-vpu.dtsi            |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi                   |  2 +-
 7 files changed, 33 insertions(+), 12 deletions(-)

