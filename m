Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6732BEFF9
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067103; cv=none; b=u5j7Q/qB2HU3WIN/r/4CceMMSYRD1dfhZtorbIHomdWtmPa9HJ2cL4josmrTB9BxQlwxacrAd0qYXiAGGReG+ElK5MiYJ+cXRQCaL51uYis8EzF/l99z+s/6749qNkc/TiCwPUJhLn4GT5XzlOIkICBUbtbcctRnfB3QvkEU6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067103; c=relaxed/simple;
	bh=NlaZC1vsg/3EvL4u3fWp4og70gDFoZCZIHdYTf1ff9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvOyUyFZ/jVR9AKHtUUb+JO8Q8wojxidUJcAo9Q3Hp1KUiBCCeegfCofhJnLth5cJDaGjkDG8lhG1APtZ+oNOJmxeZKry3h/tx5HIaUOyVWZXHt7I4nxuSbTmmToktbzJLC8SXy43QmewGWKTkoEIrwk4m78HdhYHO0qtLPgm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so7368167a12.2
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 23:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067100; x=1755671900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hANsG9cDZ8y0uwjnNV/4yPX2jp2bM/vF9ssenK54Q3g=;
        b=eZUGX1CB/GZWUm/cX57Z8IEQU0PocYNcqW0iG4g0Jp7A3IcgOB4HMku6wNTln8bPKs
         xBQL6wfWhz6gHcpeGe2kJvxLsy8zC1bcLBXT9tIz625byI0Hi5AAuL9ecoMUeQ+v7akg
         DJjcAjlce9QAOFA8+KPmqGy9SLExcgpxMvPM8wCKFxj29YHg5NtXBOHwElmGdn0f8G9O
         rc4tWAZm5DHBA+a3qVnRXzFzRCjLGj3BBWgDVeZwSMTgFNqiy3aAAvgLfTA3d+7h9hUR
         12RQLVIjKuJO+S/iVetHQfcMv6xfWvtiZWLxEOGGKd4CMnPmQsmVJwlQ8oWLxk7a/da9
         iFVw==
X-Forwarded-Encrypted: i=1; AJvYcCUcUf83Wv5gPa8wRL+OGorVfE4uP5p7kpGbnb4p7WjkhNnS2asMF5hbr1vZd4BN7WWYrAk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyUmVTqVNudVGB1mWHZGd7Uy/nskSPfw2Q2tV6KVB1ZFKm8vDS
	ILOa2d4ab3JLulWAuiDXWmVHcf24AcPRknFIAdwwMG+HL7/zrginsyQttkQytPWvQZ8=
X-Gm-Gg: ASbGnctwjSbBAGDibEClYlXqTkVrbCdyrJ7IWlzaUc33hq6n7lL1KpcJ2AyWjmnSzY5
	NmaONwwNcP15n4LdwKTrvZrGwN6wyx+ADBS/+jwyO2Un++pmlP8fgz7DPxBo9PKDbeN+rxZKsle
	lgnM5gkSjcdoHKJKJ7w1AzjhDtZHVqe06YqHoMBjUj7mdaRRe7u0XeAe5KHcJ644XXu14Lmebok
	Ly/BS762HZ6THSDlUN92c+rc9JC4ZFWPgG1WykFeUzTMoqKLDIeNox9iPasVg4Yf7qn6pqlgnzU
	slJXfpITCxF6gtZJE5c3X2QnrhAlhN37KYK8TEUQrlV/0eSYrJ7GlTseK4CL5oYzW+SEZO+fNAX
	WIWkeCeXZeG3ZMR0BBA08RF1KkSNokidxzAmzExeChe2osjoAS6bKe6961GVWAToYV985
X-Google-Smtp-Source: AGHT+IFqYEZTy37pO9Ecp++Bb/y5pDYYmoAH48GQcbV55vjYg7TnHlGwEG8KoiHqXCqpYPwkiS0Org==
X-Received: by 2002:a05:6402:a48:b0:618:196b:1f4c with SMTP id 4fb4d7f45d1cf-6186bfca88dmr1022660a12.23.1755067100059;
        Tue, 12 Aug 2025 23:38:20 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm21298893a12.57.2025.08.12.23.38.19
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6182ea5a6c0so4552783a12.0
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUumJb0QymXRt5D+6a2olc8Pr+H9DrNHGNiN2aOdlxzR+l5O4zbhigOnRtSSboU0eHhlqY=@lists.linux.dev
X-Received: by 2002:a05:6402:35d5:b0:618:6a75:75a0 with SMTP id
 4fb4d7f45d1cf-6186b4b1ed4mr1626683a12.0.1755067099429; Tue, 12 Aug 2025
 23:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org> <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org> <20250812095543.GJ30054@pendragon.ideasonboard.com>
 <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com> <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
