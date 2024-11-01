Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA44161935
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454961; cv=none; b=rTrqIy24gZvmFOyvKTrgvl/MvSN2BWnmxZ+1mR5isoRSgj95eQaLOn+zb7Pj9IxOo/2TShhn+WnSphuyYbarM/toFX3pe59RL+X3uYXESiBp15rdhzCET7L42ruyYzBv4VRJ+w8gxtWnyfDaCSVdn3IOqG+WtzuKIhLlNrB0G0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454961; c=relaxed/simple;
	bh=hcdrHvBdSayh20IlsZd2/zMiEOuiRDwG6vj9+sFNh+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1e/xK/OtydxADho/rGFKJkMOQAm+qW0VbzAiD91d9P8RcG6moBOwkG+jQVlMIOO8us6ukP9JpanlesBksH6YPMywMdp0a68WPm5RnFz8TbfKSAtoDvuSCDLmby+8KJ3uUw/ioOjXsP7FUHKA+U6wFFaeDzYdHnIp6SQFvurLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DIUCuVzO; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DIUCuVzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fD3ToTjQf4BqeyTCfHtwZ8RgkZVabkJNf3RDZfdMhXI=;
	b=DIUCuVzObRcn55/bgNdO5lV3W+fQPBj8gf7ig2mHznWlQhyJ3tjJ9eypWVMUjg
	u81wid9DJrVfSV3OV1/KTp7/TLPlhq24KGIFrGYyX+oSI3dO0LRIBBiQlKd79zfi
	tND3QrQQshxTXoHGVfjxDqhBiySb7WY6DggSQR010gPVw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXXy9cpSRnohlpAQ--.37559S3;
	Fri, 01 Nov 2024 17:54:38 +0800 (CST)
Date: Fri, 1 Nov 2024 17:54:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
Cc: shawnguo@kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board
Message-ID: <ZySlXDDG7jRxl0n9@dragon>
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
X-CM-TRANSID:Ms8vCgDXXy9cpSRnohlpAQ--.37559S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4VWlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhqKZWckfBh4iAABsh

On Wed, Oct 23, 2024 at 02:41:13PM +0530, Bhavin Sharma wrote:
> Add initial support for Nitrogen8MP Universal SMARC Carrier Board with
> Nitrogen8MP SMARC System on Module.
> 
> Change in V2:
> 
> in patch 1/2:
>         - Drop Unneeded line
>         - Correct the indentation
> 
> in patch 2/2:
>         - Add Acked-by tag
> 
> CHange in V3:
> 
> in patch 1/2:
> 	- In version 2, I forgot to add the Makefile. Adding it now.
> 
> Bhavin Sharma (2):
>   arm64: dts: imx8mp: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board
>   dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board

Applied both, thanks!

