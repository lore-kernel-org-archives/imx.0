Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D7EC125
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718517934; cv=none; b=Ac+i/OCFxRmGFoj0/eY8FlJ/fvLSZYjXC5vUk6a2mhjW5b+luLkHokPM6mcZseOEgI5hnFSx9YZEklBmTUGkmk8kOFSelBiksK6oiZTqbzbVyEVNCm+IZLfcBUWmzSlkRFYPVGDmxIFDqvZ4J5fpUsrAwy7bamWhveuqaBNXJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718517934; c=relaxed/simple;
	bh=vnxcJYRrZjBVdodGMycBA6QvYwZTYShfDH+17ifCTJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8KdD8iAmSgvSPnSjdGMXN8NbyBptLkNxL5u9qj9p48aNjZYGbWuMp7T9Rttw7bFBEVsrfuEd5xAYPA8IkpsAQcyAwd/6PniY+hxBkgiCmJl3NFJZe6wjxpQMLcl2Rfds32gbEkQhkhzsY+gpTAcUpsKozkZsr7FCcsZuYgJwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Uy3BjFOP; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Uy3BjFOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ReK3RB1BvV03874WN2uoSl0AxjnmvH/mqw3qTL4lxHs=;
	b=Uy3BjFOPXjVsSJYDVZxnxMmt9rEok4Cxakr99q9tW9RsJNy9rn0BBUuKHSi818
	f+H59E56z6W3L7wow6MKgnN+ST4DRk1Aoal5JzfXLtzQ6gM+x43pqlUDSaZEJQh8
	eQgc25WuA7Ptl9yCd+a6HEPnc9lOY3ol4BCK6AMGhnTC0=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrACX32eXgG5moZXACA--.10011S3;
	Sun, 16 Jun 2024 14:05:12 +0800 (CST)
Date: Sun, 16 Jun 2024 14:05:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	haibo.chen@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx93-11x11-evk: Remove the 'no-sdio'
 property
Message-ID: <Zm6Al4E5gzRNL3vk@dragon>
References: <20240529034854.1595664-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529034854.1595664-1-festevam@gmail.com>
X-CM-TRANSID:C1UQrACX32eXgG5moZXACA--.10011S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAr4kCrWDZF4rGw45tF4xJFb_yoWxWrX_ZF
	Wft3Wku3yxXr48WayFyr1jv39aq3ykA3s8GFW3t3Z3XryI9a45GFy2kwn5ur13X39rXr17
	AFy5Jr1YvF9xAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8_b15UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRwAZVsVCpobjAACs3

On Wed, May 29, 2024 at 12:48:54AM -0300, Fabio Estevam wrote:
> The usdhc2 port is connected to the microSD slot. The presence of the
> 'no-sdio' property prevents Wifi SDIO cards, such as CMP9010-X-EVB [1]
> to be detected.
> 
> Remove the 'no-sdio' property so that SDIO cards could also work.
> 
> [1] https://www.nxp.com/products/wireless-connectivity/wi-fi-plus-bluetooth-plus-802-15-4/cmp9010-x-evb-iw416-usd-interface-evaluation-board:CMP9010-X-EVB
> 
> Fixes: e37907bd8294 ("arm64: dts: freescale: add i.MX93 11x11 EVK basic support")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!

