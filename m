Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EA5134BD
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 01:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712107144; cv=none; b=Xc+eg8OBdP8LEP9x44pfBWxVwFAw9o+5awBujasFEyYYsZXtjOqEbmFsMcn1OyC7qW+cga9XJ4m1vSSnkRXvSixKQlUf5X0SEjpwVzC5kFjR7Jywk7pVZNyGCxisLgFHmzlAkbHbKUpe3x9qhxmo9hBWnfnudrcqDrO3cI7Bwwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712107144; c=relaxed/simple;
	bh=ZWs884ey2K4gD9VzSZ1KT79c/6tK2wm2eNgFK8fp8Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT8b8w5igoL2eZnAWbuJBr1ilWN0m2j0MDvV7LtlrzK3pZdFwrvF4Ofo36cSGnNHsw2yJ9o5ITwnd+1UEyExMJs4GLJ8GwFSlYagWGJN3FWi7k4DN5bOox+zV8+RiRZ1Khv/EzB0RxVbYvZPcIQl/2Hyctvl6cQXV7xeR/8wBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cJRRIN21; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cJRRIN21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2Sh4kkTKCe5vGuyfio0SMst+ujSu5NuGLGRn8SVVcsA=;
	b=cJRRIN218Ltl+aNYhdtNDTjF9C+YkgO3+cqTthS3iIwvqFMB3JQQvquIhIsReH
	AiAp9IMnglp2kTQGz1WflaNyFYI0mMS7TloFoWv/VufAPmamGIFX0v9Q20Euaw6e
	eIn117euEjQv7Xr0T40NoMfXUla9P637qhDmuNJddVYG0=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXn0R2rgxmK0GtAQ--.49153S3;
	Wed, 03 Apr 2024 09:18:47 +0800 (CST)
Date: Wed, 3 Apr 2024 09:18:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6sx-nitrogen6sx: drop incorrect
 cpu-dai property
Message-ID: <ZgyudlZqTBdMMLw+@dragon>
References: <1711976056-19884-1-git-send-email-shengjiu.wang@nxp.com>
 <1711976056-19884-2-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1711976056-19884-2-git-send-email-shengjiu.wang@nxp.com>
X-CM-TRANSID:ClUQrADXn0R2rgxmK0GtAQ--.49153S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIUGOUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBi1ZV6NnqoiRQAAsQ

On Mon, Apr 01, 2024 at 08:54:15PM +0800, Shengjiu Wang wrote:
> drop incorrect cpu-dai property, change it to ssi-controller
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Applied, thanks!

