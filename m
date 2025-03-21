Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D053322AE76
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742562898; cv=none; b=k2d7aQVju0T8Y808OaG8CyXQtc+VHj5JWvJ2KW0LOYR5o/OTLESG892c27wKkLrsM0UKuE5Aa1S0mM/nYzONUFzsdYmU7KIhZHnSomaBnGY0AKdYpH+T0A5GpgOpKDK1lNgbUvF1plo71idfJf7kmbLHVZ4vwxyTNP4Vr1YxfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742562898; c=relaxed/simple;
	bh=yQTzME/6PP1TPK2T8WEG3txl4TCZUlsCKhod5W9SwfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpq6bMwMQUzXVQQYzQOcSDjK2BAF0l/7YD5SCefDfPHPo2FM3Z8mrJ/kPfOIEXNAJF0S0F/GavSuNECzP1CMuwgdE+CoD626e/aYFz+cFnX7yNoUpLvlIliyZbAy0lh5Orkg6enDIrTxM+4f3Ypu136PJ6DAKbSwbEuHrFzZSeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/KAHkSy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/KAHkSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50228C4CEEC
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742562898;
	bh=yQTzME/6PP1TPK2T8WEG3txl4TCZUlsCKhod5W9SwfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F/KAHkSyYmfJOv/5FAv2z07LjM0mutjOxjLltd0/jQVYeEVaqUdPAPfK78OKA4Ymr
	 pLf6gi5C5bxtakc6rutk2Od5FrqPTJEH2Ptbrbcc/qlzcBLHmESzUohhrNhe3RY6a2
	 xLWK7adhpoEBLDSYMgFqdNPYgWaItn+OMTmFginUrrKOs5KFMaUpEF2El4ciFx+gsH
	 W6CXmYmNIQVZR3dpJx+5GmlFmpm5GruBqwCBFhhfn5R7A+amiVHIwcDhNHffwZqxmf
	 mnt67zM9LvEXc/PaTQTiHe3DXmMaMULycJPjbviQlLhRgu832JVpqWpyys8cpNviTM
	 dUalSjf/sSkxQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so3188162a12.2
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVeWG/aB3GqUYzP/XlAi2YX2mQlODI7Jewi5m+WyBvQeo4gPmVXr1f6eDHScAUZLywhuA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/gtXQabLorc34Q4W1ShArjGMF10c0kT5q4GlVOy0PZHPyG2S8
	4RPRycCjc7dws3Lm8OCRVjk6sHn5eMpUZbMUyOh7KTeJyva2HJpw7TbyxlZgOz2JCCYXe+C7HLm
	0mxZqFawdV2pwhzSkLQJ8x5G3Cg==
X-Google-Smtp-Source: AGHT+IFKb3vaGpKb9OXSdeAes78/CEmG5k6oY1UfVro8GO1khGigitTlcZdAN7kLobo/GTF9XcNCydapHxU16QMQNfg=
X-Received: by 2002:a05:6402:440a:b0:5e5:437c:1daf with SMTP id
 4fb4d7f45d1cf-5ebcd468e6fmr2817130a12.16.1742562896829; Fri, 21 Mar 2025
 06:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com> <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com> <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
 <4eddc37b-5164-453a-9b7f-c4331a7d6243@foss.st.com>
In-Reply-To: <4eddc37b-5164-453a-9b7f-c4331a7d6243@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 21 Mar 2025 08:14:44 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pNGObRJs9tFgHQbC8kCVm=myt+syQSLJVaO8D2GWHCQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoxWG99z-onx2wJCY2-zhJYXWv3cM0qorkPtzMXdYEUScnMR6DharJJMwg
Message-ID: <CAL_Jsq+pNGObRJs9tFgHQbC8kCVm=myt+syQSLJVaO8D2GWHCQ@mail.gmail.com>
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

