Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9A535DC
	for <imx@lists.linux.dev>; Tue, 17 Sep 2024 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585115; cv=none; b=fUHsW4dJFk6wITkQT+HQMSq6gRQwWCA7XrCl6r3HUwqc5mjhMJcn1o07Jb9cv1a/LHDeG3AG2XyhVX5HgTKWYgKxYNG3r6JSs91yi4+o22E5diIsSl15FuOTLINgfqleTOVk5FnSOW0oM8J+kgycn2qiTMI/aL+TF6/NnDE/dD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585115; c=relaxed/simple;
	bh=jNL6gnAeQmK5Ead24WrWOIcFJ8XntH6wyk9LBOJXGPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLP2zj2ay2x1RwL6ZjtOQIRkHQKCJ2Sej8OhqDH+4jOwf5xC1L83n6SfyblSBmdXYz9yEZp/+2n4aZjL7g4+jbkoE5yUNBE2jPOXlgXKmrifVSRAGR1FkrGo3EjmUz8GAYnyzZITUgWLwz4cucBlanStOWExjBqJoROGB+4IPvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jxq1uaSJ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jxq1uaSJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBA4040004;
	Tue, 17 Sep 2024 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726585105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iaBc2O4CmIP1XgLGYsmKKlrDN9ivIYK+vE5FkkijoTI=;
	b=Jxq1uaSJ/XeRnVClcJjBhtug5mzDyI7powIgC1eTaG3O2NV1xyIebagdN71fZM9PiCxGXn
	rsPYeOblz+8deTXpDKQDI1hx/CoYoaVaxEz3gBqrvz7vMok6VJEx3B4NA68UyCipQ44vxf
	P9vGWWll2SjauoD4ZTd+IHc5S6AIsHfK5uIOManyKxKRJpbqzKibE34pYJ9EML07RAJDIZ
	31DBIPqta9lmreLRlX3x+qhi43NTIWHnGDCBxTbXLMAMct+9HMxILTR3bUWngUGwxnxyQ8
	qUYdQqgCqN1y0Vu3iES8v4Z/6mTKG99PTeoyZecqmQMqxRMZuvoR23EZxjQ9ZQ==
Date: Tue, 17 Sep 2024 16:58:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, frank.li@nxp.com,
	carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: svc: adjust SDR according to i3c spec
Message-ID: <172658508685.68424.14744518376546755348.b4-ty@bootlin.com>
References: <20240719080233.842771-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719080233.842771-1-carlos.song@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 19 Jul 2024 16:02:33 +0800, carlos.song@nxp.com wrote:
> According to I3C Specification(Version 1.1) 5.1.2.4 "Use of Clock
> Speed to Prevent Legacy I2C Devices From Seeing I3C traffic", when
> slow i2c devices(FM/FM+ rate i2c frequency without 50ns filter)
> works on i3c bus, i3c SDR should work at FM/FM+ rate.
> 
> Adjust timing for difference mode.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: adjust SDR according to i3c spec
      https://git.kernel.org/abelloni/c/96267f358c14

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
