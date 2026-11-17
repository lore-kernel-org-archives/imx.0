Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955242;
	b=kCpwNl6jEQ50cZcNr9h6lg0Ei4D79HS+a3gFhsYoFTtGLF3fqJO3fP2YCHQSZM8DgkS1
	 CdFlcNrUFVwjQmyCHV8eIqTSOR1UvJQswck3OfybLHfgqBQbC7BXzdpkhOt7L0LuiRFrm
	 MwEU8Kby9nT5nVKq5GMIcx6tlW4Mzx6TUI78V+5KBUb+MI32UMUBPojMAwbJA0b+v5GYX
	 Uq3M0kE4IVMm4OO8AhHzDB/63GzXjfF1vVXcZ1/SWuatN4oX2cRC4AJVkrSBQoDb4QvhH
	 UohKCKKzlgpgxFZZgUwElTwPKpMgseqp1bqEgJCBla52fFd6Toix1Ulixpv5Q9N39uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955242;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=;
	b=K68ng14zSbSf5QEaxDDUBCCnN+blQ3MXcoyR23m8gp6G472UaKnHyqkVKHN/LtB6obfj
	 kJB7Eky8bjnhanpVBofsysHcLPIxx3srA1uMSpChYnkIwrGl6AFtKUHEroN1Nd/PTeV+C
	 /SFFHfNGljHPAd8pk/q7gQokabzlB58fYSK2Q0Qd2u4TBBupgnYDnUXF85LgE3T6gkHQd
	 NWRrlwCELc68Bjg/3V0V1765N2Xj13Y3RCSt3bbChxeq5Q1jjg8qvAmDbXLWrq0ndwVS1
	 QXBYis+8dTAm0Ct6D/8W9dFWQBqbksYLT3mJeLz6kXsHKHQ8tGwwPvHhPu/vPHJRC5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=hRSv9jjg;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=oRU6ioQs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.12
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B4606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 22:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=hRSv9jjg;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=oRU6ioQs
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794955241;
	 b=Z8VLuvvXU/T+lU3gm2yV4p4JfxbZdsbytyPZk7nxpWbP5VPj4/AFj5JXhJTIXEccdWXTAdEl0F
	  HJWHrNz0tMRXNMYq9ReBczaz/oF4e+fsVjj/vcGnWBKu46R5UJMNY+nLsswsn8TQfd7YODwvFx
	  az+Y8K4OoGWYnw1DhmSghzaWPGmrAuE4NmJ1a8MerZlMBv6yRQsCaV7uvWTHR+snH4Hh7EkSMc
	  7CYPXBuvDIABrn6O9VaiQLiW3MXSwWR7ivOVYv7F22GOq431dgQ+pVErJj4v6VcCL5DegKgjXQ
	  oBKRpZzNQJNeChUgsLahVcgva5e+ztS/FavG5cxNc8dcZw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794955241;
	bh=Oj52gqXQzkstpHvNjVxr4EJNLgpIaRPOLoYHmJcIMiw=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=WHkt2lsl/bkHFtbp+na4c6g2oanjdAlMato4ijdmbAKgB4p9/uC+GHLPWeRJYUAFlP+7EUHIod
	  TpsiF9em+FjlqOPcTQ3ED9JzSoQm53dDwY+Rsog/EGPl0xxvBehrOJecRin1AOXDZhew1LC/U2
	  Yeb3wKd2o0JpPMAz+C/isQpjLQ8s5zPP/NQj/rCb5Tqzl+JG5ERwawVN7qG8heYxkr9nz5Kuqv
	  s3HaqYj8ZRBWYvydv10nOeVgCiRu5ODnt7q8dw8yu922OTTYHZ0S82A/2ENP0ys9LJysoEhVyk
	  KQLnae3skw9C1RbRJbvBwUHRT8QuVlQsL7I5kfsOx7HM/g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=hRSv9jjgOt1Py/f+2Fhsaa2PrZ
	0eh+Xj13/ufZLpJv1F2lN54z9koaGLHN34LKUpGl+AnR0yETcTWL73MKI6h5xqgKaCKVIfpo7HJMu
	4DWIV5L2mp4di6ny5E25uRkL8s180aIjw26jXs4fNe5E48wrmepUQ99BSdzi1Gx55cmo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqx-00000001ykM-0AmU
	for imx@lists.linux.dev;
	Tue, 17 Nov 2026 22:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=eSBePUX/8L/yuDs+AcrLFngnrbJOvj4lFPwfvEU18g0=; b=oRU6ioQsb09tiiVkx3MrYnIBqp
	t8UJEbLDV53tq0tBoKw5jtuDw1Y9IKIignXaFAR7TfjnAV6IRpNbQ+0+hcCBL5aEs8kpVIp9bkKJr
	pV9jCCh48sBuVCYYqiesYPh1UQPAiOduUQl52mpRJtqWAvymeqaOtUfpJ4KYkZqkGQeo=;
