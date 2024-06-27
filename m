Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CD217C6A
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472625; cv=none; b=ZUNTdR32Rhww/VU30ZW/aDMTPlqMJ++T92OwVKRqzzgTYCU9miCSds44w9Afux4YuinpQz/eHKPF4jC5BQC46h3mlv4mCktD6Z1/2Tdj2bvkgtFeapMIllQDW79Bdm3UHL5byAWTVPKvEcQ5XH5qdD1Jv2ktQc9fd1Q5t9bRyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472625; c=relaxed/simple;
	bh=VZd1DTMsV4Y6GkhYKBwj5DfAYkl/FIXvXfestO3BbMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAwcxvm2xaX4s0ySSGghL+kA9gzr8uZyOikerAaYA5jIjB7Z+RhJj+UaQ2+t2tW9ibuQwkljb8EfHhaayLn6JABscO2NqZY3JyfFdp0kYQNEhfTtIRSQRQb4bbOacNMF+/JXl7N9hk7OJzshCaXz7GybdjGZs3XqNxhECz/luNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nO3n3JOu; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nO3n3JOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YfzRT/YahaCVfCZjCVbpbtKPLzjuLKP7xH/d0hodVsY=;
	b=nO3n3JOurca8Hv+kmfFWjTkQxKgHDcm4gOLb/cTbLiq0TocaEQp01vxKfkAOxc
	1CF7UcpBTGGgphtGYNDAuhY1YYmMiGAIXg0MVnazDQqqhGblHP9c7FTPOBQS5bse
	dR3/bDRW+A7ULMVSjCIk/vZSW3gtJ+BPmXm6lAZwaywp0=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3H47bEX1mGbYZAA--.52899S3;
	Thu, 27 Jun 2024 15:16:45 +0800 (CST)
Date: Thu, 27 Jun 2024 15:16:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arm64: dts: imx8qm: add subsystem lvds and mipi
Message-ID: <Zn0R2/lcgcSG03CM@dragon>
References: <20240614-imx8qm-dts-usb-v3-0-8ecc30678e1c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-imx8qm-dts-usb-v3-0-8ecc30678e1c@nxp.com>
X-CM-TRANSID:Mc8vCgD3H47bEX1mGbYZAA--.52899S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxEdyUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh0LZWZv-cwvZQAAsT

On Fri, Jun 14, 2024 at 11:06:24AM -0400, Frank Li wrote:
> Frank Li (9):
>       arm64: dts: imx8: add basic lvds0 and lvds1 subsystem
>       arm64: dts: imx8qm: add lvds subsystem
>       arm64: dts: imx8: add basic mipi subsystem
>       arm64: dts: imx8qm: add mipi subsystem
>       arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region
>       arm64: dts: imx8qm-mek: add pwm and i2c in lvds subsystem
>       arm64: dts: imx8qm-mek: add i2c in mipi[0,1] subsystem
>       arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc
>       arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes

Applied all, thanks!

