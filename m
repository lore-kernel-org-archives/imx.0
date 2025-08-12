Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D33AC39
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754966838; cv=none; b=NuiSGZS2xx8sczCyPKwN2AHNc6CgdsW+tm5HdMtkIlE/y0J0+a+cdNC7suz0MwehxNU8jEcKCqDuoj/psfroiLy+E4YwvToZkzPXlyFMi6Nh0AzhJBApaBZL0OjeJRAkuFwSA1cbbqUetgxOLbd72iYERYjWKRVCcLm3gYXVyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754966838; c=relaxed/simple;
	bh=+fHSSfrLfUCHm14m34euvNod7wbZwFjgDmGXRetUF70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPZoQKIBtLh2F5FTj9rcTKkUVI6jU1AvA4lwcnqmVG0Tbd8oH+sDsntnGDGV0Se5ozZBAOg8D6AAULFiCICz+xQvrGLB9M1iUhr5ohRjGdlr23YzXkIYFIXwm7vWgqNLIZFMzr0gFnSd8hCeobRb1jC0P/NziqiRaXolZa5zB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so9774276a12.0
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 19:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754966834; x=1755571634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4WEnSDqzgAq88TBUpwwpgbS9VPz87hnkF4biNEHDlY=;
        b=itNKH7W8pi9O858IGXVYWmoGbbMKtCLHQoJ0vEonl8Tbu9A8b8kC7GhsTsH4K0Lm4R
         7znG81G2hVSxpDgtYfU3obM5eX3cQExy+JfZEECYVPFrdmkfWaDcV+ZavlE91ieCm+fw
         d0xP1Kn86GLjfTga8VUX3DNlxvBhddE1Nhg9jhXuMgRS9cQqsrdhtrs6W/MdMQoWXg4g
         GsQetwEE+QNmFCmN531DApivIHmnnspNxdJ/PDyvJ1BQtJoyBFbUMmrX6Qmm2m3vX1HN
         72/UGa2wycLuzE7YB1k9RLo8cs1F1VO873nUWCAd3cS40Tv8SVdxik/K8uGti7xt6GYu
         Rk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjHQyeDJSNUy37fXIhem5BSnqluE87LD6YhNIU20PNKVN7PvIfFccDMN2YkjXgVwOExPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBsBpl3RZ/k7E3dheHDZA5SFS1UvnxDMzjxRMjjoE1riZQaf6V
	pyZxVmz6/4DDsOc15V7CzwN+TWs/NnWW/CDMXzXofUFmxh8jrHJHxpLcSoPVVuy4USU=
X-Gm-Gg: ASbGnct8Bug4bhoXaEc5PyteGkg2b8WT6EcNA7KXMb7L3YDEVR8gbw69TcyIoAY8NOy
	Yzc+0Z3o2Q8TrUMaxRFjN89Otb7CjAUZaHDP04+kWDeFTZbvStdke78O71B/7Z03aQIwzYWiOk4
	10FzA5fARJcBnWi3p4ArVJvdEgWEqaStypepNHUvhvMMeotfkXQYQkxk4z/NgTURLqDlsrwb0qm
	4QdfMUshcgfTAdQJJSxcSuI4bNOCQFmmFfrn4Nn+atDDpiuU67hNedknpqujczuDl1ADAx+blr9
	uVaeDxoh9pXn/SvzmVk49haq7/+F1gI1L3f1K7cTN8TSol7otehbosyfqPr/riPaJbGbKQKmWZk
	xXbZE1xRPKC1fH7WuWjz6grmHUqkPPR3c4IjaQJKWptoIzZHWmTup5ilX4Q==
X-Google-Smtp-Source: AGHT+IHPr12CS2Y4daOOk8dV/yCcAsgmsW5q0vX0uEcyC3btpc5A8IYGXBIYtKW5ANJPYV2KuCnFcA==
X-Received: by 2002:a17:907:9287:b0:ae3:d5f2:393a with SMTP id a640c23a62f3a-afa1e1e82ebmr147651466b.44.1754966834344;
        Mon, 11 Aug 2025 19:47:14 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df08dsm2102645366b.60.2025.08.11.19.47.13
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af925cbd73aso953464166b.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfO4Ddm6bEEB6yZZaDM+qCljyFOf8/jQ6gcORmF5sRGqmaGxNuBeRzsjTmjAcHXDWKCbg=@lists.linux.dev
X-Received: by 2002:a17:907:d27:b0:af9:3116:e104 with SMTP id
 a640c23a62f3a-afa1dff94d9mr158864166b.3.1754966833478; Mon, 11 Aug 2025
 19:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
In-Reply-To: <20250811-successful-military-dragon-d72486@kuoka>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 19:47:03 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
X-Gm-Features: Ac12FXxQmXnuWdzEc4zTooah7CjD9hS5SJe3jLxjPY4eiFkazCpsluep9zY_bS0
Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
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
Reply inline.
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > +description:
> > +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sony,imx585
> > +      - sony,imx585-mono
>
> I don't understand this second compatible. Is this different hardware?
> Can you point me to "mono" datasheet?
>
> Your description should explain this. Commit msg as well, instead of
> speaking about driver (in fact drop all driver related comments).
>
Mono version of this sensor is basically just removing the bayer
filter, so the sensor itself actually doesn't know if it is color or
mono and from my knowledge there are no registers programmed in the
factory that will show the variant and model number. (That is why when
the driver probing it only test blacklevel register because there are
no ID registers)
Originally in V1 patch I've made the switch between color and mono in
dtoverlay config but reviewer comments is to move it to compatible
string and not property.(https://lore.kernel.org/linux-media/20250703175121=
.GA17709@pendragon.ideasonboard.com/)

In this case, what would you recommend?

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
  description: IMX585 has two variants, color and mono which the
driver supports both.

Something like this?


> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
>
> Drop all three.
>
> > +
> > +  clocks:
> > +    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24=
MHz
> > +    maxItems: 1
> > +
> > +  vana-supply:
> > +    description: Analog power supply (3.3V)
> > +
> > +  vddl-supply:
> > +    description: Interface power supply (1.8V)
> > +
> > +  vdig-supply:
> > +    description: Digital power supply (1.1V)
> > +
> > +  reset-gpios:
> > +    description: Sensor reset (XCLR) GPIO
> > +    maxItems: 1
> > +
> > +  sony,sync-mode:
> > +    description: |
> > +      Select the synchronisation mode of the sensor
> > +        0 =E2=80=93 internal sync, leader (default)
> > +        1 =E2=80=93 internal sync, follower
> > +        2 =E2=80=93 external sync
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [ 0, 1, 2 ]
>
> Previous comments not applied.
>
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +          link-frequencies: true
>
> Drop
Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml and
sony,283.yaml doesn't seem to drop this?
Just to double check if my understanding is correct, you want me to
remove the line link-frequencies: true?

>
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        imx585@1a {
>
> Nothing improved.
>
> You replied that you applied comment, but send the same.
>
>
> Best regards,
> Krzysztof
>
