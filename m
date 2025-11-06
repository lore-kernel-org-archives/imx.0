Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E73002B0
	for <imx@lists.linux.dev>; Thu,  6 Nov 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416556; cv=none; b=ETYmt/bU6CGgaJUL6RAV/droJoCuqTy0wD8jVyLz0fqJB6sWKKBnzyBOtq7TiERip5DbM9gSObOucs/NBUYyG7V8TooW76rIjkrzLcFWFGJD1APwsfXnWYkvErwHv55OgMqTb4nxkvOJQO18S/te0UAFMT/Pm427dsKfODrBp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416556; c=relaxed/simple;
	bh=lRfiaPilGCbrJdjqrBIGDPtcN225cI7Hh21G5/DO+Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taSxH+8YF1114Y/QXGDoPz6kgLM6ZoFKxpSRswO1vrFqbgE7fW1b78Eun0u+xGsakqZlE9fhzah5o1kxT9/fIrnuv2+BrZ++2lmgxZc7LaUsnXmOC0xe9gNXO6l6IudoiBex2KkoK8D/RyeyNWIpoBHG4sDEwkXWFZYlNtR1wFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTVugf2d; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTVugf2d"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso1311223a12.3
        for <imx@lists.linux.dev>; Thu, 06 Nov 2025 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762416553; x=1763021353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqG4Vhl3gJVR6ZhqmKUIStjnvxpVzC8nlU32UMscO8w=;
        b=bTVugf2dX5E0m9OyRLY40/CxxzxICsyEBLn9W2GV77fewfyBofw3Wdti1zrX4ZgW6V
         QR6fyg4+vNzNir6ua/8Q0djWxaOKiU+PP7YxIoA7WdTm5P/SLdn1FicZo8Un9Eer4qoQ
         7wOgyyTE7ershsVJZEzGvSf85mzNL44P6gGVdCduJLpI6NdL5DOj74k1pEKNv+Fj9gG5
         GaIegFhX15lCWCZQ9jnSS4lywHq/mylXIu/TlXWDa+/cgMUK6xjPYhQgW5ZtOBxNJop2
         AmRK72EgyFo7OSh8Mynnf5LSWQ8cyPUicm/uVkiEeFTnhRRI03VOJXkT6mw/u5GyUuFO
         YS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762416553; x=1763021353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqG4Vhl3gJVR6ZhqmKUIStjnvxpVzC8nlU32UMscO8w=;
        b=pJZ2NwSGJnhnCUJfaniwzFPiP3HDi/p5jcdJZmSid4/rppc90Vy1+QiqyX+l54VYXO
         1QLsKyP+d8E9qw/8kOo92CMtQOnyJxOaeXO23z5RgDZb4Ewgb7tu5SRRpq4d0SQbdncF
         fD7vbgH6Dv7bb5SFHIU9vDvm1yfBal62ivxY5siWJDdlJyP53y4Lq6s6WvOzl5jB7aCa
         u+jhvRG1TfJBgAdIp9hlVfDui1Qk8p/W9mAnyrLca5dz5XQU1+pF49vSb/MEqjxqWfRF
         dYX8AyP70Bn4fbcyWQXHYUA+xCKUfkbCmSfTLqgL1LZj//nHw7JApg2T112AQdcOb0qx
         32ww==
X-Forwarded-Encrypted: i=1; AJvYcCUqVjCDNCu2y6aiqRAX81zFpQFc0vGDToqYPqz81wUi9IxHue+lLpTm/F2BnASvqXoFE6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YydSaW5Q5/EcfxMxQggkizWKGM+wZXuZBCqZkc+ENYrG8UDRXLT
	WLbbv3atPLF8IpxCkpmgnA3sSJZt8Yi1JV9ByTfj5VDSWirK2V7sGlidnwmF7I7BD/QYUPSDflL
	7uE+wlNgqqXlpHi9b3WSlgVLfIspMWcV2MD9LhKWk6w==
