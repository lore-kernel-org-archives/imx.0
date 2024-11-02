Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8538A3D69
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730516658; cv=none; b=u0XrPjgnpu2HXZY9uKEiQVNVGWbXoalEbXz4IMUeWlAtp1Je50REwIolBOG8VGEWOIkoISClUI6+wI4FRmxH6NAB1EZlJ3qkJ83K2fV9w1HsCkPVtrASoJFHPcVEqB6qx95lV6a/fnIPTX9iL+CjcxK/zEoblnDpNBAXni6qdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730516658; c=relaxed/simple;
	bh=EEt0MEjE4FFmpHsXng0O/SiotnzKihY6I6Ua5Ya3cRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALGJvTjEaJ4AD3oNfhEvU8hCXK/e/Nn6dOP1pIoUpHgmwBEOodOKKLkX18rUAykznVXSr+Yg4hOjE/SNyz3iGMoh1BBfIKNoEwL5PwmEpAIsA8ZZ5z5GYQp/Rb9PWd2q4jWOP0SidVUZNoy7hsH8GlUejztP5uRiIDngfXGV06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cEGfSccs; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cEGfSccs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ANBeQg3BIZC2MxnhvEH4gAK8e61+0m9Yr8bFK4R/WhA=;
	b=cEGfSccsODcmEk9CfsTGs+7qzKJsdowUgKk3yHE6TbswYJQK+LWTLl2bjaUEWC
	HRuvDiNhmmhNcN8H7Jdt5eiOPS+lPw59MapV+SMuxuJj/0+X4tDG3voUt48AvXFU
	xh3iGWkf6Rptzsbsm8Z2tlsU8xHQ/EBS7ApOYWbqIublk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHk_2VliVn_Lh1AQ--.14550S3;
	Sat, 02 Nov 2024 11:03:51 +0800 (CST)
Date: Sat, 2 Nov 2024 11:03:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Fix SD
 regulator startup delay
Message-ID: <ZyWWlA7sGuhg0rJw@dragon>
References: <20241024130651.49718-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024130651.49718-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgBHk_2VliVn_Lh1AQ--.14550S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh2KZWck2JnQywABso

On Thu, Oct 24, 2024 at 03:06:49PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The power switch used to power the SD card interface might have
> more than 2ms turn-on time, increase the startup delay to 20ms to
> prevent failures.
> 
> Francesco Dolcini (2):
>   arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
>   arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay

Applied both, thanks!

