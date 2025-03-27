Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA11AAA1C
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 04:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743049959; cv=none; b=NZUTS6V+p4Tp27YuoBmnTATRTFfKlfLPoMYyug6IOJOTUdjLyRoJg+80s8DJwmTz8SVHVvav0uWiDNdWY4XG5cEO8Os4ql2WRTDkqRctKq7HV2bocNMm/NSSyePpqaBebMMQxhglr+QvZkcseOIaKiuHWuWKjYN5Y6wWaEc3ZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743049959; c=relaxed/simple;
	bh=vkEar+Bp4mb9U1ErBYXk0ufSXnmYuVhKsrxGSFbrQIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0ed8hmUBx6B/SKpAvZmG+fMEWDXh8OzhAMG/YrhvpkTXC+qRKmCQAORA3XRGj3N1fs91tG0+iI7ngTsghWMirX/2/MlpcBZzKjdTQNkRjXdN7ir3aS7pHeWDFIwNesjyL4TeZPKrNd8cmxyvyUDRvm/LIeJt6x165Qy3YYbWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unNIypE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unNIypE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D3DC4CEEE
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 04:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743049959;
	bh=vkEar+Bp4mb9U1ErBYXk0ufSXnmYuVhKsrxGSFbrQIw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=unNIypE6iqy+ubI9Ya0D9eLbo1mZTw8lYFUzFDiY6evS7og0p4YWv4/xQF6JIcNKV
	 YZB63Um3ZTLhNx+F/QjCA/RcFQUdswqcOgW4MI0XYIFtTW/acH28hsIN+3vaKBRn/N
	 UkuhOEEMuWvKiv4GKpFyISlTuC0LGi5hrfsnNPx9Ipgc34LTgE8JtDHA4/zDm8xTbX
	 JCwg8erYxa5hyVRgWVyKGKFpQ7kVMdFr3OVnqCzlqPQocJKkRmfm5qanKxYhrUJ5u+
	 IEfNN9iS/upvnkhwdE79CPUUdSbrnJ4bY5DF0cnkr4EUIIubwzdayLNmo325buQEYb
	 OvNcKRN0DdlcA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c2d427194so6188161fa.0
        for <imx@lists.linux.dev>; Wed, 26 Mar 2025 21:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVu7jtrbvvec3Ij6FI0av4GhQKKFizGefTFVl/0fMZ+3EaxBPlfj6viGLTxyJXmfD2HH7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyRv0hWS6wL4JiFA2r/o+4062Pg0vSoljCEF8Sf/BgU0cIYnrq
	mUvBavfP0uwIJVkMgJyDR1C9QjL3mRCd0aWeih7cy4UsTbGuWCZ7X3bJsNd0hVnKaQONgTypJBa
	xqmucoLBBgAwXtkrEHttf9RZM4ME=
X-Google-Smtp-Source: AGHT+IF6fAB138KxHWy/pT7d/+7sa0DqbsRN8WZ3PB5VKFSTgeIGYi9SJIdz25/4ZRPKiUb58v/Gi3ZiI0Z3sR4FiZc=
X-Received: by 2002:a05:651c:1a0b:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-30dc5e31b95mr9042391fa.15.1743049957271; Wed, 26 Mar 2025
 21:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com> <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 27 Mar 2025 12:32:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqdFE0VpmnOb9GgVtgJfb7ntGDb2tyu8gNbju_XzgxeziYqnhZQK0zKPKw
Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:53=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Mar 26, 2025 at 1:44=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > Hi,
> >
> > On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> > >
> > > Simplify of_dma_set_restricted_buffer() by using of_property_present(=
)
> > > and of_for_each_phandle() iterator.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  drivers/of/device.c | 34 +++++++++++++---------------------
> > >  1 file changed, 13 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > > index edf3be197265..bb4a47d58249 100644
> > > --- a/drivers/of/device.c
> > > +++ b/drivers/of/device.c
> > > @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
> > >  static void
> > >  of_dma_set_restricted_buffer(struct device *dev, struct device_node =
*np)
> > >  {
> > > -       struct device_node *node, *of_node =3D dev->of_node;
> > > -       int count, i;
> > > +       struct device_node *of_node =3D dev->of_node;
> > > +       struct of_phandle_iterator it;
> > > +       int rc, i =3D 0;
> > >
> > >         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> > >                 return;
> > >
> > > -       count =3D of_property_count_elems_of_size(of_node, "memory-re=
gion",
> > > -                                               sizeof(u32));
> > >         /*
> > >          * If dev->of_node doesn't exist or doesn't contain memory-re=
gion, try
> > >          * the OF node having DMA configuration.
> > >          */
> > > -       if (count <=3D 0) {
> > > +       if (!of_property_present(of_node, "memory-region"))
> > >                 of_node =3D np;
> > > -               count =3D of_property_count_elems_of_size(
> > > -                       of_node, "memory-region", sizeof(u32));
> > > -       }
> > >
> > > -       for (i =3D 0; i < count; i++) {
> > > -               node =3D of_parse_phandle(of_node, "memory-region", i=
);
> > > +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, =
0) {
> > >                 /*
> > >                  * There might be multiple memory regions, but only o=
ne
> > >                  * restricted-dma-pool region is allowed.
> > >                  */
> > > -               if (of_device_is_compatible(node, "restricted-dma-poo=
l") &&
> > > -                   of_device_is_available(node)) {
> > > -                       of_node_put(node);
> > > -                       break;
> > > +               if (of_device_is_compatible(it.node, "restricted-dma-=
pool") &&
> > > +                   of_device_is_available(it.node)) {
> > > +                       if (!of_reserved_mem_device_init_by_idx(dev, =
of_node, i)) {
> > > +                               of_node_put(it.node);
> > > +                               return;
> > > +                       }
> > >                 }
> > > -               of_node_put(node);
> > > +               i++;
> > >         }
> > >
> > > -       /*
> > > -        * Attempt to initialize a restricted-dma-pool region if one =
was found.
> > > -        * Note that count can hold a negative error code.
> > > -        */
> > > -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_n=
ode, i))
> > > -               dev_warn(dev, "failed to initialise \"restricted-dma-=
pool\" memory node\n");
> > > +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" m=
emory node\n");
> >
> > This changes the behavior. Before this patch, it was:
> >
> >     if a restricted dma pool was found, but initializing it failed, pri=
nt
> >     a warning.
> >
> > Whereas now it has become:
> >
> >      print a warning unless a restricted dma pool was found and success=
fully
> >      initialized.
> >
> > This change causes the kernel to print out the warning for devices that
> > don't even do DMA:
>
> Thanks. I fixed it up to only warn if i is non-zero.

Not sure if that matches the old behavior though? A node could have
memory-regions for shared dma pools but not restricted dma pools,
and i would be non-zero.

IMO the warning should be in the "else" branch of

    if (!of_reserved_mem_device_init_by_idx(dev, of_node, i))


ChenYu
