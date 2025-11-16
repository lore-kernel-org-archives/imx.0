Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9274C92
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265408; cv=none; b=sVHd92xVnBvxyLi69r+6ayo6ch5jPwO8vbhYOu8H3Xi7oJ7BljOyVDGR2seq80oyM9eKopa4BvVcY+1CGlxNIzRPrk1lF8bK0gAbom+OU8F+zlJRPNKLEuwg/Q9VRTwghATI/cixQiOoRvmD7TqqLLq80b2t43yFL+YwgmUgPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265408; c=relaxed/simple;
	bh=itfzgRv69cSdPUg7zJzc8VMFE/HpgagI2jrKcmzrjyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvdIT3vlNthiAwiSbgxlAbIsK4Oa9k3u5x0HQuDP6xa5AHsqfT10UttfUUNujv4E0l9t6zXCNrbhJUpi309tHxmmHbj53IOGLy6cmn3mXbV54H1GOtBgTgCpbXq6B51F7dwmWfiUzIBWTA78yutY6cxN8DhshnbvTFWZ7mha3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NgJpJ+zB; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NgJpJ+zB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+d11/97yRmoOItITlX8hl7n6rNBG3cdfrFwI8I9S/Yo=;
	b=NgJpJ+zBDX0MZ6JrWYa/UG5i1llDwj6bUNli3bHCZGvMo99R5xwOZwmYqvOgDp
	B/IQoge6LZBZdyAytuk8P8Ma2Ff9VQPHQJ7zk4ncADLSNXHYvhyxq/0lzmz3rBRT
	yTf36Lw6CY/ItBVsWx0NiQKC7rjGBtqEBbW6Y7z0kLpBs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn4UNjSxlpT8UfAg--.7837S3;
	Sun, 16 Nov 2025 11:56:21 +0800 (CST)
Date: Sun, 16 Nov 2025 11:56:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] arm64: dts: imx8-apalis: add additional
 functionality
Message-ID: <aRlLY_rWgeAXGEV-@dragon>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
X-CM-TRANSID:Ms8vCgDn4UNjSxlpT8UfAg--.7837S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWruF13KrW7Cw1DAr4Utwb_yoWxuFc_ur
	1YkFnrWa12gF4kKw45JF4I9FWY9F409FyIq3y7W3srW34SvF1rAr48XryF9w18tr4jkrsr
	ZFs5Zw4DXws8ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU2jg7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQWM8WkZS2WKnwAA3G

On Mon, Oct 27, 2025 at 10:30:06AM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Cleanup the regulator used for the Wi-Fi module.
> Improve ADC node by specifing the used reference volatage.
> Add thermal nodes and cooling devices for the PMIC.
> Cleanup TODOs no longer applicable.
> 
> 
> Max Krummenacher (3):
>   arm64: dts: imx8-apalis: cleanup todo
>   arm64: dts: imx8-apalis: add thermal nodes
>   arm64: dts: imx8-apalis: specify adc reference voltage regulator
> 
> Stefan Eichenberger (2):
>   arm64: dts: imx8-apalis: rename wifi regulator
>   arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

Applied all, thanks!

