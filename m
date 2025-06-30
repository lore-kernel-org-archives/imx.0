Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524922E403
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255265; cv=none; b=IXUpzLsh8Na1TEKduihXpVOfTygyeMDnKN8ZnAAAlzAhh1prCmbpq385omSX+IphaQf0rtya/pLVMyaOjp7zPQjnijVtefp14DgbpzF58op/fQGnmNsi7QvNVDceM9XVe42lOc2TPF+ofSdsZySEHInjGLESDsGqxmsgus7T5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255265; c=relaxed/simple;
	bh=+t1jPnYCOVF0SdtSuEp+RHL45lFV8uYHWwhOlZuzCAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4XDNdW15FnbOPvCqiKQsRr3KhuhBWIlM7wjBALnHhNfD0U7fXLH16RAvOvPyhQGrDt1wv7+IGdxZ5Ab4sxrqXE2WC70d4ei7/iVjNNIVpqYyDqAqMe4y6OkUFnWoElhQEbWkMOa22TgEUmLQf9h6U+WYseNNyiLcy3FMJ7hxZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=N7aGd5qd; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="N7aGd5qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MC3PpwZilNiTUO9T3N1jve3LMEKnZfHx+jcycfs6XYI=;
	b=N7aGd5qdzoWWFzieN9fkXxNetlhygQmqSIiZToazHyALyoSFCZESx52z1V66gK
	he+efT+cy3t+JM44yyIZ1CTxwW+7NzuhOgh7GjvyyP4uUqUrhvLUVSGjCMIC25R9
	WEszdsj3W6LW0hwHdc3I75YNpYnSDAJ5041WHQNkaTzUM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3nzjFCGJoEjPOAQ--.37623S3;
	Mon, 30 Jun 2025 11:47:19 +0800 (CST)
Date: Mon, 30 Jun 2025 11:47:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Meng Li <Meng.Li@windriver.com>
Cc: krzk+dt@kernel.org, linux@roeck-us.net, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, shawnguo@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Message-ID: <aGIIxTjmpPPhhtpN@dragon>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-3-Meng.Li@windriver.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608030616.3874517-3-Meng.Li@windriver.com>
X-CM-TRANSID:M88vCgD3nzjFCGJoEjPOAQ--.37623S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1fXw1DZw47CFy3Gr4Uurg_yoWxAFgE9F
	15Cry8WF9xJa4jyws0yan3Zr9YgF4UCrWrG3WrCay3Aa93JFn5JF4ayFsYqa1fAanxZr98
	Aan5ZFZaqr48CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1D73JUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QACsl

On Sun, Jun 08, 2025 at 11:06:16AM +0800, Meng Li wrote:
> Watchdog doesn't work on NXP ls1046ardb board because in commit
> 7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
> it intended to remove the big-endian from mmc node, but the big-endian of
> watchdog node is also removed by accident. So, add watchdog big-endian
> property back.
> 
> In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
> property.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Applied this one, thanks!

