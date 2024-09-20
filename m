Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431FC17DFFB
	for <imx@lists.linux.dev>; Fri, 20 Sep 2024 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847911; cv=none; b=ij+nVRohoSEPV8PIw5oWP7l4cEletctm4IV81gCndHBadj+8BQz1n8uxFwsRdc4Ujzmk1Y3JUN8YB7esLqDyz1QcpCqZD1hbUPZFOlSISO0/uT1bRMnB6/KP8jYQ1g4ErrqZax4+VQFLYzLTW4P2GioFM8DYRY7Fg8WJwZTAfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847911; c=relaxed/simple;
	bh=XNfFFrRVo8a4wL2UR3VbWZtjgrhwmDIpuPmCd0POBCI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DC9m3DQ2JUZrul8C/hPcVMYRCSu/VjUAVq67uBPGikXCG0YcwnPiY/+eUfBsaEZligK9LIUigXZRDMNZHEP6Rm9TACo0PXniGV3kWQwz6AwZzvObzHBiufMn3Ax7wHnXxrkmVA7VDAK9X9Yok+rtLbSyUr1mHGdb322+TBVOstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEVnVaUC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEVnVaUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726847910; x=1758383910;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XNfFFrRVo8a4wL2UR3VbWZtjgrhwmDIpuPmCd0POBCI=;
  b=SEVnVaUCMGV+Kol5lmhpldq3L11PeVo6fBzvxj46pbuyhm6g5J5wbJdo
   0mURDAZBYyEnUAhNbtocnsFR1FhtJ7fN5dC27XgxQB2CN3+jHwlbKYymg
   7Wmf8LE4E8zIZUb+hUbARr2DuThijLn/ATapaL26dCXoXAx+9ByixThCT
   KCJaN8JWVJc/iWsTAvVsR+uDCGZVn7gBOUsktQRrI+f8RKK5dRNwnF2ee
   x4knmDJxRra/hMxNx5TjP49aGN3cS2UszATrR0XkBL6roqr/LBkI+IkXT
   6fvt28kOukSiW9d6Ho3xLcRchmMkDTNsgw2qHCHmaFwYvOcaIU7i3fvWr
   g==;
X-CSE-ConnectionGUID: /sMrGn2ZSiq90AlJfA6Jww==
X-CSE-MsgGUID: RopvpEO0RmqbvZjhCqSGMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36993381"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="36993381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 08:58:29 -0700
X-CSE-ConnectionGUID: yXk6fyQHQN2yIOKlPR89xA==
X-CSE-MsgGUID: eZG4rdVpRyKxvYFXLfNMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70787342"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 08:58:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Sep 2024 18:58:21 +0300 (EEST)
To: Jiri Slaby <jslaby@suse.cz>, LiangCheng Wang <zaq14760@gmail.com>
cc: shawnguo@kernel.org, s.hauer@pengutronix.de, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
    festevam@gmail.com, u.kleine-koenig@pengutronix.de, 
    cniedermaier@dh-electronics.com, l.sanfilippo@kunbus.com, 
    linux@rasmusvillemoes.dk, stefan.eichenberger@toradex.com, 
    tglx@linutronix.de, rickaran@axis.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, imx@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] drivers: tty: imx: fix flags of rs485 not work
 properly
In-Reply-To: <7a31001d-da37-4deb-a366-084a4027bcd2@suse.cz>
Message-ID: <f09c546e-4f0c-81a0-8acf-24f4e5d29229@linux.intel.com>
References: <20240906021905.197891-1-zaq14760@gmail.com> <7a31001d-da37-4deb-a366-084a4027bcd2@suse.cz>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Sep 2024, Jiri Slaby wrote:

> It seems gmail refuses to send this to zaq14760@gmail.com (the author).
> 
> On 06. 09. 24, 4:19, LiangCheng Wang wrote:
> > The rs485.flags are lost in functions such as imx_uart_stop_tx(),
> > causing the function of RS485 to be invalid when using the
> > serial port as the RS485 port. Use a variable to store the state to
> > avoid this issue.
> 
> AFAICT, this feels rather wrong. Any rs485 experts around?

It is wrong. The patch makes no sense at all and prevents 
reconfiguring/setting rs485 from userspace.

> At minimum, how are the flags "lost" and why this does not matter to other
> drivers?

Perhaps some userspace program is altering rs485 settings, definitely 
nothing in imx_uart_stop_tx() writes to it. I'm skeptical it would be a 
problem in the kernel, especially given the patch that is supposed to 
"avoid the issue" (whatever the issue is).

> > --- a/drivers/tty/serial/imx.c
> > +++ b/drivers/tty/serial/imx.c
> > @@ -209,7 +209,7 @@ struct imx_port {
> >   	const struct imx_uart_data *devdata;
> >     	struct mctrl_gpios *gpios;
> > -
> > +	int flags;
> 
> Definitely not int for flags.

Driver is not supposed to duplicate the rs485 flags at all.

-- 
 i.

