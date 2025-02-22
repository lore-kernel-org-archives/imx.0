Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9246C13E02D
	for <imx@lists.linux.dev>; Sat, 22 Feb 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236427; cv=none; b=KKfVWSuO5PsHMCdCRzdgdOAfvo2mfRnPyEa+mL7QOubTlv2rjdTnNlRpc7dgX1O4+3gG5OfkiNa4z5zXIDWz90An7OPsmhSjw4UlyBJNGlL0JRgN8AGCWuBulTRNeT8kI4+tptsVGp5q3KdmY0V4UpUGdT9NcpvEFFelx1tr9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236427; c=relaxed/simple;
	bh=OKe6QRTlXlfRzsO6k+n/DgK5Yjn37vIB+q2Y13+5D3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXsx8oYR/mbaXnnTWRvAy6qPkKEZgLaIxV/o9Bx68FXAD7CXLVxokWW6TdkaQQGCdKWAwBICcg0onA1W75o4qfyspm+dDbQnAd6mMoC/7I8s0tk3xnOTjWlXqgFmM0E2dZi6ZF28KkGj3Qj/naxEniw5td55UNM+mmuVhmGerK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Y4gQA153; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Y4gQA153"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=lr9E6bgj+FVra1H0FVQ1LPnUfFoxChUOCwxBKvYbs+0=;
	b=Y4gQA153sXLHJXw5OAPbt5ep7sPGg527sh4tlG03czMimAa5U7wDIb42/JqLwN
	x5cvJWjeFjPc8PBZEsJTduIEnN3ccnwoNz2Er0Fk4F+Jrk3o0wA3g8UPVk9Z39eL
	O1j5lLTV7dJ6PgTqmfV5kCNp/cLo7Qmvm3qYUKOjMzsyo=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnSaFy5rlnUPC7CQ--.24012S3;
	Sat, 22 Feb 2025 23:00:04 +0800 (CST)
Date: Sat, 22 Feb 2025 23:00:02 +0800
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
	open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 5/5] arm64: dts: imx95: add ref clock for pcie nodes
Message-ID: <Z7nmckvKi1xcb4Qo@dragon>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <20250128211559.1582598-5-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128211559.1582598-5-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgAnSaFy5rlnUPC7CQ--.24012S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV2NtUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBX7ZWe5p-zUGwAAsF

On Tue, Jan 28, 2025 at 04:15:59PM -0500, Frank Li wrote:
> Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

#1 ~ #4 are applied and #5 doesn't apply.

Shawn

