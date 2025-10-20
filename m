Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3770230264
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962346; cv=none; b=eDB4dC38Th3d8tObhnnf9ratXVuaCohNhvYczN8GcrTkbUJFOTwVtocBb3Eucd6SNyOo5nfFZmxdapRTX401IiURWm4WFDkwrYGmJVEYUhQHOpxq4RKvjUzbryoqyaVGz5OsJrA/wBGPIqf+JzZwFEw8sx9tuk3xMjOEkdtECYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962346; c=relaxed/simple;
	bh=MkKQdDsYP+tI7FujBY/HKFKDArIAcjnc8c//TsyZKBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqYs68S8d+KLlHq/EvorutUPc0dzXnJY3f87wTaqjR2eGMnZ9FSvtaDXTV/bee8dtWAY2blNACt4/hPEznG4OZzvI+EJNAnm84yvqI7/R8mSNWk8fVh+ApwYezDvmOWIF1VfbIoLS7Cq9vjyc2ySxSGbikZsbeMHPCE/apuaeJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RsZoBfFS; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RsZoBfFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ltyj1FS4gis+7LWdtGx1ofBO64mHrGOTJDhLLZcoo1Q=;
	b=RsZoBfFSULMxuDGRzNdZ6yeAHhKdHnDbRwmQ720VL1Q3YexqnLILbCbWeQ5fw2
	DcwQfwwPOgPGAKXk0qK08aCrEBDlYK8cQgLd/2Oizde2Eqx08MMSjY8yPMF5BApb
	WmXpKm1i+c3YGrhWd5SxIVg/lJs1254wbQ88c25dvDAJw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD316EQJ_Zo4qRTAA--.26839S3;
	Mon, 20 Oct 2025 20:12:02 +0800 (CST)
Date: Mon, 20 Oct 2025 20:11:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
	Teresa Remmet <t.remmet@phytec.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 0/4] Add display overlays for imx8mp-phyboard-pollux
Message-ID: <aPYnD25ljde33_tq@dragon>
References: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
X-CM-TRANSID:Mc8vCgD316EQJ_Zo4qRTAA--.26839S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr15trW3JFy8Gr4fZFyUGFg_yoWxtryxpr
	y3CryUur4S9r1xArnxXwsagrWqyws8Aan5uw13C34kKr43uFyDA3W7Grna9rWUZF4xtw4f
	XF48Ary7Wr1UXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joeHDUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBKlC2j2JxIThgAA32

On Mon, Oct 13, 2025 at 08:25:05AM +0200, Yannic Moog wrote:
> Yannic Moog (4):
>       arm64: dts: im8mp-phy{board,core}: update license
>       arm64: dts: imx8mp pollux: add display overlays
>       arm64: dts: imx8mp pollux: add expansion board overlay
>       arm64: dts: imx8mp pollux: add displays for expansion board
> 
>  arch/arm64/boot/dts/freescale/Makefile             |  15 ++
>  .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      |  44 +++++
>  ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso |  45 +++++
>  ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso |  45 +++++
>  .../imx8mp-phyboard-pollux-peb-av-10.dtsi          | 196 +++++++++++++++++++++
>  .../imx8mp-phyboard-pollux-peb-av-10.dtso          |   9 +
>  .../imx8mp-phyboard-pollux-ph128800t006.dtso       |  45 +++++
>  .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  52 ++----
>  .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   3 +-
>  9 files changed, 411 insertions(+), 43 deletions(-)

Can we do something to avoid the warnings?

../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value

Shawn

