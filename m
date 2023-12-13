Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B912E638
	for <imx@lists.linux.dev>; Wed, 13 Dec 2023 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-591553d3835so420299eaf.3
        for <imx@lists.linux.dev>; Wed, 13 Dec 2023 06:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478177; x=1703082977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+KCX3VeG9RylsCC1YNPXKBKpJf6ejqEflv5vOYcrLY=;
        b=nkozlbF6bAr9WcSW9CwE0fj6R2LO/JJZtYHZ7ymJuBCdCwtaxUNE2G37kme8kX7Lll
         L9nscS6ZzsuZypmho89bGf/Lz95XaigRAYltSZ5KaxBAvrio3YRUTZXR/fPFzmoi/xGy
         /TGj8v+nL8J4CzA7ru13uI1bZLS7+Udi9joH+XWwyfTmk1/FXKb/e+rrN/hYwOErrCYA
         5ZF7ufjcNfyOE0chwbxrPaZlHRqoleuAh9cqUTQ1nHhjxfmlcyTk/7BaFA/n71dht8xv
         WVIxNkp+U38mpWtPqAnO9YeaY4rpc2A01GI0rQ7gcdKpalbkRNYCARJ9vrjQcRWZKuqe
         wPkw==
X-Gm-Message-State: AOJu0Ywv7t++iCugFJMNJtAV2rWwyUngNDm/OZTsXn4bwvw3m0LTh9TT
	deH9FkZ17/YGT8SP7AWjUTFEuWy0rQ==
X-Google-Smtp-Source: AGHT+IFfbdp0Fk0iljZhPsJrTY/juF09ZOPbQP2s05SHQ+lFCWp9SR9xRORHjmc2ElZiVPN97gPIeg==
X-Received: by 2002:a05:6820:287:b0:590:673c:e284 with SMTP id q7-20020a056820028700b00590673ce284mr3736085ood.10.1702478176998;
        Wed, 13 Dec 2023 06:36:16 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x8-20020a4a6208000000b0057b6ac3922esm3043883ooc.18.2023.12.13.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:36:16 -0800 (PST)
Received: (nullmailer pid 1097845 invoked by uid 1000);
	Wed, 13 Dec 2023 14:36:15 -0000
Date: Wed, 13 Dec 2023 08:36:15 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, kw@linux.com, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: imx6q-pcie: Add imx95 pcie
 compatible string
Message-ID: <20231213143615.GA1093782-robh@kernel.org>
References: <20231211215842.134823-1-Frank.Li@nxp.com>
 <20231211215842.134823-9-Frank.Li@nxp.com>
 <20231212224426.GA2948988-robh@kernel.org>
 <ZXjsq2QtFa2V0BAl@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXjsq2QtFa2V0BAl@lizhi-Precision-Tower-5810>

On Tue, Dec 12, 2023 at 06:28:43PM -0500, Frank Li wrote:
> On Tue, Dec 12, 2023 at 04:44:26PM -0600, Rob Herring wrote:
> > On Mon, Dec 11, 2023 at 04:58:37PM -0500, Frank Li wrote:
> > > From: Richard Zhu <hongxing.zhu@nxp.com>
> > > 
> > > Add i.MX95 PCIe "fsl,imx95-pcie" compatible string.
> > > Add "atu" and "serdes" to reg-names.
> > > 
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > > 
> > > Notes:
> > >     Change from v2 to v3
> > >     - Remove krzy's ACK tag
> > >     - Add condition check for imx95, which required more reg-names then old
> > >     platform, so need Krzy review again,
> > >     
> > >     Change from v1 to v2
> > >     - add Krzy's ACK tag
> > > 
> > >  .../bindings/pci/fsl,imx6q-pcie.yaml           | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > index 81bbb8728f0f9..b8fcf8258f031 100644
> > > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > @@ -29,6 +29,7 @@ properties:
> > >        - fsl,imx8mq-pcie
> > >        - fsl,imx8mm-pcie
> > >        - fsl,imx8mp-pcie
> > > +      - fsl,imx95-pcie
> > >  
> > >    reg:
> > >      items:
> > > @@ -90,6 +91,22 @@ required:
> > >  allOf:
> > >    - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > >    - $ref: /schemas/pci/fsl,imx6q-pcie-common.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - fsl,imx95-pcie
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 4
> > > +        reg-names:
> > > +          items:
> > > +            - const: dbi
> > > +            - const: serdes
> > 
> > Did you test this? It should fail because 'serdes' would need to be 
> > added to snps,dw-pcie.yaml.
> 
> I run "make dt_binding_check DT_SCHEMA_FILES=/pci/", no error report.

Only because you have no example. What about your actual .dts?

> And PCIe function can work.
> 
> > 
> > Is this really not a separate phy block?
> 
> This is misc block, which included phy and also include some registers
> about SID for each PCI devices. I plan do it later.

Sounds like it should be a separate node and use the phy binding. Do it 
correctly from the start, not later. Later is an ABI break.

What is SID?

Rob
