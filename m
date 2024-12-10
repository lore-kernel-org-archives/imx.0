Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2B23DEB6
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837858; cv=none; b=cODy8DHBnQ2vZFraCS+yDhrVqdc4HE34xqXz9Flh6YtmuNDyqvfk9vRYUIsx7s4isyW3trKJ037GCBrLv9sfKpWX1anbdLjSf3UcFetWAuDKIDUjU5rdt40vH+61VntRe3YWWzH92HYF7OVV+hF2Y7IOSJCJYun1Sv5qVx8fN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837858; c=relaxed/simple;
	bh=Rd2iPljEDfNNqaWr5g+QzbTeRqU58jXTJYCQVyr6iNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFosnnCidEcH2MEtTtBDb3bpe7Wn+3XI1s8BG/FxkvHx3Ga4gbbydstHti3gNO5m6x1ZReaeLfTV6qUWMNpzx9x4D6fJ5QDdo+0DV5b+Lg5BrSnzYG8wcewk+A7IL1rZ++CJjHwS/d1O+uRpc7D/ccF2Sm4uS/4ersPyFKf09Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sz9QD4FM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sz9QD4FM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C95BC4CED6;
	Tue, 10 Dec 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733837857;
	bh=Rd2iPljEDfNNqaWr5g+QzbTeRqU58jXTJYCQVyr6iNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sz9QD4FMreEsZWo9DqmPgDiHLGQ7RzyFypZCrcrxheiWeD+O6w8o9wgTuHvYltUuQ
	 PvuBG2R241TKY1LCZMKXzyz2o95mAfEktbO5m7d+poNpyBeogMqvkvR0n9/jciwlBA
	 1xhJWz5PcE7oy2smg9zZ6G7XwrGHBbeAm1AjhjH47vjH9X5/9uAxw6f6A5JyyL75lH
	 +tT7FUJF8Bn6SdNzc5W/aFLNxvyku9LLfyiITUtJVGQq96tu9eOcM4TIRn1ug0NX28
	 V7jHQZb9G3Y6RcrNrOK85q3qQj06R8s6zDAcKsP54j2DbW//25GaAHmyjQSKYFdPie
	 t2L1qIjedtWIg==
Date: Tue, 10 Dec 2024 13:37:32 +0000
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241210133732.GA15607@willie-the-truck>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210020212.yz3xowvdk27zmgsl@hippo>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > write transaction and read beats events which corresponding respecitively
> > > to counter 2, 3 and 4.
> > > 
> > > However, transaction-based AXI match has low accuracy when get total bits
> > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > filter version 1.
> > > 
> > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > also detailed AXI_ID allocation so that most of the master could be count
> > > individually. This could be regards as AXI filter version 2.
> > > 
> > > This will introduce AXI filter version to refactor the driver and support
> > > better extension, such as coming imx943.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - modify subject
> > >  - add comments for AXI_FILTER version
> > >  - type -> filter_ver
> > > ---
> > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > >  1 file changed, 25 insertions(+), 8 deletions(-)

[...]

> > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > >  	hwc->idx = counter;
> > >  	hwc->state |= PERF_HES_STOPPED;
> > >  
> > > -	if (is_imx93(pmu))
> > > +	if (axi_filter_v1(pmu))
> > >  		/* read trans, write trans, read beat */
> > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > 
> > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > reading of the commit message is that imx93 was the first chip which
> > supports this.
> 
> Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> They use same configuration for axi filter.

Ok, but my worry is that the above code looks like userspace now _must_
provide valid values for the config1 (axi_id) and config2 (axi_mask)
fields on imx91, whereas before I think they were ignored by the driver.

In fact, without this change, how were the PMCFGn registers configured
on imx91? It looks to me like they were left uninitialised...

Will
