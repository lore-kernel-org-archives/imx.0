Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA484E1B
	for <imx@lists.linux.dev>; Thu, 23 May 2024 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716505505; cv=none; b=ggBFAzJO3DJHzTOTNOeiVJdT8fyQHGQuUETnpZoyS5IrYLFeZYq2oXQ4eZVhWI/lNSCqw69iDg40j3GGtsJb/ScIe8zAN490s3uFoRx9H/W03g6PZCs0do2iV7rrStmFZrX6rnUdMGg0RRsMZQJbU1Z5WysJwyeMCgGJSf26I7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716505505; c=relaxed/simple;
	bh=BHiJmgEBa1gvLNWntn5RfkJD/TJ7EaO5QDPUeZlRx5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGjasLI+OADzL6bNgshD4Na9p4eLpb5csaKi1ivTK76bB7eWNRDQCWx+oklve2z88X2hAbPEENQ0A8CdkoOXkV3lUlt+PzGOz4Y6fy0ppF65twYxZmXjyHCSvDUuTVfP792EKruH8IPuYTZIPDSgyrYmSc5CwWuopZr/aqZjIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=kT4lZezg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="kT4lZezg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-529644ec0ebso272108e87.3
        for <imx@lists.linux.dev>; Thu, 23 May 2024 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1716505501; x=1717110301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNpjFzKLRaM/fVkxEdNIFaPzfJ+DbE01S4ZDfPlVfB0=;
        b=kT4lZezglGYqLFJ/PXfEKRioJ5732TEOE2WZH+pqoiaaBnFc8PixADkIVrSmesytZ+
         ScYaTheHcEFEak8RwOcOHqFthnurA+gYUheazINpSK89R4pIAJA2edO/rrtb7iMHktY6
         +wvJyew9gOQnWmFW5KZXc+JOUG9xi4mtlxSXqO3cnH0dhEU2ZiypiY3MKOfrG7QqjnYo
         RdEkjvw3p0W70gp3yrbyPbQHUVOnk6RZla6epv6j6tc/Doatpq2o6f9XjNx2AZdx3F8V
         z1wS5YhGMFaJdjC4kcxv17GRzKOXRQ+P4ebYe2jjl/TfK4n/+6sEjq+eX+6UaB2pIgfH
         7obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716505501; x=1717110301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNpjFzKLRaM/fVkxEdNIFaPzfJ+DbE01S4ZDfPlVfB0=;
        b=fdC7oIpZEp8bBMeMxeBQEebHv9emy+KWF5JuxmtgiL/8kXPE/EoOlOvUX/OE7XiCov
         4BcKhO5+l8Y4/kdEjXwG1wNLrgrfz74GZmoVp8kRY7pT20GThD4xpnFL7xb8KVNKXuTr
         ju5NCnMGP/AruLlt4MT19DJc6J3bHGf/HTJc2VlMNi37AtBtQ7yjKTLmVGYNDH/JorU+
         LYfxNxzWijzD/EW3zvVdnOO33KrVKXbxfBVHo1opfyRgNurLwRVkLzawCq67JjchDCqZ
         HQk5TfO466wLi7WYyG4L1L0zTezFq6TGO/97Vz7AY5a9AATM7o8W5KKHyV242MFS6s3F
         BvwA==
X-Forwarded-Encrypted: i=1; AJvYcCWiS2qK2cfv5fgH+muKS5UH0gB7Q+WXDQeodGoUhgAYphG8/6LgARV/mENO59+gunbsdMzVINVa7r3PR5+x05RiBKAl
X-Gm-Message-State: AOJu0YwPoZHfBBU9GAxgYcZUH8oLgcwBaxJ1ejs3ouNtCM68a21f8xCm
	Xr2bLUlgwPT5a3YSexeYfbDRQwuYKJIOVUL9FmSU4srCVVD2hcwnutxIHRsib5rxnhaUeZWe4fr
	6QO4//oQzYP9gnjuZjKAMWWugBWi3B8t6LxUFRQ==
X-Google-Smtp-Source: AGHT+IEmckQyii9d5h+3SwFO5raoGBU1nq40RxOH1XcjOxKLm2r5qPhAiY+i55UsHnYaFQnU8ydp+dzH7XdOV3iZv2I=
X-Received: by 2002:a19:7008:0:b0:522:3487:3f3b with SMTP id
 2adb3069b0e04-52966005c1dmr291285e87.36.1716505501582; Thu, 23 May 2024
 16:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
 <07250029-7cea-4a82-9e70-22e0e6f7fb37@linaro.org> <20240523-vividly-sequester-d85ac7bccbbd@spud>
In-Reply-To: <20240523-vividly-sequester-d85ac7bccbbd@spud>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 23 May 2024 16:04:50 -0700
Message-ID: <CAJ+vNU3fQt=6t3a_QFU_3jb5mTVLGJiptPnGEmWvvXZYGEPOFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 7:47=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 23, 2024 at 09:02:46AM +0200, Krzysztof Kozlowski wrote:
> > On 22/05/2024 23:50, Tim Harvey wrote:
> > > The GW7905 was renamed to GW7500 before production release.
> > >
> > > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documen=
tation/devicetree/bindings/arm/fsl.yaml
> > > index 0027201e19f8..d8bc295079e3 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -920,8 +920,8 @@ properties:
> > >                - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 EVK Board
> > >                - fsl,imx8mm-evk            # i.MX8MM EVK Board
> > >                - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
> > > +              - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board
> >
> > That's not even equivalent. You 7500 !=3D 75xx.
> >
>
> > >                - gateworks,imx8mm-gw7904
> > > -              - gateworks,imx8mm-gw7905-0x # i.MX8MM Gateworks Board
> >
> > Compatibles do not change. It's just a string. Fixed string.
>
> I think there's justification here for removing it, per the commit
> message, the rename happened before the device was available to
> customers.
> Additionally, I think we can give people that upstream things before they=
're
> publicly available a bit of slack, otherwise we're just discouraging
> people from upstreaming early.

Hi Conor,

Thanks for understanding - that's exactly what happened. I'm in the
habit of submitting patches early and often and it's no fun when
something like a silly product name gets changed and breaks all the
hard work.

The board model number is stored in an EEPROM at manufacturing time
and that EEPROM model is used to build a dt name. So instead of GW7905
which would be a one-off custom design it was decided to change the
product to a GW75xx. The difference between GW7500 and GW75xx is
because we subload components on boards between GW7500/GW7501/GW7502
etc but the dt is the same.

If there is resistance to a patch that renames it then I guess I'll
have to submit a patch that removes the obsolete board, then adds back
the same board under a different name. Shall I do that?

Best Regards,

Tim