X-Gm-Gg: ASbGncvfArH/JxHtX6ZtBHx+7+sqMoEScdmpN/t+V2G+5Qz0j6xDWFEt7H7xoVV2lG5
	PPgOGGFiB0GtR2Ld0ID3C0wbVz6l0JSFwGLaYjTuYCGQHuANPZ3AjMhdUgZYTNSQdg4wx11PEK0
	l8XEAB6rEslFvGWBKiH8wH3SDus0cJyQFCm8UOUa+v0i/ghvBnIPM5RWD/sy2o8zLaG0eo/OcMp
	rQKQiNhaC5DrvENQmCZ2rHr28K2msGXl152/ch2eWRYPzSoa6fxrw1HHTh44Pgn8X+tHQCK
X-Google-Smtp-Source: AGHT+IFpGXTLSElm/iJX28AkNKWJysbi+VSdMAhhXx+DpEVvXomYFy1/eZ4xIzIhBa3g0OBlHb0wiAGdwqeYIeUCjdY=
X-Received: by 2002:a05:6402:3508:b0:640:c779:909 with SMTP id
 4fb4d7f45d1cf-64105a5c833mr5111127a12.27.1762416552602; Thu, 06 Nov 2025
 00:09:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
 <20251022174309.1180931-2-vincent.guittot@linaro.org> <6k5zdhbhtqg2dghdm2bkbymr5rwzcowziaahfdvgw4dk22y43y@npsrperinzue>
In-Reply-To: <6k5zdhbhtqg2dghdm2bkbymr5rwzcowziaahfdvgw4dk22y43y@npsrperinzue>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 09:09:01 +0100
X-Gm-Features: AWmQ_blssT-7N0Jk7hsjbSupnpo_HEbqq26DIoOJgn8hufRZY427ml3fisK5oFk
Message-ID: <CAKfTPtC87w7RVSDAXWXRX1sjgo4s=_Z_k62+mfTXrMZwmkEpFg@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 08:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > Describe the PCIe host controller available on the S32G platforms.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b=
/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > new file mode 100644
> > index 000000000000..2d8f7ad67651
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
> > +
> > +maintainers:
> > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> > +
> > +description:
> > +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> > +  The S32G SoC family has two PCIe controllers, which can be configure=
d as
> > +  either Root Complex or Endpoint.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-pcie
> > +      - items:
> > +          - const: nxp,s32g3-pcie
> > +          - const: nxp,s32g2-pcie
> > +
> > +  reg:
> > +    maxItems: 6
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: dma
> > +      - const: ctrl
> > +      - const: config
> > +
> > +  interrupts:
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dma
> > +      - const: msi
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - ranges
> > +  - phys
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    bus {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        pcie@40400000 {
> > +            compatible =3D "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            reg =3D <0x00 0x40400000 0x0 0x00001000>,   /* dbi registe=
rs */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 register=
s */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers=
 */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers=
 */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl register=
s */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space *=
/
> > +            reg-names =3D "dbi", "dbi2", "atu", "dma", "ctrl", "config=
";
> > +            dma-coherent;
> > +            #address-cells =3D <3>;
> > +            #size-cells =3D <2>;
> > +            device_type =3D "pci";
> > +            ranges =3D
> > +                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x=
00010000>,
> > +                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x=
80000000>,
> > +                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0x=
fffe0000>;
> > +
> > +            bus-range =3D <0x0 0xff>;
> > +            interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names =3D "dma", "msi";
> > +            #interrupt-cells =3D <1>;
> > +            interrupt-map-mask =3D <0 0 0 0x7>;
> > +            interrupt-map =3D <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_L=
EVEL_HIGH>,
> > +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEV=
EL_HIGH>;
> > +
> > +            phys =3D <&serdes0 PHY_TYPE_PCIE 0 0>;
>
> PHY is a Root Port specific resource, not Root Complex. So it should be m=
oved to
> the Root Port node and the controller driver should parse the Root Port n=
ode and
> control PHY. Most of the existing platforms still specify PHY and other R=
oot
> Port properties in controller node, but they are wrong.

Yeah, we had similar discussion on v1 and as designware core code
doesn't support it, the goal was to follow other implementations until
designware core is able to parse root port nodes.
I can add a root port node for the phy and parse it in s32 probe
function but then If I need to restrict the number of lane to 1
instead of the default 2 with num-lanes then I have to put it the
controller node otherwise designware core node will not get it.



>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
