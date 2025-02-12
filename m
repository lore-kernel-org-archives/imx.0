Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9891E0B9C
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332307; cv=none; b=V5g+DiME2bXEXx9Nq7N7LQHq8qrN9UOsVJUfi2V/1n9qEEclo4HefSXETolkCC6aQRQn439+OaXamAoBxnFL6UustVpXz1qhAescM1soraLz/vip5Ts4j8OW9S2y1PImhWRy7Ep4tiZkiUhFO5Ni26OuuAAi51CYfc2gc/vDeYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332307; c=relaxed/simple;
	bh=kozFMohFM7Fntd0TGvXH1XXN77KIL5Uk6EH9MHO1Jiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwqntHaMDspheA9XmCvBC+2J5PAW+yxiQ88EAsKRPtEs4+v/xQqnJBwmrrl9pXg9pvnN+6/JlobtyOhGmRwq+zb0Xwb7sQdSjI3rsANqAiPhz7QcbJBPBinnbhSguqiqCddxBcL8Q1P4ozOOJ+JaqiaheP8RNnBei+7pN5hUIqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw1t4vb3; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw1t4vb3"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so61940865ab.0
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 19:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332305; x=1739937105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=kw1t4vb3zgt/YnsEcr+2CqS4fje0pghH8nxgysWPNRNjRYR7BP4q+OW/3nUuh541cF
         PMNbvoX/AtqO05fcAd91dNviZ+wy4vAqCzXC5ic0tixInc4tL7aK/rN34Gm3Y3jLj0oi
         nKJcdZ+DwduDRasLzb9ONf0+Iszt61rUgXbR2uppb8lbAjA0eXN0ejfdJFPiagxnMpn0
         EDLX/BnSbxBs5GfpOA4X6clpi5imp+CSVPB37SR/BUQQr8K8JHHil7QLTHpYB0pbcezg
         Y1b033MJAV8hQcVrhxKm79zT4ZLvNSdgp0CraoBhGUnzBv9RcqOCtgNILvQoOr5TN2a4
         zeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332305; x=1739937105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=PsHhMiZjifBrBLqDUzlCdNgCduvqoOlPmhelzX5fqKD72XVQ+nuG9Q1vU0jbaPYEZp
         85gdnI5R6ReXWchxZTsJDFDWG2MoWncr1gx+XdC0HvdyexYrScxR5kDyWn1Fhr19xc4+
         wO1Q9slLQn+RSvqTED1Vbaw+gv06akWU5iDsq5odk7RWXzm5Q+ccxEPXEFComlQ1lhLJ
         kWKacf/nFbmW0XWy1gigi6ZvB1b+7sxPkbaMlpgToR5Qih4kMYrcSCnopkMKqUVf0EjS
         r6epHEX+p2+N7OHXjtmcejOChkQhZggZwE1SnFKS7RBOAeehrnFzROWNMyB7Ol45ZMXE
         nExQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FqJP42mLN09UFunYZB/q9JLTtLQ9vUQYRnDSZlRW2rkmMS0c/YRSGbWYJgoNk53YQwY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzasCtnwThW+AFIhWrjVy1pBW9qu0MF0D9cteoel+oAi4AsVWR6
	u8EvQGftXfVw+R+uXZCMOGu+jRXdYZFiZy9n/TPFo7nldHT1E1CtVQwAk/NMnui+G2AqPlZG9WN
	FctRLvITZSrvHd2pQJuXOKw9WZhY=
X-Gm-Gg: ASbGncs7Kf6Cu2BGJaZpDstcneDX4buBALK/Rsu54plGJ9wiSeZTDn5jcgmQxDcRy4i
	+JElSScKzbnM0NzRYqn7+kywM08OfaFcMIAl3Q1g+1S9NJyVCl0onNTQQXcxdL9gshOBY9ecn
X-Google-Smtp-Source: AGHT+IELmMC+rEqMtc5H2YZuEE1iKouS45lV6N0hJ5Or/LuqIGNtJHv3ZlrPMODm1vA23GJ/GTBsAYKKjidNOlR17CI=
X-Received: by 2002:a05:6e02:180b:b0:3cf:b365:dcf8 with SMTP id
 e9e14a558f8ab-3d17c21ba5emr21495995ab.21.1739332305183; Tue, 11 Feb 2025
 19:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-2-shengjiu.wang@nxp.com> <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
In-Reply-To: <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2025 11:51:32 +0800
X-Gm-Features: AWEUYZl3szAb6kdvVRYt667G1aLNreWAtpJFe-4jAXLL0jVOJ3awo1RObh0k1-U
Message-ID: <CAA+D8APFPKGGNHiiRYFgGVM-AL4LrE-q0zy9i0mErjeJU+KbuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: imx-card: Add playback-only and
 capture-only property
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:32=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 11, 2025 at 11:57:36AM +0800, Shengjiu Wang wrote:
> > Refer to audio graph card, add playback-only and capture-only property
> > for imx-audio-card.yaml for the case that only playback or capture
> > is supported.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yam=
l b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > index f7ad5ea2491e..86571fa930f6 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > @@ -46,6 +46,14 @@ patternProperties:
> >          description: see tdm-slot.txt.
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >
> > +      playback-only:
> > +        description: link is used only for playback
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +      capture-only:
> > +        description: link is used only for capture
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
>
> why not ref to audio-graph-port.yaml?
>
audio-graph-port are based on 'port'. which is not used
in imx-card.  imx-card can't directly refer to audio-graph-port.yaml.

Best regards
Shengjiu Wang

> Frank
>
> >        cpu:
> >          description: Holds subnode which indicates cpu dai.
> >          type: object
> > --
> > 2.34.1
> >
