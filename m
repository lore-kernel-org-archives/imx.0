Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1B1DDFE
	for <imx@lists.linux.dev>; Wed,  7 Oct 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334327; cv=pass; b=WWpwS9LMPtJ0oJodKlVt/r6SKxzKr3YvvV3QWnIdlPCi0UGIMN5B930IiDibtphleHWtiT4/gtOWIDomqSO1FyHkbFsj94JnApD25J76TgRo3fEKuB65XBl1nnwrjbJGDzsofeuCgF+Uw+eyO0RwbIK+DY/e3zi62a2+VsWFSg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334327; c=relaxed/simple;
	bh=BX1JTxbJEXnqNqVkUffmNNj1V50eTcs9S7BDpSMKKPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwtRJRPTFkVTEUbC3VXvvympmIwzPfS6WdyH5KdNDrJC2wQ9WTWBH6l+DTcBwn7maMnRkhYdEq+VVZAvCAQE0ogWoNJ01YnD3MrKH4kve/742K6/Ppl31HDbdjToHlD7h7xocq/sNOmphjajAaWftC5JIMx9hbJGhPF7b2FiCuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CIknHIIe; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CIknHIIe"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afe29c08ccso1582958a12.1
        for <imx@lists.linux.dev>; Tue, 06 Oct 2026 17:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334324; cv=none;
        d=google.com; s=arc-20260327;
        b=bgBPBW7OAt95vTOaUll+BlP0oAf3wTIb9ePCTmRIwKDqMiBtg+migkQcCd2b8cy4UQ
         /cR17HJmFKarJWNTDsevk0pLsXcq6XOSOSVwFdjOk0eqqxG+ZB4IYnt2HZUGERdcN7uw
         kRXmJNzH24wRlbieUep6AyYOlIFAzQOSqIFI8CFlhZyeKkQzqZKGK0JZwz2tipYBhobU
         qx4fx0SzwiAv4D8FnsHI5O2uAwM3dDp/UwDcDqC5BpVLgTTC2IWWaxn/07iovOjMfBEb
         bYr7SSqoSvvydN+Ig2MKf9rQpqWR6SmNw+iXPaUIGhXaXRty5EiKFkuVu8XElQXlI6HS
         wZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        fh=HmUqZxuLA32h0yEw1bzqgT7yMzbxD1uYv10XpAWNOQw=;
        b=VB5tnIDZn/20UnPldd8k74H3kR6E04FfqIGxRUxJx0g/i3OCvbkfhIRiWMl6h0iga2
         /DOJVGb/hIQqyO9RHPUs/V5rTjVJFlXDVULLLUQ/PSL18IyLDa381c3hecjfeYoPQK+x
         fA5Y5ahKg4x4M1X0h9+Jc0LCI88pUzDBCh3ohw78EXVuQmE/i8zWhVvgolHooWJlmM+s
         10b5vptLg299YrBB+pUx/rfP3lo5+ZJ0FFldrmsm1MtiRbGLZ23vp7TMJaNyinxrKHXN
         T0HKgYUfEm2+NfdsAzcus3wMAhDVGgrjnruEgihw0mF23HG7DKX4kM5FJI/7oWWgjveH
         1oKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334324; x=1791939124; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=CIknHIIe5anjI2aJpcZ09YQgbN/KvyH3x2Fxi2VVp+n7Vn48YpRgCaEm/4gT/nYS1b
         OA5Q+A4mSiayXAkS3FtjIn0vdyWmUfTnOUqMNA4SAFeFybi9J0zfVUl+PS4aB2WNSGrJ
         ns/Ozf73EneaDthE1l0ugfm924W4OFm/gXJuLg8RJqdCgZqRlbEW/rKZnTBkz9mqelmE
         Zm9kiSbJlv7myQnPhmb96PQAbAPIFrTju6LACsEq6Dy7aUVdPuRjZ6HxdBxh7qP8hBQU
         hpPnLFSpIS/Xv0B9552+VEQ1BjRmqgafYUNXUPICFz+Q+V4Q0ZgUv6ODGwVFNUbarYYm
         5yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334324; x=1791939124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=aSa9zLPI2siYs3898eGJ3l/ZxTNitAlERhebL16LQf786ooEWgfGXn3s6MXt9LO1wb
         ZTTcvYGTSA5l3cT1EuU3Ep+orN0qP0wJaYC34zqSW2fl3V5w9Ls89FzlQu2aDPpvDC6a
         RtdbweXR66ASMmETpMu7NTQcUXd3im1PeoSIbldwV+9gFLQ2MgFxudNXGvFFr89iqwmi
         j+0DYmIQME4+jWm7BraJAhWkZikR490sYyD4A/dFr9dgY8s8Itfai/NC7hbNo13JHTd3
         SmQV2PDO95gVBX9eA1AJZ87Iwf8Sd7BJBxTrzMOYpoSrRZn4tNImbdzn1OCLeM2YH55D
         gnwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIEJhy7ODBI/s0uTJG0/XMfVV/TZAyA4DV5c/fAZ6UbMBRmpbuuJr6n5VGieElSpLkk3A=@lists.linux.dev
