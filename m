Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA072E1F1C
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884632; cv=none; b=mrLlbsmsATQV4j/IIX45kucLFHj5oVFMsOsDZ5i2/H4UXTq44DxAe/cky0RqEezS7tW0tC2H0rY4DyGGtKy5Rsau2mXlOzxI6gcvQErB0fphgCyP0uq31gkd1uwMKLr7M5Lrx/kTpv1ozpIopeHFaQa70Gvc0zyJC7/CNWWHwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884632; c=relaxed/simple;
	bh=URdhwSzTVTr6jnbDNqiV173BojDqOvJ98BtN7nxNUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVjKWwgBXd8RHkVX2FgT63zWGxDHwPzm5/DKGj9rbYsVt3/r3srQ9xYeH7iZo1l33RdtQ8y2aOjKOiRfZZYIDuAzezucY7J+/3ITj1F5IAkRtmx6OSvYX6ScZVvpGfzmttZp+x5R5a+5Mwnw5+0WGoP8DTAb239wAgZvXTIOW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cQOmKQK/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cQOmKQK/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F0AC4E40BD1;
	Sun, 14 Sep 2025 21:17:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04FFE6063F;
	Sun, 14 Sep 2025 21:17:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A8A8102F2A78;
	Sun, 14 Sep 2025 23:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OkqbEDTG/+GAW4UlfVPaLCa1gjibhe38pdOw5DtxKK8=;
	b=cQOmKQK//9unzznVxjZPY72Zq0diePDB8AuvMrj3OXfD/HfDUApsWJISmMkBYgmBv4cwBn
	sG1znEXphFFz0pigi9i0E8BvWMVhbCqz9LbUuy53IshXA20/Kh/4VFQoxT44CKVuB/flr+
	F2KO86gDTQ+fl+zRmsF8NTh2eP/znv5okt658EIjTmV7kAG5g0qLqWBOftb8428nsNu+V4
	f1MOZIDU81GO06zfta415cjMvLnhWexlyMPf7Cq+ljLOq+lsXFmwT9qvrjGhjedhMhc0D1
	GbLtOuxXxH3E3Stn5gA7BrxcFANuZP2lJYa1JHnR3hUZuEenbMa0gAnSVcs+yQ==
Date: Sun, 14 Sep 2025 23:17:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
Message-ID: <175788449951.388732.3384121989400255394.b4-ty@bootlin.com>
References: <20250827193356.78368-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827193356.78368-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 27 Aug 2025 15:33:55 -0400, Frank Li wrote:
> Add compatible string dallas,m41t00 for dallas m41t00 RTC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
      https://git.kernel.org/abelloni/c/ab2849666022

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
