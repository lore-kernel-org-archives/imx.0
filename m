Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065CF33E1
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712106945; cv=none; b=FY7OR9wFcz1qhlmGmzIUUL477LuKMRhZExQ9keTgcuFWeqXvSMXBKsdnNt/Rf/Yhi1S/FA/vsfBGVh7JzDRw0bT091i+gRvnA9+ebPCbEENA2CkWevl6h31uFV2GWuOE88MeLmV8BBAc+/SPXBdKTsi5fyZ6BEuhnCYiAmmlV84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712106945; c=relaxed/simple;
	bh=dWBHMCmaitAP48db4fAIbcveiAUCQHjT59JZeexowBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5t9FCpZwXidjzVbdz3nDGr71yIwH2sC5TCGfFoX+wNEanNQmkAU3UhIQuGGQJkP0a2QqS68Ky9+kk0obDoF27+103r31u98931+nIsEAJDPoR2LO2esvpr5hToa/tlstQIiEfWF78StUena1RgGlUsM0qovPjUPYIojgiHHBp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=otPkQs9R; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="otPkQs9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ELALI0ShQWbaJT/YcQMzlTzqIqgf0G8wMIxnIcbfiEo=;
	b=otPkQs9RyhbGWBBwpBPiZXIeVxLXAZhJNiU9DE0r2iY/Zn9UhtA3+uzVzKP4ts
	S0jSn7HFrvuVF5YqA/p/po6QFe75xG1aMlZF+9vOa+rxQcmQt2eNJZBDvxbta1Bn
	QxUXCVsM8pOTTMIFciyreShbSyFdaXDzRu0xCUMZ16Fbw=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrADnD1CprQxmgt6yAg--.10300S3;
	Wed, 03 Apr 2024 09:15:23 +0800 (CST)
Date: Wed, 3 Apr 2024 09:15:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com, alex@voxelbotics.com,
	andrew@lunn.ch
Subject: Re: [PATCH v2 0/3] Add support for Emcraft Systems NavQ+ kit
Message-ID: <ZgytqXy/S63iXbTD@dragon>
References: <20240330133410.41408-1-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330133410.41408-1-gilles.talis@gmail.com>
X-CM-TRANSID:C1UQrADnD1CprQxmgt6yAg--.10300S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyrurWfuw13KryrZF15twb_yoWfCwb_ur
	WkAa1fZr4DJr48Ka10ya18XrWYkFWaqrW3A34Dtw1fKFy7ZFZ3trZ7GrnY9w18CrW8uF9F
	vr17JrZY9Fy3GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0tl1DUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRC1ZVszXX8yJQAAsQ

On Sat, Mar 30, 2024 at 09:34:07AM -0400, Gilles Talis wrote:
> Hello
> 
> This series adds a device tree file for the Emcraft Systems NavQ+ kit [1]
> 
> The first patch adds a new vendor prefix for Emcraft Systems
> The second one adds the board to the arm/fsl.yaml DT bindings.
> Last patch adds device tree file for the kit.
> 
> [1] https://www.emcraft.com/products/1222
> 
> Changes in v2:
> - Add Acked-by review tags
> - Fixed device tree warnings reported by dtbs_check
> - Reworked leds node
> - Remove unused i2c6 pinctrl entry
> - Removed unused regulator node in Ethernet entry
> - Link to v1: https://lore.kernel.org/imx/20240328202320.187596-1-gilles.talis@gmail.com/
> ---
> Gilles Talis (3):
>   dt-bindings: vendor-prefixes: Add Emcraft Systems
>   dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
>   arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit

Applied all, thanks! 

