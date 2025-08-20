Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF22264BB
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 03:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755659292; cv=none; b=KJlL3cOiC8TVmPRtL+5CU7UBXFYpjf7QlrFDUHrG3ano5wqhbcwCtx3RBvYIi9efEcmhThKgT7/I6TUnxTQ9aR/FujSMI9r190qmTZ2IqxUDtlW6u/F5Ie60nbUrssLKNKwnMBU+yV4YuVCIpGL1CL9xyryadfr5x6+zZ+Xl01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755659292; c=relaxed/simple;
	bh=ZXSSwhiLothcw42T8WV/C2Hk6BN4vEWGCis46vc1PUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH6i0VQGfQ7zVaQaVChmfMF2mdu2nvkw+R97z7xOLHqRAgdF+CEGVjkEvKcPnBoE922zWOklUSzutXjkJdLJEX4wHhsqW199M15L/yDvGERYL464lNypr8HHUn2HaEluj12d5tn2vKPPdcDv8lKfJjTNSu3pZ3AgyjdekqwC0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WcOh3ZWS; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WcOh3ZWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xhgXz+NGz9dE9bo3AgVhV+r8lEFLGIj0GKiYKAiGm04=;
	b=WcOh3ZWSv2Xk56vJhMpz6KCwCHurEduYoLeL7PSDayXg+xQrZ93ge37SGl8rre
	qbREsrJMJ1iAf4gfl0pxJaV1UcCM62QN2AYFMzqJ7gIp7iWsybmOZFIKrUn6JFfe
	Z4mUlqrF450rsSaU6hCZ39ffVes2sW4EiuAnLV1kfqA/U=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAn5W6VNKVobNX3Ag--.59759S3;
	Wed, 20 Aug 2025 10:36:07 +0800 (CST)
Date: Wed, 20 Aug 2025 10:36:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <aKU0lPi485xA5SS9@dragon>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524112315.695376-1-c.stoidner@phytec.de>
X-CM-TRANSID:M88vCgAn5W6VNKVobNX3Ag--.59759S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF13Gr47JrWDuryDKry3urg_yoWxuwb_ua
	y8K3ZFkw42yrZYgF4fKF42gr43uaykGFyrXr4rJw4fXryrXa4DWFn5Arn3Zr98X3yS9ry3
	WF909a4xursrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb7PEDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhe1G2ilNJffuAAA3G

On Sat, May 24, 2025 at 01:23:15PM +0200, Christoph Stoidner wrote:
> According to the datasheet the phy needs to be held in reset until the
> reference clock got stable. Even though no issue was observed, fix this
> as the software should always comply with the specification.
> 
> Use gpio4 23, which is connected to the phy reset pin. On the same pin
> RX_ER was used before, but this signal is optional and can be dropped.
> 
> Note: This comes into effect with the phyCOREs SOM hardware revision 4.
> In revisions before, this gpio is not connected, and the phy reset is
> managed with the global hardware reset circuit.
> 
> Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>

Applied, thanks!

