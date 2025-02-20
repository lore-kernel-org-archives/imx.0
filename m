Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE61F03D3
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740089365; cv=none; b=gUK23t5YkNPP7eGdJHLQMSaxeTtRDLDpO/m6b1GhviX2Nsm+FXQL6vX3ziRJbBCsikKZB71fzfliYDNcg4r5yqG6N87sgs+/u1r8oihSEsN2r0MVZidp0eV5ZQgJoVm7ptLgz/yhc+VWADmoVro7zuZ1Ya6EqeVh+DxEIWLpdec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740089365; c=relaxed/simple;
	bh=Qk46eOwmfnB/fNW3txcLxyQ//kct9eJkKtX0ruYzmGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msJZxOaN9o4+REKk+n9ZnTl/ED6rvsYtY4Oz/Gi6bTlr+E/Zc0aKtynai4QUzRZ84ntr/r3p5CbGpQqBfKoNCAPDu1BcQVP7Im5mHq1LFYYP2oQ3ijmmfPEh3HS7o1rn8Njckv6Yozs+4KzSQkIf0K8TWV3SVyCgCvk+pJ/wYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L19XVOcB; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L19XVOcB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62F843137;
	Thu, 20 Feb 2025 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740089360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR5kIZpUVnxd7NQva8Zt0gnaC0IasQ2WCr4TJ7Zil3U=;
	b=L19XVOcBHKdvLxCS0Zx5UodskMhTSSsvc+dv4kDB9sXNQ6yMsGw9B4R9q31athnkEHjlpT
	Ml+tFdPj3xrLyvHT3QYTMIhrFtfcMFnL4XwiSuTd3ZrqvUvQIEH5w5AhHHacdx35FMuCn5
	t/sFUZbFYufljky9AHMGCnH5aZ4hTcXZDRSyf/GQtM9esLe/oLUzn+1ilqwdEKqNWggZBo
	yvpfEmC0FXlfoxjJ7WF4VbvswDBzmOVQgF6DVwWKKhOG0U07Vubeb6XA35CyToB50lTEk+
	/Nwk4PXYCvOBTcAAU6T2LcFlMAnDoRPNKqaaQI5TzWVVHcZNqIC4+fDg7AiMuw==
Date: Thu, 20 Feb 2025 23:09:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco
 driver maintainer
Message-ID: <174008931864.597348.8655184807057605761.b4-ty@bootlin.com>
References: <20250204161151.2179596-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204161151.2179596-1-Frank.Li@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrrdgtuhhlhhgrnhgvsehsihhlv
 hgrtghordgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 04 Feb 2025 11:11:51 -0500, Frank Li wrote:
> Conor Culhane's email address (conor.culhane@silvaco.com) is no longer
> accessible, and there has been no activity from him on
> https://lore.kernel.org/linux-i3c/ in the past two years.
> 
> To avoid email delivery failure messages when sending patches to the I3C
> mailing list, remove him from the Maintainers section and move him to the
> credits.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco driver maintainer
      https://git.kernel.org/abelloni/c/6f61e5dce268

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
