Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106C25F975
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755059474; cv=none; b=uFdxQNrJU2PPkS0a8rFaWm0bgS4NdwlSZ4TlpplNxp9IBovsdlTMXhP2iGTxjqvsYmKC/0YCWzXVxbjl9Ck0xNclBhI/GL63yxhklzJQOH35xJq9gfVtN3/Vma3FWwl6MEKu3cZl4+gCvxntVfRF9xT6DuD5gxEsJ8RJxLjJUDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755059474; c=relaxed/simple;
	bh=1+lPN/7RaXvAgaTP1wg5cSNxAX1xzdUfHWFU4t8MroE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXH9j37xGezABqWN5oXSKJlBz4z/wQY3UkYvbL1/QZhn0Oa1di2MyteSWZLNqIfNTon0OCDMbrk3qIWAXmlFLGryTPF3pTR70uMZP3wXG/bkJ1VvVQ2W+lurG7CiQB9y2ZMS8I/6XJ6ytWIkFp0XAXOGn+Hhn5BG0l3Jeiy/Lbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso5218912a12.2
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 21:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755059470; x=1755664270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEitumvRdECaQFnfUf7n8uN2sOMlQVkaq/vshRF+hlY=;
        b=odPtSR9+S2gM1cTyo1VkFEZViy0nH2LKwMmFWP7RpFrBDj8GBaeMVXMsxyVn5ABxnb
         raukdvf0jtCtcnk49XRaG/tch/X9F6IqIUq2lIpzIXbnfXcUyVgBVx9yR0ENRGbAcwSF
         L7bivgG7EIqhM7FaAO82aHXQ2VC/uKUQjehTjMdevYLMswhjFW7UsrrYCLDlNNqcNS6h
         BVFL2xjEMy9qgorTUckSSL9HCbncckfio02mp+Tv8DLvkw6JOK+eroNHdul+/3SsVMBO
         2jU+jLWJ6lIs9G9P/+Ja/I+KA4IGP8Pg2dFT2cCSS7VsVP+puL+S2QohlevUkD8SQVbB
         qAbw==
X-Forwarded-Encrypted: i=1; AJvYcCWY9XmFO5qnAZC5S9GHMhYHwL2+twcPdydoox6BhkDI3nofGXO5WGxUifAW7JSwp8sltcs=@lists.linux.dev
X-Gm-Message-State: AOJu0YykLZXDd2zjYlQeJd5kFYnk8aETEwzyOoWYwxtbwUQRCZ8uyM7D
	IMlhK2mF1Gmj/n4mdGG+1rv4lMb8lSEmrbmlqww7iZqhkIzrgSJKyNtN2vcOu/RAugc=
X-Gm-Gg: ASbGnctXez321aCc/00z7PR2uRBUcKLIEC3P/uR1iXLr+j1xS275kTeeCY23VeOXlE4
	Gl9K3I2VWDYC/W/9wpv98s2zB8iHVYh2w+yNPr5b2pJ5nXI4K7C0CUlAOGoslEYoA0Lfr97YEJX
	4qHVr8u06GS1bSqd6MVNbAEnSUeE7tWri751xcHvo/w+aJSj62oxroJGi7AhltOnGgYKlsfmzVe
	kNs6NT69JRkMC071ZLmy5GczJ31mRutik1qqQIVx2dUJcoccdF06JRgMVVB1uby4EyTbQj0tUCY
	/phKq+2rNCubQYYXZRqoJcDFqsb8/LzHtbBLVgItQ1zRU7SyFDbjECkP4k5Ucww2xj31Uc8+NF1
	XAQ55YVkJ72XFnD5iJLSZZa0ysnLmj8S6fNs0WnVjhxOBOPA9eRgOhgKiIg==
X-Google-Smtp-Source: AGHT+IGTu8701W7tFVCugKdYYfiBmcO19eXFTa+9RwMbQNXmI/+awjbflD9Yat+Y6JnRWRXUpt7hEw==
X-Received: by 2002:a05:6402:13ca:b0:617:91d5:7cb2 with SMTP id 4fb4d7f45d1cf-6186bfc95f5mr1140800a12.23.1755059469842;
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6180ce5b9e3sm6604172a12.9.2025.08.12.21.31.09
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso5218887a12.2
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwKxUg6SfYc3v+PfpZwRAAFogMKLfx+BEEp72KoU0qrHmp6t3BvgAROMIi8LLpp7ZzPGQ=@lists.linux.dev
X-Received: by 2002:a05:6402:5251:b0:615:539b:7acf with SMTP id
 4fb4d7f45d1cf-6186b75b54cmr834464a12.2.1755059469148; Tue, 12 Aug 2025
 21:31:09 -0700 (PDT)
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
In-Reply-To: <20250812095543.GJ30054@pendragon.ideasonboard.com>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 21:30:58 -0700
X-Gmail-Original-Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
X-Gm-Features: Ac12FXw_0xiUCO5_AdWCiXWdSKd3XS6pJsuGK-9Sx_SEJjxOfia3w-Vp2ADn6es
Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> > On 12/08/2025 08:31, Will Whang wrote:
> > > On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >> On 12/08/2025 04:47, Will Whang wrote:
> > >>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > >>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > >>>>> +description:
> > >>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > >>>>> +
> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    enum:
> > >>>>> +      - sony,imx585
> > >>>>> +      - sony,imx585-mono
> > >>>>
> > >>>> I don't understand this second compatible. Is this different hardw=
are?
> > >>>> Can you point me to "mono" datasheet?
> > >>>>
> > >>>> Your description should explain this. Commit msg as well, instead =
of
> > >>>> speaking about driver (in fact drop all driver related comments).
> > >>>>
> > >>> Mono version of this sensor is basically just removing the bayer
> > >>> filter, so the sensor itself actually doesn't know if it is color o=
r
> > >>> mono and from my knowledge there are no registers programmed in the
> > >>> factory that will show the variant and model number. (That is why w=
hen
> > >>> the driver probing it only test blacklevel register because there a=
re
> > >>> no ID registers)
> > >>> Originally in V1 patch I've made the switch between color and mono =
in
> > >>> dtoverlay config but reviewer comments is to move it to compatible
> > >>> string and not property.(https://lore.kernel.org/linux-media/202507=
03175121.GA17709@pendragon.ideasonboard.com/)
> > >>
> > >> You only partially answer and judging by mentioning driver below:
> > >>
> > >>> In this case, what would you recommend?
> > >>>
> > >>> compatible:
> > >>>   enum:
> > >>>     - sony,imx585
> > >>>     - sony,imx585-mono
> > >>>   description: IMX585 has two variants, color and mono which the
> > >>> driver supports both.
> > >>
> > >> ... I still have doubts that you really understand what I am asking.=
 Is
> > >> this one device or two different devices?
> > >
> > > One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ=
1
> > > (Color). Silicon-wise the difference is just with or without bayer
> > > filter.
> >
> > Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> > explanation either in comment or description about difference in RGB
> > mosaic filter.
>
> Works for me. We could possibly omit the "j1" suffix too.
>
My thinking is that imx585 and imx585-mono are easier to comprehend
than IMX585-AAM and IMX585-AAQ.
Because in dtoverlay for the users/me they will have to know what is
the exact name instead of easy to remember name.

dtoverlay=3Dimx585-aam
is not as nice as
dtoverlay=3Dimx585-mono

which is what it does, a mono variant of the sensor.

I really don't understand the standard for compatible string naming
here, is there something I missed? Is it required to use the full name
of the sensor parts number as a compatible string?

> --
> Regards,
>
> Laurent Pinchart
