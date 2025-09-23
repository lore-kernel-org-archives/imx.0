Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736E5695
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638969; cv=none; b=k5LWLzY5SrvcEJkvlwBxSLvt6NLZdlNwrjWKIgjL9mzVV2ga55nNgdsHhIr3UTYSjNJ9u7g6+0uD8ml8GR+V1OJQBOl8rSCIkavgWdi1Acb9ymNDZiqSvUyTVTNkp0Tnzpm41jWLujmGXo7nHKDnOLPqafxlGZOES2D+FGbPpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638969; c=relaxed/simple;
	bh=ic044369QqtidAh8yfSu/u+g2qCbcTn5nkvJ11LGmK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRM6dICcjDTjtUKMcLvctuPqSlVcmm/3+td8dfJDjGMv3H7hos5Uam+Wx+eO+fEXlSuNYQhUIVW9S+H1ckU3MBe1rsROWKz6P6M0hZDegxsfDJCc/BE5UBbV1feJYoyv5mMw7rKQKdjrZr12XpGNLOZ6WUAjnJA7Fu4qFaGQrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7LEvcAG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7LEvcAG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e0513433bso298191866b.1
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758638965; x=1759243765; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y52Xkcdn7xk0ZUxLnhD94pTmXLnFSczNPfuhX4p80MM=;
        b=F7LEvcAGYob/A0I+bMGoseMtuna8NTPcj3o9LhcQ5dtkW4xEz9D8w9YI/zOBE1ehUR
         JRbHIl9czuKAupsteyi8MsBJAGuWl43pJqpp19CuAF7lyVucOdph6VPVCv7uJJH8HvvE
         pk7HGWAbRy4DpLhRgsYlI5/h/RQj1cBfXqu9VKvAfQ4+N+X7l9cFWupPx9nRv31kIIna
         3pb1jCJwq5bViqzB4fiy9q7Ago0pn04YkIDatolmIsNbAs7oRcnvy295Wt6+kS2Z+7tD
         4nqc8g69OhumLYSi3Rg8aHHDqRk/MFRK9v3J3EyiuqVS/aFkc3uW4VNZsSRWexYbwyxa
         ZqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638965; x=1759243765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y52Xkcdn7xk0ZUxLnhD94pTmXLnFSczNPfuhX4p80MM=;
        b=HTiqeioBiSgI/PljcTSX2dQNlkCHNVp25EXOAjoenwFYRHY9NVvKO1V8VfgEZrCezu
         DI99OynujAg/QYGc83ABAxqeAgpVNBwNr5LIBwetpbWRdC1HQv2E8vTyUD8tH1DA0y3g
         iWXjlB8R94soEEtYcUS1rm28is4fYAmFtcz4F3Y0rzOVkX91Qwg1zu0RwB7jnsNuo/E9
         9vq/DwdR2rDLcXZsGyyyGjt4CorUA4hl9GP+n1gyIHm75WOSmwQsxp5i+JvCZNYrOJ0n
         2Xi/tK39cVIGcxFnBqlY3q+fqlb9jdGiSwJebSubVBkyIf22lHjzKq5/j3WiSNJM0DQp
         vNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKbvbsOg4LotthwT/RA5aOtf8MazDODZcdMWomxo3gw5ymZL71aITBosJnT8FiGBglNPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YynjoSxeXzjSWF7kxYeFESmLgavccUD92Xopz8Kwpz2Z5hXTt+Z
	Uts0/mN2fMfMP87h7O8wEmggMuV7gEgt5yMAl20tYWvf6aCI/KcDZ5sU3klVxXrfYR6w7i7LNnN
	12PXNkJsJWGO4KQ+skcyxb2GzWF7dK88fasdzybjQjg==
X-Gm-Gg: ASbGncvUtZ0k3pctP9MOC9uCgUvdAOZsI+tblp2/IF/CltLIMHfkFwuAgsGNwCiuOQ2
	im7X9+jVBIPs4MCd8M0FMojW1LyfGw47ohf+tWSG+sCkOLI3XsSJ4EFtJljXi+2M2tnViejspbs
	bzAWPCnU7B3IXrS2O3OU9RH9v49IUJsvBNUUFVLIAaLPhZHE4heCVhblPkG0k7dWnxVrFb9BQwE
	oQ/4zBsQPjQutupHOcPwjABuHPVRU8XWXxi
X-Google-Smtp-Source: AGHT+IECKT9YZPD+FAdye+FerjTbLGMGSvvRtZ+Pjo4XFET+bb/b/phi396gjsk4a+Gepk9kfKc2SZh1oT+jOw9HvrM=
X-Received: by 2002:a17:907:6d03:b0:b04:2533:e8dd with SMTP id
 a640c23a62f3a-b302d29ad94mr253112266b.60.1758638964984; Tue, 23 Sep 2025
 07:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org> <aM2HMOvksD0kSd1u@lizhi-Precision-Tower-5810>
In-Reply-To: <aM2HMOvksD0kSd1u@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 23 Sep 2025 16:49:13 +0200
X-Gm-Features: AS18NWBnvH3cHGC78xNej_-VaL44m5KxupJlVq-5uA_Jq-oxSoNspDlHAQbMDqk
Message-ID: <CAKfTPtDadioUFDn2F5gJ59tYJD2owVZMZs9TNUBHk-2uuz0GmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 18:39, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 19, 2025 at 05:58:19PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
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
> ...
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
>
> why not snps,dw-pcie.yaml?

dt binding check reports a number errors and warnings with snps,dw-pcie.yaml.
In addition to the reg and irq names which I can't all map on the
snps,dw-pcie.yaml, it reports unevaluated properties which I don't
have with schemas/pci/pci-bus.yaml



>
> Frank
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  /*
> > +                   * RC configuration space, 4KB each for cfg0 and cfg1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> > +            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                        "config", "addr_space";
> > +            dma-coherent;
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +            device_type = "pci";
> > +            ranges =
> > +                  /*
> > +                   * downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > +                  /*
> > +                   * non-prefetchable memory, with best case size and
> > +                   * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > +
> > +            bus-range = <0x0 0xff>;
> > +            interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "link-req-stat", "dma", "msi",
> > +                              "phy-link-down", "phy-link-up", "misc",
> > +                              "pcs", "tlp-req-no-comp";
> > +            #interrupt-cells = <1>;
> > +            interrupt-map-mask = <0 0 0 0x7>;
> > +            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +        };
> > +    };
> > --
> > 2.43.0
> >
