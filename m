Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26011357A37
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556226; cv=none; b=CeTilXf64ufIBZ5nufU1len9lutVepCe26uI8JEr3XEK+QCjRl4G4rH6k9ZsLT6vvHHPGs14ZJo76suNRab/JFlenv7BU05elO+yoYlvh+uLa2vt1WWQrhIZ7+ewdcur+Orhq8IOrnPqI/PzvSNryUtbFHUCklHeLrNTr8jGHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556226; c=relaxed/simple;
	bh=veSWyZPxgBl3O2bkm46uT0hLgcL0oIcoN6YW7LLsatk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8l3cgRdMpKrlV0CDPlnPrYkCMYuU/iCfNvcUIXVT9EyuT6pMCurrBIgyHP5via1HNyzVQervhYeAt5AtR6quIWtsZDS470uKeIgu9c78lzyZCVHsJMW/n0zIcKvsTpxZF05+JVZqeg8e7BIlWbTn+wugvgzkpeoOPJPnMM7iLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFRLSMY7; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFRLSMY7"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-11f1fb91996so4305247c88.1
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768556220; x=1769161020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=;
        b=HFRLSMY7QQUl8rRm/i4bt5G1UOZ4FPVaYgDr2lcbNYn7DkTt+lYHR+DvFaUHA7Lqii
         osZFyH56TLArgE+e9b4pcZ90YiywgXB2AtZ/j1tVPWWs0bD65s5q4hxFmPM4A+FvkswJ
         ThEbHxyVN0v16ovD2Jwz+4BdypJ1J59tUNMBnIyBiWWbyFicoF99cXBuiJmhoSNmk7Ln
         LARsEFieVsawYPWWKD7BKkMv4BbAnDPiN6Yd8z2VO71TM4r+jZKGgSoICZ96/uXv7k6f
         eOJjGeyd1t40dFXDhIrIfucGwzTajfM8DuFNBYOa34VecLsI7b0+CEFQFVzl7hYGg1sV
         9RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556220; x=1769161020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=;
        b=wury+jraGEJIoR05s3LnhdY8HCjw92a2aWrngFXJs+GfLMOVcxLjjyJvX4IYPxxU0G
         MXeHRLYi175OualUI7n7FrbCpDwKMSA8vR9EvwC7hrBiQX6uWCA4h4zK0THQFMUmd2Le
         ZsjSCjTdBzmP1V8s9jm/Z3zD427JWCgEVn9fT/cG718xmNlK1qik1ktwgIw8WK/RaspP
         puw2h/aVOU/opMkkxUBTRaiNEGjN0rGqKCbS6gF8kLUYAp6UJZQXucovpchKADnKpZHE
         9Ajm/MixIGNEWpMGLRzZL6DWhdHeYHsYxTdCmFJNtDU7iJoAgHmvBO4eUOPGFlzfzEcc
         7yfA==
X-Forwarded-Encrypted: i=1; AJvYcCVn0RQU/kHqV/WeKJQqr1lTq8cyfDxVctpMGmQF++18cNBoZpySDhvi8ao3zPPQDyfFims=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKXXrHKk7JSFs9mt719UC6fvsBcXLvV3c0H2qEtVNe54raHOEi
	Xrup0EGFgRK/1KW0qYvu6osWYlChcQCzVdJBTCKkJa7s/8AOEQp3LW9Q6RnElfdqjYymnFJCM0o
	p5Z66nsvS6CAivvfkCBb7KcVyBj6X/co=
X-Gm-Gg: AY/fxX5au9tSkIyymPHW0ak9xhzfD8dqQTlza2sETnIliB2uXy2u76bhfYV8wZ4F8wu
	LzbnW36YXiYeN+5oPw4uiLtIr7kpoPNGmG6EpjOkCDx6RRt9gZPc+M2KgBDoKjOWDvm2saVdeRP
	+7ZZBGYkHBqIaxuGj4xFoAAyjw0N2n4WCWcCKYgAkPr5P1kaoXBVhrPhkK3HH0heb1LKeG2FgRe
	zcBYsseeYeNHSFHWzATXhoWGiTiFruX0y9+12V/T9OzHXNqD0f23gOl6nxFDDpDO2Lxn6/xiT+s
	PcsjzOXF4ppwp7murQd7/CdDTQ+r1d3KQHUUDU3HF73P9RpPzBsCz3DNbjgOVRh37hi+S1sS9pi
	j+H3ZnUx/ymQq064hrOJj
X-Received: by 2002:a05:7022:6182:b0:11d:c91e:3b58 with SMTP id
 a92af1059eb24-1244b381f4fmr1752175c88.39.1768556220218; Fri, 16 Jan 2026
 01:37:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116-127-v3-0-3dc49545a745@nxp.com> <20260116-127-v3-1-3dc49545a745@nxp.com>
 <94c920e9-cde0-416e-9b6a-16255eda2b73@kernel.org>
In-Reply-To: <94c920e9-cde0-416e-9b6a-16255eda2b73@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:39:41 +0200
X-Gm-Features: AZwV_Qh6ntqhZTGdRL0PXfGXgKQs_rs353EC_4pMNSP4GTlexk3c6guYld7I3zc
Message-ID: <CAEnQRZDrchcDr51r7HWjq_=S184n2rq1o=XAnvQKVrXLxS+qjA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com, 
	qijian.guo@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:36=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/01/2026 09:56, Lei Xu wrote:
> > Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> > development board, a compact and cost-effective platform based on
> > the i.MX95 applications processor.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Signed-off-by: Lei Xu <lei.xu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documenta=
tion/devicetree/bindings/arm/fsl.yaml
> > index 68a2d5fecc43..4b6188d39be6 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1432,6 +1432,7 @@ properties:
> >          items:
> >            - enum:
> >                - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
> > +              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
>
> It's always surprising how many people need to review such one liners,
> but for more complex patches from NXP there are no reviews happening...
>

Krzysztof we are just warming up.
