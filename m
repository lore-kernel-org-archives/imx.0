Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936688;
	b=otqi5tEOUfeYhlyph47NIjK9snOyAMbg6uKIB0KG+jL5h0wRhRxLQIpk68XLJhJK7/qp
	 bOz7ijiER6qQG14KCDg8fMWzM3PsqaUag82gmjk1SZjmYjbQEV9sNz3B6jsTwx/YSMiei
	 QrwvRry3cQwc5YF8iPBidbDQCXWDVcOKLKwKn9wAmbpT/Zikx17GLGStrgrzuIr1D6TKH
	 z/bJk2gEVcC95yLfYC4tfaMW5tYcnL4V6REPcOy81+ZngYgje3Df3YYjTzgsHENfQ2iQt
	 UzlCKrcXTEaKT+uXle+aI5iL3m0OYRKJhtoJYOl5cb4vY30+8kgLVam3NKD7vPvjJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
	b=rQC4gj4GUk3J65WmhmxkhJjNXkQ4YLNXKWAy8Rdqs7E3FqMIOoTWBTImRNvF6Q/jCB4N
	 e2QtPoA7laDMcZXvXvNsaes4GbFv2PWz3hvBnVT9Q7+sLusE177yoX3UqYH4mJFiIZiVa
	 5iWymJrqQyABNrWe2mVHpzkmmJcTO6v18wHptwBtCSWUT6GKrubT4iiPNGHn90a3RSsNh
	 HlNmIjhXNOQXvjYh2cUopONq5ytbm2lL58Mvf24TD4Sitk95p+z3tWJWkPv0jsThR4XlB
	 yXHV16fsn7vQgwV/w5aOasXRZewSNpzpWt/2C/8zK9FeDb4maIdi+cdXKsLRTzsTb/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WuyJuN+8;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEC606A332
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 17:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EEC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WuyJuN+8
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5792021a91.3
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794936687; x=1795541487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=WuyJuN+8wI++wNqP+Hkl1fKK78QLPmpDOAdS4mLLV/HQUqp1vJVtuPl8pF3ncCzUPe
         5AtKPryGOKCQBa/7KXxcDJtFbO0sCk+W2oQdfSOHGowjDL7h9fW6p+rWbpqCn3puP4iy
         bS4BnC2wZmHOmGbdVx/BpkVF1Shlj+itdsDNVlGp46Ilb1zzopRdeunvFkyEb/08u08O
         JFl5m16HsWOuaJIAy7Yz04OPTB5TFoZqkyA3tcgsj0mOcqzjvtYci9m4nflPAhB0Neom
         5TElysmjIoTNmZ9SkRzoqDw7SOeogU/1eSr0SNJxDs9QM5qG5ODgqcfW/zmke/QyVfJD
         ruiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936687; x=1795541487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=HoflucKlitoPwn40HC9MLBBUVncFPJljUakPYUNx2o2/H6sgmnbcPnBvn+Sx1+NI9H
         6MKJgdSJjV5bDRnEAmD8V6UIopc6kUjv4uuV1V0s+Tvpa6P1+O+R7xjMd37hGjnHhIL5
         AkxJBZKd9LTTExL5inKXOxS/Groqe8lfGEcA8bOWnjt54gUkMX/fYKuZdK9hCGPKi23M
         nLqMH6UDwP93BU8AJP5Yy7xjALpz5Mj81GU4uDYx+fnJ2l7WO75dHX6ZxjKq/2M00U1B
         /Sdul8RYjrRNwLJfkh3Ie0svxc/XAYbsaVw02Y2YPzGaMii2H/j468cGBpXIvJ1RZfrK
         1z8g==
X-Forwarded-Encrypted: i=1; AL+hErGleGXsIVTUjWL+fKlx9dZG1izoo3Q5w12hTjCglv2+bhA7N24/gPEVC0bOAXFy8rAnXps=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jWIHJZNg5K3yNj/LOd28WEYgtO5GE3IQ5Qo7uSw2SM+xVds5Q
	kn30axygCxZRsXn7FNktwvuB6vu3spG4XO1FcxvW866WgG2Tztk/GPmrDPzRr+ntoIU=
