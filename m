Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9881662F7
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040989; cv=none; b=DtZU2av4lFGKFTNSapIb/1DvGF7Sg4cNMxYEEYyqI68675TB5EuolovdLAO2CF3b0iy5NtPky54HAZBS2YcMtGFxzrlhy/tX9z/gm9JDeO9FEfnb9intQWpfUKWNZHJdqbycthSrunhGgz0zS3Ub8hFKcyqTn6y6GUwMz3I4ZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040989; c=relaxed/simple;
	bh=7uHJxNk8J+7YONNo+HXDaXGuq72vXCrSY3b47EZX7zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEqOhWcW2RbTGjWtOIsuECSHquGBfaI5ivkjouEs4kBaX7PUD8XThX9xOkZSAn6s7uV5HmF0rcB1JgqtqlMlfxdmLHJkKiGwChrW/wLoZPJ2ETHwA9rhggsBAzuq1j83wevrls6VeABPovHDTJiSbjYa5+yP2n/U6DCVg5OPlGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJNE-00037l-BE; Mon, 15 Jul 2024 12:56:04 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJND-009gbE-JY; Mon, 15 Jul 2024 12:56:03 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJND-000OX8-1O;
	Mon, 15 Jul 2024 12:56:03 +0200
Date: Mon, 15 Jul 2024 12:56:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] firmware: imx: adds miscdev
Message-ID: <ZpUAQ0QDr9kzlOIn@pengutronix.de>
References: <20240712-imx-se-if-v5-0-66a79903a872@nxp.com>
 <20240712-imx-se-if-v5-5-66a79903a872@nxp.com>
 <ZpGr6qKjJKz14J+y@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpGr6qKjJKz14J+y@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Frank,

On Fri, Jul 12, 2024 at 06:19:22PM -0400, Frank Li wrote:
> > +	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> > +	if (!rx_msg) {
> > +		err = -ENOMEM;
> > +		goto exit;
> > +	}
> > +
> > +	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
> > +			     cmd_snd_rcv_rsp_info.tx_buf_sz);
> > +	if (IS_ERR(tx_msg)) {
> > +		err = PTR_ERR(tx_msg);
> > +		goto exit;
> > +	}
> > +
> > +	if (tx_msg->header.tag != priv->cmd_tag) {
> > +		err = -EINVAL;
> > +		goto exit;
> > +	}
> > +
> > +	scoped_guard(mutex, &priv->se_if_cmd_lock);
> 
> You totally wrong use scoped_guard in whole patch.
> 
> fun()
> {
>      guard(); //which means lock here
>      ...
>      return; // unlock here
> }
> 
> scoped_guard()
> {     // lock here
>       ...
>       //unlock here
> }
> 
> your code scoped_guard(mutex, &priv->se_if_cmd_lock);
> is equal to
>  
>       mutex_lock();
>       mutex_unlock();
> 
> Nothing protected by mutex lock at all.

Thanks for bringing this on the table again. I already mourned about
this in v2 of this series, but didn't notice the issue wasn't fixed
then.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
