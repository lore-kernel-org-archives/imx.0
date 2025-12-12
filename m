Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B32F9984
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 23:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580839; cv=none; b=T1/ltTIdYErGYCqCtf7KA3U+947wS1JymqSCgk6Zs3NXtLRTCqq+vzfchoX1sEV9Zv+m9F8Y/fcn2RdCrrPO7Z4ScLsEUkogVO+B/0Vg76dJHxIsS+eV4jLxm+Hau8atagjK6F9z7HYOvOpbekCYZHIZ6ooC2VwRm4PTbI4YpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580839; c=relaxed/simple;
	bh=Lxn4MEKEicEbOFmx88T47+9Qx7b8ROKLDvsLsh3yD4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsYJ/gbXFD/+3IP8TA41wsZUjvEKpDMIM5g7esTz1KseYHt2oyto4bmHmZpFwdpZDqW8W7ScDISzYFhhlhE5H0+d/+ZOUcEyRq6F02zmP2NMIM3xJhLjWqKBrAQVP60wLHTJe/+Gds7ruCEJFMz1MiEY6yIEJR81IQcit1xsUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uCVRl62A; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uCVRl62A"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64DEF4E41BBE;
	Fri, 12 Dec 2025 23:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A1B7606DF;
	Fri, 12 Dec 2025 23:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFE98103C8D89;
	Sat, 13 Dec 2025 00:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765580833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bDaKGEZ61DFeAm9Oy1D6NKbVJaadd6WZ6QJ+ePPrDDU=;
	b=uCVRl62AiA2Qu5JGY41QyIdn78FVvzT2EFzV1+We54jbRKoE8hXrnmNZY835xFO+4prQ0P
	YVT2LtXxGcGMlmQjuTgM6JwqcwdrAMH0RIQCcrrywH/drfnQgb6A4bqwFhrYyLcOb38fk6
	Gu0Fg1l14P1f0e1nrdGwFvxXA627KtljC9MuRaAQgYqXiq3u6cRx8zRGvv51kbWb4Pk3w7
	kTM3no4smjZBDpliygVB7WAihrnPRoT224QM5v36vE5VBPS8xmQ63S8vW6utPvw4ZFsiF+
	iCM1AoWtky8NpUQK47FDDr2Ujccyw0eup99nmW/t7o8vMX3GEeDrvSmrAKuHjA==
Date: Sat, 13 Dec 2025 00:07:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] i3c: master: switch to use new callback
 .i3c_xfers() from .priv_xfers()
Message-ID: <176558079620.1405691.18176288166178254349.b4-ty@bootlin.com>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 03 Dec 2025 15:45:49 -0500, Frank Li wrote:
> switch all controller driver use new callback .i3c_xfers() from
> .priv_xfers() and remove .priv_xfers() in framework.
> 
> This serise is base on
> https://lore.kernel.org/linux-i3c/20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com/T/#t
> 
> 
> [...]

Applied, thanks!

[1/2] i3c: master: switch to use new callback .i3c_xfers() from .priv_xfers()
      https://git.kernel.org/abelloni/c/eaa0870387f9
[2/2] i3c: master: cleanup callback .priv_xfers()
      https://git.kernel.org/abelloni/c/41b80d43d9a0

I4ve tweked the doc change in this one.

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
