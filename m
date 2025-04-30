Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9925D530
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021148; cv=none; b=r5pyB2rY1FE0d3qx/njqZhY++KUK1wCftljHf+ANQ7DWWDbMFl87UWK1yPcadftGVST2KUG0qqJNpJpMZUWafoNGTXXCcuBmXyqgfdABjfuup3D2wdghDgUjiA+OseIgWVJVjEyFds0xI+f5GQ6bzN53oGsgwPmYiSzD/k43DLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021148; c=relaxed/simple;
	bh=Lxvxz/7MXPZmLKIuYhOHmmbd8kWJVwadl9qT+TRj8KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFHsg95YeUjyS8Ix1ZURStM1GVoIPKMnEMBNRMGYpqNOLlH2Z8+L4w5vIhDOltSlG/TXR4u7AWj3saw6XsvTEa3d00gFi0uTUnbs2F1D9ErKlLA8klt0EDXVHj2eSPDRj4/SwUeDca2/+QzCyRq8qAyZR+RxMj4jDdtI2rrt4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=l3VNy77g; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="l3VNy77g"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7875671e87.3
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746021144; x=1746625944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=l3VNy77gDJUSYVGrlO2X44YpL/jolwR3r69ml7qjG7rTardukn1WwQu1dbmIIzzJ3M
         UIKurQJ+Hm7JGYWeg8trH6APZMRPtJljuW51bHsuPXyAXmpv8hVDnt41+xRli0VVEZvA
         2qQgr6M5wJ7fG4mN/pQn9YY/PvzkraDGLysW2ojvsA2EDpBZTQAFxsi0QW/UtHgEeTyp
         h+7JY0zJyurFrW9ukgW0G69IL2M991c5rMxziJ2CET5Ih7E8qW1mmegegeoDRXqhh60h
         0tdifnpRE6tdFU/fbDDxUlHSlnuZ4zYZBiaAI3eqFIS9zqqUalnPxXdTOgo6NXrqbm0X
         586w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746021144; x=1746625944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=ThFX+kMmUfijMItsTAo1q4eGSkiWwRKXqZEiKt85iKb2Pt7X9DpNPmYArXYokjp1y8
         6gzA2hO0gkghvxGXvW5SZef/Ilvucq4D6oJGK/GWk33hCbHW/mXBDQugpbeOXyARUNVR
         1NUht+6IyCxK+ZVSzwonr+/RpMl16MnLRnvUkQRvyCY6C1hC24TgXoZjcDtLwcPCEnXc
         A1ItReA9Y182QnRRZfoS1l99aJlc2x7b4hcNXep1RLan0wRnXhttBdGnhs1nEbYY1fvN
         7p8M0zvbRApZxzqS0IzO2/FRpkOAyAkQwWC8aNnyMw2dRnnc8//i365q6g/+vueKQdTH
         VI0w==
X-Forwarded-Encrypted: i=1; AJvYcCX66L0S2CFA+LHzAt1bJACDnRlt83vL3evvCykmwCQusfWwskq79C2ZKs0DhmKNInX2Trc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6LriMzdya+oeEjVupCyN4AQsaBCR/YMSK8XeQSEZEILj3BmHC
	gAzpjco+OUEV5LoUMhlPs/mAEDVFhSLT4RN9CEVawFKSjaPClCPYRMCO6ATjI06le7RPDkNRtF9
	x0rwVWbMt7B7lu4+csmx4nFFibb9qq23vaT1v+g==
X-Gm-Gg: ASbGncuCKxmvZuDYIUtgEhEHNbygywXbidvExJPc1zwXMVviqhcHjq/eFV00Jv6XFS1
	NFnuizPoR0MV9EUOuBqOWExq3CSYsoTQVo3QyieLL7ELLemzukoEQUVEYYjDObdyeJy8DYF3FWc
	DSBE89Sr3AWvixBr6LTs4rmwEiJf9WA/5xA7uKMaWHWTTc2SqnFRNCwKFM3XJS7ZxL
X-Google-Smtp-Source: AGHT+IGyQiHIWhF80eEOC+6pgdTTn9cHOWztzyXKd7Hn1hMJ1sGS1ScFK8hKa7Xzn645fZbc6UnZ2HhOztB0rWXCHbU=
X-Received: by 2002:a05:6512:681:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-54ea33bc380mr1250594e87.52.1746021144067; Wed, 30 Apr 2025
 06:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com> <20250430131856.GB25516@pendragon.ideasonboard.com>
In-Reply-To: <20250430131856.GB25516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 14:52:01 +0100
X-Gm-Features: ATxdqUEUJPqT02hhE_crNuAPw-JTMhsKXzp2oVf3n9xmpn33eFhhZ5g7KLGMb_A
Message-ID: <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
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

Hi Laurent & Niklas

On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > > frequency and pixel rate") the driver expects two specific
> > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > (222750000, 148500000) operation. The driver fails to probe without
> > > these exact settings.
> > >
> > > Update the example in the bindings to match this to make it easier fo=
r
> > > users to incorporate this sensor in their device tree descriptions
> > > without having to read the driver sources when the driver fails to
> > > probe.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > @@ -136,7 +136,7 @@ examples:
> > >              port {
> > >                  imx290_ep: endpoint {
> > >                      data-lanes =3D <1 2 3 4>;
> > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > +                    link-frequencies =3D /bits/ 64 <222750000 148500=
000>;
> > >                      remote-endpoint =3D <&csiphy0_ep>;
> > >                  };
> > >              };
> >
> > I guess the link-frequencies property should gain a rule that it
> > needs two values, too?
>
> The driver doesn't require two frequencies (unless I'm mistaken), it
> could operate with a single one (albeit not in all resolutions), so I
> don't think we should require two frequencies in the bindings.

The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
Add configurable link frequency and pixel rate") and
imx290_check_link_freqs()

However I'd agree that it'd be better to make the driver accept just
the one and make any compensations, rather than amend the binding. I'm
happy to try and find a few minutes to make a patch for that.

My experience of this family of sensors says that we should be able to
run any resolution at any link frequency, but it needs changes to
HBLANK to ensure there is sufficient time per line.
Dropping to the lower link freq for the 720p mode is only because that
is what the datasheet describes for the precanned HD720p. The window
cropping mode lists no such requirement, and yet could produce exactly
that same 720p output.

  Dave

> --
> Regards,
>
> Laurent Pinchart
