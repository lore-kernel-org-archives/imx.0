Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28B207669
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319414; cv=none; b=KZRmrHhym68DICU8or//NDCjT8b1R20iddaaNl/N4B0hc1dy8A2hwuXoADGIsZxfif7GZypVwfTni6C2en3ZhnZEPc7X284zHyBaxX2J/pEaFndD48J07pOcJGmCvSYHQ1V1KEuC54w/JlKt9gjfPFpUxPKHDu1GqoiQ25ne+Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319414; c=relaxed/simple;
	bh=3dbiKyZvbkcP+FyniGRkJ2al00SUv6tdoKNz8TZcPUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khPPEuNWEEBRS/ZeImn8UHTMbRLeQMy3OICoiOp0HvwWbSjTaia25sXiqGhE2qcdsdjG1fZttxQOI15EV1xkbKNXTeB1nk6+JDcgYmTQVhJBmbB03Tyi9T5xY2JoFOslyFA0kioZwW0Z5hxdLonehOVmlkFDszrBvEuQAYobrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=l4h05MDL; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="l4h05MDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=timvlLjM+uBUHo1IHOCMzNWoKTs+k3Z8AXBdPLGlagE=;
	b=l4h05MDLwAW9cxrsZsnetXwAHaOcGNCNw/smiVW1Fj06fb6GVUw7p5dbIOjTOL
	JqwIENTGJzrsaOJkRbwhE0tg5hhZB0rNy+8tKg09EvHF8nloAiLycDFiGf0an8lI
	4el2r4zQSZ/R7kHOZRi0eI/go60VS6E+DrTFTFBUW4LhI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDH7zoUwVNocPP5AA--.63435S3;
	Thu, 19 Jun 2025 15:49:41 +0800 (CST)
Date: Thu, 19 Jun 2025 15:49:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stable@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI
 frequency
Message-ID: <aFPBE0roFWvBqjXx@dragon>
References: <20250523173723.4167474-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523173723.4167474-1-tharvey@gateworks.com>
X-CM-TRANSID:M88vCgDH7zoUwVNocPP5AA--.63435S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc9mRUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRJxZWhTi3vJNwAAs6

On Fri, May 23, 2025 at 10:37:20AM -0700, Tim Harvey wrote:
> The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
> depends on the pins the interface is muxed behind with ECSPI2
> muxed behind ECSPI2 supporting up to 25MHz.
> 
> Adjust the spi-max-frequency based on these findings.
> 
> [1] https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> 
> Fixes: 1a8f6ff6a291 ("arm64: dts: imx8mp-venice-gw71xx: add TPM device")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied all, thanks!

