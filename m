Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504DF4D8C3
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473182; cv=none; b=hCGQcbaJM3SaBUTwUQiPn/OsAk/QZOjnCUczXlo5Udo2h/Wk+LuAMoWspc2JKo/lRy/8NcvzUeg9GX+rudi7Xn6JAhGg7t1/6b6HYTke1aYbdoTrrXsK2FoZtHjJlSrz0MM4M2mFUCYi0apZsYkCB4B5Bp0ppB9glbzfp0ULPzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473182; c=relaxed/simple;
	bh=k19oMRwYZixgIkDPdeaKHx3aHREHfP+8oM5zi7YlyiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQPh5lDGAc8VM8geHFWurwcx5GJyKH5M+Oje7SPlUDNpSCXa1OgOPHWKdmSoYNMk9h6Lu7eEUxZpJmTL1WDyizyLjXSCUVlemrg76b98ned/7JJPqh+o3j+PweXlOrsoLtdiIMQCZDtRYWoc2t0fjNeIXhSwhAiJHXuXoBQb4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BaHhItfP; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BaHhItfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yfnR4f5J5qrRmd7Y0VQuklEvzqrooKhNJa00ntjIhf8=;
	b=BaHhItfP4Cr8SUBN99K9wfKLESjUGYrMnhQfVViWjvezo7ka93dAz/T/COdN9S
	snaFx2l78q5n1ITgFa1jokmGNwEYcJbILHiuBN8OQl+JSZjTn3LXi8+PP31qfNx8
	dgjtItaWxazH6tAn/OAnjNT4CtsylVenItld7Q8AGVxAE=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3X8gFFH1m8I0aAA--.52410S3;
	Thu, 27 Jun 2024 15:25:59 +0800 (CST)
Date: Thu, 27 Jun 2024 15:25:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Li Yang <leoyang.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Priit Laes <plaes@plaes.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/13] ARM: dts: kontron-samx6i: various fixes
Message-ID: <Zn0UBS9vx8bJ+6Kc@dragon>
References: <20240617091341.2375325-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617091341.2375325-1-mwalle@kernel.org>
X-CM-TRANSID:Ms8vCgD3X8gFFH1m8I0aAA--.52410S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1xAw1UuFykWFy5uF4fGrg_yoW8GFW7pr
	97WrZ2yF1v9w4ftryqqF9FyayYyw4DAr9rtw1DJasFv3y3Zr17ArZIgws8XFyxZFn5ZrsI
	q3y7urnYy34rCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz1v3UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQcLZWZv-cxcAQAAsF

On Mon, Jun 17, 2024 at 11:13:28AM +0200, Michael Walle wrote:
> While working on a new PHY support for this board I've noticed quite
> a few errors. Fix these and introduce an actual board for the
> module. For now, there was just a dtsi and no actual user of it.
> 
> v3:
>  - fix typos and property order. Thanks Shawn.
> 
> v2:
>  - new patch to fix the node names to make the schema happy
>  - new patch to fix the PCIe reset line polarity
>  - new patch to remove the unused and invalid wake-up-gpio property
>  - add required poperties for the supply voltages to the wm8904 node
>  - enable PCIe in the ADS2 device tree include
> 
> Michael Walle (13):
>   ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
>   ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
>   ARM: dts: imx6qdl-kontron-samx6i: fix board reset
>   ARM: dts: imx6qdl-kontron-samx6i: cleanup the PMIC node
>   ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
>   ARM: dts: imx6qdl-kontron-samx6i: fix product name
>   ARM: dts: imx6qdl-kontron-samx6i: always enable eMMC
>   ARM: dts: imx6qdl-kontron-samx6i: add SDIO_PWR_EN support
>   ARM: dts: imx6qdl-kontron-samx6i: fix node names
>   ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
>   ARM: dts: imx6qdl-kontron-samx6i: remove wake-up-gpio property
>   dt-bindings: arm: fsl: document Kontron SMARC-sAMX6i boards
>   ARM: dts: imx6qdl-kontron-samx6i: add actual device trees

Applied all, thanks!

