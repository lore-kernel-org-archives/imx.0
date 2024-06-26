Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A2175AA
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393967; cv=none; b=MwwhBy41UNyZ3eX/pbsAtwmopw2C0KjyzVUvkTfaOr9t2gA8+KlRzx+q1rTQNYDoTTzGxVBcfUZhRO2ZduQu3kTsvUvWsQpJLv1cNom3ReBN5ibn7g2Uw1G3Lum6wz70LA9Li/Es0XR+G1/Ut8YuGc+wYd2HeKWvHaa0dUOgnsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393967; c=relaxed/simple;
	bh=TImSq2cjy7qGSTtQ6Zpc4gpMXPfbpIIxDoWk49mkmDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lR4klfFcDRW8wx2Vj3fLNFOo72uXkAybfv5wJeNeNkMXNua3uwZXMqr2Gxpqkdsa5MM6zm7l5vOjK8Qlqnkt3w7nHuQG42pDNFHPtRkkyevjexDRR3cJiSbx6gPqQt9ex27ULUYuOo2p4UQtVDVGGQ7FAyfbLLg9Nql6W7MQseg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPmo66IG; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPmo66IG"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3762eadd807so21359595ab.1
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719393965; x=1719998765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS9tBWagV/aB3ttYbZvRx1MNDmH3F8EWYX4OiWc3MUM=;
        b=HPmo66IGI+hUG2R2GYtj0iTdYU6912//xrdJZwJnmvcIh8dvYg1waXRckVlrJf0Mh9
         eEYyMdBPX+Ux8nmdwarwjHmeaQZCiHjWS69QMzKdarBwWnsYQZ4QmywEtwHzS2d3pbWI
         qL3wV58l3LxAmHIIuPZ0RTBu/LSWeGmqkhOJVwQ6njurHGck7ZXreWoQNaBFhL4Oqf0e
         P0qXHMpyY3OfA76bMFi+MMVtd23eYAsuclG8dtbz5BYupqnDdZ8tPyyK/h5pL+7qmO4a
         SUMC4+7a6rMOOZ4XF45gtdoK8xyYfXfB4/0YEnuA/Ff9lsNCv93Mdngj5wjHIXNZralO
         nChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393965; x=1719998765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS9tBWagV/aB3ttYbZvRx1MNDmH3F8EWYX4OiWc3MUM=;
        b=cQLTWLLdrKW86DSnYsgOOsYFYbdd624oYYk4nVeivqzYl4BbhMoHOpxbhs3d+rDv3y
         yw4CQT1J3QWkMOhg0Dr/d739tZtz9gF3UQe4bUPDKn0RHQ8avCKjqx9iCfPb6sZ9pO7u
         r4X5q1erFKcWybYsBCJWJtiiueBBznSP01xsF/J6yhiy60f2JoH5zakSXbpraYDeyiwH
         v/Wb+8WyzHn4KM5qLtPYwjCAWHoaQAFztSgyGEHXt6DPp8l9Sthdv/HvZI1f3CDifHMX
         oDEDuI4iAvGzaRQcZcWu3u28iOlG/l43TZYStjQFyxR/8Ln3bgvmU/zmEgp6AFXBIb3x
         aA9w==
X-Forwarded-Encrypted: i=1; AJvYcCXU75yXeY5QpCrqxdXvEX3Tp4p+SDT3vG8NDzET1jN36MqlZatvdhjSrvv/3u8godAnlOI0p4TKsmam+eiC9IwD7zHR
X-Gm-Message-State: AOJu0YxDZWuwHNRFY9zPboQ+TknnloZgHxWPwPaFPB2nokB9uIuDl/ji
	GKGtSbKc096KjV5FjBXnssgUxAJGEUcHZTkpwBrADrlhIyarHYNdrqPk4RhHVIDlfW3oxaA05KM
	SduCM+ph9leSeONuMBuiZrfoSIJs=
X-Google-Smtp-Source: AGHT+IF8vqv2H6BpcX/e8E9ZnvoMnUjyW3sSLUDB2oJsF3VziNS1XQjch9E28MYtledL6iD1NEAUZ0Me343FM2X83XI=
X-Received: by 2002:a05:6e02:1526:b0:375:8fb7:7a32 with SMTP id
 e9e14a558f8ab-3763f6ac1f9mr146620995ab.29.1719393964771; Wed, 26 Jun 2024
 02:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1719291415-1168-1-git-send-email-shengjiu.wang@nxp.com>
 <1719291415-1168-2-git-send-email-shengjiu.wang@nxp.com> <293fb3d5-9b77-4321-8b31-d060cf96565d@kernel.org>
In-Reply-To: <293fb3d5-9b77-4321-8b31-d060cf96565d@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 26 Jun 2024 17:25:53 +0800
Message-ID: <CAA+D8AMQv_=X3hC5uQbrDBN0EGo3U6EToGFVjUYcOVHpf5b=aQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 5:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 25/06/2024 06:56, Shengjiu Wang wrote:
> > On i.MX8MP, there are 3 interrupts, the third interrupt is
> > SPDIF wakeup interrupt from PHY
> >
> > Add ref: dai-common.yaml for #sound-dai-cells is needed and
> > XCVR is a DAI device.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 197ae8ba9c30..7470866e11c6 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -42,6 +42,7 @@ properties:
> >      items:
> >        - description: WAKEUPMIX Audio XCVR Interrupt 1
> >        - description: WAKEUPMIX Audio XCVR Interrupt 2
> > +      - description: SPDIF wakeup interrupt from PHY
> >      minItems: 1
> >
> >    clocks:
> > @@ -88,6 +89,7 @@ required:
> >    - dma-names
> >
> >  allOf:
> > +  - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> >          compatible:
> > @@ -112,7 +114,7 @@ allOf:
> >      else:
> >        properties:
> >          interrupts:
> > -          maxItems: 1
> > +          maxItems: 3
>
> I have doubts this was tested. The existing example should fail,
> although I did not see any reports. Not sure why.

it is tested, because the minItems is 1. so the example can pass

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>
