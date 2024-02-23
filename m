Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C533712B6A
	for <imx@lists.linux.dev>; Fri, 23 Feb 2024 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708670388; cv=none; b=TC5gkrhIqd+Qw54/D+O2a6RJYINUgA2phdZGF/xK8vVF56bFBeplP+2gpr1c0y+XPupH5Yg6GoI5FKoU1xIBroFKh89umq3HqRHwNXsHiN4cEKB5P5yTIOuCnN5Qbh8iDcKopk1LhLHDJdJ4zhdYo4MFsaPyLZML+3ZbNWLTs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708670388; c=relaxed/simple;
	bh=KwiHJFK1Mbbz+BN9chz3t+DZpnNLTM0nxRYWqa83UmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgMLf6MsrVhaQkQCVB8hy8dpaiR2IxV9thyxe1IAoNHG3wmQ/IzPUUoVJOv9uL1Anz/t5DWBBYZw3SiaaBO0odFqvmkQc2MuesEeH5c7QUMbklXC8zCVFrdJXhTspI3WVBlaBFb819th5ayIlcTRuEF1RNBPagsFlUPyDyWGnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dz8WNJUa; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dz8WNJUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=3msUX7Yu53rsu6BH2sOQ1nOJPUof7djniYPIovDSxFY=;
	b=dz8WNJUap54FKFNVZQJNaBjLRXwwEMwFnJ92OQhXTXMjKIoH0DIL+kaNdNV1od
	nKz3jrr+5wWM8ELe8235jCBVpzYz0/L6JH9iH+Y6BJavAiW3gcK/ySGPeH01qmb7
	OLAZvGJmc5yUmf3+yPsOwphCTP0bvcpLmLsDoHW0ZEOSQ=
Received: from dragon (unknown [183.213.196.200])
	by smtp2 (Coremail) with SMTP id C1UQrABHLYeRPdhleU4wBA--.7112S3;
	Fri, 23 Feb 2024 14:39:15 +0800 (CST)
Date: Fri, 23 Feb 2024 14:39:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm: add i2c4 and i2c4_lpcg node
Message-ID: <Zdg9kT35cKT+sVra@dragon>
References: <20240206225904.3565362-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206225904.3565362-1-Frank.Li@nxp.com>
X-CM-TRANSID:C1UQrABHLYeRPdhleU4wBA--.7112S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBONZV6Nni+uTQAAsi

On Tue, Feb 06, 2024 at 05:59:03PM -0500, Frank Li wrote:
> Add i2c4 and i2c4_lpcg node for imx8qm.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks!

