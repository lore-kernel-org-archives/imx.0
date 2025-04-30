Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8B264FA4
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030339; cv=none; b=RBnT5gZ+ez7Cfyu1708GtZDcZkg52mfNdPHlfnCX4gYwdk5cBMrEU4BlF5bWSwLk5k+lUth4U3MbMzifUWYebtz1/pcWTVFCtSeuDOtXZn+UJ+mpZugKRo017n3Ljm1kQQ91yWsXBbyhrhfRWmR4PT3B4BCeqhOCxtx/3RprH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030339; c=relaxed/simple;
	bh=1PVzdxRp/+kFJAIg/6hMZbJV5KT/kYbP/MLkM4mgXFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YStrSChEMHlzN5y6m4UuAAsvnGupGpM140uqMIpa+KueE/60ngKJY7PcdS7UkBhOzYsAoSQIs6f4ZM0DrjONsDY4mthVYKjHW9KPOPCO3TKSA7lAnOTPjTgec6LW5sibi3/yPlWRnDyIX2P1iJqT1emCvDHI64ZV7F5IbIBV3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WY8PfvQ2; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WY8PfvQ2"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-707d02aca67so477837b3.2
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746030337; x=1746635137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=WY8PfvQ2K9t7AzVUviiROXMN7qU/bD1ougTNWm0GQXnf0ZAMUHpGFMyVxpDlJ2yiXy
         +zyR8E5aqgJg9/qXIaOYcrKHQrU4r7Amx5aisaAURRY74poTJQ3QyEslEk61PGy7cVbX
         fv3l5kS0g3D0AWfKW2MUhh3zODMu9pcEq+4LmYbibEcuXXjw/2AZur1Wbx+V8dPNJJJZ
         GFJ+h/hfNb/VsS569QWQrpIPEj4upMxcJkPvdc9qZmqbTi75oI3KIf233mGX/n9lb6Hz
         3jmUVJ59tCz9NqvbVzAtbsd5d43WqKPx8u6yp8jXvSUZuWjM6ojWPnTrc5bJKA63YoIo
         GNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030337; x=1746635137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=rXCA+gzRF8BDTPkQabYfvthDNSrLqXI6Gn9QSO16EVnRaFm1684vuAAfYldtM+hA4j
         7uPk8OU7bv9hxqZGWqwYf8GrDjsROnRf00IwYi7n7EEbaK2a6aU3YeV6X0UR5n43IYGZ
         E9uF8GrN8ps9CSGEwVykogNQnBp/2W5OM3KnWC3qeJKDrgryYXxNwzf6vDy1/v8jUOVk
         nTvlNaH9D/Qpc8Vy0nifYeW2cZ0d1ImpahmFOqpxUjjXsxGB0aJyA6hASGeQt0DBd25o
         lmhOcfvthdst16O3dUq9jJky/RQ4xLnlZzsrO65AlBMnPCKON6PzP9coc+dMXgzxbl7Z
         mFrA==
X-Forwarded-Encrypted: i=1; AJvYcCWKQ7tYANwa3MVDG35Wp/z6486PIyw0kI8DK39FFFnkAGLr5plFGRyDpl7NVubRO8E8ADU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx8lLZ+FmCgOWF4o/VFzsIXXK3JvFvr++C38PMrWESB2LdKWgd
	f/Jg2C8M6cxV0ESXhLqqyLtJGnqofqFzbOF2J6SiWWstVrA9J4PjIIo/4cvGJ4doczLp+v7CXlo
	ZmwkvfDFhegr8wG0jO543Yh5FNohTO/mljfSSoQ==
X-Gm-Gg: ASbGncvskeOblMqsZ0Jai66cajQRrMWSYVovg7sjsF1ijIFR1YxVbElisj9ZqKSBWHa
	O/hv5zUKqTBdtqY1Dbpkf2WSHN78RrZzyjX5IC9yMvJVOrmi/gI9EU8nh+9pWN3o4BCMLZHUOgs
	Z/ZqSm1yZgbc3vJAdXTZcn2xbRh8bHdDD99nh15zJArirWEzk7ISvJjA==
X-Google-Smtp-Source: AGHT+IHd+mzxsbQHzg2KdqaE0D0IMCI4DPD74nxHKEsYaPw4wosN4rVl4mhlvOGDdXpSNiN3p5emIlAjRcnS9XKmP/Y=
X-Received: by 2002:a05:690c:700b:b0:708:73bc:abdc with SMTP id
 00721157ae682-708abdac21fmr56602207b3.22.1746030336612; Wed, 30 Apr 2025
 09:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com> <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
 <20250430160445.GB31516@pendragon.ideasonboard.com>
In-Reply-To: <20250430160445.GB31516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 17:25:14 +0100
X-Gm-Features: ATxdqUFmSnHhLyB4xlaoBz0z3J5u5ayEJkVVl-qFWx18SUxO7BsGgktwlOcreUk
Message-ID: <CAPY8ntBb5x+F=xj=KVrkfq=JqdshgCS548YjRt4OuhhyVJNkVw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 17:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> > On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable =
link
> > > > > frequency and pixel rate") the driver expects two specific
> > > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > > (222750000, 148500000) operation. The driver fails to probe witho=
ut
> > > > > these exact settings.
> > > > >
> > > > > Update the example in the bindings to match this to make it easie=
r for
> > > > > users to incorporate this sensor in their device tree description=
s
> > > > > without having to read the driver sources when the driver fails t=
o
> > > > > probe.
> > > > >
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > @@ -136,7 +136,7 @@ examples:
> > > > >              port {
> > > > >                  imx290_ep: endpoint {
> > > > >                      data-lanes =3D <1 2 3 4>;
> > > > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > > > +                    link-frequencies =3D /bits/ 64 <222750000 14=
8500000>;
> > > > >                      remote-endpoint =3D <&csiphy0_ep>;
> > > > >                  };
> > > > >              };
> > > >
> > > > I guess the link-frequencies property should gain a rule that it
> > > > needs two values, too?
> > >
> > > The driver doesn't require two frequencies (unless I'm mistaken), it
> > > could operate with a single one (albeit not in all resolutions), so I
> > > don't think we should require two frequencies in the bindings.
> >
> > The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> > Add configurable link frequency and pixel rate") and
> > imx290_check_link_freqs()
>
> I realized after sending the previous e-mail that I was indeed mistaken.
> I thought the driver iterated over the DT link frequencies to check if
> they're supported, but it goes the other way around.
>
> > However I'd agree that it'd be better to make the driver accept just
> > the one and make any compensations, rather than amend the binding. I'm
> > happy to try and find a few minutes to make a patch for that.
>
> That would be nice, thanks.
>
> > My experience of this family of sensors says that we should be able to
> > run any resolution at any link frequency, but it needs changes to
> > HBLANK to ensure there is sufficient time per line.
> > Dropping to the lower link freq for the 720p mode is only because that
> > is what the datasheet describes for the precanned HD720p. The window
> > cropping mode lists no such requirement, and yet could produce exactly
> > that same 720p output.
>
> And with more information about the INCKSEL registers we could possibly
> even support other frequencies.

I have no extra information there.
The minimal changes that are made to INCKSEL 1 & 2 to switch between
the two link frequencies makes it look pretty fixed rather than
flexible PLLs, and I haven't got the time to go randomly poking to
reverse engineer it.

  Dave