In-Reply-To: <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 23:38:08 -0700
X-Gmail-Original-Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
X-Gm-Features: Ac12FXzzLLrmw8gIl8Z6rXDfhueeMgmWZqS1-9wCIvFbO51xu2pnx-aLX2I9B8Q
Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 13/08/2025 06:30, Will Whang wrote:
> > On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> >>> On 12/08/2025 08:31, Will Whang wrote:
> >>>> On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> >>>>> On 12/08/2025 04:47, Will Whang wrote:
> >>>>>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> >>>>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>>>>>>> +description:
> >>>>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>>>>>>> +
> >>>>>>>> +properties:
> >>>>>>>> +  compatible:
> >>>>>>>> +    enum:
> >>>>>>>> +      - sony,imx585
> >>>>>>>> +      - sony,imx585-mono
> >>>>>>>
> >>>>>>> I don't understand this second compatible. Is this different hard=
ware?
> >>>>>>> Can you point me to "mono" datasheet?
> >>>>>>>
> >>>>>>> Your description should explain this. Commit msg as well, instead=
 of
> >>>>>>> speaking about driver (in fact drop all driver related comments).
> >>>>>>>
> >>>>>> Mono version of this sensor is basically just removing the bayer
> >>>>>> filter, so the sensor itself actually doesn't know if it is color =
or
> >>>>>> mono and from my knowledge there are no registers programmed in th=
e
> >>>>>> factory that will show the variant and model number. (That is why =
when
> >>>>>> the driver probing it only test blacklevel register because there =
are
> >>>>>> no ID registers)
> >>>>>> Originally in V1 patch I've made the switch between color and mono=
 in
> >>>>>> dtoverlay config but reviewer comments is to move it to compatible
> >>>>>> string and not property.(https://lore.kernel.org/linux-media/20250=
703175121.GA17709@pendragon.ideasonboard.com/)
> >>>>>
> >>>>> You only partially answer and judging by mentioning driver below:
> >>>>>
> >>>>>> In this case, what would you recommend?
> >>>>>>
> >>>>>> compatible:
> >>>>>>   enum:
> >>>>>>     - sony,imx585
> >>>>>>     - sony,imx585-mono
> >>>>>>   description: IMX585 has two variants, color and mono which the
> >>>>>> driver supports both.
> >>>>>
> >>>>> ... I still have doubts that you really understand what I am asking=
. Is
> >>>>> this one device or two different devices?
> >>>>
> >>>> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQ=
J1
> >>>> (Color). Silicon-wise the difference is just with or without bayer
> >>>> filter.
> >>>
> >>> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> >>> explanation either in comment or description about difference in RGB
> >>> mosaic filter.
> >>
> >> Works for me. We could possibly omit the "j1" suffix too.
> >>
> > My thinking is that imx585 and imx585-mono are easier to comprehend
> > than IMX585-AAM and IMX585-AAQ.
> > Because in dtoverlay for the users/me they will have to know what is
> > the exact name instead of easy to remember name.
> >
> > dtoverlay=3Dimx585-aam
> > is not as nice as
> > dtoverlay=3Dimx585-mono
>
> I have datasheet for AAQ, so how above is easier for me to figure out
> which compatible I am using?
>
I propose this:

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
    - sony,imx585-AAQJ1
    - sony,imx585-AAMJ1

  description: IMX585 has two variants, color (IMX585-AAQ) and mono
(IMX585-AAM) which
the driver supports both.

Description is there for a reason, dtoverlay has description also. See
sony,imx296.yaml as an example.
If you are looking at AAQ you know it is a color sensor and all the
color sensors from sony can be used with imx+three numbers in the
current list.
This is following the established convention.

> >
> > which is what it does, a mono variant of the sensor.
> >
> > I really don't understand the standard for compatible string naming
> > here, is there something I missed? Is it required to use the full name
> > of the sensor parts number as a compatible string?
>
> It's not part number. You have there different models. We don't add
> prose to compatibles, but use device or model names.
>
> Best regards,
> Krzysztof
