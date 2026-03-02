Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0119332907
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447931; cv=none; b=ppQteXWlzsw9VuVplHIr9INLPQ+EmScc6VlyZ+rHWZtOuoqDzgVNtcaGYYooqoVqbdLNwkbMuGyKdhsjgQGaUSUy5rLR+vThEry2kL907CsiPUJOQR1zN9JBVcxAzmwC9Q3blwpNVu0eMe36ayWWECPGC3dgOA4W+lhb439d1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447931; c=relaxed/simple;
	bh=PO0TbLRbiVrKvdhPwH7RKWikT/wKrrUI+0ibUOovsCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWG0HArWsWO4NKbTQY7EfeLVW/ENH2P7rLouYpapYY6bWCK8UYHDpcbZa6fQOFtqhpC0rshuKenplmnSqUZDXIxDvujFcOCfb6tkzGEeCTF/xwkmUu2B7BJTlXm1/nxrX4z23Fk+8Y1D6yhTZinF1tYFiO1qMqYEsCFhYaYGgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ff09bb6271so2695449137.0
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447929; x=1773052729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl7RAWu6mKzowPFnldQghONe5pbsD04RWaX4BUYhOlo=;
        b=um4it9jPerwld/guot5ICnhlqG4QORY+FHf2j4ZPatiPnfbrwrHTwEATkKt1UDqI+Z
         uCj+XihKxN3E3wNQFnztKdDqUKPHAqs2GJwqe8UqXw0/0nwVnekWB/dNwYpNHeOABd5O
         gkpY9BUshZqrUYD1O4E0PnEqfZzb77/yCVA1kaO1clY1PenWvz6LwOkldSgt5vfVjS3Q
         sqXumzcbib9JZkJckFltupA0ELbEUBRpDC07V6fUjHiYMbMutIJ/yFnbWeJeWg/4JTPx
         NnDy3ZGKIuzstnglWG3A2iTEMrikrAk+Y5EXuVEYEhWYjMpczfuvDQYPAlozOfLxMjhD
         pFhA==
X-Forwarded-Encrypted: i=1; AJvYcCWxeZAsBvh6NUeVmmpnJhTv534KycfqCsdv12YwmDftlAhyZkQHu9yYHB2ZaReD/hpcTbE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy6FVXjTDbCwaZhWAGVZytBPx7WpZSZH3X58ORIwC2LZrCfjCN
	NLtJP+SAl/1I9jgyHulOSAbAmgyvbHzsAz+WzYlR8Fq9A1HThbyy1m2EMzohYs4z
X-Gm-Gg: ATEYQzy+/l9yhIyDc2Hl2d10AT33QjTSZAz+tszZuVeSik9dq5Lb/M764DpiNHfvHjv
	tZv/01Q9rYwVl4Pxr3h2mDUWKqtHGpriVH+ReCIdePGGaCE8zGLAFopkysNx0tKDsK2Us7igC+u
	qEuCoPRfNQUVzQ+3aFEWRNpfNEhZTsedIBXDEHd/dBJDpAbFoM2OpTOR4ecgo+PBqWgiaftLcpf
	ehVMXnJSRnCdEJ2tRm6H83nyV9WsmZWdG7CAxBrd4cVBq32/aEonFGu9rZIvtgcnox7eQBnOND/
	3OYL5b2swE+k4sX77Fpft3MCNBFaD16voyBDJMj0NrtcNc1PAb2g1kvMd6NSm8TIKgj46NtosMa
	4qrGbzf79jDI2q/5Rt0HOv4ehQb5b8MFB/s9ZTCGILuUTnJhyG53ho66s6JvEGPAVwy2X3veV4c
	nQdsKVnAcDZyCSBA+SBpvyZGAOcv1VO8nc4+KA6rp++PNCsbzRRkItL2LyCJYrKyo4
X-Received: by 2002:a05:6102:5091:b0:5ef:b51c:e7fa with SMTP id ada2fe7eead31-5ff1cfa2bb8mr8550079137.16.1772447928752;
        Mon, 02 Mar 2026 02:38:48 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65c4951sm11422440241.14.2026.03.02.02.38.47
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:38:47 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5674f3e80edso4088625e0c.1
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 02:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqTcOxM+qFmFXF1i8g3rnQS2KblJVnnwjqUnYV2zF434Weh+xF6UTHeL5gHyXkT+ITtlQ=@lists.linux.dev
X-Received: by 2002:a05:6102:440e:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5ff1cda8e40mr7754538137.5.1772447927548; Mon, 02 Mar 2026
 02:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com> <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
In-Reply-To: <DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
X-Gm-Features: AaiRm52rSumTG3nFZ9P6FzWdxvQ0hMzWVlbis5lyqzx4MgKVwMUrLmFH3gE-zLg
Message-ID: <CAMuHMdVe7Z3k1sz2dEYqfpp7uqdYjrqL-gRbUE7CPBpOA+-RfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 11:26, Danilo Krummrich <dakr@kernel.org> wrote:
> On Mon Mar 2, 2026 at 11:00 AM CET, Geert Uytterhoeven wrote:
> >> --- a/drivers/base/dd.c
> >> +++ b/drivers/base/dd.c
> >> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
> >>  }
> >>  __exitcall(deferred_probe_exit);
> >>
> >> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> >> +{
> >> +       const char *new, *old;
> >> +       char *cp;
> >> +
> >> +       if (!s)
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> >> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> >> +        * Thus we can store one character less to avoid truncation during sysfs
> >> +        * show.
> >> +        */
> >> +       if (len >= (PAGE_SIZE - 1))
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * Compute the real length of the string in case userspace sends us a
> >> +        * bunch of \0 characters like python likes to do.
> >> +        */
> >> +       len = strlen(s);
> >> +
> >
> > The newline case below is is basically the same case as the empty
> > string.  Hence if you would move the newline check here:
> >
> >     if (len) {
> >             cp = strnchr(s, len, '\n');
> >             if (cp)
> >                     len = cp - s;
> >     }
> >
> > then the "cp != s" check below is no longer needed.
> >
> >> +       if (!len) {
> >> +               /* Empty string passed - clear override */
> >> +               spin_lock(&dev->driver_override.lock);
> >> +               old = dev->driver_override.name;
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +               kfree(old);
> >> +
> >> +               return 0;
> >> +       }
> >
> > Also, this block can be eliminated completely...
> >
> >> +
> >> +       cp = strnchr(s, len, '\n');
> >> +       if (cp)
> >> +               len = cp - s;
> >> +
> >> +       new = kstrndup(s, len, GFP_KERNEL);
> >> +       if (!new)
> >> +               return -ENOMEM;
> >
> > ... by pre-initializing new to NULL, and making the allocation of new
> > conditional on len being non-zero.
> >
> >> +
> >> +       spin_lock(&dev->driver_override.lock);
> >> +       old = dev->driver_override.name;
> >> +       if (cp != s) {
> >> +               dev->driver_override.name = new;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +       } else {
> >> +               /* "\n" passed - clear override */
> >> +               dev->driver_override.name = NULL;
> >> +               spin_unlock(&dev->driver_override.lock);
> >> +
> >> +               kfree(new);
> >> +       }
> >> +       kfree(old);
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
>
> This is essentially a copy of driver_set_override(). Except for the required
> minor changes I intentionally kept it "as is" as it will go through -fixes and
> we know it works properly.

So I will have two to fix? ;-)

> Do you mind sending a follow-up patch with your suggested improvements?

Adding it to my TODO list, if this patch makes it as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
