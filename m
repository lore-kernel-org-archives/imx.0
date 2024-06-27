Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0210374BED
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474730; cv=none; b=cfROakQY0sa2haMsSZMAKBkepVLzmdJgznEY0TDZ6qLWGy/5maWLJgNomvsWWXfm6ZX6bOhGKS+BgpLTUPc3TyildGvBT66INELPxte91N5NQ2iMedd3aiNeqxwPJNxIyuu7+NuoWH/QoEF0pwypb2SrbSR1u07/cO7LzoK27C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474730; c=relaxed/simple;
	bh=PNvkEYWCL5PovGD0P2qF3krIDcXGXZcIfYxxUFEFQTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owsE39MfnuzOnhvhyygj9odpbFfUpjySyfu9d8yWfN2tulRCcs5F0xjmjTCpuIvfUDjYcQptqq+IU0xxG2wIJogMFnx0C/jTuz0IpUjYUw6TA+ZNPgp9KtUY/fS49hQY4dbvBWwBfKh4VEhFHgCmwSFM5X+3fdobXSDnfhKmr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=e9L6GaKk; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="e9L6GaKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dwSrd4rEFtEbvg8UIqDAYpLCFNz8AxorAioAjY9AB2U=;
	b=e9L6GaKk0FJRkRWTlFa2/kLOeWBiVXXeniM8D6BAmaQdgOHFPbJFrHFniw4ML9
	g8BTNs24OyHmuWfMUFM1YarqzxfOSCjtVjx/ABtJQBDF/MLeT68VrJWSyfVfVzjW
	IYqUaycrcskp6PzpuiZ4buTt4GOUduudk+I9eKjuWTSmM=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3v5nXGX1mma0aAA--.27519S3;
	Thu, 27 Jun 2024 15:50:49 +0800 (CST)
Date: Thu, 27 Jun 2024 15:50:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-venice-gw702x: add support for PHY
 LED's
Message-ID: <Zn0Z1/LULtTmF4/t@dragon>
References: <20240618200551.1740178-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618200551.1740178-1-tharvey@gateworks.com>
X-CM-TRANSID:Ms8vCgD3v5nXGX1mma0aAA--.27519S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV9mRUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRkLZWZv-cxxIAAAsX

On Tue, Jun 18, 2024 at 01:05:52PM -0700, Tim Harvey wrote:
> The GW702x SoM has an onboard DP83867 RGMII GbE PHY that drives two
> LED's (LED1 and LED2, skipping LED0). Add the appropriate dt bindings to
> allow these PHY LED's to be controlled via a netdev trigger.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

