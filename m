Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C71C5F39
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617576; cv=none; b=rnt7C1rWs0birz8FOyTbWYTG+qaOPsRW6esaDHDFNvaqpV9x0BzjhMJes0ny2wrmNPAfTM1X031dkjV6gmYnTXqfy8fF/MKLn+VTg4aBaSfGefna2hYuL37ptY2bJ92B/phSNm7BBJ6E3/LG4Pv2RVf9AKFuiV62Z+aGL0ift+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617576; c=relaxed/simple;
	bh=ofj6JP1j6Y98Ose9xyS7S3SdHxczj7+yv4cnT8ALfhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKTuiuGpzVOBh1Dmzbws5NPGBxWbbUZoprisnpLR3uYp3J5NMmAra56Xptd067Un8wDa5HkgjpbPOA4VpC96wpfSArU1zBXTj3r2P1rd7lMh9BNRQ7ceVCJx2Ev0LklG/MV0VEqOL/xHjcxEJWirmZnMUoC+XXhCdCxUbM8DJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbAewE+2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbAewE+2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so8431601a91.3
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 13:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738617574; x=1739222374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1RprFycDuHJldRn/ezrS+F5IM4jHFkaXUl211fTz08=;
        b=QbAewE+2dPvpA7M+vGyDGbOXTfle6HvHsvOuqCQABzZXxZSW8VT79ntYsZiWj8mCxf
         JE+wF5I9/weatGiLv5gEWYBGKqH0gaenghJ5mj6Q6LLg4TB62FhTrgLQG4mHTUmOyxrJ
         XrjJbHZaAevX0UJJgjdvpRX85xKokaj2FBZg7s1J4u+QGQTwUs96hzgypGWD0MiL678+
         SIHU+H0lcp+QOLwjf9kKn77/Ycf4w+FRjU67HSVDtpUynrKaZWEiT8ALle26ABubQS/m
         4tNrJrHgByyDrtQNmMcDF7Kt/REvdBg1QMNFy04wwQ6VgEIsSSZI6PC0ADfQqokGF4pL
         mIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617574; x=1739222374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1RprFycDuHJldRn/ezrS+F5IM4jHFkaXUl211fTz08=;
        b=AAYlTq+m7kca8N9Ke1Bgl0y7i+ECXigyHszMvFH7rS0C3UxalkOTDz1wPGyk48YMYd
         agsdb6HKzQ8mxa2v44CRclDZ0b9UmR0fJL3CDPeCB+htTGDjF7me7ziZq8KNphh7lXI4
         mrxcFWMLZOnobEKEgyFBSAqDIpl3sAK9P1osNRV4X33iTr1IFnt+OXFYqgv3ookP2ZOF
         3zAmdRCjQg4unyUCeFYa+2JVNlTajmcLVp3/ydNYWm1tA24Vk84cQEYiCtHRqUHN4nYm
         Gio0lX37XOggpsW7Rluin1eOFHBpcg9AXVL/qliQpqUJcgmJ0Et+SDcHzk8Fb1I7kIgP
         LU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+l0ZMEJJ6GMLHjYblm+hwZ7t2HrKTchj26NWi/RBQGtLVJSgt4VNncKXUoLSOPuJlqWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKw6uJpalx8IiXhhY9DDvq2RDW3jJUrMXtwnqGQ02WHwtS/1NG
	iCr85SwrLDCXB4QY2ZMrWhcwu6rjia35X326+ULwYWgTAkN7JOVUMvDgKkCaPorg78sEBa6cBqH
	IGgCw0tI9qoDFRBePbsa+dp0jFpA=
X-Gm-Gg: ASbGnctNVpIVXG6HVF5+BjXneFOfSiSzRKEOQs7Xli0fVvQ58iNEfIWV4b7frEmHZUM
	fimPb//hL3smjp5xpZ0+PMkXtLATlLQYfXu5e/NAHcmItc1AsOiMwANhhCp2ipRbAGCMAH6sq
X-Google-Smtp-Source: AGHT+IG/z3EJhnf9SR0K4H9KlI981FGgmyEgJkvQWHpkkih0UJEnWjGg3KJxlOWE94AU8gGejkz3MNO9Uh3+nXXaTBI=
X-Received: by 2002:a17:90b:5146:b0:2ea:3f34:f18d with SMTP id
 98e67ed59e1d1-2f83abdebdfmr37965262a91.10.1738617574433; Mon, 03 Feb 2025
 13:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-6-9a6ecf0b2308@linux.microsoft.com>
 <dd0358b1-7c8a-4c9e-88c5-2e1db69a3a35@linux.microsoft.com>
In-Reply-To: <dd0358b1-7c8a-4c9e-88c5-2e1db69a3a35@linux.microsoft.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 3 Feb 2025 22:19:23 +0100
X-Gm-Features: AWEUYZmGyX5TH9PuhG1vFlJR4zNh-9wcNWLcslfb_ZiDi-fTNv4o-akZqj7ScMc
Message-ID: <CAOi1vP_UTjuF5y5oEVquk45udBZ41WqxQpHufD5oK2wbQkobhA@mail.gmail.com>
Subject: Re: [PATCH 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dongsheng Yang <dongsheng.yang@easystack.cn>, 
	Jens Axboe <axboe@kernel.dk>, ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, 
	Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>, Keith Busch <kbusch@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>, 
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Selvin Xavier <selvin.xavier@broadcom.com>, 
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, cocci@inria.fr, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:03=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 1/28/2025 10:21 AM, Easwar Hariharan wrote:
> > Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> > secs_to_jiffies().  As the value here is a multiple of 1000, use
> > secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplicati=
on.
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci w=
ith
> > the following Coccinelle rules:
> >
> > @depends on patch@
> > expression E;
> > @@
> >
> > -msecs_to_jiffies
> > +secs_to_jiffies
> > (E
> > - * \( 1000 \| MSEC_PER_SEC \)
> > )
> >
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >  drivers/block/rbd.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> <snip>
>
> > @@ -6283,9 +6283,9 @@ static int rbd_parse_param(struct fs_parameter *p=
aram,
> >               break;
> >       case Opt_lock_timeout:
> >               /* 0 is "wait forever" (i.e. infinite timeout) */
> > -             if (result.uint_32 > INT_MAX / 1000)
> > +             if (result.uint_32 > INT_MAX)
> >                       goto out_of_range;
> > -             opt->lock_timeout =3D msecs_to_jiffies(result.uint_32 * 1=
000);
> > +             opt->lock_timeout =3D secs_to_jiffies(result.uint_32);
> >               break;
> >       case Opt_pool_ns:
> >               kfree(pctx->spec->pool_ns);
> >
>
> Hi Ilya, Dongsheng, Jens, others,
>
> Could you please review this hunk and confirm the correct range check
> here? I figure this is here because of the multiplier to
> msecs_to_jiffies() and therefore unneeded after the conversion. If so, I

Hi Easwar,

I'm not sure why INT_MAX / 1000 was used for an option which is defined
as fsparam_u32 and accessed through result.uint_32, but yes, this check
appears to be unneeded after the conversion to me.

> noticed patch 07 has similar range checks that I neglected to fix and
> can do in a v2.

Go ahead but note that two of them also reject 0 -- that part needs to
stay ;)

Thanks,

                Ilya
