Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64C5481664
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026398; cv=pass; b=fZM1MwTufAhDQVfhqSbAcVOwu9pwwTiGIVOPBLOBNI613wUZWc+g59zrW5xOG6ryfwQ6L5cFHgN50qQ7RPFllrxBkdhLv75eL55ZxrkmTEX1VxDYykBW1G3dLBOZMmh3rBGdTsnqh7bO/alWqAS0xSUP/2WwEop8aSmiSMH5enk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026398; c=relaxed/simple;
	bh=jxQWVxKxN1OM9wmfJgsxdUMXh7ls1hDMi7sURvf3ApQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cxo5QGJzu936myLaxWF17W9T5eS1j8/HnXt6bWtchI4g7kEw8OCtSZZwJMId+zvq3la5m5EgjkEK1WAQVIbGkVg44eeIJ9oG24EOcNmTy577r+9YeyfVvcJj3Mmg6qk+/RVuzi85GUX0mhRLrJj8egNd8BGV40jtcNOtoRHYZFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okrd7AAe; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okrd7AAe"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso11306680a12.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 10:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781026394; cv=none;
        d=google.com; s=arc-20240605;
        b=J8D7yfKzkv6+5erHJThk7KQoFRiWXwOA+W/7QBFidH/6W71vR0rETffhcL3ColBdb2
         nmfKVvb/yb6ElZOme2cuzLFopMWcYShjsr/EQT1n+qxn65pEaNpcYnO9L9ZC36G7jZaO
         zAwKYaqP5MA+5Vu6bj19efsCqfy6zFwkWt/4Sw1i7zm6Cd2aUt0NlObVfzR1Oq+gPByr
         AaDbos1EfhSVHe1SmAAacm1hXrDcHFCMSxBI06L1xXxSyTc/KHvsx9gQZgGKUFa5vUXo
         Tzl9jZMXS2WQYlex1av/d83Evgtdn/Ur6gEKjdqjFd+Dcn5k29N5tFrHxCEKbOe3v4/U
         YCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        fh=mQ5WpKTHDTE+HfRz2XdnZgukkslviD/fPZWn231GRH8=;
        b=gpNaKPb78Mr5AM2GWc59H69CC9I6kBYbfl+A2CdUTFGrcO9WIWUPeAABmGesSm/RAd
         wxp+++V6mAaaahd2gUV28j7q571KqyGr8ommLC6pVl65m7niQ4lva5qx2sWQQRLrC1Tq
         u311RJ0VQdEIbjr3y+lQRw4zJAxjWQUZg0ASYKfxjeYHqX9uzJJbkEWhxun4KCTQCvd9
         v11FM9cstbCVcWLkJpHRQcqJ3XmvxkJ54rTFJNLwFVul6Kpc8AwkIkJZLE4uSlp7Fi28
         GccuA5iOwbMuONp03s+E8kMwMknE1YVCJQ8zQiXZCLK7KLukWgUy9nXQueoE7N/KHrcX
         z9TA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026394; x=1781631194; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=okrd7AAeHvMiCVo7ZTIXNv6IynO6MdVAQENkVq88EWwUFqI2csc+sp89TXQ5/c8kKC
         JiePzvaEhTxecXGMb6RT5k4e+JsWBQ8JmKIplM2PNfpE9IhjnTU2hnVGpx/HuQOyR2at
         XyksYQ8C8GpPS1gThComq2ejPLyrhpof/Nt1ZgS2+0OweczeHfRYxfQN+g9plc3aELmw
         Er3iCowBsk5zN25e1HGb+mHrQYc4Xt7xs6B4p7ZBZg/RCEBdgzdhBXTDn+M6w8W2IiGe
         /TOJ/rPXjac3fxbjdvveW9EIB2FRpKh29Q8PEHPxGFYkM/TLbi3ww4V3FYR6kQ0/Lj+3
         hx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026394; x=1781631194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=p+P77szqkygDwt4rYa0ryuF9OM6X6bg1/02JYs4cqKs/0lr3DxRDr36a3hmDOyXQov
         bWPznrdKw8SFcLxFTtUXOcFzWnsO7xcdN4YDDamQ8F86GKKWtlKdZU1AUAXgoJ14y6cF
         MDacZ4PPzoiZDD2puEGZ+mDdVm0IXiVgQocWw37fBRUNz6XjVwr9+orWndYBsVpJeedX
         dOlQBKMFSpZ3W5I5oz0UohVpVqKSxv3tJ6mHTWfi+b60zJ9RmlzNsveMKp5AP/Qb5+d4
         a04I/rww53F4qMTpUOIqgnGBHit4IoYj5TNrInslH2dhfJArCUt0/aS1DfH0MFt88y0f
         RTrA==
