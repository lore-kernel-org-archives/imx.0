Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E14A31
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718595939; cv=none; b=ZxGq7kU5jC0oQjGyB6QDYIRvY0aHEEXL8qWl8X2G/sLA7KyMQqc6btvzFD60o3wxO8WqllRvDT9hndlChgHo2owIfNoskjGI69x+ki1IRdkqTaWkg3QTmwSJCW/qz0RB6B1bJqHrmMph3LwZ2zO6fS1vl+eNhnLLl0XJSPybrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718595939; c=relaxed/simple;
	bh=sXWdN1O7NqWFWY4b+k53ydKXcnKDx79uD/Hs5GIZGNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dm6+3Ped62koA/Y24EnyyG8XX3jc7iNuDNQTGWxRmRJ2C7Gv2ZfLOd4Z1gVPUgw9ZzZsPATj2uFxIrWBtY15IQnZjyfi9QW8EXD4D3i22b+ralcfbcAn2lUlLs+8sUAL1OzpxCq1D9Rv8WCaZ18iBZafCSzCjAr45hDoQ105sVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P5B2pNw8; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P5B2pNw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=m/voODt9TY9R77IeA7WVY1A3Xd9OvptuZQxSo0kZs+M=;
	b=P5B2pNw8XuOnAe5tN1wARWhYS00dQAybsm3HhIDGMeUj1x3AU4JuR9EIH4jSca
	uFcxOYE0i7akYvX9NnBz22N3/S4Y9AXgGFL3+p2fcQrAUN5FWVhkVXk3HXuA8PWb
	lSsXu90Qs9Ta4Sb0vlG7b0Y4omsYWu8VD/zkSWnXQnFfc=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADHLxlVsW9mtC7PCA--.5394S3;
	Mon, 17 Jun 2024 11:45:26 +0800 (CST)
Date: Mon, 17 Jun 2024 11:45:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.10
Message-ID: <Zm+xVUmFtaOnYBb4@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:C1UQrADHLxlVsW9mtC7PCA--.5394S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryktw13Cr1xWFyfWF4fAFb_yoW8tw4kpF
	yfCrW3Jr4fGr18CFn0qF4kX398ta15AF4Yqr1Yy348Kr1rZw1DXFnxKw1fWryjvryxXw4Y
	yF1xGryUWw1rXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jazuAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRcBZVszXmQLqQAAsO

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.10

for you to fetch changes up to dfd239a039b3581ca25f932e66b6e2c2bf77c798:

  arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc (2024-06-17 11:07:06 +0800)

----------------------------------------------------------------
i.MX fixes for 6.10:

- Fix GPIO number for reg_usdhc2_vmmc on imx8qm-mek board.
- Enable hysteresis for SODIMM_17 pin on imx8mm-verdin board to increase
  immunity against noise.
- Remove 'no-sdio' property for uSDHC2 on imx93-11x11-evk board, so that
  SDIO cards could also work.
- Fix BT shutdown GPIO for imx8mp-venice-gw73xx-2x board.
- Fix panel node deleting on imx53-qsb-hdmi, as /delete-node/ directive
  doesn't really delete a node in a DT overlay.
- Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM.
- Fix GPU speed for imx8mm-verdin board by enabling overdrive mode in
  the SOM dtsi.

----------------------------------------------------------------
Fabio Estevam (1):
      arm64: dts: imx93-11x11-evk: Remove the 'no-sdio' property

Frank Li (1):
      arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc

Joao Paulo Goncalves (1):
      arm64: dts: freescale: imx8mm-verdin: Fix GPU speed

Liu Ying (1):
      arm: dts: imx53-qsb-hdmi: Disable panel instead of deleting node

Marek Vasut (1):
      arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM

Max Krummenacher (1):
      arm64: dts: freescale: imx8mm-verdin: enable hysteresis on slow input pin

Tim Harvey (1):
      arm64: dts: freescale: imx8mp-venice-gw73xx-2x: fix BT shutdown GPIO

 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso           | 6 ++++--
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       | 1 -
 7 files changed, 10 insertions(+), 8 deletions(-)