X-Gm-Message-State: AFq9FYIsoxKHz/kjf34wgftUIZfI43iMKnq6dSj3gTTEBiH3jJMzWqGi
	wSmIxthp0ROf5YajblFEtLhsnYQCbH+N9uZEgqK4pguYpnpHsf3NZDASyg4sQ2YtvOrpWSL/D14
	q/Lnwon0Bg+7rCIOzGwTAYOUianGstWoLSLZV9GaP/Q==
X-Gm-Gg: AYBFou36p9Bsjn9QAmuL9iFjEeM/OqsqXID2LG5Iu4K2NaPcX/c8W0TuZZUyT+laHRm
	8ubhCozYuIpxyce4OE6I5xYZCGM5aj8E5D4k5ldRBGe58xIzhUyyB6ejtY1GrsHDhO9IEou+nVw
	6owOByQ3bI6yEftedur1q1cCUCWobxfmeT9PtWf9IoB44SFowO8Fx0xYXYXpsDu3EDGW54yyzgR
	eycpZThKwThkgIcUfZ2m2jsdpPrh8cljbK4JVvitIYjMNrhB3uvpt1VPnpVsTCLVsyDU0xXy98L
	T2Q1EDrfsGm5J2E6zyZlLau4dUooQSnWfE8o/AX4qdv755V4Z8VS7g==
X-Received: by 2002:a05:6402:455a:b0:6ac:73f8:2e50 with SMTP id
 4fb4d7f45d1cf-6aff29b8a9dmr558035a12.43.1791334323774; Tue, 06 Oct 2026
 17:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater> <20261006183910.GA2890477-robh@kernel.org>
In-Reply-To: <20261006183910.GA2890477-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 18:51:52 -0600
X-Gm-Features: AclHuK8OpBmmKBzqQvP8CWwB7vUNA7khdkA2Xv5tnX4fcSWpzyBVTx2EHup08IU
Message-ID: <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Rob Herring <robh@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > these are discovered through a resource table parsed by the remoteproc
> > > > infrastructure at runtime, their description can be needed to probe
> > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > >
> > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > a virtio-device node, which binding is already existent and used by
> > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > using its index inside the resource table as the reg property of the
> > > > node; this permits to have multiple instances of the same type of
> > > > device.
> > > >
> > > > The binding is intended to be generic and adopted by any remoteproc
> > > > provider.
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..c4a0d84b1460
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Virtio devices over remoteproc
> > > > +
> > > > +description: |
> > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > +  providers.
> > > > +
> > > > +maintainers:
> > > > +  - Francesco Valla <francesco@valla.it>
> > > > +
> > > > +properties:
> > > > +  virtio:
> > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      "^vdev@[0-9a-f]+$":
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: Virtio device index inside the resource table.
>

There are 2 configurations we need to account for: (1) each device
located behind the remote processor gets its own set of virtqueues and
adheres to the virtio specifications.  This is the configuration
targeted by this thread.  The other configuration (2), discussed in
the other thread, involves virtio piggy-backed over RPMSG.  The hope
is to represent both configurations using the same bindings.  For (1),
virtio devices will be advertised in the resource table and for (2),
virtio devices will be announced via the existing remoteproc namespace
service.

> Who/what defines the resource table?

The resource table is part of the firmware image and is parsed by the
remoteproc core.  For (1), as presented in this set, "reg" links the
entry in the resource table with the device definition in the DT.  For
(2), the definition is also a device index, but said index is
communicated to the remoteproc core using a namespace announcement
rather than the resource table.

I hope to establish bindings for configuration (1) and merge that work
first.  Once that is done we can extend it to cover (2).

>
> > > > +            maxItems: 1
> > > > +
> > > > +        additionalProperties:
> > > > +          type: object
> > > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > > +          maxItems: 1
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +
> > > > +    additionalProperties: false
>
> Preferred to put this before 'properties' in the indented cases. Easier
> to see what level it belongs to.
>
> > > > +
> > > > +    required:
> > > > +      - '#address-cells'
> > > > +      - '#size-cells'
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    remoteproc-cm33 {
> > > > +      virtio {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          vdev@0 {
> > > > +              reg = <0>;
> > > > +
> > >
> > > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > > provide their input on this.
> > >
> >
> > AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> > child nodes using the 'reg' property, not the node name. This I believe
> > is the preferred way of doing things.
>
> It is either both unit-address and reg or neither. It's preferred to
> have them unless you are just making up numbers.
>
> Rob