X-Forwarded-Encrypted: i=1; AFNElJ/t2ouQu9Rpcm/qnfDm95ZFMLxhvTzdb3ODeY28C9auCLQ/+ZjV0dMWa2MWmhV6Qh4dWQg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpKyi6688GRgxTBZ/P2Y70zIyWKRFM3MbTd9uKmd18be+4B7z1
	r4o6ZUqrS+xG/Ge7dSCExi4ktE+wtbVMvejSOj/GJAJirIhydekAc3tqgsVOkw0l6km7MvTkXsz
	Ktu2LOCrxzZHwjRwE2pXc2zPJR16G5tIaI5Wbh8N0Fw==
X-Gm-Gg: Acq92OGJGMfG+icyRJ5nD6lwvCp+Li2me6zArhzkScW6IiTDWhUjLNXaLi9zCppMkDd
	l8QAdzMp6bZM4tqzomolCLzsqns9Lf+G/hG75MZpxlJ34zUqvdJ5MgCpwm6GIrK0rIKgYOyW6Rt
	/IPc5DP7tgqzdiIXqXO0UUXJeyAIFmDjkN3jIXAhmouH4TO6BGpcjIa8VpVAzBdjnTf/Bf1/VuI
	XvAjiDviVBZguhofmpOy8Khomyo4Bl9ONMmhL17dmoyvKsWmOxlOS7zWvIs3n1qh5UILe15bs86
	sv1VVc5Fl850PN6kpk0rdKTHNN47rx80sHsB9VTFb/MeDTnZzaTq
X-Received: by 2002:a05:6402:2686:b0:68c:3994:45f2 with SMTP id
 4fb4d7f45d1cf-68fa503fde8mr10046906a12.19.1781026394348; Tue, 09 Jun 2026
 10:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com> <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
In-Reply-To: <aihIIwt_9T7yYxP3@SMW015318>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 9 Jun 2026 11:33:03 -0600
X-Gm-Features: AVVi8CfajwXrk0zh9dxoFsW97FohDkxe-xDUhgkWnVGwuNvfV4UW4Y-xjQ1W9M4
Message-ID: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >
> > > The names of the carveout regions are derived using the names of the
> > > reserved memory devicetree nodes, which are referenced using the
> > > "memory-region" property. This adds a restriction on the names of said
> > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > specification's recommendation, which states that the devicetree node
> > > names should be generic.
> >
> > I don't see what is so restrictive in using the node name of the reserved-memory
> > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > will you gain with this new "memory-region-names" that can't be done with the
> > current solution?
>
> DT Binding check can't find such wrong if node name is not what expected.
> Binding can't restrict memory's node name because there ware not specific
> compatible string for it.
>

But what "wrong" could that be, and what kind of restriction are you
hoping to enforce?  What specific problem are you hoping to solve?

I'll wait to see what the DT people think about this - I personally
don't see the value in it.

> Frank
>
> >
> > >
> > > Fix this by documenting an additional, optional property:
> > > "memory-region-names". This way, the carveout names can use the values
> > > passed via "memory-region-names", while keeping the devicetree node
> > > names of the reserved memory regions generic.
> > >
> > > There are no restrictions imposed on the values of the strings passed via
> > > the new property since the software allows any name to be used, with some
> > > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > > special meaning.
> > >
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > index c18f71b64889..8e3e6676a95e 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > @@ -62,6 +62,10 @@ properties:
> > >      minItems: 1
> > >      maxItems: 32
> > >
> > > +  memory-region-names:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +
> > >    power-domains:
> > >      minItems: 2
> > >      maxItems: 8
> > > --
> > > 2.43.0
> > >
> >
