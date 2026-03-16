Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEA3368B5
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678278; cv=none; b=kCQQetpeJYasDGhGGx4BF0+Eo0DzS7KznEZKjXVEIwAMZAqXY/YsDEpM93/uuN8WvKM7CcHB64xTKTmKgsLSbjpLHuMnirpW2sadTYKBNfsyz9hO0TOVFf+J8dAqujG0gnu+D1/w+QTbO+H7g1ne8RHgABGyGmNn1J0zCgqKaKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678278; c=relaxed/simple;
	bh=FI+pEJOl+xfO28oSXW6gg09R5wZ6B4Wats0lJ39KDRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScUISZdUbeWqLRUaDmMrbAS7UiJHJhk7pyAR7PhSV5YiDxBFnOs6qTNLj4F3GKuC+u6QOAiofMm1OA7NiySmq++7m1D+qMX+lbSJS/TkqP71QJI80GcHXOpf+9GIkMkOdNzVwgzdAkvl3uLpJLiyMGQ8fTbI9976luP7p1ilJdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+2tcJIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+2tcJIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6087AC19421
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773678278;
	bh=FI+pEJOl+xfO28oSXW6gg09R5wZ6B4Wats0lJ39KDRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z+2tcJImXtkYeNcZSosHOCTo6NjAjMeei2Ddq3BB5KjdCf6w62GGNVATGDe4rTr4I
	 ODSYaddfodEEZZ063e2UxJkV7xZLwEobxGqz0m1IiOYz2UEXDDMh78p0Kz/CAPcowK
	 cGRU0uk0cVRD32okUxpFvvHHM3YvsxCwLcz5F3kKCgHLhREO3q1RAgfTD44ve15t8z
	 Oz/+bQSFQhr3ULHRmtX6aY5ZXw8XysQOciDO45yBVShI6Fwvi7o2cYGkldMT0Ojax4
	 RS6/DuuaNRXwKotemX4AgQYRY3RZw62729x8z2N9yoqmOOfrjY97AMeLoExocJHcPh
	 e0RBvixgM5sJg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-666f73217baso411903a12.1
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 09:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+y8m8Cq5Te+47YiMzDaNd8AiG3RPed2cbCk6zzbeOyyi2UNuQ8KyNqFyweCNomkMgrhs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeMdUZDHScpEYFXg/UUlFniSYEdmQHi+nRTN2QNwlRD1fTpNy1
	zFGX0P2La8jLDe1v4FGygN4WCzBSAzcW0loMDg/7EMj7pOcg3NwCfI518ljEPLfVXiY+oM1UweM
	RdYPjyzRAlPFbB9OiV43FcD1S4lpV8g==
X-Received: by 2002:a05:6402:13d4:b0:665:57bf:7de6 with SMTP id
 4fb4d7f45d1cf-66706eea380mr157610a12.0.1773678276885; Mon, 16 Mar 2026
 09:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309200351.1791162-1-Frank.Li@nxp.com> <20260313233450.GA3632753-robh@kernel.org>
 <PA4PR04MB93666895F0D685181FFAF5DA8840A@PA4PR04MB9366.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB93666895F0D685181FFAF5DA8840A@PA4PR04MB9366.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:24:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Nw38mPHgZTTDMRY3zQ6NeOhp3PDvZobqwjdFy2HMitw@mail.gmail.com>
X-Gm-Features: AaiRm515QMiZFlZBbgAHua2Ztin7i7yfV9IvbR3MOhE5nRKlwuLZWSOHLGO-dh8
Message-ID: <CAL_Jsq+Nw38mPHgZTTDMRY3zQ6NeOhp3PDvZobqwjdFy2HMitw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
To: Frank Li <frank.li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:37=E2=80=AFAM Frank Li <frank.li@nxp.com> wrote:
>
> > > +select:
> > > +  allOf:
> > > +    - properties:
> > > +        $nodename:
> > > +          pattern: "^nand-controller(@.*)?"
> > > +    - not:
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              pattern: "^fsl,"
> >
> > I would just do 'select: false' and make sure all non-legacy
> > controller bindings reference nand-controller.yaml.
>
> I found some controller have not compatible string, such as
> arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts

It's there somewhere though the source structure makes it hard to
find. Converting the dtb back to flat dts gives this:

        nand-controller@18028000 {
                compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1",
"brcm,brcmnand";
                reg =3D <0x18028000 0x600 0x1811a408 0x600 0x18028f00 0x20>=
;
                reg-names =3D "nand", "iproc-idm", "iproc-ext";
                interrupts =3D <0x00 0x44 0x04>;
                #address-cells =3D <0x01>;
                #size-cells =3D <0x00>;
                brcm,nand-has-wp;

                nand@0 {
                        compatible =3D "brcm,nandcs";
                        reg =3D <0x00>;
                        #address-cells =3D <0x01>;
                        #size-cells =3D <0x01>;
                        nand-ecc-algo =3D "bch";
                        nand-ecc-strength =3D <0x08>;
                        nand-ecc-step-size =3D <0x200>;

                        partitions {
                                compatible =3D "fixed-partitions";
                                #address-cells =3D <0x01>;
                                #size-cells =3D <0x01>;

                                partition@0 {
                                        label =3D "ubi";
                                        reg =3D <0x00 0x8000000>;
                                };
                        };
                };
        };


>
> I am not sure if it is wrong. So I have not direct use "select false".
>
> Is it okay omit these dts?

Even if there are cases, yes.

Rob