X-Gm-Gg: AZFdTZc51wTMTGQShE3dCd4T8nghEcNLxgKYnzVQuama5II8YMYuKdB19Hwik9k93Ps
	kcVldn9ydYOj2Nque3TB8RderjLOZp4rro2YKJ/yDY2u2PbT1fTQ0jO0ZaV/7UXrlPo5hFGoCPo
	zxu+SNiQbTZ2cgJD3TfhjJ2NIMeiIE1zDOLHuyfOhcua8ZBCoO/SZu8pMO54kCgunsUaa4VtpgZ
	uVZKW93gzVblr6Ljb0zmxLYEF5bd3ebt6tvNmLyn4rMZa3bkc/bThlJF2CIr2qRg4We1dPD+cd3
	ZRv81xzhIcH37NnkqZXZ2V7T4y5ECniI8ZSzWlKENH5egkC82UQWWbKXezruC/9/2U27uUtpzMP
	82BWROpJmsiZ5FQOIfRoXGWH9xbt3WBpq2jvx3GQyXqChQJo+yPIWZbKo54GWC6hl0S9udqZI/J
	ntqiirAfpGFfL33dXVYgAktWAs/TabYHQ+BA4r4G8l8IUuWl/+JjltXs2CZouyEAajDqVvLGeab
	5WL3hnzFvHvVfnCsrM/bnVyNEiJ/l7uDEteqdyjZHfsnZzd4jgUM/drticODhgTQ/IBYgA8ZZ+3
	DBIiLclHZeHNRJu4nF4CqAyA/SykrxuEOmvP+JDHX8hvZUTTB0k+ag==
X-Received: by 2002:a17:90b:3892:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b3d07becb8mr123850a91.29.1794936686801;
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm4936578a91.14.2026.11.17.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Date: Tue, 17 Nov 2026 11:31:23 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avyPa5rSx9rhf9yO@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> Expand the section on virtio support over remoteproc with details on
> memory allocation setup and constraints.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index c117b060e76c..4b42ed582fb4 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
>  of any type (a single remote processor can also easily support several
>  rpmsg virtio devices this way, if desired).
>  
> +Memory carveouts
> +----------------
> +
> +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> +the resource table, the remoteproc framework will search for memory carveouts
> +for:
> +
> +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> +
> +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> +resources inside the resource table and/or supplied by the remoteproc driver
> +and will be indexed by their name.

The remoteproce driver doesn't supply carvouts, it gets them from the device
tree.

> +If a carveout with the same name is provided through both means, the one
> +supplied by the remote processor should be marked as dynamically allocable,
> +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> +

Right, as per my comment in the previous patch, carveouts at the virtio level
should be distinct from those declared at the remote processor level.  Hopefully
this will keep the remoteproc core simple and make it easy to differentiate
between code paths that handle legacy and authentic rproc-virtio devices.

> +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> +either from the first ``restricted-dma-pool`` region associated to the virtio
> +device's parent (i.e., the remote processor device), if present, or the global
> +DMA pool.
> +
> +.. WARNING::
> +
> +    This fallback mechanism can result in a vring being allocated using a
> +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> +    memory regions should be specified inside the virtio device's devicetree
> +    nodes and not attached to the parent remote processor.
> +
> +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> +use the memory region declared by the virtio device's own devicetree node (see
> +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> +Otherwise, it will try to replace it with the first memory region (of any type)
> +associated to the virtio device's parent (i.e., the remote processor device);
> +if no such memory region is present, it will be replaced with the global DMA
> +pool.
> +
> +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> +device's devicetree node are present, the carveout takes precedence and the
> +memory region is ignored.
> +
> +Declaring the memory region inside the virtio device's devicetree node is the
> +preferred method for ``restricted-dma-pool`` regions, since listing them among
> +the memory regions of the remote processor device would make the first of them
> +the (forced) bounce buffer for the remote processor device itself as well.
> +
> +Buffer allocation
> +-----------------
> +
> +There are different kinds of buffer allocation scenarios:
> +
> +* if the remote processor can access the whole DMA memory area of the host, no
> +  special arrangement needs to be performed, since either the drivers (in case
> +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> +  virtio device type) will take care of any necessary translation;
> +* if the remote processor has limited access to the host memory space, for
> +  example because of a different addressing scheme or for memory isolation
> +  constraints, the memory reserved for buffer allocation shall be selected
> +  depending on the virtio device type:
> +
> +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> +    should be preferred, since it allows zero-copy message transmission between
> +    the host and the remote processor;
> +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> +    such devices need bounce buffering to work correctly.
> +
> +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> +virtio device. The virtio device inherits the DMA mask and the DMA range map
> +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> +the remote processor device, and is never attached to an IOMMU: these DMA
> +addresses are therefore host physical addresses, translated only through the
> +DMA range map. The remote processor must be able to access the buffers at
> +these addresses.
> +
> +.. WARNING::
> +
> +    For remote processors that access memory through an IOMMU managed by the
> +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> +    of the resource table, at the device addresses they specify; no mapping is
> +    created for the buffers of the virtio devices. Such remote processors are
> +    supported only if all the memory that can hold virtio buffers (e.g., the
> +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> +    with its device address equal to its physical address, for example through
> +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> +    translation applied by the remote processor that is not described by the
> +    DMA range map of the remote processor device.
> +
> +Allocation of virtio devices
> +----------------------------
> +
>  Of course, RSC_VDEV resource entries are only good enough for static
>  allocation of virtio devices. Dynamic allocations will also be made possible
>  using the rpmsg bus (similar to how we already do dynamic allocations of
> -rpmsg channels; read more about it in rpmsg.txt).
> +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> 
> -- 
> 2.56.0
> 
