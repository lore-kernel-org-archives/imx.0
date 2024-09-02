Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28063469D
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725238630; cv=none; b=VLdQDdw+H71WdI52NfofnpynlzVgOZhRufYuKktnHg0p0AUUqlWuPSUYcvdawAb6zvBmvaiLSnmYhdCEh6qLSz8tcv+fF0/M7TBHpR8m+eckY+05ABbGw+tmK4sTgwwJ8zdwEwXCmNVoB2YetnNkV7sBsu0QkXhYzQfGNMIZpgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725238630; c=relaxed/simple;
	bh=MaPmVxulV2klEvBUto/0dUhphxIMQveDnJvQ339rxus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5lCMDP73UcVTFem5mtTV+/6zxhih/k3w6Sz5awq0Km5IVsE+rtJCeP7huYPaDMhCKasCmSd2fzI+A1dxc5YXN6cwusEbm20q0ReRwPSTnI65TR1snLicMBxqZW594yDl8nipqQ32MWdlQ3jEZzuu+lFTZhE9lTB2cbsURlnIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IiMxtUUI; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IiMxtUUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XGVn9bbamNrnXSoS6civZQ68s+RVUPDpsuvPeT4kxqY=;
	b=IiMxtUUI8nB/BA2sbwuzz+X9VTvc8ZV4bGhIRBbphXsAns2dqUx8bbULnKPWBt
	nQGHv+WmFAyAPKcoulVrUjtEZvBC2OTSxyLuyyXGZoqLl6TvoqcZm5CrgvgKUBVs
	WgIVdBFAEz4utKTVxBL1eFLd+A0d3ivpzgMicpkAe1Svc=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3t0MZDdVm0ZxMAA--.30459S3;
	Mon, 02 Sep 2024 08:55:55 +0800 (CST)
Date: Mon, 2 Sep 2024 08:55:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul-geam: fix fsl,pins property in
 tscgrp pinctrl
Message-ID: <ZtUNGdH3U4HbN2ok@dragon>
References: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:Ms8vCgD3t0MZDdVm0ZxMAA--.30459S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kr45WFy8Jw1fJFy7Wr1fXrb_yoWxXwb_CF
	y8Ja4xXwnrWr92qw1xKFs2vr929a18AryUWrW0vFsIgryak3yUZ3yfJry5Kr90qr45uFyD
	J348WF1DWrZ7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eyIUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER5OZWbU5TRObAAAsl

On Sat, Aug 31, 2024 at 12:11:28PM +0200, Krzysztof Kozlowski wrote:
> The property is "fsl,pins", not "fsl,pin".  Wrong property means the pin
> configuration was not applied.  Fixes dtbs_check warnings:
> 
>   imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pins' is a required property
>   imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pin' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Cc: <stable@vger.kernel.org>
> Fixes: a58e4e608bc8 ("ARM: dts: imx6ul-geam: Add Engicam IMX6UL GEA M6UL initial support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

