Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C651335098
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807881; cv=none; b=C+Pgoh0+R7G4eJ5Lf/kvh1Y645+xlsomhqj9TXyy1tH+Q+hHVDm0I3Lu7+y2e67sXgLvVi60ApjsFeUWkEycSd7pV89ZxmcpJWkrfgGTF4c3LirurcqJYaTUWulGnd/MmiaDyXm27Tu/P3DsLHsAB5yWVsfTwz8mNniLVssLXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807881; c=relaxed/simple;
	bh=05TtTHgNdkznqfwnElj2udcrcsdoU2jg/0WhEE3uwVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDwFjOQafmQHwJ2L557Qae6ek3QzlTtzODltxwN4smDXw3ZCLjOtD7lSMPa9TdxX5WM4ZR2BDEDvuScej/sprdrtxIWkjp4VwEx7m4Oc9YZQqElZMzY0pj584yRz+AaAdpyoInHi4g+VdRUWmkz+M3DiG6kkK4RfXIPpGjaX6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTsSthRt; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTsSthRt"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so2626300a91.1
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 23:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768807878; x=1769412678; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=FTsSthRtpELK2DTvaEFib/sPfxWL+tww5YUR4xBu8pVY1RtpjQs8wLd1O8wQv+bSXi
         to4LezLiealYiIskKXOvAeTOpZUlw/UP36M132uJGASVMVJRl9ybPHFhTD8O6fHDAdtP
         Rl1EmsJqbKD7uN+JLXRvHUgUe90CbpcV6Ia8/Cxh1cVv2WZCvH3+wTIHoT0y5SrpWYHD
         NChE6wHa6MRTqAIfQ2YEB362yYDT/HvUIDGRU66nrVuX1DkvhPvrZppxXE+Xetrsbq18
         E0kDICS0T7rIDkPUhJYmqHpjhJ3nwbiWHUO21hpclC7tns5jAk9IC5F+W0UZQrg8pKAq
         5Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807878; x=1769412678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=j0WrXcaZDbicgi7rWAtJWh3w/We0jHDmNBrgxImJmogTAOhyKmejvew6mTK5DfxI2c
         FCOJdRMYjQd72H89C7OQAFSnkkn0aauK2vJWOPMC3TdWiRB0X2EqjPLvLEk0Uls5Mtdg
         Agr4IRmnPx9B+7QMr2jritavC+nzTFLMlSJxwr6K3AwIhs/L16rDTf9LbKN9G2sqxdEj
         EhoOB89AMepQKK2uZV6rtjIb1Et+Bv8a5GodPtjjNL62aOS23NrF3cDuNpwvkkMzFmGs
         7TA2X0/91S1hv2AEtOIcOZcX+CAVwb8m3jghlEBiZwGhsmYWjosGsprpkrUJppp5NlLO
         7goA==
X-Forwarded-Encrypted: i=1; AJvYcCX3oCLxEb18Njj/DvKzR9Z/H+JMrEb8O4GV9dFluzdAzVj7A49I8GkGqCQn8/X9LFxV2Iw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIfolWhCGrXbj+/6HyvAXo6x9766lu7jPQFB2BFEPZ23yflva2
	ASz3Mdf1pmkrpdZAS+Xpzzxh0HpFhrlLSYiajA9y6ewZUjd8Lp09TMG3KwJEnz6rGTROxjipJlu
	s2O7dOX2QF16CskgFHVx8njVvLtBcZS4=
X-Gm-Gg: AZuq6aLZf4JvyGCZzwjNaYyl5VbyhuXb803hquzxLrswmK3nz/ZkzBQKi5sfCyWh81R
	rMUFUvL0fPnRL6rDsLCiyZzuueJ8m9I2wx+warUaQT5BxL6tFTgUJ13nZXa6L66DQXAObIqknVU
	9/WRocb6wRTFqWSPgSrehN2KU6SUN3jpCbGIq3J5csnbdOfM/2E7J6BK5s11/UEfbhhFtabjtFG
	6Oah0zYVEjC3z+lmwLMhBCbK2x49qi3+J5Y8H6KGyIP1kGUaOvPG1ow0h2SWxKKSrTaZ34=
X-Received: by 2002:a17:90b:3884:b0:34f:6ddc:d9de with SMTP id
 98e67ed59e1d1-352678fcf6fmr11202077a91.16.1768807878309; Sun, 18 Jan 2026
 23:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
 <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com> <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
In-Reply-To: <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 15:31:04 +0800
X-Gm-Features: AZwV_Qh5iuoRHWZMiK5VT4SDQMVso2DrWmENEWodorBSh_MSb2zROT8lpDWRAvg
Message-ID: <CAA+D8AMv0TaGwCU8yWWVbVfuYHyPMjMnz0MWNLh86nfsGMZtYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
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

On Mon, Jan 19, 2026 at 3:07=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/01/2026 07:27, Shengjiu Wang wrote:
> > On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> >>> The specific feature for AUDMIX on i.MX952 is that it can be bypassed=
,
> >>> so add fsl,amix-bypass property for this feature, besides this there =
is
> >>> no power domain defined on i.MX952, so make power-domains to be
> >>> dedicated to i.MX8QM.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++=
--
> >>>  1 file changed, 33 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml =
b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> index 3ad197b3c82c..50fb08460b4f 100644
> >>> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> @@ -34,7 +34,9 @@ description: |
> >>>
> >>>  properties:
> >>>    compatible:
> >>> -    const: fsl,imx8qm-audmix
> >>> +    enum:
> >>> +      - fsl,imx8qm-audmix
> >>> +      - fsl,imx952-audmix
> >>>
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -75,12 +77,41 @@ properties:
> >>>          unevaluatedProperties: false
> >>>          description: Output port to SAI RX
> >>>
> >>> +  fsl,amix-bypass:
> >>> +    type: boolean
> >>> +    description:
> >>> +      The audmix module is bypassed from hardware.
> >>
> >> I don't understand why device AUDMIX would have property saying AUDMIX
> >> (so itself) can by bypassed. If you bypass the device itself, what do
> >> you configure here?
> >
> > The case is that the SAI interface is connected to AUDMIX,  but AUDMIX =
can also
> > be bypassed by hardware configuration.
> >
> > Yes, adding this property in the AUDMIX module looks strange.  Another
> > choice is to
> > add this property in the SAI binding document.  Is this better?
> >
>
> Not sure, but certainly it does not look like a property of AUDMIX.
>
> I assume you acknowledge all other comments.

I will move the property to the SAI binding document, then please
have a review.  As this change, the binding document will be updated, for
the comments to use the example-schema (:false) will be adopted if needed.

Thanks.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof
