Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926919D065
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834197; cv=none; b=C9yk8bZ3M+CfHt3eluR+s9XL4VHB5gTDa7OK2oWFGnwfEfXMmRcFD85fUab5LueWsfL0S4yHRjAGIdDN9s67ZAIjllAyt2RLXY6UXVCprHTISSDXcRrdahvw9kZhy8JPKE8udva4NYD3FJrHTNtb8KX+fcwmL1rCUJX5vgARdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834197; c=relaxed/simple;
	bh=4060zgJP/pSCl08nUofF3yyzoKGahdPpnHBWzWSvRE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRFVM+071FF5+zsUiUpB2ou/xF1m1MwAS9c8gDgX7m+/WqDoYs4QtMDDhceVHQuqF+46KLIAxK/mBwzvlWoOywN4Bd9ctOdSU9ewLZlTXSQTAr9NWyjAeYbJeVSs+9LWi6UGnCi47JiWVj+2HSCEw+KGNom+HBLLPcADH6dNXQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MWBz1Hhf; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MWBz1Hhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=x8nAN6lH4iIKWitR1lkqTMUOmZDGNmPb6HAGd4OPNUE=;
	b=MWBz1Hhfc54z3LCta+MG6OWeZ2TiBw7nE+XD/Ffgth9DxRt3KZ7lGS/ys2WloX
	JWAOcYJXj9hiflwd2GzsckAeYz8e14pkysUDbCKarBua8Y/M5SwQljaqv3+ENMIt
	gfAghv5QXBL34cAFp750SbYj/Ivdq+l7zlCPgYIVsDNDM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAn_Ict56docRIZAw--.14029S3;
	Fri, 22 Aug 2025 11:42:39 +0800 (CST)
Date: Fri, 22 Aug 2025 11:42:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jacky Bai <ping.bai@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] arm64: dts: freescale: Add dma err irq info on imx94
Message-ID: <aKfnLWqfrErWBwLN@dragon>
References: <20250725070430.660644-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725070430.660644-1-ping.bai@nxp.com>
X-CM-TRANSID:Mc8vCgAn_Ict56docRIZAw--.14029S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrR6zUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAixZWinhqf3uAAAs5

On Fri, Jul 25, 2025 at 03:04:30PM +0800, Jacky Bai wrote:
> Add the err irq info for edma2 and edma4. These two err irq are
> connected to the GIC directly, not irqsteer.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied, thanks!

