Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EE118BC21
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979965; cv=none; b=p3J5l+wdHOmgpUugN9IEJLayCo64ElL6K5jJA5zRqPo1tY/k7aN5b4fN2WT1W8Qqwev9kDdxJp9zWHXconwwbCnegzkvWC23Z+hmY/9Xhm1Vseq8sYM1+8MnQ3Qc7IB2Gk4SYU6JwKp2bQ5czXjC0jOPtSMfdTYGtB3aNTXKVn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979965; c=relaxed/simple;
	bh=e2+iFrOJzwzNfSbMrK1Gg5aTCjWbwMktcisESyQ/0Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TY5O7FjMo9/8f0XoFhTizDfYh5fu5JN5Z4Kbf0Rj/Z62lLLkAagFlo8ng12nhkUOiGpJpaRwW7egEmI4gZ897DA/zUS1iTOtuGopinDQTI3PwjlGpgL4azOuEoPnaEzcPn+YxCigjZzB09Z5YgD2OlVHxZNdsBTfNJeMMbidkfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Wyb4/JxW; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Wyb4/JxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VnWpEMqsaiHx1UpbckYzGM7hHu3/g8tn6M+IPcoVc1s=;
	b=Wyb4/JxWriALg09AHwSs3VPSyIISJ1nCkehabr0kVFDRIEEmT3hRLqEcvVdSJ3
	2Qi+DXdQ9zE/ItF2nN1J2iTRTv1cuWmNFSiPNQwmc4WQtPHN7qLvphFkZf0CmVvd
	F13zNkjxCAjaPCQHxFGenxCfN0+gngjM4U+x9t8mcPhCA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3ny3dIw5nQJgDAA--.7183S3;
	Tue, 15 Oct 2024 16:12:15 +0800 (CST)
Date: Tue, 15 Oct 2024 16:12:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: shawnguo@kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <Zw4j3XOxhdO/dztA@dragon>
References: <20240903091720.443091-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903091720.443091-1-tarang.raval@siliconsignals.io>
X-CM-TRANSID:M88vCgD3ny3dIw5nQJgDAA--.7183S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBx5ZWcN2zvY+AAAsu

On Tue, Sep 03, 2024 at 02:47:20PM +0530, Tarang Raval wrote:
> Add following peripherals support for the Emtop i.MX8M Mini Baseboard
> 
>         * Wi-Fi
>         * Audio
>         * SD card
>         * RTC
>         * CAN bus
>         * USB OTG
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

Applied, thanks!

