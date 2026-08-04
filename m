Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A278343B6CE
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832173; cv=pass; b=fMSvj+LH2/0Plkcht8EbATG7/2RsbdnKh3e59Zh3LEl0FyNe8XXUydCQZ9q6LZRFmmKxFRwaFkMzcA7vXHb70/2sqh7AOfqKpEPZC9+YMX8rKsz05E7hxGJCb8T/IBVvEts7In1GFExW96IOfMcEDY+HaK4HpGN/d2X3V869pCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832173; c=relaxed/simple;
	bh=JbREwa63WRi45t2mfJ3BlRKqeRupdVkcEIbr80t1Rm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hs2o4YjI4R7Z/qJS1/1AhN1AFY+X94ymgPiKuz3Vv1nMeAmhBRcA+lCU6Rs04BG+pOphj2ggacbc25fmmDte+yeVYzO2ZsgdUQ+qmxt5xdB0RjeDkNj3vQ2nYiNFlnXtwZmQeN4gbTu9BzxAJ3fnYKZofD6fIxShtaaFjjTiTYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCCUYjhJ; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCCUYjhJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84864086bfeso4381301b3a.1
        for <imx@lists.linux.dev>; Tue, 04 Aug 2026 01:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785832172; cv=none;
        d=google.com; s=arc-20260327;
        b=BFIKpNHxFn+Q3Uc9bgj86o/u0XMWzzda5xid/IPclheR6izKB6Jr69I900HVHIJYvm
         XldmXuDC3C7Huo29yvCg1IJ/uFZ/ABNqGzf5qnySOIlcMYkGx/UFZgoHUqyVXCmKPk9/
         O+qFSkqlY3GinsFkZ5e7f+eSzCoxNFQLtiJyLkx8wL5pD5l2n0JXGUrlraVXH8Wwc9uS
         y+tgjFz965se0uvxGlaQOe+dwSajhfsHtDy910fH4hW+qzW/A1ZWAE9akYYjOAwd4hE+
         tOXY/W4J3cr9VjHN8GjcaMFMQbpfB//zy8srFyVLJ9MB61abHmrUS68mlu7IxM6mbf2k
         7pCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        fh=y/O1kVUxCGjwBWazkS3PMgznGimINXM2oOhkw+ejUGo=;
        b=VxYB5S77TKFh/7rtROZN3KBcAC9o+BKz5QBs+Zr5MS4w+palpKWtB5pXJYnfyTzWlG
         yT5dTh71nFHHqposUx5EcmfhTAoJW5bAKeeLhsRn4GLfPCdvvZt/kTa9hG6ybAW5NKOa
         LgcOHLFXc8Ei0EC7IXJOYpwdg/UvhSMq/UTVUDICtBm/6Xppj66adYurbtznS4OwEXB0
         +pNxKJUZhjJ5h61uKgJdga/CKvDeg6tzkuqiCKUBo+BVWshZuLH6VoMmVMgrioipgPfH
         hKuzZVtIpfmcCd48dsr+KTxWMTPcm1t0JKFATCyEyRNTalJ9hu42BcUTM0ilFbzAM5ne
         armw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832172; x=1786436972; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=ZCCUYjhJ8gYGaIy1AmYvla1YBSXFLK06q5bFTk0ozBx5db8XXIxtUc5uhrrKJ+y1/2
         CHWursDmXiQWXkKrBawAG2cARIvamPStX27jb14o2BhCH8CTTg9nbUVlc6vEGRq9cndG
         G5LAzkVKuU3g+wLSWI6ZHWb/FCTu9ecdzgW6E71IEmbI4JIeuD74vw4fmkhq/rydu+PL
         7stIG1ikqUWslk5airNql8QeHn2Twt6Zr+tT/Qrg+peRxIkCZuiJGWsYJ6LHbaDvNYCw
         EboOtFntrpHf+DZSfCSQDY+Zilp7CVFaXfaG4KLozaDbf4795rd9SI2p3ipuR/18vRKR
         Cp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832172; x=1786436972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=Ai5RImZKNIqSJYqK9RD9F+X9ij0EC97Fh74RVrUxz2viIBftOaF6EFfiRyaLlcL8dt
         +kytrPosplZonKhqpr1HAoXgB8zF4RHgckNM7LSkD+qPK2b9fs3cgXoJDOnOPPcq+gtn
         662dbe0CUTILqg0as09oL8LjXuGBt3m2V4NUfkQHmYTtVJfUXx1ok9kvSCmMpc9+LhNL
         wgtirPcUha1dPWFu3XRQM3clY7oeKVglcykyQt2U4+iHbK9z4mCle+KtImqkSpvuXGIS
         a9CLXdKJGTF5WmLQQaJuPRHHE04sQ8coBgIgYuPIInurd6tWCcvpG0ULG472jCoC2QTM
         a7gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD2GlcF1+34vuIGtSxJtJif1vrcvCCN6biMrX8rGrDqvA1ib/8Q5Wc0OjEAE8Y4EtEUwk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN5TmRieIlci4HlvO/6FkXUlG+WNVhKNx1xOwz/C8mWHWW+W6B
	pk6lzkfnDruroL9VKiFwZT7MZMqNclsjZ99qyNYiT5F668Tn11WtMx86cJutqBbl/J+MKZlkECH
	KjEdxI79tuL7ecdPesF5Orp9n/UmoKvA=
