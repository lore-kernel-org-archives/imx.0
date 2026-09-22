Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A773C454F
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089812; cv=none; b=AhpponEUyH1HK6M4oRegRZPbL4AHMFptJk92RE7KsP6XoDdtevxEaMSiUEqcWiy2hE1Ipq/xk9xCZOH5Z3i3TLC8VThO1WpWhpJEO3m6BZv4iz0dR0uXqJ9BHCwNOTVkGIUcPx0KnAQP9xrHWXWR/rciJgVK0zA7nwt5bzBaBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089812; c=relaxed/simple;
	bh=eZvJzrFV596OF1br1NU0yVbzXelFlV68AjwAwCh1swg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heyjGHD4gl4kNwbZMNDdwwEM5O1CcnO1c4WYsKhc9yo5fKNyOho37yDKBMHBxpoiH9ODppFODmEjBh98Kg+Er9woB9FkE8jRoIxVszQQkTeB0tbPv7HaYJMjdEsCEjQxBqyIsUbrpHvj8B9V+ZJwczNaUMwOSGSr6LiRXm7bpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KU0SFQVg; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KU0SFQVg"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso34102055ad.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790089809; x=1790694609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=KU0SFQVgATLuM4RnGiqUMwRzSNebzeFZP12AonvKYPJW1xt7JkujYKCD1JH4REdd+z
         soYUndyLvkFcGabgSgloLo5UYoKfGUm2jX9uraleaw26N0FTaPW0aofNg1zfE+7W4n7C
         zFq5MWD0XId3DIkSwBBor2Nq4KTjoPdToa+EmX/vk6ufg6K4n3Tea6EpeY+AgAAC7F4q
         MkH/nXD93z3OU5wCXfKmNDdDVVuT/LQ8nlpivszqpNfOnwMin/vTwBrSpS3I4Me03mma
         AjuMfHXzxH6nQGWsZwPvFxSYvdMRdkT49syeVp6LbozcJUSAZaCC8X6dwi0gFdgJqRyD
         buQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089809; x=1790694609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEUSfYy3fMUXK5aMDHvOLpQjElNKnWNceOG4CaIeRdw=;
        b=GNLIVyPLvPfHSS6iXeMH4GfHLE1cO3FEkfwwQcNDfpTEx/v8mLcRq+rcF2wo8pZuSX
         8uZ4Q0NkeHjF2S9yGM5iPJMSwrI22WZWjRAjm1/doTbEUvp+eMe0qJOj2erpRjeqBPF6
         7ETc6yVjlGdknUnsJPbC4J/S/mQADdft9rhe/vBf3g7KH7IuYapu3aW1+h768P/Wljm0
         VMN8es5F+blldmQ6Z92RQo62LReRG7zFw1N9BHg/09BtQfA2EkgZenL9x+lOgRDvLx1s
         OavYf9yPCYNApVOrklP0dFH7WDRp12ajAx0OzMAUXvqK8TRVwwC1sTjzcY1ys+IQElQN
         6zcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMyWG2zShvqLiu1QG9/ApzvyluWo8zDLsVdM9UbfRi4Ufy4FfdffxeEv3eDssZaPYlhN8=@lists.linux.dev
X-Gm-Message-State: AFuF++k5LWdrCct4KFAy3vvySjOd0hT/gYg47deRbUtEuW//hwYI2rAs
	jGGsRqFDZBO8/vnZJU1FCcFTBkK2h3We3dno2f6JYM8ONzs3PSBvTfCxGH2Cx+ZCfYM=
X-Gm-Gg: AYBFou2X/9W9hgYAR9ps7Kg27BQFL6ZDAhqebOYULS4zwZc9uPlQ3CdM2AXIQuPyYll
	WdpR+IdSr0yrQFrdz1vDEqbRH56yKAs06/S2e4nM/vCFfG8L4EVPl9HgSe0IM9hVzBnFATA+b5P
	BhszOWrzzmcXY6ezCnbSSJjxcNNgTFDtQUM6zKcv3+al09ExqbfpriPTVVssWyUYbGvitWS4lUY
	PZ/Vo80wmOSviZ7GtVf25X23sS3+CV7ie4dqU4L8d2qwSt62hvyfpkPrSybE0mF+2SJ/2TSqjhX
	BVYQXj4JAJsbsvhsGOSAE6CBUPESgJ41BpuGkqMxclw04JAeMfvLHv2rI+7xiXhKN1DtEOoabd5
	4berhmeDo9gWtiOX/GtixYE4fzZDVNQEn3tF8fli4Jdv4C+L9dZQkYk5xmmrJg9M0azgcQudrZp
	abto4ehcp3p01HqBFWp8XTd2Rjn/z0Oy15fnOSPrA3XTzECXeRcdT0IdO57ZdvHjTucYBBaYbQ
X-Received: by 2002:a17:902:db0f:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2df609d1b62mr16580265ad.14.1790089809191;
        Tue, 22 Sep 2026 08:10:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0563eesm11964455ad.69.2026.09.22.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:10:08 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:10:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arKaTaFuNW936nwg@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
 <arFRqopkkJf7Nlq4@p14s>
 <arIgI4E5rGXq9H0P@bywater>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arIgI4E5rGXq9H0P@bywater>

On Tue, Sep 22, 2026 at 08:32:15AM +0200, Francesco Valla wrote:
> On Mon, Sep 21, 2026 at 09:47:54AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> > > There is currently no way to report the VIRTIO_F_VERSION_1 using the
> > > resource table alone, as the per-vdev feature array is limited to 32
> > > bits.
> > > 
> > > Considering that the VirtIO 1.0 specification is now ~10 years old,
> > > always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> > > it.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 74e0da970f1d..cfd66d9d1c9e 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  
> > >  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >  
> > > -	return rsc->dfeatures;
> > > +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > 
> > I understand this.
> > 
> > >  }
> > >  
> > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >  	/* Give virtio_rproc a chance to accept features. */
> > >  	rproc_transport_features(vdev);
> > >  
> > > -	/* Make sure we don't have any features > 32 bits! */
> > > -	BUG_ON((u32)vdev->features != vdev->features);
> > > +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > +	if (WARN_ON_ONCE((u32)vdev->features !=
> > > +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > +		return -1;
> > 
> > And this.
> > 
> > >  
> > >  	/*
> > >  	 * Remember the finalized features of our vdev, and provide it
> > >  	 * to the remote processor once it is powered on.
> > >  	 */
> > > -	rsc->gfeatures = vdev->features;
> > > +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > >  
> > 
> > But I'm having trouble with this one.  
> > 
> > First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
> > rsc->gfeatures.  Why bother with clearing bit 32?
> >
> 
> Bits > 31 gets silently dropped because rsc->gfeatures is a u32; this
> was inserted to explicitly drop the flag that has been inserted before
> and avoid the "silently". It has no real funtional impact and can be
> safely dropped.
>

We have come to the same conclusion.
 
> > >  	return 0;
> > >  }
> > > 
> > > -- 
> > > 2.55.0
> > > 
