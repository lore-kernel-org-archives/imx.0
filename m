Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607CD385D61
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615191; cv=none; b=PZlFddaCdbTp72t1rHA1Ghqy4SGDdI77PkBKWUJHxDbf3HBlK95nbQn6dK4nnviGWhjk4ZZWHcT7hz4Xc02AoqzlxtbUinHfc41yOpr8lwMgUx4uW8gF3mqJQkmUHAnYpBty3c09SL6mueqYiUnRQoDW4l5nLqmQpTv1YCrM5IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615191; c=relaxed/simple;
	bh=vaNwRoIjhye69eveL4rFSb3FVRqGKzDCxkgsIv4QOPU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJiABUaVqCSLjdUye3RMbwmjngZrcczm229UC0gN62Dj2SS4PF/UGOtGD9zqC6vEw/FxdIYgdiSG9pj/Wmle7mh7/diBSCnNFTR1euGdNIB/H1yG9D6ntWsJxY2C0BWXZqqGUXZ7jjQVHeDwYugtwmLtN2hhJC+MpuAcA8RV6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3XXUZYP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3XXUZYP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-470174001a0so89283f8f.0
        for <imx@lists.linux.dev>; Thu, 09 Jul 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783615188; x=1784219988; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXX9nNx5eZSBjCWWcOzM36IZ91PUM/Pz7bOwY12g6SQ=;
        b=h3XXUZYPVgaU3EP98sd0xvDN3CwTTl/wwrBiJfuvuyGrgoKnGeGKVZCH6so2lmq1nx
         56xfgELDCNHcWeUKCczk5ZZTrnbqgRgzcC/NjY6PDLy/khR04hKQveQ9pl6i5a1XemKE
         o6p2GkIu2IjrVPqSMffGGtAQXTAykuxa1EeWMi8yUlHvjF4GXhuRejzPDpaYRfye3p9Y
         l06qysvHUWXnRqVEwPSGO0QRXk4DHu+t1CQvZEIeKntUbU6iaqt6qXgWNH6vbZYQ1mS1
         hqajYyxTYRuF6baKKIfcacxGLLzNXO6pNgxBGbm2HAFyZsUTZ0EAAuWihOKYcvLRLmvs
         6vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783615188; x=1784219988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXX9nNx5eZSBjCWWcOzM36IZ91PUM/Pz7bOwY12g6SQ=;
        b=JhxrJNVreB4ajRuy4KKnab9wvfcqHt637t9Ah/7Z0TSzAgzKx4wn0tfl2qQkCgmMsF
         z01DPZ7pcC+HII8ZzXxmM1l+3uIqEJIz0XtjBLgt+3ODslTW5+vZgHvmeIBJOJdoQ9iv
         Exlw1Px2k9599LQQ7GxgqCJsyZpXcZoOAslLE9qEGjauL4UtPW3EOn/iC9GP345yTnot
         RKC782+2fCx+qAw0E+epoGTsheeF9chi/rXWAkbE5YmvT189Z/PGfueyqOtmr8sDzInB
         8M1KbRYRp1+DPn1OGfvBxR87R5ComDXTCMIgqtgRbdttdthCnJ5JxkfuC8j7gUroqP3R
         L8Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrgFbpb+/n6Xc3HGTdOw1oSGdAatR9XG6nLR08SOtwTzc1oeBg4J6pUEu4p96HSaQl2qfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkzpAL3lI3/U9Ry8svD0w1kJ8Ld5ApwzNXp7wrSZS16t7dMg3W
	0aapmpKgVvwBsE0XqlfPde0yF/zgjgbv3YwZZQlHWpdzIQhBXc5IXXxn
X-Gm-Gg: AfdE7ckJYLV0geZbvBjkRpPW6RDyh2qk8rWhzXJ+2J635KzsNCwJn1JdkYrQ1rKe04r
	zCaNcEl0h9JEZLmVWbFitWYA82TjYeW8r3F+IivL4wB16NPEkZWvGtpr9MDUDAHXbh1DCeRwgqP
	UxtHFtGbWg+xYHcGW5krvGYU2/OdvIwhL+FIyKdm3+yshHBYntoiVATMl0GhNaLFeGQgqr0E8zS
	RsdzbFVfnvDGInWs+cZTeL18I1blg+phSsVWWKKKy2eAkzmBjBsbHcBZ11mvKf5E/miqp3J+jQg
	ZYw4VSreaYdW1o+ZSofc1b14sk1xisH5rPG/HhqzGYweLhgFdtKSehf7/gKFrAwqfcKwN6s/82p
	vUIDtrfrsdgHytWVErqbT4raFOTA9KF92G5seItVkHEk6XwZxJ0u67mI0yJH01xu5wcg9GXQYqP
	4TEu33sHLr+PDgOHjhONzOxYF8vd52LNzuewyf5UkY/U82Og==
X-Received: by 2002:a5d:588a:0:b0:47d:ee7d:c125 with SMTP id ffacd0b85a97d-47df07faccemr8178775f8f.40.1783615187636;
        Thu, 09 Jul 2026 09:39:47 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm52545593f8f.13.2026.07.09.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:39:47 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:39:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Xu Yang <xu.yang_2@oss.nxp.com>,
 kees@kernel.org, christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
 hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <20260709173945.268a9917@pumpkin>
In-Reply-To: <ak64635tgUj3MPEx@SMW015318>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
	<2026070831-peso-aluminum-df0c@gregkh>
	<ak64635tgUj3MPEx@SMW015318>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 15:54:03 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote: =20
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > kstrndup() returns NULL on allocation failure. The condition was
> > > checking 'if (tmp)' to detect failure, but this is inverted =E2=80=94=
 it
> > > would treat a successful allocation as an error and return -ENOMEM
> > > while leaking the string, and proceed with a NULL pointer on failure.
> > >
> > > Fix by changing the condition to 'if (!tmp)'.
> > >
> > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: Claude:claude-sonnet-4-6
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/us=
b/gadget/function/f_uac1_legacy.c
> > > index 5d201a2e30e7..e9f2632ce785 100644
> > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct =
config_item *item,	\
> > >  		goto end;						\
> > >  									\
> > >  	tmp =3D kstrndup(page, len, GFP_KERNEL);				\
> > > -	if (tmp) {							\
> > > +	if (!tmp) {							\
> > >  		ret =3D -ENOMEM;						\
> > >  		goto end;						\
> > >  	}								\
> > > --
> > > 2.34.1
> > >
> > > =20
> >
> > So this has never worked?  How has no one ever noticed that in the
> > decade this has been in the kernel?  Does that mean that no one uses
> > this file/driver and we can just remove it? =20
>=20
> I think just no one use sys interface to change name.

Or doesn't notice/care that is didn't work and didn't try often
enough to leak enough memory to break things.

	David

>=20
> Frank
>=20
> >
> > thanks,
> >
> > greg k-h
> > =20
>=20