X-Gm-Gg: AR+sD10wtAlQZpIQq9W+CjktOfnfPYKZq62SUYNepmHbONFxuMX32otHHcHK4L+ay6R
	EpPv5wYEt3AE7pH6fsG6ub9kaSfg0qZXGlOv241s40eEr7utDPZ+WBp8Ikflt1U8+3zrLocr0Vd
	BtZeg5++3QT1R+HcpkP3OK/1vce6XlJaklSpcBNfmPb9LQcfWrdYPp0LJXWe4lG8kJNsWDJo7v3
	ZljQ4pHD0aqtmZXYjQQ5UX1fEs7rLht2Hvg0aKM/djk+ei/Vz70nu8i3GLr2a3LHk3uGchuEFhd
	okeEJDehdmD1mXQLLiUBqhNjzjgASmdKSwyn2Q8dIlDQFS2r5Uu0kSI=
X-Received: by 2002:a05:6a00:8d2:b0:845:e2da:91a3 with SMTP id
 d2e1a72fcca58-84ee480ae81mr12824134b3a.30.1785832171759; Tue, 04 Aug 2026
 01:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <20260731225930.GA2098187-robh@kernel.org>
In-Reply-To: <20260731225930.GA2098187-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2026 16:29:19 +0800
X-Gm-Features: AUfX_mwxExGCC8sRpN6-vbVB9v8CNcSex_SykavnhYOluP_E46GIp0w8aQWy9oQ
Message-ID: <CAA+D8AO1D6GJ8xwuKf797rc41ymTZp2d=LD8GEQALHhdpToCUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Rob Herring <robh@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 6:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
> >
> > Add a ports container that enumerates three named sub-ports:
> >   port@0 -- pair A
> >   port@1 -- pair B
> >   port@2 -- pair C
> >
> > Each sub-port references audio-graph-port.yaml as before.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. Update the examples to
> > show both the new ports form and the deprecated port form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..18d252722aa8 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,29 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair A
> > +
> > +      port@1:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair B
> > +
> > +      port@2:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair C
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +145,10 @@ required:
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
> > @@ -188,3 +212,57 @@ examples:
> >              };
> >         };
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +    asrc1: asrc@2034000 {
>
> Drop unused label.
>
> Presumably the existing example uses the deprecated 'port'. If so, just
> modify it to use ports and drop the deprecated part.

Ok, I will update it in v3.

best regards
shengjiu Wang
