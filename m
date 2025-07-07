Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B3262FE9
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878816; cv=none; b=fDOYVYKn6FBsn/yunbV5NDrvoutPWe5n8nUPECuLA28iso/v1F2WfvaO32yh3Zi3aQXfCdOVEkjVpQRGT+MaSQZgVsjeAkDlHcaOEZmM9lhaMcVVK2FFiTjNhDN3LjjBNAOCSNPIOKGxLCySGDrCmnuLZxDskPCdQepgbuYCKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878816; c=relaxed/simple;
	bh=MTKpsIgeW6LKhzv/n15vzUl20MWMaQ5G9qNXsAqBv9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHp+Owyu4bsP2WVnfySRglpSSBS49xez52Bzisw5llKZI+nT6IUxCKalq0J7Qk7AXxazBscVJtsLyJ+crOihNZcVSW3CE2A2ER7psKOiDCkGh/nREzX9UfEUBLUEsbI7LQiRBfk7P3rM53uJbv5Pk5pB5X25eYTJ1H60TWg4o6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=j+zmUsHV; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="j+zmUsHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NlfspyJjbSk5hoUC2w/Rc3ZtDhkI9SmVzdkEY6k5DMg=;
	b=j+zmUsHVSPFrZdUoR2WWjvIiHwwkKBdwCqCPC+3NmBplpzl+/IgDHia0T1yfBL
	ni5LiRmgaBonuMSXa8K5DIhxTCrLNTaDNop8Uxyy0aEXVt31RqqSoXmlkgpVsW4Y
	aLTSjXURy0k3RWhBb9ruUNAUsVVgYYNr6cYzqy3/No8hQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXluN_jGtoVAF6AA--.63095S3;
	Mon, 07 Jul 2025 16:59:45 +0800 (CST)
Date: Mon, 7 Jul 2025 16:59:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Message-ID: <aGuMf9A0gONkaOmr@dragon>
References: <20250703113810.73023-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
X-CM-TRANSID:Ms8vCgCXluN_jGtoVAF6AA--.63095S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwYLvDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQWDZWhrVpnALQAAsL

On Thu, Jul 03, 2025 at 06:38:09AM -0500, Adam Ford wrote:
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recommended to not use the DMA on the
> console. Because, the driver checks to see if the UART is used for
> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied both, thanks!

