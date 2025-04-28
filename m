Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0741025E800
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829794; cv=none; b=XC7PS261jrGN6aeZacW4DuPgWwY7rkTnGx5gqMw6gwN791kfEFIrdE/xZ06yly69qPXX6TLnS0A6Nz/6HlCUfiFcjy00CoUPExAxlWVQZrj5I2X7oGKwWkhCRFgJtpVwp/dz+IDm7ttUMDp0KWCtX+CKIcWbyGDj5TbwK+tWSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829794; c=relaxed/simple;
	bh=OI5ZUFkKlZcdx4XCjlRyprfVIcbcTC+fNZppjc7+axs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+WyVwaHcBEJsogIQGj/bvTNRQK++3+D5IYKSBcvGRsWqR9fLK4VI+9t8Rr4w9AI6H521PPepYtEw2ZWsb51YHm90EarWzjwOmr2D9CtiHLIZ8UvGpqRqp/WQExU2f6oS8I2CIPMGZaDUmS6FgMCaWtbTFy3aw+60lzWOyX1BTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qbJT/6nX; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qbJT/6nX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4K3Qwsa6osT47RC+pxezJV4ZKGVwxR2f9TSemPDQ+RM=;
	b=qbJT/6nX6mSTCQCOCMYGvgyL6IwI2sY+D7ktj7c1vVNdgBMTucsfXvR6K3XRjs
	vRDzyVAMsX2o6BT0P2KQSBJZEFL0QAD/MLLmLqcTaCg6EZY7nLjeEYvw2Q6NiQZ0
	odel16PFErR6M7H8A5SaTyRkfPBwuSiti4uiuAVmFjP64=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3;
	Mon, 28 Apr 2025 16:42:38 +0800 (CST)
Date: Mon, 28 Apr 2025 16:42:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.15
Message-ID: <aA8/fFzh22s1Vtl1@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgAHLyR8Pw9oAgMVAA--.28245S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1xCr47JF4rKFyDWw48Zwb_yoW8uF4UpF
	y3CrnxGr48Jr1xZrnxt3Wqq345Jws5A3WYvF13X340yF15Ar18Xrs8W34FgryUAryIv3yY
	yFyxtr9rK3WrZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu6wNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARk9ZWgPB4HeVgAAsp

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.15

for you to fetch changes up to 5591ce0069ddda97cdbbea596bed53e698f399c2:

  arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2 (2025-04-27 21:49:30 +0800)

----------------------------------------------------------------
i.MX fixes for 6.15:

- An i.MX8MP change from Ahmad Fatoum to fix the broken nominal device
  tree caused by commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
  GPU and NPU clocks to overdrive rate")
- A MAINTAINERS update from Michael Riesch to exclude Sony IMX image
  sensor drivers from i.MX entry
- A i.MX95 device tree change from Richard Zhu to correct the range of
  PCIe app-reg region
- An opos6ul device tree change from Sébastien Szymanski to fix
  an Ethernet regression caused by commit c7e73b5051d6 ("ARM: imx:
  mach-imx6ul: remove 14x14 EVK specific PHY fixup")
- An imx8mm-verdin device tree change from Wojciech Dubowik to fix
  a SD card regression caused by commit f5aab0438ef1 ("regulator:
  pca9450: Fix enable register for LDO5")

----------------------------------------------------------------
Ahmad Fatoum (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks in nominal DTSI

Michael Riesch (1):
      MAINTAINERS: add exclude for dt-bindings to imx entry

Richard Zhu (1):
      arm64: dts: imx95: Correct the range of PCIe app-reg region

Sébastien Szymanski (1):
      ARM: dts: opos6ul: add ksz8081 phy properties

Wojciech Dubowik (1):
      arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2

 MAINTAINERS                                        |  1 +
 .../boot/dts/nxp/imx/imx6ul-imx6ull-opos6ul.dtsi   |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   | 25 ++++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  | 26 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  8 +++----
 5 files changed, 54 insertions(+), 9 deletions(-)

