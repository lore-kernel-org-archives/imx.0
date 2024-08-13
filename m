Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83C16F2EA
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538974; cv=none; b=YOUZrDLFvAQgkFm63wjXy9WlyHgAE0x3EmCgNxzG4Ss5T/XTaoB7/pgYR8yzuQnrbE5o7Hg9Gl6KEks6RnuRo1vS7Lwu16xEh7LcVWfVEqlWSnBV6R7gBB1ezFuF08qO2uQwdw1BekIjjO+xubtMJqhaYkL20Y46vMl+srIzUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538974; c=relaxed/simple;
	bh=fnGUMR8alWJ23yiSC9hwqHhWGxCojupW1eTuANhSJGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGGwcNyEuj+vehz/4pOdWdymERUICDmXLFitzH0auaeEUSY39NJ/uOhBz03h5Izuf9dm/Hm8I8q2vRHQsSdhhT2gGwpSkAQc7S/F2R9HshEHS7m0zfNKdVtg/ltThbvGniqYisDeb0GK42HzYjygb8LG7MJUaCZT7XkRpXjLGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Os8nz6D0; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Os8nz6D0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ubP/x6XM1hVrrXEFEEkcuv4aeS2a2HZhT4tQZk/QGN8=;
	b=Os8nz6D06WVF/hzVZq5Y4vI7jyB4pG81Vgvw3c8mAAkM+V3dzsaY82idHq+cbu
	IfqNbTd7x+6t7YhzWugDZEOX6o7d7srN/9PcZlKxBxfBmbBZQnESz6cACW1ULVSa
	Uk2COdTdngPa6Vh+7UHZXQS+Sjs3Dfe6rO4CIrrM9qwZ0=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHj78AHrtmfYIbAg--.7470S3;
	Tue, 13 Aug 2024 16:49:06 +0800 (CST)
Date: Tue, 13 Aug 2024 16:49:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] arm64: dts: imx93: add lpi2c1 and st lsm6dso node
Message-ID: <ZrseAE8+YJ1PhRL3@dragon>
References: <20240808162157.3323811-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808162157.3323811-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgAHj78AHrtmfYIbAg--.7470S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxsqWUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQI6ZWa7CftCUAAAsp

On Thu, Aug 08, 2024 at 12:21:57PM -0400, Frank Li wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> The i.MX93 11x11 EVK has a ST LSM6DSO connected to I2C, which a is 6-axis
> IMU (inertial measurement unit = accelerometer & gyroscope). So add the
> missing parts to the DTS file.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

