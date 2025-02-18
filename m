Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E091A5B8E
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 05:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857729; cv=none; b=fHKFwbyyIfYV3VS7faR1AfyF24ryssMVIrMcsGsxTQsAFR8OJI/5r2XYr2Y1qekKZdDbRekCXC4vc5hI7p/LK/ttcDkK0n8KkxtpeNF1ONwWGLmuIDEoLfK6vlgVJak1zYMKLUkkMAlk5BNo098/j9bZyJgurdUStw+TbAjbNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857729; c=relaxed/simple;
	bh=EhfoyfiV3/TQJjfLSsDlj14YQBGN85M2TkPc7w3M1ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZdWS12my7cUR4PA9SGBXkrwDuSnOH6iFAKPPiJWyIPYnTa/mCmeCBEi7UkjXF3f+DMWDGVfnrOlTOtLhS22A8jgwk//XF9AKdBhEZ7rGJ4dzdrGy++ulM85N27buLZPuKGvOPamsDSHXsWlDRud6RFcFKmM65yS2Q9QXaCklts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRj8Vy0I; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRj8Vy0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739857727; x=1771393727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EhfoyfiV3/TQJjfLSsDlj14YQBGN85M2TkPc7w3M1ms=;
  b=lRj8Vy0Ic/fk6MKf0Y/KIwj/Zx4VGQgkYdydxefKzteC1Ht6UimHgSyu
   JbCieIYU1IeSFQlUSerd70BTh++rLDX8WlJcmuXNzuXxOWBvrRItPWV9P
   2Y0dbXLFM/kYmZPNgQgtyyzN71OSgkWM2OKR1YitI+aplBs0+Qr7Pqh64
   QKv7SjHRlcboEMmS7mDdywjf2JjrUkq0LVfu4OjvSoGWjnhU/tOBgce0W
   X/nDkq41FMHF/G4Jg1UGFd5jQx8630PmY1I59x5hPirgf+WwtKpFNsCSg
   a5QuSDL/oJ2MGuPMAM5VjCfPnRQeaOH6sEo6jY4ufECHjQc1oKfMD9pJF
   w==;
X-CSE-ConnectionGUID: VA1qbyVKQtaMwCxqhd380g==
X-CSE-MsgGUID: y5YgqwdaQbCA00nOHaewdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65896416"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="65896416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:48:47 -0800
X-CSE-ConnectionGUID: OP7CRnalRXSD+cNsV3OJ6Q==
X-CSE-MsgGUID: hUD85pdNRkms9PlrASST4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="119392439"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:48:43 -0800
Date: Tue, 18 Feb 2025 06:45:02 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Y.B. Lu" <yangbo.lu@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH net 1/8] net: enetc: fix the off-by-one issue in
 enetc_map_tx_buffs()
Message-ID: <Z7QeXnBE0iBNFQYL@mev-dev.igk.intel.com>
References: <20250217093906.506214-1-wei.fang@nxp.com>
 <20250217093906.506214-2-wei.fang@nxp.com>
 <Z7M1hQIYZGWAZsOT@mev-dev.igk.intel.com>
 <PAXPR04MB8510AA1D5B596B4382873A9F88FA2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510AA1D5B596B4382873A9F88FA2@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Tue, Feb 18, 2025 at 02:11:12AM +0000, Wei Fang wrote:
> > > Fixes: d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet
> > drivers")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > > ---
> > >  drivers/net/ethernet/freescale/enetc/enetc.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c
> > b/drivers/net/ethernet/freescale/enetc/enetc.c
> > > index 6a6fc819dfde..f7bc2fc33a76 100644
> > > --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> > > +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> > > @@ -372,13 +372,13 @@ static int enetc_map_tx_buffs(struct enetc_bdr
> > *tx_ring, struct sk_buff *skb)
> > >  dma_err:
> > >  	dev_err(tx_ring->dev, "DMA map error");
> > >
> > > -	do {
> > > +	while (count--) {
> > >  		tx_swbd = &tx_ring->tx_swbd[i];
> > >  		enetc_free_tx_frame(tx_ring, tx_swbd);
> > >  		if (i == 0)
> > >  			i = tx_ring->bd_count;
> > >  		i--;
> > > -	} while (count--);
> > > +	};
> > 
> > In enetc_lso_hw_offload() this is fixed by --count instead of changing
> > to while and count--, maybe follow this scheme, or event better call
> > helper function to fix in one place.
> 
> The situation is slightly different in enetc_map_tx_buffs(), the count
> may be 0 when the error occurs. But in enetc_lso_hw_offload(), the
> count will not be 0 when the error occurs.

Right, didn't see that, sorry.

> 
> > 
> > The same problem is probably in enetc_map_tx_tso_buffs().
> > 
> 
> I think there is no such problem in enetc_map_tx_tso_buffs(),
> because the index 'i' has been increased before the error occurs,
> but the count is not increased, so the actual 'count' is count + 1.
>

But you can reach the error code jumping to label "err_chained_bd" where
both i and count is increased. Isn't it a problem?

BTW, not increasing i and count in one place looks like unnecessary
complication ;) .

Thanks,
Michal
