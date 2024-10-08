Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABB5537E9
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728380172; cv=none; b=opqGk0M6psd0NaAduGVk8fSgqzhN8X7BJVnt57ugaMB+cQ+Vz7ro7G/StszLQS5rjXenVwo1PUjPwNDNW0YoC9PkajcAfoxICx1T9HhxdiBIyMJ/obHiSFoJGHyWzDW4UcbJjD3MzaGxg6fI6KMQ8GySh465sYAEPv4PgY0gfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728380172; c=relaxed/simple;
	bh=pRDCSX0h6sdWkOiRnpwocFiCrU0WtMoZWzS3wTV1y7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ob/+QgL7hIMLHFGsUbEUKR7lTC4WlN1/UQ2Bxz/6d2Pn4zEnW+HV+EyXgKb3hRxj1rLZAhVlhqW2s6LsiWZkvEnmcjYwrk/ZNloOdUg74/QDvQUHFqY9wEiJuYSrFz30tRvTI5xZIGu9E0yhO1Pp4fN3ld1ISmpd9eKRf1vJ0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=L8AhmHnE; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="L8AhmHnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wq4sVQnYrhOzvSut9lo+69MINdVR5kfrnIHLBpaOyyw=;
	b=L8AhmHnE2MQ60hEweJcUPfgVYYVp4xIxUf9WMoo5oLn7CGvcMBxa41KsC5MibS
	4wlZab7S9mV50/9LvTGP5rho5k7mbhR6O0Ek1w7ZW2qtgLFNRCk6Zi4pR8ApF6yy
	3Ukucx1Z5tIcTNZ37zglb08GDprduinMJZw9jmzb1UjYw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHpuXx_ARnbJHTAQ--.33511S3;
	Tue, 08 Oct 2024 17:35:46 +0800 (CST)
Date: Tue, 8 Oct 2024 17:35:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] ARM: dts: imx7ulp: add "nxp,sim" property for usbphy1
Message-ID: <ZwT88GNbW8IOumEr@dragon>
References: <20240904071808.1565238-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904071808.1565238-1-xu.yang_2@nxp.com>
X-CM-TRANSID:M88vCgCHpuXx_ARnbJHTAQ--.33511S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgRyZWcE2BSCjwAAsz

On Wed, Sep 04, 2024 at 03:18:08PM +0800, Xu Yang wrote:
> i.MX7ULP need properly set System Integration Module(SIM) module to make
> usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!

