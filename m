Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85063DE43F
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913097; cv=pass; b=rxg5S7AO6NPNwMDDhrZUnjBvcCuflRRUOEzbiZrMeg+Vp5YEjU2Pl4Ru7FmyeWsPNFWn2bGu3FMfirQiBX+ngMpc6zrkKIgzyTybkeSCRzokm9+vziMo3S9Olgb4GjONyUbF9cur9eqXr1Na8+9sZX4iVqQ4GHTDEgF9u4fioWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913097; c=relaxed/simple;
	bh=OsodnEMx+zgh9b3FFSBCG8xEUSroGixsC/QWoJUzxBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDjrEKWg7n8j4S8IRLodk7bYWOcvKr+HvbNvHvB0siftVbYGOL9+BJwFrGeVz/K83TjfCbFyREb6EyFSzLoy1vYPI5VHvX2lv13B8iss7VzlwqPZRdyS6jEOKWFGpIgj9q/55qGEn9Onks70T/YYdUrKlUHRplAvw0MlvlL0XkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI/mNdn9; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI/mNdn9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfff5f88dbso9984535ad.3
        for <imx@lists.linux.dev>; Tue, 04 Aug 2026 23:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913093; cv=none;
        d=google.com; s=arc-20260327;
        b=dVnE9B4tGIt7/4kb5vAf/g6nw9VvXxchCzjmmNugoyG0+u+isTqhNcb/xJOWSo/mFy
         0NiOlVwacJDfZ2zL1ZWZjNjWvMai86VBIRW6z8gtf7+GewiO8JiyNkr6fAjBu7zFv2Hk
         RD1NPXCe+aeHXCXxnE//osZG5IhqnNGa0tj4IOeht73p2ED3xpntXD7X6g0vlvfF3JWp
         pLX75a0YyZpSYVK8U23LR0iLPKJq+ZA2w8+od0rxXa1pETCG7clAChltXA5fn7+AEuw+
         s0l7y2fJzhAoYSSAImMbVDOZp4JMtP4pGoFCAvWmld44M6lfAJlPEKPrjqRGYt1CZX6P
         Uhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        fh=GzvDLYjsbu1EHd1z3JVsXkyj4S2QDPdVu59/JtlHiU8=;
        b=CNxpaEmUc5SKpbtnYBCQjgaiHjVqiRhs4AFGRyqwwklREes15+upFo+t4vdATtfxD4
         b6EvUCCwTxvxUCX2dwzOTmTYlO+sPvTe1c9T2WPIuQXkJcVGBMMmgAwqInLIOquPV6Bw
         GH7FmhA1PQDT47dRUnsaRTy8fKZjaGEIFWcj5PDBWQnGvwl3Wgrw2y6RcYbPkKhKlM6i
         TgvfdnDpA/ty+uBKeTrJ0J1mJBzt/q00gLT9Tusor67OGjgAxRDmLj3iBIn5B/OaY422
         sO7o5rFXRZw7UG92/WWqU2BMGScEw9fU3EuPF61/dMRv6uaXMl5Q/Glf/SDvJ2B9dOwA
         dJ8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913093; x=1786517893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=GI/mNdn9W8lMnPevc/As6H2b6JzBpIc4sHSdkvjhYKTmfNISffz8AAK1hLZ2/sBR15
         TFeqYJN9jZI5NPf1GVAtX81Ne2O0eIod1lAJ9MngxyvX8OnkS7UJ/gGvlMXalm/1zuKZ
         cMDPoM2FV6o+xSbrJx0gUGhkzV/MRPTpMBnRtHiiaD0SDJNXKFg2Iaraw7K5xz00AVHM
         1PMuqruFYgsm7Jt8LTWJySy4RDBibNXcP1ucfOxM5GnfcAf1wYhX5jJ9fcGxY7WNAoaa
         o2CIDpdf2scxJQm4vD0yF/voCNY8wZwN5i5P89o4FXvAy/nnwVZgO/SKc56RAfxhOMIZ
         VnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913093; x=1786517893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=OK7ag5dI2VC9CFlhfOutuZbajaP/gR9L4V6Amoo6wZ1jmp7ipGZvDIlqTnUi4PqGCl
         VkD4tGlROFatiSdBrFIjs6PtHTzhP5IOKgdHEU8d4nEeQHv5yDx0Nc2h3CXMo1TrV9u7
         HUYp6VVuEu0tlUqssbA1mz0oMoyn3N922Ce560rle9LKNP01Dj/SJ914GKjZRcfWq71u
         gVtvYgTQMnElL4LZW+nwQCzvIFBtqZYU/rmBuz6CtN1RNkN5V81PZ3A/8c3Bb17o7r0F
         LjHQzLzcWnXoxLXVWJ6wsFpuY+ED85+HDnAsJh/OqnoglHMpHQGKyncUxoOt75w6tc8f
         4WsA==
