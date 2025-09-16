Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156952C3272
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029914; cv=none; b=sKWKfiqEDaqdRvxuvSYg1pxZEHPNElTIZRHSR4n8bNu3k9d8D0B6csArKv2lFQ4gMuuOxvGhkYaut9HEnzQzJyOehJNm9Q92s0BqItVvIeKUWJ7t8QA66KPgfXXV3/KItFTt1TmV/3UOH9uUd3tDqE5cdw7rLVUlIaSRwZne4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029914; c=relaxed/simple;
	bh=RUIOFUyGAU9lf/b6ffnhbghIz3X/+a8GFkJzvSDd0UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InJkhn7ouHKtTQerjdTW2ZutT5cHcZ7HmMWcoEeS/htVDUftDpEXghgZm3hbCdqlA2B3peeh8odRGFLFs/fqcBMGkRszCWOO9tNm5scMJpKkfpZROPEJ5LR20atVDkNCCFDRzEat15suEFdmaxnxdg3++h6ugbgejnVDrY9FvUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=v5gj2Erz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="v5gj2Erz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WPVN6uX7KvmtEwe9ZmBY3J+N/O0DGcQ0FgQs3IdZ+84=; b=v5gj2ErzdPrRuimce0O2nKewK0
	pwYRtdVSMcZzmSOhsvXE9lvCpL67O6yNeI/hiiCAiT/w2NcXgzxF21fIBjl8Ks61MRzM7O1XcWsde
	14/Bq2FY00clRhJFC8zJaxZR5fKdm6chntG8wATe/Apckz7fTodaIXn5+GCAh2nCs2Jj0yaqQLwVP
	MAUJiIFm99au241Bo5lzaYZN83D6kfMUz4rjd9eKMubrsRhbrLh+ZbU+YSLdz3JMWcZWODnDpTvJu
	rFf0Qa9DB+Iqzil89VqCKUdYDTLB6MEzIf2z6knfQ3VNuPi3jpi+HXixeGOkDlzp0RxK8ELvic4pg
	Cluj0nqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58202)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyVt3-000000004fD-2eCm;
	Tue, 16 Sep 2025 14:38:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyVt1-000000007ga-1Nb3;
	Tue, 16 Sep 2025 14:38:23 +0100
Date: Tue, 16 Sep 2025 14:38:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Wei Fang <wei.fang@nxp.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Richard Cochran <richardcochran@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Nick Shi <nick.shi@broadcom.com>, Paolo Abeni <pabeni@redhat.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"Y.B. Lu" <yangbo.lu@nxp.com>
Subject: Re: [PATCH net-next 2/2] ptp: rework ptp_clock_unregister() to
 disable events
Message-ID: <aMloTwObRUIRAzPF@shell.armlinux.org.uk>
References: <aMglp11mUGk9PAvu@shell.armlinux.org.uk>
 <E1uyAP7-00000005lGq-3FqI@rmk-PC.armlinux.org.uk>
 <PAXPR04MB851098C0A69B74DD232071B68814A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB851098C0A69B74DD232071B68814A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Sep 16, 2025 at 09:03:17AM +0000, Wei Fang wrote:
> > the ordering of ptp_clock_unregister() is not ideal, as the chardev
>  ^
> Nit: Uppercase, 't' -> 'T'
> 
> > +void ptp_disable_all_pins(struct ptp_clock *ptp)
> > +{
> > +	struct ptp_clock_info *info = ptp->info;
> > +	unsigned int i;
> > +
> > +	mutex_lock(&ptp->pincfg_mux);
> 
> Currently ptp_chardev.c has been converted to use the auto-cleanup
> API (scoped_cond_guard()), so scoped_guard() can be used here.

... which are very non-C like, non-obvious, and I currently have no
idea at the moment how to use it. In my opinion, it makes code more
difficult to understand.

Maybe someone else can convert this for me to this non-C like
structure?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
