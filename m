Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF51F153C
	for <imx@lists.linux.dev>; Fri, 30 May 2025 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748584783; cv=none; b=QWCumdvhm5xPyaaRAglbEEeHz4yFEP7teyHtOwl3yZP1orOoRP2LZQ9lqas5zKJ0rHTC9qtLtq8wTCL07Ei+aNJ0M8eAvbSMk2vwEOuQLxL0PRBJ/z1e1wYJ1vbtOzlzzFXtEQ0nchROnl0p0AmzycHNmPWSXFlpd5A5N0opUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748584783; c=relaxed/simple;
	bh=nnNBgcEZgI434oiz3LTah5dcOPnX/JaI+3hRg6Joj0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZE6Z6CD0lUIRMC78H2CsI4wt+coxQfNflcZEUlyh3DuCxRAhx8YvAWpJB6PsrPdBNsPwRQ/cEORWIevzy2SAxbFd9E6uQaPDAuxweiVbZzIPMbQdgIfdYva1RoLCpC46GZBhQTJSP8na7n5MvL2oo4p5lUaI69R8y38N9Qh7PWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uKsmF-0003MO-7W; Fri, 30 May 2025 07:59:35 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKsmE-000vgM-2K;
	Fri, 30 May 2025 07:59:34 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKsmE-000n62-1w;
	Fri, 30 May 2025 07:59:34 +0200
Date: Fri, 30 May 2025 07:59:34 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v3 2/2] i2c: imx: drop master prefix
Message-ID: <aDlJRg3ebTVHksTQ@pengutronix.de>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
 <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Tue, May 13, 2025 at 02:36:14PM +0800, Troy Mitchell wrote:
> In light of the recent updates to the i2c subsystem,
> drop master prefix.
> 
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
