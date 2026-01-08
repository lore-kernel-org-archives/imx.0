Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF303563E6
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859166; cv=none; b=rV7BDAuBm5ksNXpuq4HMRTUg8n80vLgDSExlYQ7az3QmI1fA4pTLuVL31s6CsfT6B4lznEYrzV6SvI5IsedE2sPRcjKMDA+SHToyEUjJyLkRswrvD08Mi4SuOwvhNNxIdbbWY2NMX4HP+/liYFKwJlEMSiPr5P168QAMS1mgdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859166; c=relaxed/simple;
	bh=euPMXGUfHmKY0j6jRwBm4ZQL/PEILyPhKfkeMXB9tJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1yJbThaaRxWLdum1gGr29mlhM+DSraMHg6XOuyFgkzILyHj/JGa8jC5fcSu7PfbiVl9TzeJF9FSE2QXNC6MUea4d56FSKwNyAJwG8yoW2rENoXUENuZqM6XO3MdvntbTinIHrGAPSQiefddxqAHJfSE+Wsj0wCqFyASbd+Lhfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvF-0008Sm-PT; Thu, 08 Jan 2026 08:59:09 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvE-009doK-10;
	Thu, 08 Jan 2026 08:59:08 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvE-000JhN-0b;
	Thu, 08 Jan 2026 08:59:08 +0100
Date: Thu, 8 Jan 2026 08:59:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aV9jzI8_EAuT9KmF@pengutronix.de>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
 <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Andi,

On Wed, Jan 07, 2026 at 09:13:24PM +0100, Andi Shyti wrote:
> Hi,
> 
> Can anyone from Pengutronix give this patch a look and possibly a
> try? Oleksij?

I'm just back from my vacation. I'll take a look tomorrow.

Thank you!
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
