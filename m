Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046AD27FD51
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758649257; cv=none; b=aZoVBlk5/zhx/d8XKBAkaOKc2aKWV3fIghbqHY+Eddcm9o9CsbHt5Cy/NYA1EDBDq7RnCxGY5FZWLjqCA6PYV8FcNAOJSLuHjWTcmihRSzevlFltjcP0dmOHYfOzbjoWgVLmZK6+7/awsCpLgig1raBEwhOIWQU+wg2FeFlhqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758649257; c=relaxed/simple;
	bh=gnYeGB2B1v903Xtz4VVWD8MoJQwc4kIonn9k6NGquuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHm2SBY5o6avoM/uFngRHnwIljagycN7F9UJZk6jgVlwhZ71rQxapzJDs4xBmKWlDMael19dcNJPXUzcQlEtIrk9dGWuFjUUq/nsB+8MAWSZXZqQta+vkt8lwkUUmoO1v3z8dNNQr40YPhoAQycQbPy2RcihwYhOtZp0ptcZycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z30K3k2i; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z30K3k2i"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so8208334a12.3
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758649252; x=1759254052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKpIP4JHqz6cG4UOF6o0Lt4gug+UcA+CBt0Oa3txFso=;
        b=Z30K3k2i/GLRrR9+C9MOZfst84t7DVAwIYOXRUH+cVwo7mUcd7IZKqFWUrIf5GvkHP
         O2g9eO2mqDXPmnX4pEYO6Ro19ovh79NsOzE8NQK0zjJmNDXd79STJdEQFLrn3jhVxflU
         Y446tk2N8M3EOaUDe68OowKnzutrOcZkxxVQQJLHxvDsbhstgLeYctFxyk31Ft9DHOgP
         /IaHbmlfcoU/ekmCQecMkTPRTNJjS0pmpAQquzk/dUgNhU1bxmXluJ12Gl+/OAQ9mGZg
         trcnpkx0SoiSlYm9boVEECHYOg4UHIBrxGlWIpu4+S7PTdNSCbcQ6Eo3jiaLBkhUzvc6
         BVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649252; x=1759254052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKpIP4JHqz6cG4UOF6o0Lt4gug+UcA+CBt0Oa3txFso=;
        b=n40eRhVskFiG1V1U0NO1RiSBwIT94a0TF5wFVbV+yhqaezFn/n8p+Lx1oHqkyNu5CC
         T6hmJLXcxVqIrjXh09B5nQQXQ2GiQvQ48QklpYCjV4/n91hUfhiY5cVd/OE/CN0TbiHh
         93TwYTcZZcg8ByDiZJ7lBKU2MZmG3ccqhiMEguX5pdvxa1ksqEx+AW/8YONymKv1B6Y1
         Eqiy4bFYiEGuq7nL6mNtpX/bBfA3dBcmhY56cWNg1Un3KpMdHF2+7NjYUcc0I1tUPa95
         RD7eKf/hNNfBytHMmLudbpdI/58EtLnHPc3is+nffLeB6YqWDHV4UFqhdkFA1M8qZuaq
         M0ag==
X-Forwarded-Encrypted: i=1; AJvYcCV3uMNQsqUlfUyzvaoWK2p/4SlA96XPaDWGc10LfOykpTeNAHRGRaimRtam/S+sv7jT2ks=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNW8caTON4T1k2GB9A4JLON4QRe0vLYrUB/a2h+P5xpc52ZspF
	Mb4X30X1zqhPzH/0vfh7xt1eUI8bXfwIUH/kgA/uLxaA44oj7UPjwQ7lDMN4hnSTSimR2+8KgT/
	u2q7G7TfyQUpX6Q6Yt410FB69Atn5k0ziUcmWg6RNiw==
X-Gm-Gg: ASbGncsliZlr9vuYb5e3hYf/HO0+2Izc5qegiiAm3QPk10AmFQsj+/whOlVnJCFE2NU
	DKLgQM3g4KH1j2u0LSB8SIjFmTAlL2KQDTcyCfLB9pVDGmdyfunwfDHu/VG8mwfotijCnlmtCh5
	UtMyw8NX1Jjyy7F4UCHVtdpdzXm5sz/9XRxdWjZ01S/U8eDwV5MP3hwyGyc1hmnupU8ADXm+IS9
	BrOIuChcVW1+SR6YCIb5l5UH1szXUWjgERL
X-Google-Smtp-Source: AGHT+IGKj6Y7Rbxbcuv/p78PYY4VhOn0VuHWkuzF4bBzMgRnn4BUqA5lXuES789K8QEVi7gDnX95FchYWyP/N+Yb7J4=
X-Received: by 2002:a05:6402:42d4:b0:634:66c8:9e6d with SMTP id
 4fb4d7f45d1cf-63467a196c6mr3151558a12.35.1758649252279; Tue, 23 Sep 2025
 10:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org> <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
In-Reply-To: <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 23 Sep 2025 19:40:40 +0200
X-Gm-Features: AS18NWBNIKbQJlsVTlHAuM-w_iiTyLoHRH4gz5lC-pFfTqvjXuoI-RD55es6jyQ
Message-ID: <CAKfTPtD2MH9_xT+Fq4vvpGNMJPSkwh3CMaVCLRcNxrn_Ab7eLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
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

On Mon, 22 Sept 2025 at 08:21, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Fri, Sep 19, 2025 at 05:58:19PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
> >
>
> You should mention that this binding is for the controller operating in '=
Root
> Complex' mode.
>
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
> >  .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/=
Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > new file mode 100644
> > index 000000000000..cabb8b86c042
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx PCIe controller
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
>
> But this binding is going to cover only the 'Root Complex' mode, isn't it=
?

I was planning to add the endpoint in the same file as the hardware
description remains the same between RC and EP but only the use of the
HW is different. But it looks like I have to separate binding for RC
and endpoint

>
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
> > +      - items:
> > +          - const: nxp,s32g3-pcie
> > +          - const: nxp,s32g2-pcie
> > +
> > +  reg:
> > +    maxItems: 7
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: dma
> > +      - const: ctrl
> > +      - const: config
> > +      - const: addr_space
> > +
> > +  interrupts:
> > +    maxItems: 8
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: link-req-stat
> > +      - const: dma
> > +      - const: msi
> > +      - const: phy-link-down
> > +      - const: phy-link-up
> > +      - const: misc
> > +      - const: pcs
> > +      - const: tlp-req-no-comp
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
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> > +  - $ref: /schemas/pci/pci-bus.yaml#
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
> > +                  /*
> > +                   * RC configuration space, 4KB each for cfg0 and cfg=
1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr spa=
ce */
> > +            reg-names =3D "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                        "config", "addr_space";
> > +            dma-coherent;
> > +            #address-cells =3D <3>;
> > +            #size-cells =3D <2>;
> > +            device_type =3D "pci";
> > +            ranges =3D
> > +                  /*
> > +                   * downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x000=
10000>,
>
> s/0x81000000/0x01000000
>
> since the 'relocatable' is irrelevant.
>
> > +                  /*
> > +                   * non-prefetchable memory, with best case size and
> > +                   * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfff=
e0000>;
>
> s/0x82000000/0x02000000
>
> And the PCI address really starts from 0x00000000? I don't think so.

I'm going to check why they set this value



>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
