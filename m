Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98C1EC00B
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740090154; cv=none; b=AzC2Vru+kZ32efB25WD7Bs9yV3AdDQjXRpTElPTK4NIDMgVQ7GqzTfd7D/oUkFivniwDhAfvvHgjiTV5pTzUw89sAoAt3oQa/rdTLlX8OoAMb3nz+mWEBHvJYwpgzY1Vrq11iK/iD4Y8bnkU4XLhJb98GPmeFEL6ZcRQetf2v2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740090154; c=relaxed/simple;
	bh=Z5CJx/6eYJwOVZRg64u9wxEKo4AJILDaWVrigGk3gL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGye3EHSmt1XVpBmpmn8PEJDCWIbN3i2vWab16Q2127q0niNeRsjbG6Pa/+myxPJDKuNVh4iamdZ2HNMQFdUxxI9YXTI7QdcA/LsWmXjbo2CE1NJ/M+lUshAwMLkbAPd8HO4DZQ+nQ45/c+5NBy09acKSRPwL8hQFTXTpt1RzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lF9PdIdf; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lF9PdIdf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 915BF4431D;
	Thu, 20 Feb 2025 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740090151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5s5UwLG6TyX2xyddRb3emz94Dnuso5d43K0ObrbLrs=;
	b=lF9PdIdfHxNQEwF/p7RZ97QSp71uS5MXfmHhos5q6lR+DXfbL6sv0el0r8ruXrxu57uc+r
	7Ucs8MUReNcZcJMUi1xHX3DkO5Zj8S6fEIonO+lLD1ITYGFY/XqhEEKCnEYK7BlGP2Y+Ud
	Fl4on8SlfKE5IP43Sih9aUkjAXz7xHuqqEiEF6Ys/w+ro+5UES98LTg3t/oGpMK+OXSub3
	g942dbXxXHuOChNRkg/veGNKqRGknGnr4PfrBOzK7pEvI2f6HE6UrJSRlBKMMSEBm+KBw5
	WrajnYtAVXVJBpKXFglIwSUPk5YtBpFAzl/q+aLNfEX+d61od8zFQdwd4KccjA==
Date: Thu, 20 Feb 2025 23:22:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: arnd@arndb.de, bbrezillon@kernel.org, boris.brezillon@collabora.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	pthombar@cadence.com
Subject: Re: [PATCH v2 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C
 controller driver maintainer
Message-ID: <20250220222230954f57c1@mail.local>
References: <20240815141609.4089406-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815141609.4089406-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjeekudeludefudfftdeuleejheeuueevfefhhffguefhheejkeejhfffhfetueenucffohhmrghinhepfhhrvggvnhhouggvrdhnvghtpdhinhhfrhgruggvrggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdpr
 hgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghorhhishdrsghrvgiiihhllhhonhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegtohhnohhrrdgtuhhlhhgrnhgvsehsihhlvhgrtghordgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 15/08/2024 10:16:09-0400, Frank Li wrote:
> Add Frank Li as NXP i3c controller driver as maintainer and add mail list
> imx@lists.linux.dev for it.
> 
> Add Frank Li as I3C subsystem reviewer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied now.


> ---
> Change from v1 to v2
> - Added to exist item
> 
> Recently, I submit many i3c related patches and become familiar with i3c
> protocol. So add me as svc-i3c-master.c maintainer.
> 
> I reviewed other i3c patches. So add me as i3c subsystem reviewer.
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b96899a78890..077e37eb018ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10708,6 +10708,7 @@ F:	drivers/i3c/master/dw*
>  
>  I3C SUBSYSTEM
>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> +R:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  C:	irc://chat.freenode.net/linux-i3c
> @@ -20961,8 +20962,10 @@ F:	drivers/video/fbdev/sm712*
>  
>  SILVACO I3C DUAL-ROLE MASTER
>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Conor Culhane <conor.culhane@silvaco.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
> +L:	imx@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
>  F:	drivers/i3c/master/svc-i3c-master.c
> -- 
> 2.34.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
