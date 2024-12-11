Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890221DBB13
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954203; cv=none; b=SUZwdHR7xSji7oHgfEmWK5UeceeUt5G9fErOkyZksKwU1I1wfs/Gv6gUQTa9EEeRGvLzIxuCB8lMQnwo/yLRag65M1EZCFo40fn/tsR3MVK0Q5dAhCHS5HAFHdd6bkrLUklrb7s6wSQHYM3N4YJscZK5F4bbuqWm99e7BcRA8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954203; c=relaxed/simple;
	bh=Lwqg+ADrB6ItLkQKdR+JgXfWXKYnf/XKcjMI3AS8BFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIMOr/CUQJJ+bLXrsBQo77H+Gnt2OskRxyoknvJH4UvLxTwZ7PoITWi2/jy50nn17EUmqpmzhVKqpjWyfUx3StslALjsl8dgD6wExo966LhxTuXVWLHxnmtwnseVs3g9CXOLCuJAf5us4wSd1N6vxYuRNLKmx3ss+QmoaHE4kek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJq9im5M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJq9im5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B33C4CED2;
	Wed, 11 Dec 2024 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733954203;
	bh=Lwqg+ADrB6ItLkQKdR+JgXfWXKYnf/XKcjMI3AS8BFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJq9im5MPQBMqanlONUmrBV/FxkCDcsFQN8GMNVgPSqxAKUDwN4C8YBiQhyV09qGq
	 GKlk53gHao79q6y8c9DGmswlgUvyNHzeG4F2fzOAih76Z7CHKhOsOj5EcBykUnaQl2
	 7dMS1UbuGGYs2rVKnI2CbmCzehNdmIifn5E0MpK4M254AVcvp1LGX/cTBKgeqRrLPu
	 yDlgITovbyw1Taj+fdlJnZTS6XdhR5YJoylFXEbgXzhGx4ZC0PDjvC6reIt2eml73V
	 MxwcGILhO3Xheya/GL86JY9TmhZeU8llnruyRaSOCB/AUcWHKb3DHkvBoUOiqq/gH+
	 tygsFq8PD+ztA==
Date: Wed, 11 Dec 2024 21:56:38 +0000
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241211215637.GF17486@willie-the-truck>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
 <20241210133732.GA15607@willie-the-truck>
 <20241211053455.z5zzawfacpyv2dlt@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211053455.z5zzawfacpyv2dlt@hippo>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Dec 11, 2024 at 01:35:16PM +0800, Xu Yang wrote:
> On Tue, Dec 10, 2024 at 01:37:32PM +0000, Will Deacon wrote:
> > On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> > > On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > > > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > > > write transaction and read beats events which corresponding respecitively
> > > > > to counter 2, 3 and 4.
> > > > > 
> > > > > However, transaction-based AXI match has low accuracy when get total bits
> > > > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > > > filter version 1.
> > > > > 
> > > > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > > > also detailed AXI_ID allocation so that most of the master could be count
> > > > > individually. This could be regards as AXI filter version 2.
> > > > > 
> > > > > This will introduce AXI filter version to refactor the driver and support
> > > > > better extension, such as coming imx943.
> > > > > 
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > 
> > > > > ---
> > > > > Changes in v2:
> > > > >  - modify subject
> > > > >  - add comments for AXI_FILTER version
> > > > >  - type -> filter_ver
> > > > > ---
> > > > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > > > >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > [...]
> > 
> > > > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > > > >  	hwc->idx = counter;
> > > > >  	hwc->state |= PERF_HES_STOPPED;
> > > > >  
> > > > > -	if (is_imx93(pmu))
> > > > > +	if (axi_filter_v1(pmu))
> > > > >  		/* read trans, write trans, read beat */
> > > > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > > > 
> > > > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > > > reading of the commit message is that imx93 was the first chip which
> > > > supports this.
> > > 
> > > Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> > > They use same configuration for axi filter.
> > 
> > Ok, but my worry is that the above code looks like userspace now _must_
> > provide valid values for the config1 (axi_id) and config2 (axi_mask)
> > fields on imx91, whereas before I think they were ignored by the driver.
> > 
> > In fact, without this change, how were the PMCFGn registers configured
> > on imx91? It looks to me like they were left uninitialised...
> 
> Before this change, PMCFGn registers are indeed not configured on imx91.
> However, they should be configured as imx93. I notice this thing when
> make this patch. First thing I tried is to add is_imx91(), then check it
> and is_imx93() by "||" operator. However, this way seems not scalable as
> more imx9x Soc comes out. Basically, AXI filter version will keep at V2
> unless big changes due to new features. However, perf tool need export
> correct MetricName via identifier in sysfs. So I made this patch, then
> PMCFGn will be configured based on axi filter version rather than pmu
> name.

Gotcha. But that means this is a fix, right? The commit message doesn't
really indicate that and we probably want a Fixes: tag to indicate how
far it should be backported.

Please can you send a v3 with that so I can apply it?

Thanks,

Will
