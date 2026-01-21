Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDEB3C009C
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992456; cv=pass; b=BG6S+sqtUVWIVO+L09xsHnTZLVH2on4u1YViSwYhRAJBflBaNIq0RXaL4DXYlUnC3fzE9bJL1qc+8+eqbl9pZHXzwKN9ab+wHNiDOuUrRzbS8dbAw5LzsClNnuD+KucKEnF/eXsxdIZU0NeIOpe0oOBm5+A7TAGzMEgcal23wzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992456; c=relaxed/simple;
	bh=x1Jt80LN5/N4tHUEJT3M8l8NQh0Ouao1/CX6fzyd/jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXu7Siul/z+AjtFt0dwQqvgzz746thyk74v23ckdoDJTjz00LMkJi/Np6B06GMmIaNnzRbIvtQlLD2BRKhC5P6XGZFfgnfLlfOOq4xqY05a6gyy7R5x+wkxGR5sIzo4P1i7yQOHH0AfBRyFjfAc+sxnzIxT94GLo8Fq8y88ev3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foz7bqLL; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foz7bqLL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so4766312a91.3
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 02:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768992452; cv=none;
        d=google.com; s=arc-20240605;
        b=UrE0AYURKiUpH+rQGZgvKBMs1tSpOgsUBWdnrV4keFFgpiqfAXLG4o+cKFEBmUH2Lq
         +LYKtgOx3nbpq8IKb4/GTDQOvUObvO/QCI7/Td2opBqzeYGQUu8EAjDUTWhSFo9HFpaj
         G7hVijKzLeB27dJCe/v2l6r9kUl8NQxCfIkf4/PtOAEp860yawDdruOc9q1t3zNV0atM
         YK9FOXsPYNVzCnl9IfHBBpNn5ITH5DlyErNDl0m0HKOgAegt8IjHTuduxVvJinuTBL1h
         FOXWVfkLGGCUnpacETK/acL3O1/gqqzTUhIX/BZTGQ34U6DZk5pYusBv8PWEzQdEftdL
         G/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        fh=CfGEIxvXEYrTxuG0YzHg8HaLcx734DVdKoIs3osGyGg=;
        b=c6nF+ZZzVD6YtySHJFbsO1UbA2/jCprYt9PWVumOwXd+3cv+3AMxH+InWl3qfAhLlO
         NaZZ1iT6mu1M9IQx/o1PbDfhW/1dxS0fxapT81Nh8Rv6aUw9b2fPyfycljEJUFHWVK/3
         aw6Dqifvcm1vX4a2dWR2C87l0Usm/7TuPGBdNTQpDsnJgOtxcUBRdtUjd611aZ53vxSe
         R23+pj8RwgmrEo6nKlfw896858YpFifQyJuKg31MkhXIhuuUppxfnk1tvogoFez1NI83
         diDS9q6/8aX5WqziaosAE9HKrv39VDO+I0rdVHsCB70j7oXGSL1kPO7HBot1GthaUmXL
         8uvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768992452; x=1769597252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=Foz7bqLLR4RpDmmCQ9lfxYe3/1tejExgz8kZUswRmF7dzRUsgF92Eg8e45lzpajhpj
         IOuLuXZtFsTXSLduSLBZvw65oLBA+qttmV6Dl8Sjm9rBGeK6ZPLEULxMkSSMgeCIerfw
         GjCvowR+mV4kEUu7I+GUC0ZlS6BHo6Y2wEVFPDLkOEpvpqunkynmBUCKnA7mF4W/GXux
         7pPDWzn/QkkkAyfPjoY3N8aBe77G7+5EOoAdpztv2JpvI88wGt+APMJAHtNk1db+c+sD
         hPzORMfe5t4z3ABHZctX6rK0UItAHPf5nGO2iYk61ii8S8V3BtiPELJCl1rccnsyopzY
         r9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768992452; x=1769597252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fMXkDh4NuIGqP7vK0ebKmRodxeqBxQ37RgaLup8t8A=;
        b=PANJT8J3NvglJfCKuTACar93ojZsh5zc5qjfQj7OMmPOVDT9sKW9w/fzL9x+SQeb3n
         XR+GvYSVbwYIJf3SJqlALuUqzvurE7AOT6Fe+1/cHufOuX4jWF90rUyvYSnEKBXgtnlu
         ipYTfFGhva84kUDKTiSaasOtqzYUMQHKRRqhml681BhFT2RHPjvaXnf6t4vvfOZmw2EC
         NhiVHu6iHfuyEBpIWa9V8juwTFLGvlVtAck30MUmsSRiIfB2wgTd5MuWqqCtlfwX2q+Z
         Gc2vt8YREOZUPJjaK2bnqD30qlutOI/dQsn0W40WSDmfrAaR4NJvxQzQMCpwhB/00Hji
         769A==
