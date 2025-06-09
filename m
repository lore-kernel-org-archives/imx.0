Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB6218593
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491642; cv=none; b=TNSLg91Sj0LmNONwUKGslc24TizZEWJ76Lvo+hx7N38cnNHjqD52c+w1yk7xCk4GL8f2xzPmiFMSgwGpv6xH/tIPvfadq+1e+aG8QB68pCxRXG14H2ZYTMiIxYMVe9QoAMdxqhzYtVgAhfskucglivjuhoR6uFzy/WaUcuZDWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491642; c=relaxed/simple;
	bh=kelMJff8wJTREpM7rMjD4HeqtY7kzJoHJJ0/eCsUp2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG7vKWzpRavGFosmkPFsfnake/S2290a4e/c/xRrd+2OJklef51OuIVvnUrBXLaBEebGOFv46QH+3RPqNCl9qCfagJp6eex1Xm1Z5heRxCArowHe1VfZoxzWpLTGPwEoBsg3hNxPUKrw9jLPdzQ0TNW/hwCuRfDAwVSBQCGYD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwbNw/ZG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwbNw/ZG"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3990948b3a.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749491641; x=1750096441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=LwbNw/ZGtyMvMNRi7zkHpW11F9S+sIr6MSxjpsIECl4PqoopbwnJEBj195s6riVkBS
         pm70/bPVkMvFVWZD/7rpMr2NfSAM5SWSecCC9O64ZBkoVAw5Ts5nm4athYPKc0kPU1k3
         hhe+QrT6oh4POLh8JFC7WiiqHu7MOpgMfht9jFicYJ9e/3uf8yyWBJGaHAMCS1nwMU1v
         PiQXYhqbVBtLeN7AhCecupp9wrY1W9z5CmacngfmY47qaCFLn58f76UAPSNSfgegRUFR
         +FiqGjRhSYfHf9DtU+7c9FCRQNxDh0jUntKbwA8AGajZZhKr//5Dbq0XaUlE5jk86vzn
         D37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491641; x=1750096441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLavl1OFNqOjRx3CGhPlhwLyCUU3nUM8v4tmbP82xPE=;
        b=WbAd69VWzl/iO49LMP0Gf529JElBAdD7jQUybgIoRNav50cNXnGwQUTRKCJEVA4d+9
         dtEAgA/R40UPmLjeg7/ABrxanST4VE49n35EIej9taOlI7yDEc18Kfei+IK/RmwnGM1q
         4ME4uNx02v8l/mKRES50IAd+JD02dMynyNNAD1kpe8OdpPIW58fl+vEV9M33mlRg+wZQ
         MJWFZejei3CN9LxBN5z/ppToovIXeb1VtNT/29m/PEbv3x2CtVjJs25bqjc9/lKc2Vjx
         7nYXT9eCsNiU8FcjlSekkjqPiBW5vTq2826O8or7Jfgdf04rUdTsNQFPPQk6JEvebEKK
         gekg==
X-Forwarded-Encrypted: i=1; AJvYcCVU5zww9Nq8FigLAUTuvPBeBQgEVsLJIOT6FAdq+TV6B7nwMQAj2dyrUWkXhowd2bDcQ/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmGKoPK9FHuHjKpTQSYNU20ufmYf7NdcZoDHw0AscM/STn52fM
	SEGxEjvOD9CLKtEzoyiaw6GMFXJfbEg7cKww7t9adTlUFZ1AtwZ8SaGaNcbomqMWJU/gEKuZO1w
	wsydsBu0JGmvR8N0HX/zA8qvNIWXXaQI=
X-Gm-Gg: ASbGncvpwu0xlfjgM66f8JdoQkmGLdxuIfvYoeanx24m54IRlfauzBmyT9DJwmUlNn+
	An7RykQ2sGWh2lL0t4RENE+JwoU91W0F66QvOd0cq/5EwcBzd8WDq5koFtnS8Ox96q0Al9ZVcKk
	Hxn3V5pKPqN1qfc+2aLMBWMfBUjlueW/V4
X-Google-Smtp-Source: AGHT+IEg36qltC0WMS5rKcmC0QOu1qYNMycbO+ypdNoe6gLAt9s6BqjElaf2ITKT7TIBRdwePFzwfXD7EdQ4aFq7nQQ=
X-Received: by 2002:a05:6a00:c88:b0:73d:fdd9:a55 with SMTP id
 d2e1a72fcca58-7485ea7097emr499919b3a.8.1749491640678; Mon, 09 Jun 2025
 10:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com> <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 9 Jun 2025 12:53:48 -0500
X-Gm-Features: AX0GCFvBSlGjJP6_gYPY5G8LHDwywJVn2yc0aoIQdRQOd7fdU_ZaLDtXpMwt8Ck
Message-ID: <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 10:32=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > The CSI-2 receiver can be instantiated with up to four output channels.
> > This is an integration-specific property, specify the number of
> > instantiated channels through a new fsl,num-channels property. The
> > property is optional, and defaults to 1 as only one channel is currentl=
y
> > supported by drivers.
> >
> > The only known SoC to have more than one channel is the i.MX8MP. As the
> > binding examples do not cover that SoC, don't update them.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.=
yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > index db4889bf881e..41ad5b84eaeb 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > @@ -68,6 +68,13 @@ properties:
> >      default: 166000000
> >      deprecated: true
> >
> > +  fsl,num-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Number of output channels
> > +    minimum: 1
> > +    maximum: 4
> > +    default: 1
> > +
>
> Look like it is fixed value for each compabiable string, So it is not
> suitable for adding new property. It should be in driver data of each
> compatible strings.
>
> I met similar case before. DT team generally don't agree on add such
> property, unless there are two instances in the same chip, which have
> difference channel number.

If the DT changes are rejected, can the number of channels be added to
the data structure inside mipi_csis_of_match?  We have compatibles for
8mm and imx7.  If we add an imx8mp compatible we could add a reference
to the number of channels.

adam
>
> Frank
>
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>
