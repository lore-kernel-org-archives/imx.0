Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739321323F
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740090059; cv=none; b=EzcH1pR2ClnDtE5yIo5f0/lY8mVUVl7TJ8gxyk5SB0qn8N6fo3RSaF7U9RDUl9kvpQg/t+wyj76FPOKVYifeHo3KiS3yhU7qOMWmbVZE7d8yWWa82NQIFFu0doeowf0ZPU0xe1MGkeqjlafz8haX/GwhDs3FyJe96MRkBEgdIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740090059; c=relaxed/simple;
	bh=1DSkzqSj3AIzvFLMcIq8rSXAYhwHlidlZp3mBjFvf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyP0eVp3W7dHH1g2d4ry3eraapMsSKYEcqV1U5NNta+41zexlN4yu+BL2MiKytyxDjYYvncU0HH/XLj92v+RwD2/82OPyrtxO6bdojR+kJ/8jq/msuBbl06zG92i95Wc1uTTnYSLvafAST17JGpcPAEWB+yBMULKpUD4s//Krg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HXwlGTfl; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HXwlGTfl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D65864431D;
	Thu, 20 Feb 2025 22:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740090055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3LtfwD9Pn+Yvmkz2n0LKCzfssZAUMxpskFJUZ2RaJo=;
	b=HXwlGTfls/SK3S7ZVZTiUfOSL3GfSpUNkHkNt9WId5AtxQQHyrfRVYv+4vS8kZxJ5cBCu9
	gZ4O7HiR6vjMoiyfCxzuAtREnXdgdSun3nCQCwqRS36DmqDdKF6MY9NQWGIw1kDyfzUDwm
	qEjMAXtMcJhKA0vMabxWE896XtnTKIlM1WpVM9j7qFhLI4pPKYXKVoIUdnFtTUM5aErRwV
	bCFsPe5sT39mHEF8E5goMASj/teoxqOOO/UJMLZRjVwYWZuMuKOYGKY85F8vDpcsbR9RNy
	qhr3eHIYqAc/m7zkiXRFiG0jivZbF1jQg3TVjQikmKhh0kYKzrnzrYAlRvCd6A==
Date: Thu, 20 Feb 2025 23:20:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic
 Address Assignment(DAA)
Message-ID: <174009003834.598401.3147547459483423784.b4-ty@bootlin.com>
References: <20250129162250.3629189-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129162250.3629189-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 29 Jan 2025 11:22:50 -0500, Frank Li wrote:
> Ensure the FIFO is empty before issuing the DAA command to prevent
> incorrect command data from being sent. Align with other data transfers,
> such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
> sending a command.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
      https://git.kernel.org/abelloni/c/a892ee4cf22a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
