Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984D26869E
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554943; cv=none; b=A2xrgd7fJ4/q2e3wPcL8Cx2bsCQD7XLJ/FFzJklWDZvHt3RBlPsFSj4chqK5CA19y+NqcqxAuQ+oVuPUDeTKCY3L6++AYqtNVYEzcQN+rYjGgbKgYbsNsW6BkAMvJTu2mEkAgmbl4H2cEe08YCNEMQZ7kSe9cvxcJYYRRDHMYuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554943; c=relaxed/simple;
	bh=6zbN5jOaaksOEj+lbfcyYF58FVbBR2uEiZ1U9Xm0Q7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKtw7E30jVvebcV3AEZTQS9lWypdu075VOwLJLeMjV+8LCnebNupyuaGEegmr6xBE1po0MkQB8BAcsOUgvSOqdEPRvuIpjnH+dHqf6jfFO8cJE2ZScq6L3cf9y8rkroxBoHb1ZROyfw/sGKvZLKc8ldgy/FVnOY+Q+CNtAUpSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZU6OTFpV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZU6OTFpV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso10508798a12.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 23:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740554939; x=1741159739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
        b=ZU6OTFpVKVVv19ZaH25o7tGsseVzxX6hCvYjd/90on8kiqyD91JEviiAhNUGvmlXgN
         1WFL29ucblGFUQCBGoUaq1BndiJ5hrclgisq253qrQKXPIJf8SXLYG/KhWYdRTjiWX8X
         Da7JSZ3z6TSFlYoBh/Un4GVLQz37nEOGRnD5hC72pY4VPPfdy7iZI+STh+i6Ag0zx2oA
         LfhLh8iR0+b/oqtxi3AmKnKdBeMZI1qgdM+Nr9/cy277DT0HWesZszg1WmuH3GS+cNo/
         sP5ZdZ9dFYYqgMsQh35XHkHqlQC4Vg9TyMD9R3uFc0eA0ezMcJp23FRNAzUIU3lBmTK+
         TNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554939; x=1741159739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy5UzyKzocsSx5cSXomfjfFL//CTemBkcuebkephmC0=;
        b=HoAALLU8VjKxl2yS5pY1+7kX3uvHsblRaypzEPvYOBFK1CvDgY6zQk29G43gPHqhow
         SG4QjZr+tnyMB0AjQLXEcg2mvuf2yRDbXUD5gCTQC3+dduT+5a3u1cfJDlUVF8PyRtcg
         4ptfEkl0mvN2WP/JFECyyBFWddm1bJBMw5yT8YLYe8FcSXpkUGdFLOMZwUKRJ1GQ6lJT
         Fr08ZxQdMZyL53MRMwABoqhfo2AiwXsSxUEG6/dvX100MehF3wBxzR998fQAPGPChOPH
         71ZHIEDmyugKX/a5kBWBmXR1V++adbvyEcfysWM3blBJm871ZO377zqf6/BWAFh09aFk
         Wvsg==
X-Forwarded-Encrypted: i=1; AJvYcCVrktV1YRzlO29QoEs9LDukd4fIImXpsgkFV+iQbK5JROUhiBPjLX7KB/wXDUUDh7QuXSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV5/Oqoqi0ocpE3IGbPASqssun3rr9Uiff1CT7sgXTrXiGhb1p
	udOgEUsrP4Eq/0/iQGunjr+zEQCdZGlWFCVoNWDQw6cjuDk1peJ3C6DwkvQF16XFE+GX2opySKz
	jYREPIiYbsbGZxuY57P0aS6gVZEHbI2V/pXnMfg==
X-Gm-Gg: ASbGnctn+zOtx4ExRU3yb1WHj4YA1fwszj2+z+Pq8lnD7uMcf9pgLAr6A4DwTg5pS9p
	U6Zl1FAQvIASr6b6r/+pckqMO/6Pm1DFZdzKNzjf4YAUccYYODFzicvm+kY1ZnoExSB7GQRXRAS
	6bEM7lsg==
X-Google-Smtp-Source: AGHT+IFYP8Tba+z3P6zhrfLVohTtXs/BwRHQBKKRVXu59ZSzqEPbWtjoPmnK2n59Ee5Tugvqu0RIdPnu12lt6iEjWaU=
X-Received: by 2002:a17:906:18b1:b0:ab6:ed8a:601f with SMTP id
 a640c23a62f3a-abeeed1123amr202024966b.12.1740554939189; Tue, 25 Feb 2025
 23:28:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-6-a43967e36c88@linux.microsoft.com>
 <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
