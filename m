Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC119CC05
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415369; cv=none; b=PXhEv2mupwVnEgFMAz0CLNO+BqANdh6pslUozmR4Yjkv/4BEpoHaU1UsQ3QwMWv7RFYLCQCAocV7sFXZoXmPPVSZEYdB710Q3xny5vR2vAtgWfltxlyaX8HcsP8Ru/ZUbJBNLVfe4rnb+crEnmQh9dGVJ7jd6GzNIktfSiHS+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415369; c=relaxed/simple;
	bh=8AXS0YCA0Ci96k//LeUhGRJZZGKmjVHV8/5z+f5l2Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJBftwtftDrlbqL2JWmWUSnmyW4hgU+fbWTZNj4ucGZzVa6kkl/QC9GEJm42lWakg1YCdj7wJCpodqCx7ZQuGOjPFDmluEEx7KU2bao5EeG7L+U1jRKVyb36aUMk9dQSicLJsGTd9VqPvQKMyihnApO/2a6h5CwGK3puqhEPOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Tk/2/1va; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Tk/2/1va"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1B4240002;
	Thu, 31 Oct 2024 22:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sjSmi0ElHFgzx3wNVCFaZKYItZyn3LIG3b9ExI++Pis=;
	b=Tk/2/1vaqjjhyMDNIbCtptcgnwpMy/xytaDIYtObsBt4Hpi7y/Ab9I+FVZUPkmLTSMe6dM
	mExbuabxER+6htb5a24PLSkO6SiOriiIIbAqXFeOjyO5mPzlyeASrjl2hSVnku24GFRV6C
	C1utm1fp0DKv6cFFPoY/rjw+lHBUoumSJGV4j0Q6Q8Uu3wkTuxM6pb8rh3rpOfGjUZCnJJ
	cmOboOAD/9s1xFY1qyZtX7h7NXkiSSGK8aWbvGDBQVG8f5qzYkd25J/v5d9K//Ddz9h9Ki
	xnic5SIPohYn9ShOAre+g3XjDd/UMicne2VroREd0Rao4u6xTjN3q0m7mVwsIg==
Date: Thu, 31 Oct 2024 23:55:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, bbrezillon@kernel.org, boris.brezillon@collabora.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, miquel.raynal@bootlin.com,
	pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com,
	stable@kernel.org
Subject: Re: [PATCH v8 0/3] I3C: master: fix the address assign issue if
 assign-address is exist in dts
Message-ID: <173041531796.2391928.12741323378960591582.b4-ty@bootlin.com>
References: <20241021-i3c_dts_assign-v8-0-4098b8bde01e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-i3c_dts_assign-v8-0-4098b8bde01e@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 21 Oct 2024 11:45:05 -0400, Frank Li wrote:
> These patches are split from
> https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/#R
> 
> There are discussion on
> https://lore.kernel.org/linux-i3c/20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com/T/#m16fa9bb875b0ae9d37c5f6e91f90e375551c6366
> 
> Basic back ground is
> The current framework is
> 1. get free i3c dynamic address
> 2. if found dt have assign-address for such device (identify by PID),
> change to such address.
> 
> [...]

Applied, thanks!

[1/3] i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
      https://git.kernel.org/abelloni/c/16aed0a6520b
[2/3] i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
      https://git.kernel.org/abelloni/c/2f552fa28059
[3/3] i3c: master: Fix dynamic address leak when 'assigned-address' is present
      https://git.kernel.org/abelloni/c/851bd21cdb55

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
