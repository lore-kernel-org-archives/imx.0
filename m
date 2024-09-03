Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23011D6182
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346909; cv=none; b=hX7uv5OznuFKVifmJvKPx/wGAKVyls9TJn5qyXawoXHrSVa9Lx/xuBvRbWW0kKM4RESdj9WtT+fYgV8GWnG3THDeJH7g/ULfCfnWlETRy6IRwK5FC/4gl8gJu85tgVTm1/o7EXkQKY20s7qijz290AU0YRQ6AFTPstnQckYYvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346909; c=relaxed/simple;
	bh=dd6z6/fX03r7I+OK4sAZBXXYh2KrMVhFOm2k/Xs2Xck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ0ZtbHwQqRW80wUpgDqbqjwuUjJTC6/Rq+M1mczvM/2Ftb4YmgHdkbstCuzyaBUpBF0wJfpn6POZsFMUzuplO7wsNh9c7xH44ZBDo+E24zdhlpF4PlmHPNTwwAWegUFidrxfLdtmzi7MX+UvPALw1S7VQzgVoiqEjQtRF4ew9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bsPXzS05; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bsPXzS05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EMLbiGBpUuXGNz3rk2Y/NL4U1KPEBS6Vzb4O8xiWm20=;
	b=bsPXzS05MZXmnKZRLHt1am/Tf1Lt6S6u6Fi3HVbacCc1CtVVZG0b7jGvmLxQEx
	gLHCmDb2YLLh3qsne2bnYaPRmmXOxsjjlCSOe7Odm5CfcrdNpJpWzaJegTWCXUg7
	Cgy4DGS77ndqsSx4IE0c+TCrfLHij0yiW46qrWXQAMxEc=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3X_8ctNZmsEBaAA--.108S3;
	Tue, 03 Sep 2024 15:00:46 +0800 (CST)
Date: Tue, 3 Sep 2024 15:00:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: dts: nxp: imx: mnor pinctrl node improvements
Message-ID: <Zta0HBK1N/Yco9FY@dragon>
References: <20240902-dts-nxp-imx6-pinctrl-v2-0-ab8196baa07a@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-dts-nxp-imx6-pinctrl-v2-0-ab8196baa07a@linaro.org>
X-CM-TRANSID:M88vCgD3X_8ctNZmsEBaAA--.108S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-M5dDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRpPZWbWeZS49wABsq

On Mon, Sep 02, 2024 at 01:40:36PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix "grpgrp" -> "grp"
> - Link to v1: https://lore.kernel.org/r/20240831-dts-nxp-imx6-pinctrl-v1-0-f5811032bd40@linaro.org
> 
> Align the pinctrl node names with the bindings.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       ARM: dts: imx6ul-tx6ul: drop empty pinctrl placeholder
>       ARM: dts: imx6ul: align pin config nodes with bindings
>       ARM: dts: imx6sl: align pin config nodes with bindings
>       ARM: dts: imx6qdl: align pin config nodes with bindings

Applied all, thanks!