In-Reply-To: <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 26 Feb 2025 08:28:48 +0100
X-Gm-Features: AQ5f1JpekOKemtGu2BHsnbGs6fr563e7jHjxxRB5HZ2bESNce9YNZRbPCIKk9Cc
Message-ID: <CAPjX3Fcr+BoMRgZGbqqgpF+w-sHU+SqGT8QJ3QCp8uvJbnaFsQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Frank.Li@nxp.com, 
	James.Bottomley@hansenpartnership.com, Julia.Lawall@inria.fr, 
	Shyam-sundar.S-k@amd.com, akpm@linux-foundation.org, axboe@kernel.dk, 
	broonie@kernel.org, cassel@kernel.org, cem@kernel.org, 
	ceph-devel@vger.kernel.org, clm@fb.com, cocci@inria.fr, 
	dick.kennedy@broadcom.com, djwong@kernel.org, dlemoal@kernel.org, 
	dongsheng.yang@easystack.cn, dri-devel@lists.freedesktop.org, 
	dsterba@suse.com, festevam@gmail.com, hch@lst.de, hdegoede@redhat.com, 
	hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, idryomov@gmail.com, 
	ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev, james.smart@broadcom.com, 
	jgg@ziepe.ca, josef@toxicpanda.com, kalesh-anakkur.purayil@broadcom.com, 
	kbusch@kernel.org, kernel@pengutronix.de, leon@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org, 
	martin.petersen@oracle.com, nicolas.palix@imag.fr, ogabbay@kernel.org, 
	perex@perex.cz, platform-driver-x86@vger.kernel.org, s.hauer@pengutronix.de, 
	sagi@grimberg.me, selvin.xavier@broadcom.com, shawnguo@kernel.org, 
	sre@kernel.org, tiwai@suse.com, xiubli@redhat.com, yaron.avizrat@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Feb 2025 at 22:10, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 25/02/2025 =C3=A0 21:17, Easwar Hariharan a =C3=A9crit :
> > Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> > secs_to_jiffies().  As the value here is a multiple of 1000, use
> > secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multiplica=
tion
> >
> > This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci w=
ith
> > the following Coccinelle rules:
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * 1000)
> > +secs_to_jiffies(E)
> >
> > @depends on patch@ expression E; @@
> >
> > -msecs_to_jiffies(E * MSEC_PER_SEC)
> > +secs_to_jiffies(E)
> >
> > While here, remove the no-longer necessary check for range since there'=
s
> > no multiplication involved.
>
> I'm not sure this is correct.
> Now you multiply by HZ and things can still overflow.

This does not deal with any additional multiplications. If there is an
overflow, it was already there before to begin with, IMO.

> Hoping I got casting right:

Maybe not exactly? See below...

> #define MSEC_PER_SEC    1000L
> #define HZ 100
>
>
> #define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
>
> static inline unsigned long _msecs_to_jiffies(const unsigned int m)
> {
>         return (m + (MSEC_PER_SEC / HZ) - 1) / (MSEC_PER_SEC / HZ);
> }
>
> int main() {
>
>         int n =3D INT_MAX - 5;
>
>         printf("res  =3D %ld\n", secs_to_jiffies(n));
>         printf("res  =3D %ld\n", _msecs_to_jiffies(1000 * n));

I think the format should actually be %lu giving the below results:

res  =3D 18446744073709551016
res  =3D 429496130

Which is still wrong nonetheless. But here, *both* results are wrong
as the expected output should be 214748364200 which you'll get with
the correct helper/macro.

But note another thing, the 1000 * (INT_MAX - 5) already overflows
even before calling _msecs_to_jiffies(). See?

Now, you'll get that mentioned correct result with:

#define secs_to_jiffies(_secs) ((unsigned long)(_secs) * HZ)

Still, why unsigned? What if you wanted to convert -5 seconds to jiffies?

>         return 0;
> }
>
>
> gives :
>
> res  =3D -600
> res  =3D 429496130
>
> with msec, the previous code would catch the overflow, now it overflows
> silently.

What compiler options are you using? I'm not getting any warnings.

> untested, but maybe:
>         if (result.uint_32 > INT_MAX / HZ)
>                 goto out_of_range;
>
> ?
>
> CJ
>
>
> >
> > Acked-by: Ilya Dryomov <idryomov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.or=
g>
> > Signed-off-by: Easwar Hariharan <eahariha-1pm0nblsJy7Jp67UH1NAhkEOCMrvL=
tNR@public.gmane.org>
> > ---
> >   drivers/block/rbd.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> > index faafd7ff43d6ef53110ab3663cc7ac322214cc8c..41207133e21e9203192adf3=
b92390818e8fa5a58 100644
> > --- a/drivers/block/rbd.c
> > +++ b/drivers/block/rbd.c
> > @@ -108,7 +108,7 @@ static int atomic_dec_return_safe(atomic_t *v)
> >   #define RBD_OBJ_PREFIX_LEN_MAX      64
> >
> >   #define RBD_NOTIFY_TIMEOUT  5       /* seconds */
> > -#define RBD_RETRY_DELAY              msecs_to_jiffies(1000)
> > +#define RBD_RETRY_DELAY              secs_to_jiffies(1)
> >
> >   /* Feature bits */
> >
> > @@ -4162,7 +4162,7 @@ static void rbd_acquire_lock(struct work_struct *=
work)
> >               dout("%s rbd_dev %p requeuing lock_dwork\n", __func__,
> >                    rbd_dev);
> >               mod_delayed_work(rbd_dev->task_wq, &rbd_dev->lock_dwork,
> > -                 msecs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT * MSEC_PER_SE=
C));
> > +                 secs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT));
> >       }
> >   }
> >
> > @@ -6283,9 +6283,7 @@ static int rbd_parse_param(struct fs_parameter *p=
aram,
> >               break;
> >       case Opt_lock_timeout:
> >               /* 0 is "wait forever" (i.e. infinite timeout) */
> > -             if (result.uint_32 > INT_MAX / 1000)
> > -                     goto out_of_range;
> > -             opt->lock_timeout =3D msecs_to_jiffies(result.uint_32 * 1=
000);
> > +             opt->lock_timeout =3D secs_to_jiffies(result.uint_32);
> >               break;
> >       case Opt_pool_ns:
> >               kfree(pctx->spec->pool_ns);
> >
>
>
