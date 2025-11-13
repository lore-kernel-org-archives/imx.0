Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99912874E1
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043564; cv=none; b=ObQ4VpvtJVkQNgHS4M2sKp4EJFexjqwj9duSWY2LBuNV6GPKQnuTa1FNM9eFjLIxvmMlH85LXY7f6ShHJzEtcSSvyt66JdvPTm8URojNdV/ytqIhFgh/7E+5RdPb0B8qlIslBS7ao5FXsVhpIR3RUXP7m7e+mHgjV8cLWEsmEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043564; c=relaxed/simple;
	bh=+60GxZqo7W68nBsBK+4RC1waiWGLnIxNTQPjNx2YCXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUIkIUJ7LBr96QFtlvggplIemC5jD0+1OKFZKyqrN2vOj9t1P9haus1OEjBWO5TaGb4UmMm6tE5fRDa4rEjK2tY4PNRVcg6C7dAgZNLbbkMmZ6Wy8ZU2kKaoafel/opXqQjEtMjmdopjud3U42yCrp0u88ur4DFIdZTujl+CF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueVxwfPB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueVxwfPB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso1427747a12.3
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763043558; x=1763648358; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gGk2esZ3TPP+U/Xv/QDaG4ohk1EPYMCao+ua5Ut7t0=;
        b=ueVxwfPBdynCgxWUZkf+1XvK9TuLjmqH/MgMpq+RnhuM3Iri3IXjdZgcgoKTj30Ovs
         4QyY2320obQZwcMre1Mz1H6VQEpwlkQIx2AQ21sH09w5pXd8BsVBKC8gJYg/0NO8R4YU
         73wcdl67Va41ddZDKXiCkqek74JeBIP+5zpkklHM1M+V9zLx6SUQL3dJbPqOzSShrJ5a
         IWA9pX/RjU19PRc/OMap/1vhBCENEv7N7zORTSRxuFqp9z9iEtpnI+vQrURZAiePudo+
         HsmjHcPKUU5aWUTlpBqqNxtPw6yj3y2NwV+dNs5wDY+FCSCfFw0QH13hne3rIER4wFiy
         2XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043558; x=1763648358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gGk2esZ3TPP+U/Xv/QDaG4ohk1EPYMCao+ua5Ut7t0=;
        b=byvShg31reianJDIjeW4buErPD2hWK9VtERSdFvoE3sL8cXGPP8aYU5Xm+KrkPg+Kg
         fHULlSTxaFMXUTV/5HpUs5wFJXFOJU1mzIzD8yxA0Zx5EXY+22hrPwuUYhgDnIh8o4J/
         trgPCmcRjkZBoJDIaGksipWda4Hojp9MfHGo97RSUFbRuruSDFSab+7VZO8vXQogAviw
         Xl+Iesp++irpVf2YnuQyaEYganT2AuD6jpzvwAdb1UibW9R6zPtomA18QVbRuu7iPsnV
         q0/VY0SsPhBXeuqA9Wn7YcyHv9vLswFsiYE3+voZROq6exFZ9lMCRrxnpwvkZJVaPgff
         wXSg==
X-Forwarded-Encrypted: i=1; AJvYcCVSaqdakrQ+53eMo40J9ATJlT0Zcg/cwVmgphTrQFcZV8507B3UaCypZHJ0jX0rRb9r5SY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYzO+padPi7mcLvC/DwEPfzEmmf1Oi8s8jno4ge2uvzT8DpTxF
	pJzz1J5klZzsNpG8qkSqawiuaoYdPNZmQne3A/21XQycs+QFe00h9K1Gw0jBrMDbf1YbP/gB7pf
	3rSpYoUmaPTcC6drdOqo2Sy4wKjIhPqNQ92ArbhiB4Q==
X-Gm-Gg: ASbGncu3XYwGwvip77ZrAVbtzDoJMmhe5VIbuaXUIE8xFU0gGKpjIwUIDzsWXfzLhGg
	KjN27ON1K6bqdaGR7mOflXdEZ3boIJLzGP+fKQtL8hDCFw1m7tLnCFKWZlZW7L+PBt958eEpkIC
	wWTNLAwbcpE7wQe+saqxKDmaJhv45uqPWDqi4Zg6l998tad/Snm/9LCPrNUnC/nHLK0/8lMHcIe
	dr7RsSnFHeH+1amBED1f7gcRkiVCqfDu27xzNQI3sJqDnEtehpZZAlm+0oGYn7zUzvhEIcI8APg
	wg5kiCMZhgXVZA==
X-Google-Smtp-Source: AGHT+IEk4ZuVDBz3u+9Uv4/zJfB1Emeu9cNMcz6aWafXiAHCM1K8SOZabMAhPk/X3XNWJIyPPXn256y5U9W+nbjKzzM=
X-Received: by 2002:a05:6402:27c6:b0:640:95e2:cd17 with SMTP id
 4fb4d7f45d1cf-6431a57e355mr5833525a12.36.1763043558031; Thu, 13 Nov 2025
 06:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
 <20251110173334.234303-2-vincent.guittot@linaro.org> <aRIn1COnQG6Mz27j@lizhi-Precision-Tower-5810>
In-Reply-To: <aRIn1COnQG6Mz27j@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 13 Nov 2025 15:19:06 +0100
X-Gm-Features: AWmQ_bn4_FBV_0kJ1ugPYoCrbCQQh9T4qf5dxZ1Dk01YEW7NuCgTcJxJ5cXExLg
Message-ID: <CAKfTPtBT6qT2zC8toUOEFD_ZkJPBMJgZrZc2NCAFSUXANYJ==Q@mail.gmail.com>
Subject: Re: [PATCH 1/4 v4] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 18:59, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 10, 2025 at 06:33:31PM +0100, Vincent Guittot wrote:
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
> >  .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
> >  1 file changed, 130 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > new file mode 100644
> > index 000000000000..6077c251c2cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
> > @@ -0,0 +1,130 @@
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
> > +  The S32G SoC family has two PCIe controllers, which can be configured as
> > +  either Root Complex or Endpoint.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>
> Suggest move allOf after required, in case add if-else branch later.

okay
>
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
>
> Need match interrupt-names's restriction
>
>       minItems: 1
>       maxItems: 2

Yes

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: msi
> > +      - const: dma
> > +    minItems: 1
> > +
> ...
> > +
> > +        pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
>
> put to one line to save LOC.

Okay

>
> Frank
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
> ...
> > +            };
> > +        };
> > +    };
> > --
> > 2.43.0
> >