X-Forwarded-Encrypted: i=1; AHgh+Ron1NMdIXSLGtseTx5sXisKECHcraZS7hoROw6LSGqZtGPI3gPhFIQJvFvg7T6AdbakwF0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEaiL2ybyz2PX8BjVELNK4hsV51b0URPqWiW496eZ99yx7BdbK
	NZ+mh7BO1KMijbNiAco6dgOezVVk+2lo3Yi8Wfd+fOb0nEL7fu7bPh1oE6Pii6Rvf36o0kmuhjR
	OWSmeTgrRBcR8yVB9jWps+oDMIPq6Lak=
X-Gm-Gg: AR+sD13Mmdd/SqGCI5EYFC1WMzLOW+/vkcGhg433u6QfFvIDee6HY/V0NT3Lq5ctFk1
	zcjSZr2UvrjbWbeF9b7xh1eCq9nDmaekiUtyQNovuS6VEXCNd8A4ovHbQRN64ezD6xbLct/EN6P
	IXcfFv44SMiWmfljavBe3215qL/NWyqt+ELAJNBuiaTjwGX/c58sE/jBButPKRRP9pvUoAB54Ec
	IDBW7IoLEITjTkUOV8EQmht3P7iZVvkylJURqgCpDP5AvTLlSRVdRjXqpRGbzcg50cNcLGvuetJ
	Vm9W45mNlhnje61jhmPIP1suixx+ogIBpfnSUt4TrYEL
X-Received: by 2002:a05:6a21:3a48:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3cb85df12ddmr5759243637.2.1785913093306; Tue, 04 Aug 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Aug 2026 14:57:59 +0800
X-Gm-Features: AUfX_mxtqJzMX_WVEhniuKHoKxDYIHB5iQVu-6lJu_NKLxZB1goSegJJZEResBc
Message-ID: <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> if no existing upstream DTS file use it, you can direct replace with port=
s

That is to avoid any downstream use of the 'port', so not directly replace =
it.

best regards
Shengjiu Wang

>
> Frank
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..67d2826eef3f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,19 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    patternProperties:
> > +      "^port@[0-2]$":
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for an independent conversion path
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +135,10 @@ required:
> >    - fsl,asrc-width
> >
> >  allOf:
> > +  - not:
> > +      required:
> > +        - port
> > +        - ports
> >    - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> > @@ -180,11 +194,32 @@ examples:
> >          fsl,asrc-rate =3D <48000>;
> >          fsl,asrc-width =3D <16>;
> >
> > -        port {
> > -            playback-only;
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                playback-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe00_ep>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe01_ep>;
> > +                };
> > +            };
> >
> > -            asrc_endpoint: endpoint {
> > -                remote-endpoint =3D <&fe00_ep>;
> > +            port@2 {
> > +                reg =3D <2>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe02_ep>;
> > +                };
> >              };
> > -       };
> > +        };
> >      };
> > --
> > 2.34.1
> >
> >
