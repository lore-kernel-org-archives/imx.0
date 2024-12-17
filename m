Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB671D79A5
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427228; cv=none; b=EiVf3zNrxN4s1u3iCTsdqL+kwhrHwAPwrzPvd/RC4nn+ViuCvLcXJXIG08sp1gAjVbk88N7UKcZdUhJc2agU3XCt1RS/p4Dwl1SaAUVyRbt+O/1ULJ+kQCRyuZ8d7cdxOZksC7DSjKTLypvBHY5QIw4J7s9iTdSacHoFbprbSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427228; c=relaxed/simple;
	bh=ngwmnM2JIc60Ij7hXLthJYUjcdTxDynLnoqt/cbDNKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDr3KIEsGOD6MWKKuGtHGV3iICup2hElq9UwnyOIXRgAXSOTRthtF6BgmTYlC7utC0PEGsisgNrJTZyVmSMVh0MxRRL20jp7AeCx8008L17iJjZu/X8u1VsYm5ke+Fy6PBmzUOZgNZPUd/U3mYZa0OfUcvCZ5Ppgt5sv3SbBsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=W0RYBVu8; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="W0RYBVu8"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0BF3A20666;
	Tue, 17 Dec 2024 10:20:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734427221;
	bh=ybEnrOBYB5FFaQJ4NUVQLZBp9KjJVhLSUoEOOK258gE=; h=From:To:Subject;
	b=W0RYBVu8Jig3TNJicdEA8JPql3AwPv6iQw22WgSI+AwVjK2LQhqHQfeqh9CV10Ng6
	 f5nwwFxdGvU7K2jUdnrg61r5KYMtrMPsJD+imWnJ7n9HyRAk56OTGLtZCaSkNS5CVW
	 RZkf2PqxtOVP5VWPtfrVbF4vg+YJfp0MkQ/IRQCiUoODB655y4J4IoMnEUVFFzPBmq
	 j99/kyAvkiEWPvB5xA9mcwO0GHMP95xrSFyjQL0n3mmMGJwBRO1DFTNYspikRxaH9V
	 7vYCdUrq6fUR9J9evV+LsmaZ5VyB4m5oMIZNqi4/pW/01FpWcc6iHH+3ePA5k+WNY4
	 L0VfiwX8tRf6A==
Date: Tue, 17 Dec 2024 10:20:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 2/2] usb: typec: tcpci: write ALERT_MASK after
 devm_request_threaded_irq()
Message-ID: <20241217092016.GA25802@francesco-nb>
References: <20241212122409.1420962-1-xu.yang_2@nxp.com>
 <20241212122409.1420962-2-xu.yang_2@nxp.com>
 <20241216185540.GA53932@francesco-nb>
 <20241217085407.myhb6tvbchvlsruj@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217085407.myhb6tvbchvlsruj@hippo>

On Tue, Dec 17, 2024 at 04:54:07PM +0800, Xu Yang wrote:
> On Mon, Dec 16, 2024 at 07:55:40PM +0100, Francesco Dolcini wrote:
> > On Thu, Dec 12, 2024 at 08:24:09PM +0800, Xu Yang wrote:
> > > With edge irq support, the ALERT event may be missed currently. The reason
> > > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > > If ALERT event happens in this time gap, it will be missed and ALERT line
> > > will not recover to high level. However, we can't meet this issue with
> > > level irq. To avoid the issue, this will add a flag set_alert_mask. So
> > > ALERT_MASK can be written after devm_request_threaded_irq() is called. The
> > > behavior of tcpm_init() keeps unchanged.
> > > 
> > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > I wonder if this should be squashed together with the first commit,
> > given you re-introduce an issue with the previous commit.
> 
> No. One patch normally should do one thing. To support edge irq, commit
> 77e85107a771 cause NULL ponter issue so path 1 fix it, it also didn't
> handle irq or alert_mask correctly, then patch 2 is needed.

Sure. And you also want your commit to be bi-sectable, your first patch
introduce a bug to fix another one, and than you fix it in the second one.

In any case, Greg will tell if he wants something different here or not.

Francesco