Received: from [95.251.96.187] (port=60017 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xTRqa-00000000IA1-2MtI;
	Tue, 17 Nov 2026 22:40:16 +0000
Date: Tue, 17 Nov 2026 23:40:14 +0100
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avzVSG5rvoN0Z9OF@bywater>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
 <avyPa5rSx9rhf9yO@p14s>
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
In-Reply-To: <avyPa5rSx9rhf9yO@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e4778e5b8dd8db61cda84d0dd2539baf
X-AntiAbuse: ID - e4778e5b8dd8db61cda84d0dd2539baf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xTRqx-00000001ykM-0AmU-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Tue, Nov 17, 2026 at 11:31:23AM -0600, Mathieu Poirier wrote:
> On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> > Expand the section on virtio support over remoteproc with details on
> > memory allocation setup and constraints.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 98 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> > index c117b060e76c..4b42ed582fb4 100644
> > --- a/Documentation/staging/remoteproc.rst
> > +++ b/Documentation/staging/remoteproc.rst
> > @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
> >  of any type (a single remote processor can also easily support several
> >  rpmsg virtio devices this way, if desired).
> >  
> > +Memory carveouts
> > +----------------
> > +
> > +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> > +the resource table, the remoteproc framework will search for memory carveouts
> > +for:
> > +
> > +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> > +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> > +
> > +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> > +resources inside the resource table and/or supplied by the remoteproc driver
> > +and will be indexed by their name.
> 
> The remoteproce driver doesn't supply carvouts, it gets them from the device
> tree.
>

Right. I'll rephrase this statement.

> > +If a carveout with the same name is provided through both means, the one
> > +supplied by the remote processor should be marked as dynamically allocable,
> > +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> > +
> 
> Right, as per my comment in the previous patch, carveouts at the virtio level
> should be distinct from those declared at the remote processor level.  Hopefully
> this will keep the remoteproc core simple and make it easy to differentiate
> between code paths that handle legacy and authentic rproc-virtio devices.
>

This statement is not related to carveout at virtio level - or at least
isn't in my mind, I'll try to explain a bit better.

Nowadays, even before this patch set, is possible to declare a carveout
(say: vdev0buffer) both inside the processor's resource table *and* in
devicetree. The remoteproc framework will take care to associate them,
but this will work only if the resource table uses FW_RSC_ADDR_ANY for
the da field (see [1]).

> > +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> > +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> > +either from the first ``restricted-dma-pool`` region associated to the virtio
> > +device's parent (i.e., the remote processor device), if present, or the global
> > +DMA pool.
> > +
> > +.. WARNING::
> > +
> > +    This fallback mechanism can result in a vring being allocated using a
> > +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> > +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> > +    memory regions should be specified inside the virtio device's devicetree
> > +    nodes and not attached to the parent remote processor.
> > +
> > +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> > +use the memory region declared by the virtio device's own devicetree node (see
> > +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> > +Otherwise, it will try to replace it with the first memory region (of any type)
> > +associated to the virtio device's parent (i.e., the remote processor device);
> > +if no such memory region is present, it will be replaced with the global DMA
> > +pool.
> > +
> > +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> > +device's devicetree node are present, the carveout takes precedence and the
> > +memory region is ignored.
> > +
> > +Declaring the memory region inside the virtio device's devicetree node is the
> > +preferred method for ``restricted-dma-pool`` regions, since listing them among
> > +the memory regions of the remote processor device would make the first of them
> > +the (forced) bounce buffer for the remote processor device itself as well.
> > +
> > +Buffer allocation
> > +-----------------
> > +
> > +There are different kinds of buffer allocation scenarios:
> > +
> > +* if the remote processor can access the whole DMA memory area of the host, no
> > +  special arrangement needs to be performed, since either the drivers (in case
> > +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> > +  virtio device type) will take care of any necessary translation;
> > +* if the remote processor has limited access to the host memory space, for
> > +  example because of a different addressing scheme or for memory isolation
> > +  constraints, the memory reserved for buffer allocation shall be selected
> > +  depending on the virtio device type:
> > +
> > +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> > +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> > +    should be preferred, since it allows zero-copy message transmission between
> > +    the host and the remote processor;
> > +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> > +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> > +    such devices need bounce buffering to work correctly.
> > +
> > +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> > +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> > +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> > +virtio device. The virtio device inherits the DMA mask and the DMA range map
> > +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> > +the remote processor device, and is never attached to an IOMMU: these DMA
> > +addresses are therefore host physical addresses, translated only through the
> > +DMA range map. The remote processor must be able to access the buffers at
> > +these addresses.
> > +
> > +.. WARNING::
> > +
> > +    For remote processors that access memory through an IOMMU managed by the
> > +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> > +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> > +    of the resource table, at the device addresses they specify; no mapping is
> > +    created for the buffers of the virtio devices. Such remote processors are
> > +    supported only if all the memory that can hold virtio buffers (e.g., the
> > +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> > +    with its device address equal to its physical address, for example through
> > +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> > +    translation applied by the remote processor that is not described by the
> > +    DMA range map of the remote processor device.
> > +
> > +Allocation of virtio devices
> > +----------------------------
> > +
> >  Of course, RSC_VDEV resource entries are only good enough for static
> >  allocation of virtio devices. Dynamic allocations will also be made possible
> >  using the rpmsg bus (similar to how we already do dynamic allocations of
> > -rpmsg channels; read more about it in rpmsg.txt).
> > +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> > 
> > -- 
> > 2.56.0
> > 
>

Thank you!

Regards,
Francesco

[1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L856