X-Forwarded-Encrypted: i=1; AJvYcCWZf48EIbhC5PVsGCdwOa0vR6uepSuYzKtRKfRFpLrwK2F3UqusVLGxYb2dQ0uZM9Za4dY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDhQR0MSaCp1Bl1UFnE+i5i+IAcvUCdOB+u8Mgw9GJHUtIh8AX
	bIuu1X2bOzqUgiGWZRkq4Nqg8ls36q3/Q6qfZ/wUZmfFALf0cTloHnAH01+f8mbYcgbRst67AAj
	aOywLmc3SvQmSzj8s/g89e7UumEjRzTU=
X-Gm-Gg: AZuq6aLiNTluGEY+ZRmQkjVDNh+ZEAiI9bpLLtQCeNziyS8XdTyUPtuFnmhMJsct0hw
	tp7ZiwclqWeK8u5zKJ7cPy5mxGB3taxBN/rpNnhKM7TLLZAo7ezpz9NRwJj1gH3e35hmHZqvs9D
	Q1HiV7cKdr3oFDSBQjd0oU0GvgnkTusmZ2YwmRPGIN5hGbRdou2F4PeEhaHko7BuV3psTwruOtI
	xS97sgFCiC01XQYf22atNaReS0AWPVYniJqWxo+DLBuom72UnwN9UH9iMNFm9Op4JHw9Ik=
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr14234623a91.37.1768992452459; Wed, 21 Jan 2026
 02:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com> <20260121-careful-beige-iguana-c32bbd@quoll>
In-Reply-To: <20260121-careful-beige-iguana-c32bbd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Jan 2026 18:47:19 +0800
X-Gm-Features: AZwV_QjDpxZv6jt8rBYtLCaZTNVLi3Y8jythwZEftwLkFpk7naOfOY6Hgw_qq24
Message-ID: <CAA+D8ANy6-e3RkhjSKWfqEcxEnsZrEuJvz7Bmp5q6ZO4x3RfVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> > The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> > i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> > this property present, then SAI driver will try to config the setting,
>
> I am still not sure this is hardware static property. You say "can be
> bypassed", so I imagine same board could have it bypassed or not,
> depending on use case (so mixers).

Yes, depending on the use case.
1.  When bypassed,   the SAI output goes to codec directly.
      like: SAI -> Codec

2.  AUDMIX mode:  the SAI output goes to AUDMIX.
      like: SAI -> AUDMIX-> Codec

Will add above info in the commit message.

>
> > fsl,sai-amix-mode =3D <0> is bypass mode, fsl,sai-amix-mode =3D <1> is
> > the AUDMIX mode.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,sai.yaml
> > index d838ee0b61cb..7808c324eebc 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> > @@ -133,6 +133,13 @@ properties:
> >          - description: dataline mask for 'rx'
> >          - description: dataline mask for 'tx'
> >
> > +  fsl,sai-amix-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Anyway, string is more readable.

Ok,  will use string
>
> > +    description:
> > +      The audmix module is bypassed from hardware or not.
> > +      Bypass AUDMIX(0), AUDMIX mode(1)
>
> Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]
>
> > +    enum: [0, 1]
>
> What is the default? What is the meaning of lack of this property?
>

  fsl,sai-amix-mode:
    $ref: /schemas/types.yaml#/definitions/string
    description:
      The audmix module is bypassed from hardware or not.
    enum: [none, bypass, audmix]
    default: none

I'd like to use the above definition.  add 'none' for default.
Which means no audmix connection in hardware. then we don't need to
bypass or not-bypass audmix.


> > +
> >    fsl,sai-mclk-direction-output:
> >      description: SAI will output the SAI MCLK clock.
> >      type: boolean
> > @@ -180,6 +187,15 @@ allOf:
> >        properties:
> >          fsl,sai-synchronous-rx: false
> >
> > +  - if:
> > +      required:
> > +        - fsl,sai-amix-mode
> > +    then:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx952-sai
>
> There is no such compatible.

It is in another patch:
https://www.spinics.net/lists/kernel/msg6004158.html

Best regards
Shengjiu Wang
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.34.1
> >
