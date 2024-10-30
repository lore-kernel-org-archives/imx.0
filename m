Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78251EF0A2
	for <imx@lists.linux.dev>; Wed, 30 Oct 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297059; cv=none; b=TCKl6MaPfza2irxiKSshpfHOWCrul2IrvOd4QBY4urhX7UsOsB9G4B5nHt9n+0/UmivvnsCS+5TDdQMtgAwbZPW65/zT8l0r6d6a6C+GAxeotnbJTMfMo8FwGFju9jBMrUor5Dg7fMUA9UZsYRgaSxLRSV3l71AurIdMk1aUqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297059; c=relaxed/simple;
	bh=riTO+YkAY0deqoxQOS9+RgcWTfT9chRhKEWcM4sn+IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp40EXAZ6dBDHMpi95Dk0BSh8jx4kBeQvuTy9M4j/GT4VfF3ssPbTGTIWygiTpt028P3yvuh0Z/QarXHGNp06g7eKRcTXPPLrvBY8uYyeHob68xc6eH5iJtm5WJXtJ//zxp5RjDgvGkVsDili9BHwYFJ83MkU1ZuZhQPAN6GK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjTOl/1V; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjTOl/1V"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so58908341fa.2
        for <imx@lists.linux.dev>; Wed, 30 Oct 2024 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730297054; x=1730901854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2PgkGCB9uEgJ6DAJj1+SbB2BSpBIqMTAwux+rvPO10=;
        b=jjTOl/1V0X0Xk/TtOXhY4VzbVolPkAQ3hvjZPOq3Jh0kUiK+DDiRGRzexCuW8DZBuT
         FHg5sKSS9vdKdmenmU5ST1bAHWbg3GIbGSBXKMwBOYh37tN/uFFkgb7RRMxdSNMpYV3O
         XNslDqAKANXaq6rm03nIXYSTYTG2eN6WGGkYYd5i3L1VCYt+sh/EZ/Z0yfiKtZlPRmPP
         O/78kRpKmtqIrN1tpRfLTArFkjOT9kiNNGmmSWw6grGYrVFbK7LbK1bgT1gn9ziVloHi
         Q//59/lHE9JoCshyHDQE7jR5S1lNGOQMVuBQmzcog4R0RIplvmlS8l5c9Cs3BN4fr33Y
         QnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297054; x=1730901854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2PgkGCB9uEgJ6DAJj1+SbB2BSpBIqMTAwux+rvPO10=;
        b=f+ONnY7YZBH5PZhtvGElI7EAcA2JUNPCV+HKZEOuRTrS4mIXl5o25E2dTegkNy46vF
         NmtFlXPoeG8DgXJ8ayapJO8Mj9C/GOVjwiROyX/6kPZzcXy9zHmBlwo589Epmg2p/hwv
         YhXoXP+vopbg+5frXa3De2ny6VovYj0j/TUVldS/vPVAKgaZ3+sK/sK52pM0bMgKBjcR
         18KjI3+QQfTDmTLTWHgxN5i0HNGyt+lwdXfXMOD9rfj9J0emVSfI6n2m9rAre+Wk3Ww1
         QKGDADMhkwaQjD6V+R331L4wgfIc7dl5kP81qmUpBuDB+g4EAgs+UmHugSZ+P/KgD2eN
         wadQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtiUKcxK11PcNTofnLmkE16NHBReLJTm/jGHAWuFLCXBLfW+p+K+DyJgrFdbsc0k0OCLI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH3Bqafe7l5nIQ6R2MspkPn3KjqSmltQY96tfgnqfU3EeJDpWj
	EJ2+u0uu01QDpEXs+dmgMwXJcOPeFZHDoazJ1XE8V27aZZufPholUFSRZP4zt55J6bMUpj0cHva
	bhMDInWlrVKHcg+heYm12WF+c7d0=
X-Google-Smtp-Source: AGHT+IHnJq84m7aUxfG0ZPJwIferNLUtsSal4frhbPzaGkjLOl9PTdIGNUzgO6W6eHSANhGUNLyySnRg5jEKCK/i8WE=
X-Received: by 2002:a2e:a99d:0:b0:2fc:9759:4e20 with SMTP id
 38308e7fff4ca-2fcbdf70d46mr76674701fa.12.1730297053313; Wed, 30 Oct 2024
 07:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241018110929.1646410-1-daniel.baluta@nxp.com> <ZxkW9SUr91PyH9c/@p14s>
In-Reply-To: <ZxkW9SUr91PyH9c/@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 30 Oct 2024 16:04:00 +0200
Message-ID: <CAEnQRZDoYvK-YXLjqbXsRAWDkHrWNOoR1OCCWxs+AfNUDuPB_w@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: core: Add support for predefined notifyids
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, iuliana.prodan@nxp.com, peng.fan@nxp.com, 
	Alexandru Lastur <alexandru.lastur@nxp.com>, arnaud.pouliquen@foss.st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:32=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hello Daniel,
>
> On Fri, Oct 18, 2024 at 02:09:29PM +0300, Daniel Baluta wrote:
> > Currently we generate notifyids in the linux kernel and override
> > those found in rsc_table.
> >
> > This doesn't play well with users expecting to use the exact ids
> > from rsc_table.
> >
> > So, use predefined notifyids found in rsc_table if any. Otherwise,
> > let Linux generate the ids as before.
> >
> > Keypoint is we also define an invalid notifid as 0xFFFFFFFFU. This
> > should be placed as notifids if users want Linux to generate the ids.
> >
> > Signed-off-by: Alexandru Lastur <alexandru.lastur@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
> >  include/linux/remoteproc.h           |  1 +
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/=
remoteproc_core.c
> > index f276956f2c5c..9f00fe16da38 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -332,6 +332,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int=
 i)
> >       int ret, notifyid;
> >       struct rproc_mem_entry *mem;
> >       size_t size;
> > +     int start, end;
> >
> >       /* actual size of vring (in bytes) */
> >       size =3D PAGE_ALIGN(vring_size(rvring->num, rvring->align));
> > @@ -363,9 +364,18 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, in=
t i)
> >       /*
> >        * Assign an rproc-wide unique index for this vring
> >        * TODO: assign a notifyid for rvdev updates as well
> > -      * TODO: support predefined notifyids (via resource table)
> >        */
> > -     ret =3D idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
> > +
> > +     start =3D 0;
> > +     end =3D 0;
> > +
> > +     /* use id if specified in rsc table */
> > +     if (rsc->vring[i].notifyid !=3D RSC_INVALID_NOTIFYID) {
> > +             start =3D rsc->vring[i].notifyid;
> > +             end =3D start + 1;
> > +     }
>
> This will likely introduce a backward compatibility issue where anyone th=
at
> has more than one vring and set their notifyids to anything else than 0xF=
FFFFFFF
> in the resource table will see a boot failure.
>
> A while back the openAMP group started discussions on using the configura=
tion
> space of a virtio device to enhance device discovery, with exactly this k=
ind of
> use case in mind.  I think it is the only way to move forward with this
> feature, though it is a big job that requires a lot of community interact=
ions.

I also found this attempt few years ago:

https://lkml.iu.edu/hypermail/linux/kernel/2001.2/05248.html

I think the best way to go is to bump the resource table version and suppor=
t
the old behavior for v1 and the new behavior for the new version
(which should be v2).

We will be back next week with a patch to express this.

thanks,
Daniel.
