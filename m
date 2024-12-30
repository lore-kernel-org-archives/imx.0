Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9A025948E
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735548946; cv=none; b=ZOY8QK8U1EDUPAcOir+KeosKLuYxI3YAPWYYKF1zKSKtTPGWcp8LSi42nZJJYx3jNa1WiQtfcLyDu2tgdv1eH8HybZmfhfxvE38YwkFrKtoBPpdHw7Chs48xRHg6US87xsvVrks624/o52jfImVT7aynFcv1HHnQOPyN0U2gjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735548946; c=relaxed/simple;
	bh=HSPJudKip8xsAkK+VgHsqxznwELDFqQ8B5BLHxpggII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOd6IThTebYIef8EjeJPN/5PYhvX+i5aSy7sJmyNcvthijD+b9N9lIlFBEGXZnnWQTXzVJKx4dEwPkjv+NB9xqzdFJfJ04VuzzsWvKuxvkFUpTfIApZXIhhYF3vAC3B+CyONJZ6st4sqD0mLUNQ8PJ9Gs2Hgmi0Eoajw7HdqrVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iFBnYqMJ; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iFBnYqMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IjhTyIk85EtpNPozN27xxdVmdA+yXi+gjfkzcQ6a74c=;
	b=iFBnYqMJqaikGPTd2JOQK6c5ctUwkZKCAj9vBwTj7blaP+TXHq1si3Lt8oSX62
	u1dAG78ZNumNWkhOBONf17DX1t2B4h7YYo79Wgi4HUaFhHJlaixvaXWV2GFZ1bOs
	39CqSucAA9NAh3KYuKSabIsbGQhma5fmHn3r5uG+6XiQc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3WW33X3JnAhn5BQ--.60155S3;
	Mon, 30 Dec 2024 16:55:21 +0800 (CST)
Date: Mon, 30 Dec 2024 16:55:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.13
Message-ID: <Z3Jf9zbv/xH3YzuB@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:M88vCgC3WW33X3JnAhn5BQ--.60155S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8AF1ktrWDtw18uF1xKrg_yoW8XFWDpF
	sxCwsrGr48WFy5JrZrAr1vv3y5JwsrJFn8XrW5GrW8tr98Zw1UJF13Gr1ru3yUXry2gw4F
	yF1rXrnFyr1DXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jazuAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAfFZWdyVU0nLgAAsn

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.13

for you to fetch changes up to 5f122030061db3e5d2bddd9cf5c583deaa6c54ff:

  ARM: dts: imxrt1050: Fix clocks for mmc (2024-12-09 20:40:23 +0800)

----------------------------------------------------------------
i.MX fixes for 6.13:

- Add fallback for i.MX8QM ESAI compatible to fix a dt-schema warning
  caused by bindings update
- Fix uSDHC1 clock for i.MX RT1050
- Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to fix a regression caused
  by an i.MX6 SPDIF sound card change in DT
- Fix address length of i.MX95 netcmix_blk_ctrl

----------------------------------------------------------------
Frank Li (1):
      arm64: dts: imx8-ss-audio: add fallback compatible string fsl,imx6ull-esai for esai

Jesse Taube (1):
      ARM: dts: imxrt1050: Fix clocks for mmc

Stefan Eichenberger (1):
      ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF

Wei Fang (1):
      arm64: dts: imx95: correct the address length of netcmix_blk_ctrl

 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig               | 1 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

