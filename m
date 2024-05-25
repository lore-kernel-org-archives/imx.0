Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A6171AF
	for <imx@lists.linux.dev>; Sat, 25 May 2024 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667115; cv=none; b=iY49WWkYp9d81/ZapEQ/KyZfa6p9l4cizcOcRX5xnABwA7QZ5UypJOpIiuNzH9hFulBDp5dgAgOUOZo7NmmWKkq0e9pXxiGD4kW1Mvc879SgXCc+2OUTMg0i7oGfWVr05Ymvlm8s7B2jFOSqwGzvkvn2FavwbJVieincZNtTB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667115; c=relaxed/simple;
	bh=YyktBYvkAnwaBKuCJSVUX+2IGFFXy4pY1RBykLD/eQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7mtYC2GUeuDvmULnd/e56LSzC/sdlnt7nnGOiSScW/2lBpaCbYSXg/gTdGOK68TUnOBER8HtyfST9xpDWMmX0lp2qZ7+RivSXHFlJrZYZvitvJqg+RPqWTVnAho3oik7hUFj86GZYBWyi9+eeAmpjMSCF5JMvyAv7fi2NuXhss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=ljqjUsLV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="ljqjUsLV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59cc765c29so492519366b.3
        for <imx@lists.linux.dev>; Sat, 25 May 2024 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1716667111; x=1717271911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UkScwBgCN+E8s4yRTB4uCPcQeq88yLTx0RPgq0Jips=;
        b=ljqjUsLV9NClHvFz3TNDrpZZ04ZJ9ujoLUe3CHsKh9uTHxINEQPk8cSZZi/fe/flpL
         13otPcoA1h+I8p10PGMV1iBfGcjycDiIbStlxOtcqg4oWlx4Hsha49kSVTKtgXNxK/cd
         4X6/G2vAEjhEayelfjz3FfEGSW/wvGsTtKsfSC62vxo2phcbj/mbVj6N+2kYyZ14hECz
         r9Jf85Hg5zZyiScZYLef7m1DzVP/FRtgaDEydwXiFkwyDIUkaGoSZSlE9H4Hnqf8fq9h
         4coZcqOuISfnK7MWNno7usH7pZms88y3k2dWhaT14XbCHKmX42MWyRnzT4Q+CGAlbd+F
         R8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667111; x=1717271911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UkScwBgCN+E8s4yRTB4uCPcQeq88yLTx0RPgq0Jips=;
        b=Pxgaa032e3B8noqVRDKbrQZKykPsUNuCNFeydNzwKM/BKm9TBgkLE/xo1WJb6saZAp
         +0iVBp6G11GK7KkNxV3jefjA0fIMZ49OI8CSzUlbZmRjlew4EW/Qg9jGRAkyik4pNPzO
         QB6R4dMKs/TdBUuNoiJYof5KypW2bLJk56Lqtovu/OV7S0WsZHnKIPYO3AOtp9U7XvkM
         HbGKhnUWPjO9cbxQmKteu+PXxST2a+5wAu3xaaJG7MCZz6wOjRaajGHO+Z8hB4yj+ggH
         XilvDHsv1tn7ZOk2/E1n+WHj3DlkthV6bDqT9jJDJBFelX+znEODkhL8wZwl49NKyBfz
         xW4g==
X-Forwarded-Encrypted: i=1; AJvYcCV/kYJwhpRvtxLXGIkkJxb+Nq9PaCycqUfkikvkKNxeUmJt5xgVwF8vmYyuMTp5/vlFSlu9ACLGrAIBjAJpKBlX4cBv
X-Gm-Message-State: AOJu0YzHHgto1yDTgEqAcIg1e8AvD6TzUiuA1h6YIGhzQU6FY8wCNnmH
	SMCPDMw/WZp8ODDq1FJy+LmEPblcJQfyV3NmgKfBCiKE88A2lccc09tVfnNX9iD9cohmMK52547
	iHFTV0c3EGZrgqG30L4NJLNeKFqKI8J4ML15ULA==
