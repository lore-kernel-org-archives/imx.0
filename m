Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020807;
	b=F9HsFW/TcpX2nejiyfWQVxdocMaegb9wM3Sy4HhsbObdoDU3TnUAf8Xv9zg0FpSCHdDU
	 PncZ00fjMdbnSOX06Aop0xnD8DPI9UP89nKUjILTcL585LMWhBVZsFWv02hl8CUbENUjM
	 +s1ieMF4al9LLq8E6ENkA/K/0oFcZtAC30oBtQfTRpl6uQptNzVFlTF/CsjbUkuMwMwU1
	 ArQ5HjWIHFlxNoTX5z735ZuszTlMV1g7wkijn3VQJWva2cjPTqDFlPOmIWWUsAT0Rz2tU
	 vkEgknHdlba/oqcTfu1sJR80xCPX1UO9CfwvHczPg4D9FLOc/NrBttslXOxgVrbXH1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020807;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=;
	b=u/9iZKcNptXYgUcRgt4z/4AdkV8jKBcPxoExo0ofhvi//G5f+BwUVek/dUwnkQrcs1P5
	 FPRavCeEzftFmcuNkpzBbBGJxGy9yY1O0oG6J++G6WcqyhbF9QcY38verp1aaLO2nUOqe
	 tXoV+z+VhHJWCDRfx51xFD80Uc+w5h+riQQ5zQoIG6e/+4/AxDsH90cdbAGhdMH4D7UM0
	 prizmtR77QNQwTsSmNvMblpvm/thx9b+c9I3Na8Ddvb+ZaMG9EKzrR7Wsau19oBYIct0g
	 SjTCAIVVlW1GoNlA/2AQ6KmmWyr7WmFzquYV/0W9Y2wRJuFTT0xEOzC5OSiABQ5fvlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="D5d/Syz2";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=UEg0TeVF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.7
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267A60A2626
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3267A60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=D5d/Syz2;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=UEg0TeVF
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795020805;
	 b=vu0vwoKJxX1S3Jxr8zqKrGQN8RunCxwDp9vPR2s6citsNuKmoo+WsY/rPJ+fRrmAnp9jO2Iz8d
	  tUQYpYblEjezHp1XaAZYbH2PAvb0VwaFDZYIXFFnuQgdKkCL/Cppf6y45OgObbWjeac9B+skDJ
	  sOT0wrp4Hhq1CisZr0uELjpppHLu8J4/m4vsvtnU99eMwkvP3qQl7RD2CX7iMPYhCEO6yidOJf
	  TobS5AdcVvDYn9plgJeDQeDuTMbPWAWKldhnbqTxlS+ClGSAgC0EqLbVjlMV+nFF4p8qYjj/5r
	  mrBftx6nGG/VuEYF5IwX4GfvNJaWNSFKEZ81T81nZhyHJQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795020805;
	bh=hq59j9MIUVaImvVcxyR40iCL7QyC1S8ejdHje+eHY8Q=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=d1/jzUpsVrZMb+MLeq9BVJRgG/qrDQ/mBVvD7y04SWO5JUN0oTqzoIzqf+IeLzpsgp0xxmf7H0
	  pzXObXhJ+L0liqHt5Zgzhz7G8T2yr0x/1QkXR6DFURLqp0rBnEUGTfv8zM22EGTJ0wh9Bb4bwM
	  F6QgY5mbAJSkkb40VEwRdZcjGyW68s8hm1yF5ZZ1cxNprBvgY8uGi57Ps+/YlP5KGVjsDg4M2t
	  M/9LMB9JShZl369MIQRXNBMW5JuFURAS4MfE+RBDRZi3V3zMo8e5fQE7UjUey21uQfmzceZxEG
	  WXW6U9V4IFlrrvYQzx1BVrS5gvR/TYuEKGQ4jWmeIHN2RQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=D5d/Syz2rd/JITkbllMamJDzNO
	zL4BJiUx1fN+GufbS9f42l9mNGqy0VP9/XPNJyR1dB4RauGyinBLwoZbvh75XhofQH6Sj07EPQCMV
	PJt5vG8scin9nPzbRhSJbcP1aIuDESx2IGF+slXe2iVq16Wasom32McPe7gRsjAWMXaU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiuM-0000000HN7w-0ywz
	for imx@lists.linux.dev;
	Wed, 18 Nov 2026 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=s49vQAT48BxIZLfMkEXtnKafHZS3S30w7qy4wPSK4ME=; b=UEg0TeVF31O2xVuW3Qw4fUKuWq
	22O0c+RoE43yXb2K1fcEGcj4yLs39qyWMdbnThi3UjcTjDy9fjjzecG0xypXBoVvkqR0gQywrnrpy
	7aRCBZeCKAMrhgnP2KZqp4EmLuTXsa4adOHWK4o1SFGw482Eo5u6z+Uo4965hkzS3Fmw=;