On Fri, Mar 21, 2025 at 3:25=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 3/20/25 19:02, Rob Herring wrote:
> > On Thu, Mar 20, 2025 at 4:23=E2=80=AFAM Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >>
> >>
> >> On 3/20/25 00:04, Rob Herring wrote:
> >>> On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
> >>> <arnaud.pouliquen@foss.st.com> wrote:
> >>>>
> >>>> Hello Rob,
> >>>>
> >>>> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> >>>>> Use the newly added of_reserved_mem_region_to_resource() and
> >>>>> of_reserved_mem_region_count() functions to handle "memory-region"
> >>>>> properties.
> >>>>>
> >>>>> The error handling is a bit different in some cases. Often
> >>>>> "memory-region" is optional, so failed lookup is not an error. But =
then
> >>>>> an error in of_reserved_mem_lookup() is treated as an error. Howeve=
r,
> >>>>> that distinction is not really important. Either the region is avai=
lable
> >>>>> and usable or it is not. So now, it is just
> >>>>> of_reserved_mem_region_to_resource() which is checked for an error.
> >>>>>
> >>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>>>> ---
> >>>>> For v6.16
> >>>>>
> >>>
> >>> [...]
> >>>
> >>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/=
stm32_rproc.c
> >>>>> index b02b36a3f515..9d2bd8904c49 100644
> >>>>> --- a/drivers/remoteproc/stm32_rproc.c
> >>>>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>>>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *=
rproc)
> >>>>>  {
> >>>>>       struct device *dev =3D rproc->dev.parent;
> >>>>>       struct device_node *np =3D dev->of_node;
> >>>>> -     struct of_phandle_iterator it;
> >>>>>       struct rproc_mem_entry *mem;
> >>>>> -     struct reserved_mem *rmem;
> >>>>>       u64 da;
> >>>>> -     int index =3D 0;
> >>>>> +     int index =3D 0, mr =3D 0;
> >>>>>
> >>>>>       /* Register associated reserved memory regions */
> >>>>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> >>>>> -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> >>>>> -             rmem =3D of_reserved_mem_lookup(it.node);
> >>>>> -             if (!rmem) {
> >>>>> -                     of_node_put(it.node);
> >>>>> -                     dev_err(dev, "unable to acquire memory-region=
\n");
> >>>>> -                     return -EINVAL;
> >>>>> -             }
> >>>>> +     while (1) {
> >>>>> +             struct resource res;
> >>>>> +             int ret;
> >>>>> +
> >>>>> +             ret =3D of_reserved_mem_region_to_resource(np, mr++, =
&res);
> >>>>> +             if (ret)
> >>>>> +                     return 0;
> >>>>>
> >>>>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0)=
 {
> >>>>> -                     of_node_put(it.node);
> >>>>> -                     dev_err(dev, "memory region not valid %pa\n",
> >>>>> -                             &rmem->base);
> >>>>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) =
{
> >>>>> +                     dev_err(dev, "memory region not valid %pR\n",=
 &res);
> >>>>>                       return -EINVAL;
> >>>>>               }
> >>>>>
> >>>>>               /*  No need to map vdev buffer */
> >>>>> -             if (strcmp(it.node->name, "vdev0buffer")) {
> >>>>> +             if (strcmp(res.name, "vdev0buffer")) {
> >>>>
> >>>> I tested your patches
> >>>
> >>> Thank you.
> >>>
> >>>> The update introduces a regression here. The strcmp function never r=
eturns 0.
> >>>> Indeed, it.node->name stores the memory region label "vdev0buffer," =
while
> >>>> res.name stores the memory region name "vdev0buffer@10042000."
> >>>>
> >>>> Several remoteproc drivers may face the same issue as they embed sim=
ilar code.
> >>>
> >>> Indeed. I confused myself because node 'name' is without the
> >>> unit-address, but this is using the full name. I've replaced the
> >>> strcmp's with strstarts() to address this. I've updated my branch wit=
h
> >>> the changes.
> >>
> >> This is not enough as the remoteproc core function rproc_find_carveout=
_by_name()
> >> also compares the memory names. With the following additional fix, it =
is working
> >> on my STM32MP15-DK board.
> >>
> >> @@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc,=
 const
> >> char *name, ...)
> >>         vsnprintf(_name, sizeof(_name), name, args);
> >>         va_end(args);
> >>
> >>         list_for_each_entry(carveout, &rproc->carveouts, node) {
> >>                 /* Compare carveout and requested names */
> >> -               if (!strcmp(carveout->name, _name)) {
> >> +               if (strstarts(carveout->name, _name)) {
> >>                         mem =3D carveout;
> >>                         break;
> >>                 }
> >>         }
> >>
> >> I just wonder if would not be more suitable to address this using the
> >> "memory-region-names" field.
> >
> > That would be better as you shouldn't really care what a provider node
> > name is where-as "memory-region-names" is meaningful to the driver.
> >
> >>
> >> The drawback is that we would break compatibility with legacy boards..=
.
> >
> > So not an option.
>
> >
> > I think I'll have to fix this within the reserved mem code storing the
> > name or do something like the diff below. I'd like to avoid the
> > former. Using the original device_node.name is also problematic
> > because I want to get rid of it. We redundantly store the node name
> > with and without the unit-address. There's a lot of places like this
> > one where we hand out the pointer with no lifetime.
> >
> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm3=
2_rproc.c
> > index 1e949694d365..cdee87c6ffe0 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -239,7 +239,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
> >                                                    resource_size(&res),=
 da,
> >                                                    stm32_rproc_mem_allo=
c,
> >                                                    stm32_rproc_mem_rele=
ase,
> > -                                                  res.name);
> > +                                                  "%.*s",
> > strchrnul(res.name, '@') - res.name, res.name);
> >
> >                         if (mem)
> >                                 rproc_coredump_add_segment(rproc, da,
> > @@ -249,7 +249,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
> >                         mem =3D rproc_of_resm_mem_entry_init(dev, index=
,
> >                                                            resource_siz=
e(&res),
> >                                                            res.start,
> > -                                                          res.name);
> > +                                                          "vdev0buffer=
");
> >                 }
> >
> >                 if (!mem) {
>
>
> That's work on my side.
> Could we have an OF helper to retrieve the name from the full name?

That would be: sprintf(buf, "%pOFn", node);

The problem here is we don't have the device_node pointer. The only
way I see to make the above prettier is perhaps a define.

Rob
