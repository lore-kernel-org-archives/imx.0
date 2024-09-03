Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9711D417C
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352762; cv=none; b=pH3gM0zpMzH54Q/RWhH/DT/dvhgVCYFzmc+6bK6stv4buswKGoUIMa30fGi8MjnNSaswdZqjrBdp4+SKg67h4zzzxStu/wXp7JCtXxAjhONyIGuxcagjTFYaIwK4InK8Df42p1bVrv8QAHLvb9IgaA3e9XTaUWyr8+5Xa/jdVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352762; c=relaxed/simple;
	bh=mrBrZeX3pZ9wRZJbHHpcB1Uzkac+lynRVTT+L9xIkqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kE8TbSYKAKaB4S/DQylK1spym8OFrjZWrZY+zKCgkGv8mX8/QnNkzS8U5G4cO1/I2CreBP8InF2Zqdv+pq82PBRpqnK8mv1RW6kmwgoSaVDUWWu98cbiC5pvPajmzqq416yu4ySpu0HjvxPfTNi7YmSeFiSeie6o7eLriHirhcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NeA4af1n; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NeA4af1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=klQLUQYC0Iq8lFRsov9BQeOh3b0gq2reax6p5YSo9Vk=;
	b=NeA4af1n22V1F9gf2uVQenRVUtjTYVj0yOrWD0nIRujqxhaUKCogrZFgpyK3gF
	i4MxonZMIbVWr9BOJLEiPPFYiCwflyi2cJ4iOxUqIxYYb2C6OsICWl2COdlxYQqq
	fgBLcaSNE02VpjY5g9I3+asjcd93vAIg/W9NwtY+IBlUM=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3XzwGy9ZmaWpdAA--.52316S3;
	Tue, 03 Sep 2024 16:38:32 +0800 (CST)
Date: Tue, 3 Sep 2024 16:38:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: shawnguo@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	festevam@gmail.com, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>,
	Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support for Variscite Symphony board and
 VAR-SOM-MX8MP SoM
Message-ID: <ZtbLBt/RhGim78uH@dragon>
References: <20240902134512.16717-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902134512.16717-1-tarang.raval@siliconsignals.io>
X-CM-TRANSID:Ms8vCgD3XzwGy9ZmaWpdAA--.52316S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-4SoDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQNPZWbWyfkEBAAAs4

On Mon, Sep 02, 2024 at 07:15:06PM +0530, Tarang Raval wrote:
> Tarang Raval (2):
>   arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and
>     VAR-SOM-MX8MP SoM
>   dt-bindings: arm: fsl: Add Variscite Symphony board and VAR-SOM-MX8MP
>     SoM

Applied both, thanks!

