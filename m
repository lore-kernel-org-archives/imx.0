Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253D924BD0C
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980277; cv=none; b=WLgBUoe4TGbYyQvtjWRZx1q8V0diQfmYOREm11bOCETrRYEfx1ctIFsC1PBkQ7jF0v5iYcT1BzQ30lxNZFRNgKYSRzXJ97Dku4D2H7ulWydyUAQxZXWqYl0SVdC9BwNU73aLJYcDTwGDAl1RAURm7n1b8hbsQnULaCFl3Py1n/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980277; c=relaxed/simple;
	bh=LLYxMLN/+FoH7IMS9WyWZ3aQqJ9EbmJgwK779ugBzYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfgL2jFzhueDvFo12gplsfL948dZ4NAwJzHqNcYJ1GNazOcMUG0zCjd5uZZPMr+xY4K0rohFpOxuMRepp6HFDTNZAar3yLL8rR+PfDUpdsslOGTtSDLTWumed2Vkrdec+dYenp/CmZzw9NdNghrvOk4/XgsWRf7d+UGejTPPCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so5504677a12.2
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754980273; x=1755585073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnSCoQK0EBBhR+KMV2scx1OY/S2RO6MiphSzki2soYo=;
        b=c/vrn0InFShIThsc3lw4duNwoPNH61pTDtDmzy0XItnUqJRXpRZq1KwA2EWvIq1moy
         nOoV8XeMA9FwQ7tnqsXwSt+TgaPKqSh8T//G/lMSMoqOl+hSj1KtQxCuITpbcwdkOuBl
         AKXfMFNCddd0eqE/7CHWcziXsZWcQiWkPhjJ08FynzOpm1hNmACNGF0FUUDYn3klovFt
         W0kuxsBDc0I7EMyNyJQKVQOGZds0/ChE7MOVSb3QxhTHL2rOGt8UDHXHbqrdyENo/C1v
         p2E6z17rRvrjNd59RG+ufmL8BWk/2y2cw+HVwXgk8KIqTuChgR9SoHZH6NAW9616kUJu
         tbWw==
X-Forwarded-Encrypted: i=1; AJvYcCXbMTAYwgHujVc4UFUSzSXaWZRWYEPcgryLW2/PS9x6a2i14TUcUonivgUUioBepKhaKbE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6SWOH/awOyr1beOBaybKZJOLVrIoRrpz8xXASSUxUoZlOENVo
	ZpALVunCc60HNHAS2sG6LI1at4YeQpCj68zGyELjt0qh+/nl+wwDJLE3om+qSlZqUc4=
X-Gm-Gg: ASbGncsIfF55FVzRhX01+2DIJ+k1wxNEOrKuaaqQC2hZDPj/zJviuUZTmFxfksk27Z8
	DGeYIed8DunM5pVy39J/drrU5S7G1H8uhGl3AjeyZd1gNb1ykJnFrfTZ9/qJExO30MrqYTK33pe
	EPsvv2OLsISQpd9wtvh1NgfC66IYoh/PljuASpGohY/cV23SDAlKjMnoZyY4Vm7mojapS0FlsLf
	rVvzU5W4ZzUqvqUlsAKaTBLSJ844DW/c3zN7VC6X6Ol1k2Wm47Qei7wpcPKH4CG69zCih2+7dXv
	wizSblW/Os6m8zNPS5HtTdasRo8xWOByLJ5ktUFtGNINeO6wlXCW7m1lQKFvKypUpzwHgkHhn20
	7cdkSckbF4tytkOnxqkIg2G/btaq0ARZAEEy63kFBHywSoBGur6pNVzfIug==
X-Google-Smtp-Source: AGHT+IEd8kMv3DF8+DdeVRmZ9GMdyaIMZqueUvj9g84g1vvkeseNXsVzBR5LQk2jJlvxZ4vyql9XwA==
X-Received: by 2002:a17:907:9446:b0:ae3:4f57:2110 with SMTP id a640c23a62f3a-af9c6588280mr1561558066b.54.1754980273027;
        Mon, 11 Aug 2025 23:31:13 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0771f9sm2172654266b.16.2025.08.11.23.31.12
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so5504648a12.2
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzKowXM7xID6WbB8NzWxBDbcl6i+Um3GqkfkLrR0g0vWbzn3poHuqWThKivEimR2R7Kd8=@lists.linux.dev
X-Received: by 2002:a17:906:7952:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-af9c658d4e5mr1347054566b.55.1754980272254; Mon, 11 Aug 2025
 23:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
In-Reply-To: <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 23:31:01 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
X-Gm-Features: Ac12FXxUPGaJyzFRIVDPhYuVZhaEvNZeEF-rPdc7e_SppFMnCWmGszG5kWhfTm4
Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Reply inline,
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 04:47, Will Whang wrote:
> > Hi Krzysztof,
> > Reply inline.
> > Thanks,
> > Will Whang
> >
> > On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>> +description:
> >>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - sony,imx585
> >>> +      - sony,imx585-mono
> >>
> >> I don't understand this second compatible. Is this different hardware?
> >> Can you point me to "mono" datasheet?
> >>
> >> Your description should explain this. Commit msg as well, instead of
> >> speaking about driver (in fact drop all driver related comments).
> >>
> > Mono version of this sensor is basically just removing the bayer
> > filter, so the sensor itself actually doesn't know if it is color or
> > mono and from my knowledge there are no registers programmed in the
> > factory that will show the variant and model number. (That is why when
> > the driver probing it only test blacklevel register because there are
> > no ID registers)
> > Originally in V1 patch I've made the switch between color and mono in
> > dtoverlay config but reviewer comments is to move it to compatible
> > string and not property.(https://lore.kernel.org/linux-media/2025070317=
5121.GA17709@pendragon.ideasonboard.com/)
>
> You only partially answer and judging by mentioning driver below:
>
>
> >
> > In this case, what would you recommend?
> >
> > compatible:
> >   enum:
> >     - sony,imx585
> >     - sony,imx585-mono
> >   description: IMX585 has two variants, color and mono which the
> > driver supports both.
>
> ... I still have doubts that you really understand what I am asking. Is
> this one device or two different devices?
One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
(Color). Silicon-wise the difference is just with or without bayer
filter.
>
>
> Best regards,
> Krzysztof
