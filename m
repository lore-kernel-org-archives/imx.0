Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A8D221F0D
	for <imx@lists.linux.dev>; Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742425483; cv=none; b=enQz/OLzJo7RcsygtMXtTKGnzC7zMLzJj6+Yfa/aUNo3PJr3tfAuJOP5/KXPKZPT00yY/NBqgRphSu6VvLXhNn1PaeX5mYUfCychvDqGGIgaArkhqbXKLdv7kngtJWeLww8tsM4LnQjDGPF2ZlcSVcMZG7SUlAETPxMNBNEXwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742425483; c=relaxed/simple;
	bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeoA0/KPRANp2h//RVCFN29gG8aupkoKJhRS5PUEg4+cu3tnA0M9JR7iF/OdmhKc3rN1pp4Fqd7aaZn0W7gcZHCVFmyVtOCiCeplpn1UcRZZc/IOp03I0kBVJn84G9/CQ5O4gvpKe00F22NZ0knqz7iqaiFi/S65Q/VDucWYMFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuGe+aOw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuGe+aOw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F220C4AF09
	for <imx@lists.linux.dev>; Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742425482;
	bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuGe+aOwcgf7kb6tS+eJjVfXHyx1rbvLoZ2NOaP02SzxNs47NRpR2LVVwhgwHQXBH
	 NltceS4U3rtwfOvmEq6YnwNECmBc2oMMbb9lU/j4Uom1lYzKvdw4wm1Yy6nW930eJu
	 Qj9XsiBQDeLSstZ6bM2e8hq8mcmFfI/UZ91g+PDxaY6TrX2C3SXVc/S9g9siUzR7Xm
	 hpdQQZo/klOGL1YJZWIiEqKqUyJrEUGeSc8uY7viKfW1a/4xC4CXnFy1b01yO2/l88
	 BlSp4hn6bDt5R1zh7kce8Os/lelWqy7DrU4HRFeFfXCx+Wxz9JKCbO/8BHToR3LrOm
	 gULLlNMRPLUag==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so306382a12.2
        for <imx@lists.linux.dev>; Wed, 19 Mar 2025 16:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtXuGR4lb8QQxHdf6ooio2MbpuDEy1/uu2VI6UzR3tVaZfi99Vmz7Td5Lz9gNwkL1HucU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdzqCTRaEiP9AIzqAXR7kfpB735DKHgUn8kIA1O8C2sKqMbajC
	GmENmdTjp/I/5OSbtjq/L1Aw+HO6qgUM+BS0t0RavlrDVgn+c4z9ws2M5Z5OOiDZbUSZRauH50N
	MP+AqC7ItzMxwaK/LZGIbmIIDow==
X-Google-Smtp-Source: AGHT+IH1Yrc3Y5KhcKuIDvTrQ1KQbSSjJSIP+aKUctEQfy6L4vvWLzhbwAuvXFhDZUh0Wqy+O4jXTvspjUWR7fVZh34=
X-Received: by 2002:a05:6402:d0d:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5eb9eee0416mr908900a12.1.1742425481081; Wed, 19 Mar 2025
 16:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
In-Reply-To: <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Mar 2025 18:04:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
X-Gm-Features: AQ5f1JqOv9zU_NIrquP_FiizlsCH0dJCdTrTRAoIvYNPwVPq8s6b1gdkB9PCxY8
Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > For v6.16
> >

[...]

> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm3=
2_rproc.c
> > index b02b36a3f515..9d2bd8904c49 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> > -     struct of_phandle_iterator it;
> >       struct rproc_mem_entry *mem;
> > -     struct reserved_mem *rmem;
> >       u64 da;
> > -     int index =3D 0;
> > +     int index =3D 0, mr =3D 0;
> >
> >       /* Register associated reserved memory regions */
> > -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > -             rmem =3D of_reserved_mem_lookup(it.node);
> > -             if (!rmem) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "unable to acquire memory-region\n")=
;
> > -                     return -EINVAL;
> > -             }
> > +     while (1) {
> > +             struct resource res;
> > +             int ret;
> > +
> > +             ret =3D of_reserved_mem_region_to_resource(np, mr++, &res=
);
> > +             if (ret)
> > +                     return 0;
> >
> > -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "memory region not valid %pa\n",
> > -                             &rmem->base);
> > +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
> > +                     dev_err(dev, "memory region not valid %pR\n", &re=
s);
> >                       return -EINVAL;
> >               }
> >
> >               /*  No need to map vdev buffer */
> > -             if (strcmp(it.node->name, "vdev0buffer")) {
> > +             if (strcmp(res.name, "vdev0buffer")) {
>
> I tested your patches

Thank you.

> The update introduces a regression here. The strcmp function never return=
s 0.
> Indeed, it.node->name stores the memory region label "vdev0buffer," while
> res.name stores the memory region name "vdev0buffer@10042000."
>
> Several remoteproc drivers may face the same issue as they embed similar =
code.

Indeed. I confused myself because node 'name' is without the
unit-address, but this is using the full name. I've replaced the
strcmp's with strstarts() to address this. I've updated my branch with
the changes.

Rob