Received: from [95.251.96.187] (port=64594 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTiu4-00000000OYn-0kDy;
	Wed, 18 Nov 2026 16:53:00 +0000
Date: Wed, 18 Nov 2026 17:52:58 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <av3XR-APUl0ENo_n@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
 <avzQI6R9LubGP7-d@bywater>
 <av3HVh5jlMsyaiq7@p14s>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av3HVh5jlMsyaiq7@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 4ee9078fbe98320d334ce8348f2c9cd4
X-AntiAbuse: ID - 4ee9078fbe98320d334ce8348f2c9cd4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTiuM-0000000HN7w-0ywz-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Wed, Nov 18, 2026 at 09:42:14AM -0600, Mathieu Poirier wrote:
> On Tue, Nov 17, 2026 at 11:18:03PM +0100, Francesco Valla wrote:
> > On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> > > On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > > > Depending on the driver originating them, data buffers used for virtio
> > > > communication can either:
> > > > 
> > > >   - already be allocated from the coherent memory area that is
> > > >     accessible by the remote processor; this is the case of
> > > >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> > > >   - be allocated from generic kmem, and thus not necessarily accessible
> > > >     directly by the remote processor.
> > > > 
> > > > In the second case, the DMA APIs can be exploited to obtain a
> > > > functional communication, since they will take care of cache maintenance
> > > > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > > > feature flag can be used for this purpose: with it set, the virtio
> > > > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > > > 
> > > > Bounce buffering will be transparently used in two cases:
> > > > 
> > > >   - if the buffer address supplied by the virtio driver is not suitable
> > > >     for DMA transfers, or
> > > >   - if the reserved memory associated to the vdev is a
> > > >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> > > >     and from this pool.
> > > > 
> > > > With this support in place, any kind of virtio device can be supported
> > > > through the remoteproc-virtio transport, at least from a data exchange
> > > > standpoint.
> > > > 
> > > > Note that remote processors behind an IOMMU need da == pa for the memory
> > > > region(s) the buffers are allocated from.
> > > 
> > > I'm not sure to understand the da == pa requirement - can you expand more on
> > > that?
> > > 
> > 
> > Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
> > it can integrate with this work is the main reason this is an RFC, as
> > stated in the cover letter, because I'm not sure I understand all of it.
> > See for example the dma-to-da conversion in [1] or the comment in [2].
> >
> 
> The remoteproc subsystem was written a _very_ long time ago and the context of
> some artefacts, such as [1] and [2], is long lost.
>  
> > That said: all the IOMMU setup that is done today by the remoteproc core
> > is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
> > device backing the virtio device). For that reason, the DMA subsystem
> > should not be able to know that setup even exists, in particular while
> > performing swiotlb operations. Hence, the requirement to have a 1:1
> > mapping between da (i.e., the address the device uses) and pa (the
> > physical memory map).
> 
> I would like to reserve the current remoteproc IOMMU design for handling legacy
> rproc-virtio devices, i.e rpmsg and serial, and only use the modern
> virtio/swiotlb API to handle authentic rproc-virtio devices.
>

Agreed. I'll come up with a proposal there. In the mean time I found a
multi-core system *with* an IOMMU that I can use for further testing in
that area.

> Based on what I see here [3], I think above sentence:
> 
> "Note that remote processors behind an IOMMU need da == pa for the memory..."
> 
> should be replaced with:
> 
> "Note that remote processors not behind an IOMMU need da == pa for the memory..."
> 
> [3]. https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L703 
> 
> > 
> > > > 
> > > > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > > > they are explicitly excluded.
> > > > 
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > > index f1b362158a9c..1496659ddff9 100644
> > > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > > >  	 * All non-remoteproc-specific virtio devices are assumed to be
> > > >  	 * compliant with virtio specifications 1.x; there is no other method
> > > >  	 * to transmit this capability from the remote processor to the host.
> > > > +	 *
> > > > +	 * Virtio devices that are specific for remoteproc usage take care on
> > > > +	 * their own to allocate memory from the device's coherent pool; use
> > > > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> > > >  	 */
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > > > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	return features;
> > > >  }
> > > > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > > >  	features = vdev->features;
> > > >  
> > > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > > > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > > > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > > >  
> > > >  	if (WARN_ON((u32)vdev->features != features))
> > > >  		return -EINVAL;
> > > > 
> > > > -- 
> > > > 2.56.0
> > > > 
> > > 
> > 
> > Thank you!
> > 
> > Reagrds,
> > Francesco
> > 
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461
> > 
>

Regards,
Francesco

