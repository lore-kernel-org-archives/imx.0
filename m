Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FAA26F46F
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370474; cv=none; b=ksVnGx32yUgvshYhkasC5kQODKWy//CRE56VNlrJsPlfEtO0HABNuTm06Fu9C3Vg/MXS5DFcTOODNLRiNv0HZcxaa6zeKjdfVfcjdJ7Qg404yt+Sx5RH7CDzRnk3DheL0xOjBi4Nt8e+yYygRy84GvSLP4cFD36E7cKaCBpBf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370474; c=relaxed/simple;
	bh=g6TFFFPGjr50jQR7xQx4h+CFBPxdsLdChbbFuSFu0bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lADH9VqKHsZfhSKBdvKawZlV0mehC29Dyuut6cWdB0xKIHBP/1PQLY0+4BTYYDJdgN6Xeh7pMFNRn1gUq4618xmGcrpjtlhWELpiNNt4NpHkRz9G/eZt33sZk+NAncSrO/xUOmLnCd9m9iL53Ko5j8eGJRGDF/O5ZI1C8XGdtMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q7WI1IyO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q7WI1IyO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so4348898e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370470; x=1760975270; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=Q7WI1IyOWXQ+tAL6lACqm60XIWiDEHphEYD4EBaJ5DX7UwylDFVHIPne6eXRnGNxLI
         4O3saFS2AeWE/38/IbLp/Hhn12Lc17icLUCYwxP8b97cyzDtgdHiJFtBiuzpFYOh62hf
         ngHfzuHKKULSWRSwNpleFRVWGXmvJg/8tpsOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370470; x=1760975270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBeBnLojRUp+3BGjW9hqqMrpXMlk2wEyeaFT1Bjf2RU=;
        b=wa7+V8IV30jAwIQUX5nb32Ci1HQspEO+Om6c+jQ3dcdG1OMMtGS0nSnp2N+tZD8nod
         eX0MpgpsvpBHBdJsare9Ltw1y1iK6mr0snfI0yMrsziselLKMc7iXTIc5eGtT8vR5CnG
         tgbilw/JE2PZPRbQv8jf14+7EF7TT51bNbMmtcniVbGo4hM98B0eXHPnANecHB2/d/Nc
         MHn1hXgDyb/GRBJIFfOffCAMrH8yBRPtl2W3S+a4AQ81IDnkgGmEpTmm2jYzaRAFt3J2
         xI765HBixXk8RLp13NxM6R0Y8Xg7q/IMr9mhNMi8Sj2d1SsnZo0xOE2EmZzn9nfx4T7S
         aLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfDxUsSRNJdfvVHtEcn43M/8Vy7GzMZXr1iJHKP17QBaemM6sGCAvKlE4IPgFaaz517HY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgOX6uwqQX49NB/t9ps+B2TVlK0MvkthIlVTOWE/wZf7p3km73
	sW9DOQy1ScvyggQgUsBqMckVK3mnE9UyhAEb6XloDQWNT8C/ULlw09rXziwg1wtFosPWlee86pD
	t0W9X0Q==
X-Gm-Gg: ASbGncv2c4afAQSReeSRbj5MrIPc4bbdBgkb8CRqlbHTgd/bPvtFq0BCqAP95Lo4Orj
	o+yPuudJTx0LV3RFmus7zCwduNrs9tA3kRpaWGwprCNDRuhxzwQuFdSOptkF5ml91bhpVZeY7zH
	6eJY8Kf8RR3AU5EOgSliCcL/DlX88zfz+vkywgupBrUNw0JTWUE2wTO5LUZ+W6n1tZ0kELRcA0Q
	pLPFPt4BFjAWYJpDzZ1shy5YS3pHl+86NeK+APVW4NCUKoRbp9LkoLMaA1WjapHo9KbRxuvv7ny
	rrcEqfrzsINCKJeP9ZosPCt+asYmZoQ95IZTVV5q05LSG1ruZuajSXDg7apfsMUW00W8QI4lZCv
	Zpw4Fqj7SHv1GNOStc3WF4bMTRGpnOemLAX2zdrxsTdZn/lU4iEbvIAKGRBpO+n9SY301+EQIpu
	2CqQ9oWheUfipeK86AMQ==
X-Google-Smtp-Source: AGHT+IHJk07FAcd6WPP6c7rxF0gkW79QyI11Mkn1N3mjrlqE3oPUtvwSnNWGuJSrayQy+h/m7ZpZbA==
X-Received: by 2002:a05:6512:31c7:b0:58a:f948:92d7 with SMTP id 2adb3069b0e04-5906f458ffamr5372839e87.21.1760370469985;
        Mon, 13 Oct 2025 08:47:49 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98e4sm3400317e87.4.2025.10.13.08.47.48
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:47:48 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-373ac916b35so42506541fa.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 08:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAsFTeLtc+NjcAbFVJUBrhcgn5DUVzaTg5oOXl6Ewm01CsJBzylyIGf1MetxtQnv+QChc=@lists.linux.dev
X-Received: by 2002:a05:6512:1329:b0:581:bdb8:6df9 with SMTP id
 2adb3069b0e04-5905e1ffebamr6390861e87.10.1760370468172; Mon, 13 Oct 2025
 08:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-dts-v1-1-5731ed92684a@chromium.org> <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:47:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
X-Gm-Features: AS18NWCpy9_8RtaLxButea2qoJBXTdgqbhebqmgYPmIE7BU8dSEVQ_qnVy1gyYw
Message-ID: <CANiDSCu2hdaO5r8v_GcCksepy58AJFsuLb-xxz3WYOUknvKLwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:43, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:52:20PM +0000, Ricardo Ribalda wrote:
> > Latest dts-ci complains about this:
> > ./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
> >
> > Fix it to make our CI happy.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> Thank you fix it. I have posted at
>
> https://lore.kernel.org/imx/20250925193546.305036-1-Frank.Li@nxp.com/

Sorry, I missed that one :)



>
> Frank
>
> >  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
> > --- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > @@ -16,7 +16,7 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    const: "fsl,imx6q-vdoa"
> > +    const: fsl,imx6q-vdoa
> >
> >    reg:
> >      maxItems: 1
> >
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251013-dts-83ce7f7b9e54
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda
