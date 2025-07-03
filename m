Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598752D9491
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584287; cv=none; b=qI5F4ZEXTEMY4KGI0SMnLABaumC4ZGoJsBwNKT3hfRGXsm8YtUoS1U9OrfnniHB/q3CTIVlXEOri3ELXt7afgEhlLopqzUuHpsneZxxwz2PNXnl/FmwObPVSyvUSNIAxsPn2+2+PACKkI4GGxe1MlNTVSewWYDJF0N90x10XNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584287; c=relaxed/simple;
	bh=UxBlnfg+YNu6y2FdpOlInr1rVlXU0Po69oA4PZyaAY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxwOfcjkI11RrDP00AfL5GfLzz0F1Dv8KpVwI3wOBO3qRsyZKM+SO0JYSWouK3CsQoxEiHhCM/RGKfRJG00cRR4Ty8NkQa3/g9pvXB18ORwqVJBpE3h37CRHc38nYiG8jBIDKUVHV84U/i/nGLiDxhyl0emM/4OTgalsaSqBbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RL23FrHP; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RL23FrHP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4C9843195;
	Thu,  3 Jul 2025 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751584282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r5ISSWEuWdEs+QXp5Y0A1oYBYgvtwsywibJIh3bKZM4=;
	b=RL23FrHPPMt4Rz7CeAAEsqSvMHQkGck0LsXQLcA3wUnsCIWr+y2o/hEYYAfhV7/MI0IGqp
	gOYPeTynnzxkgtVwGVEDku632ZEcfDi2R1iwi0wo/ZcjZ05uPbCbIKv1PE3Wa8znHyTrFU
	2CiuJJVV5qx2Io8jdf/p7tqzQDe/GznCM04d+Kpr9pGQ49+pr0zY1pPZLrqJ1uSOZGov/r
	mGHXlAboz/qmYe1TqObRzZi0iNXo+QbEao8bdSBFK7zNzu5EFX+GVzwyfrNrZFaZemvBbb
	fkj/M7IrAakd2AkvdKG1cOIe+SKQTJsplbLkE7jW4JsZwsy2aonndNLwcDKkJg==
Date: Fri, 4 Jul 2025 01:11:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 0/4] i3c: use adapter timeout value for I2C transfers
Message-ID: <175158426783.795206.16864239289735661443.b4-ty@bootlin.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphhgrghjsegtrgguvghntggvrdgtohhm

On Wed, 04 Jun 2025 12:18:26 +0200, Wolfram Sang wrote:
> All I3C adapters so far use a timeout of 1 second for I2C transfers. I2C
> adapters have their own timeout value which can be changed by userspace
> if desired. Use it for I2C transfers. The default is 1Hz, so the default
> behaviour is unchanged.
> 
> Found while finalizing the RFC for the upcoming Renesas I3C driver.
> Looking forward to comments, tests...
> 
> [...]

Applied, thanks!

[1/4] i3c: dw: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/1b84691e7870
[2/4] i3c: master: cdns: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/be27ed672878
[3/4] i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/c0a90eb55a69
[4/4] i3c: master: svc: use adapter timeout value for I2C transfers
      https://git.kernel.org/abelloni/c/a747e01adad2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
