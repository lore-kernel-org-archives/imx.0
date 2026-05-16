Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D431DE8BE;
	Sat, 16 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915801; cv=none; b=NIneTs1B/T7kW0rbZjSnudfhulqlXQIyYkHMIckR7FgaIFkQG9oxQJI2w7TOmY2HVuth5fXGDXHE5r2wAhurZOrJrw+RpTyD3l4fFwzpsD9itRBhQDYx//ef/0mN9azZi5If6TKQhD61Cso61u2m1mV7DGsleEZ53+7Y4xZ3IbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915801; c=relaxed/simple;
	bh=xwXKcU1TUzsWKK1bckmURl4whBylKTE0ps8CgElwYR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7QqBXLlzXVvnUtpVThb+D+QdcdW7MF5B+8WMnlYasQZFQFL+uo+3Jvq2tqeLx1xAB1apSPKK57E7QHOsMEioaB+sFGu5ZymeGsvTkOVY6umFX9TPkmwQudkXSa2p1MByEECo1EpulcdmDBwTfQemd4ovQmvPmSI/+OyJBAH29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qqJrSSsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qqJrSSsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F19C19425;
	Sat, 16 May 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778915801;
	bh=xwXKcU1TUzsWKK1bckmURl4whBylKTE0ps8CgElwYR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqJrSSsrGYPyYoshc+G/wBBe4x8NYgE1qTcoESOWPNh7TYdbtcj9b7koI1nI36Don
	 AvupgQB5oTzw3BkAbXeEIp2W1zPmzaGe1YwJCFw3y/i4AeAs1wT75O2rcnVcvxmG3y
	 MSwRp46VbjFL+g4GIX3aUzn3p4L0AS+TtH67XCjo=
Date: Sat, 16 May 2026 09:15:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, shawnguo@kernel.org, hcazarim@yahoo.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <2026051633-doorstep-sequence-6782@gregkh>
References: <20260515175002.34853-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515175002.34853-1-sozdayvek@gmail.com>

On Fri, May 15, 2026 at 10:50:01PM +0500, Stepan Ionichev wrote:
> wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and, for
> every group with a wakeup_src set, writes a line into the sysfs
> output buffer:
> 
> 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
> 		if (!scu_irq_wakeup[i].wakeup_src)
> 			continue;
> 
> 		if (scu_irq_wakeup[i].valid)
> 			sprintf(buf, "Wakeup source group = %d, ...", ...);
> 		else
> 			sprintf(buf, "Spurious SCU wakeup, group = %d, ...", ...);

This is a horrible sysfs file, and breaks all the rules.  Why not just
delete it and use the proper api for it instead?

thanks,
greg k-h