X-Google-Smtp-Source: AGHT+IHmcUbw6PneWW81LNhoVdjfmvJD2KPXgw1NohVR46fYTKEQJ3xUFOcbylon09NqVhutwrjC7k1lIl8wFWY6ViM=
X-Received: by 2002:a17:906:131b:b0:a59:9fc8:38bf with SMTP id
 a640c23a62f3a-a62646cd6ddmr353575366b.24.1716667110587; Sat, 25 May 2024
 12:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
 <07250029-7cea-4a82-9e70-22e0e6f7fb37@linaro.org> <20240523-vividly-sequester-d85ac7bccbbd@spud>
 <CAJ+vNU3fQt=6t3a_QFU_3jb5mTVLGJiptPnGEmWvvXZYGEPOFQ@mail.gmail.com>
 <20240524-cavalier-outthink-51805f49c8fb@spud> <8007abef-38bb-4d7d-a453-00bb5e6bede5@linaro.org>
In-Reply-To: <8007abef-38bb-4d7d-a453-00bb5e6bede5@linaro.org>
From: Tim Harvey <tharvey@gateworks.com>
Date: Sat, 25 May 2024 12:58:18 -0700
Message-ID: <CAJ+vNU3Rh6f-HrFbBLxNXVP1PwsGh8OyGmmGJBv6+GRwZaTXgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 11:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/05/2024 20:40, Conor Dooley wrote:
> > On Thu, May 23, 2024 at 04:04:50PM -0700, Tim Harvey wrote:
> >> On Thu, May 23, 2024 at 7:47=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> >>>
> >>> On Thu, May 23, 2024 at 09:02:46AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 22/05/2024 23:50, Tim Harvey wrote:
> >>>>> The GW7905 was renamed to GW7500 before production release.
> >>>>>
> >>>>> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> >>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Docum=
entation/devicetree/bindings/arm/fsl.yaml
> >>>>> index 0027201e19f8..d8bc295079e3 100644
> >>>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >>>>> @@ -920,8 +920,8 @@ properties:
> >>>>>                - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 EVK Board
> >>>>>                - fsl,imx8mm-evk            # i.MX8MM EVK Board
> >>>>>                - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
> >>>>> +              - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Boa=
rd
> >>>>
> >>>> That's not even equivalent. You 7500 !=3D 75xx.
> >>>>
> >>>
> >>>>>                - gateworks,imx8mm-gw7904
> >>>>> -              - gateworks,imx8mm-gw7905-0x # i.MX8MM Gateworks Boa=
rd
> >>>>
> >>>> Compatibles do not change. It's just a string. Fixed string.
> >>>
> >>> I think there's justification here for removing it, per the commit
> >>> message, the rename happened before the device was available to
> >>> customers.
> >>> Additionally, I think we can give people that upstream things before =
they're
> >>> publicly available a bit of slack, otherwise we're just discouraging
> >>> people from upstreaming early.
> >>
> >> Hi Conor,
> >>
> >> Thanks for understanding - that's exactly what happened. I'm in the
> >> habit of submitting patches early and often and it's no fun when
> >> something like a silly product name gets changed and breaks all the
> >> hard work.
> >>
> >> The board model number is stored in an EEPROM at manufacturing time
> >> and that EEPROM model is used to build a dt name. So instead of GW7905
> >> which would be a one-off custom design it was decided to change the
> >> product to a GW75xx. The difference between GW7500 and GW75xx is
> >> because we subload components on boards between GW7500/GW7501/GW7502
> >> etc but the dt is the same.
> >>
> >> If there is resistance to a patch that renames it then I guess I'll
> >> have to submit a patch that removes the obsolete board, then adds back
> >> the same board under a different name. Shall I do that?
> >
> > I think this patch is fine - other than the inconsistency that Krzyszto=
f
> > pointed out between the "renamed to gw7500" and the "gw75xx" in the new
> > compatible.
>
> I am not a fan of renaming compatibles because of marketing change,
> because compatible does not have to reflect the marketing name, but
> there was already precedent from Qualcomm which I did not nak, so fine
> here as well. Double wildcard 75xx is however a bit worrying.
>

Hi Krzysztof,

Thanks for understanding. The double-wildcard is again a marketing
tool. All GW75** use the same device-tree by design. The boot firmware
that chooses the device-tree understands this and for a GW7521 for
example would look for gw7521 first, gw752x next, gw75xx last.

Best Regards,

Tim
