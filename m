Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ACC25A2D8
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477290; cv=none; b=mUtMxZXP2GQ6vaO13FLHiC6IrGj2TvQD+4NOebZhHPqFKrsWeS7OToS71RFdAih6Wsqm4vYRZenTOBtfZ2cqorgee7rAdR23epnVnpWGS8cv2TC9/0jbGcGLr3pa0pI4r7aPNHeAvdhD1qGSULMB80q1E7JC/nykmWsVDtODo5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477290; c=relaxed/simple;
	bh=AtQ5DeLqMLMiqzfDfVnJQLhsl7WhKEqsNLlvztdlvto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0XYmvwctbwi1jcio8/LY7jUsRGqp+h5bVataxSeUtGBecJdwg5O8L9yc7Z7kGiwqwmmFpMoaRAGmS0GPdHVF/ejd+4C/9uJXOz8rrlYOlUUj5E0A1NXftpqyP6udqdz9ocCT02/atgUiv2tjuzHoI6hHPfNec0TPjHc7r1Z7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=geRr6UDK; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="geRr6UDK"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d219896edeso432465585a.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749477287; x=1750082087; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=geRr6UDKAxsrq2mKj8I06OZb3p+Z7VodzE1FUlSIygWfIpP7xHkbNYQ8RT1rJ600mF
         LHrt88QLGEW7j9MdVphTo0JvqfM/apr3hmoVtSCjK6cIhc4cD5f2R2Cm6QDUjt8AKZaG
         ooq5nDYI2zwRBjWyYWDov+HVFfm7WNs1cXOTig+3FEFEfy/fwAIBYv+SWtpms0xIrAXr
         gGxrTO1AcQgbhgTreox7UupJg4TBPq63mjDPgLkdAHpQEsobJfLEmTsvnal3k11gzh9Y
         93YO4wP8xfy+LnFpmQyG4msbYsxFla7I4utbgp4n0wYV4GTFIPlZTwPvDYTTo2KjEsEx
         Si8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477287; x=1750082087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=EiwMOifdwBu8RtrRFbmqFdVR56M+BRJW8c77B2Icc2B5QHSIhp9Tansal3c6jLDDqE
         FbMsjpo6ZObSW83xy4dRn7/vojsgZio9RucCqZ/iabWdrX/Id44fPnluWoxOmBZ9s7Xr
         5J/87cOBPnKkK1DFGl5CQcR2i0sNPlO3fUzjqSZolT2bJaHtDpaZ1S0choMMpNrFY3lW
         kGiYpFzVB0OUwCBQ8xWn4w1dJ7kpQhuIlme90KoVp+RB1cQIZ7j/JgJfSMzylT6QJEMZ
         3uhVU2sOdy2IWngqRG2LkUIms23LwVJT0Ifg4CgFPa5v9OrTb1EdD9ek2x5m6oXjRqqf
         Yy6A==
X-Forwarded-Encrypted: i=1; AJvYcCW+I58vAqxsSs4SxOTel8x7RJsUKkJEqj8qsCzc+0bxDTqimwO86QcgswVSQUZ4CbcgnWE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT0Vr/++YeGVPc5+mhfBH8BgAc5YkjXBmI5fkT5Wwyn8DkUEXH
	4wUMBsTWzqAy1F/TLWPpeXT1R4E2p40os870dTYznFfZ24W7Ehb8PIykOIkLAQHt9A==
X-Gm-Gg: ASbGncud3Mm68dZHdmWkCTQSzuewoUu2rbV7RyHdgvrVAtL6nb7Y5hm+KGheT12Po/U
	qJNMu6sYVWlwFqHkzYd8QozMw2XWoqZk5MF6QGvQOPvj5nR9XBJjEwdhxkTlG1FjnXtSuQvXX5Y
	HOZaNYhtREuHXeS+RdhE7Pgpy43AiwEQLzuo3wEoX0dff3P0FCXlxo9m6bxZ7GZaErU023joC6q
	2SWyuHpK2orUXtOPPjhaF52XRGy72Q33iwkYy6+IHbI0nQ3PIzcwB/e9Rfovod5aWWpeNvkEUDR
	P8/7fsodUGA+iZ1ffciBzv4jie8ApQF2+k3E8dN4RWfCZYayVySVkq8/drS3qUBr1HFCxHVMgiS
	Aat6b
X-Google-Smtp-Source: AGHT+IFmfPwn0la8Bjg0x9fgItMpfqDL+xE2KxSEQfR+WeIFu+KstQKcIkZH8uGDncVhKeEIwi22SA==
X-Received: by 2002:a05:620a:178c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d2298ce851mr2069583185a.44.1749477287608;
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a535794sm545282185a.26.2025.06.09.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:54:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> Thanks for your reports!
> 
> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > Hi Xu, Peter,
> > 
> > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > 
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet
> >  - Device is going in/out suspend

> During the scp process, the usb host won't put usb device to suspend state.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tring
> to queue usb request after usb controller has suspended where usb clock is off,
> then the system hang.
> 
> With the above changes, I think the ether driver will fail to eth_start_xmit() 
> at an ealier stage, so the issue can't be triggered.
> 
> I think the ether driver needs call gether_suspend() accordingly, to do this,
> the controller driver need explicitly call suspend() function when it's going
> to be suspended. Could you check whether below patch fix the issue?

The situation is more complicated than this.

In general, a USB gadget cannot allow itself to be suspended while the 
USB bus it is connected to remains active.  Not unless it can be set to 
wake up when a USB packet arrives, and even that probably won't work 
because the wakeup sequence would take too long and the USB transfer 
would time out on the host.

The best way to fix this problem is for the gadget to disconnect itself 
from the USB bus whenever it goes into suspend, and to reconnect when it 
resumes.

Alan Stern
