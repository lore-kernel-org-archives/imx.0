Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C6B25D1F7
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018210; cv=none; b=NxOVG1gCTCAGY3zRMeVGP4Rn0ONI47GC/n/eKxgguvc1WW4r0rfxNlzg+Y6z43UoLI30cFo7lHAtFMLI+z/18M+6BP0fp2E2pcoe8MvSJ6cqGk4WVIr/CGNhyPAXAF/JI2FYFG9VUuMaJM9NRR3aVA0JoaGSCyAnCmKKRxUcgaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018210; c=relaxed/simple;
	bh=iFixx+t4HjD7fQ89CBPw8tcEnpXOvIN8tzy2ETRCd7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7YFHAY7du0hkf8JvR1f981o/MQQxKNA4FpWFg6Ppy/JBcBDRdX1BDkbO59NZ2IWxMf04/ghZfWchsDUy9vSLEOKivKp0ZXYZRJrqHjTUCw/b0Xnwiv0smYrVuQYC3aQwFI4yTYTXtQ1dJlcZm9RUBbCEaintP1FNbjX3Iq8N+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766cb762b6so11277221cf.0
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 06:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018205; x=1746623005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW1MhyT91saKVAFuqB6OQab7qD4mL9UWcfPujvEtR98=;
        b=GIo0wnWV6f1aXWbJLQkox1DA4NmMR85G8rK9yPokhpBnXH6i7YfRo65lavwdo1V4b7
         IwCNv5e18vQ65HdXg0n9X2YAdFLUR1948r/cN19sk7BwXU0ZTrjpvQ47bZ0nPplJ1nJi
         vxdX8os95zml8jMMRCSu7iaWrjWgs7VUCxAPVZr8KWYwTTUQkTT7DJHyRZiILitYgTej
         +UgbRWfvrskD6F43Yk5FMO5NxvXud0AN9AJmRmU5f00SDXvtUTKVQMlgGcvNVlLftRzf
         XWDOr+HL9TT9QTP19i903tjCnx5eLAyvSGlTJKjg18lBJ5f1YkTO1xMdGgAbTCfQ5A7z
         avEA==
X-Forwarded-Encrypted: i=1; AJvYcCWN+HYj95CgM9hmKNig2E9CxlraaFEYYFZQ9SOfAhNENWpFu2SVLoXQ0lqjzjaGft48RfM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7iUr4SvZDuNg9Qe34oEIUVDqS4JcFjPBC+/WvzqALZd61kPDt
	UDtM6jD/RoOQcwuNuq/kQz6MU5gfXf6z3K9pCQ44GyomLryAUN6sueHI6LGL
X-Gm-Gg: ASbGncvU0v3cBQqeth4D2XsEEBH3BmzLpKaExW1Xs+uc1wYhvLQLvoA6OIImDt5qM7c
	uFa6QEaDuA/V7X4QIrheRa7m02cQcCcGUiIxyPZ+BU+IZLomYhpANzSEI3Nh3hdN2yL9DnDVHoT
	fhw/jisWsk5apnkosr6u8VlIZ3WBkrxbhX8NbqvBeaJ129AjS/zvLLZ6u3aMRv140g02t/ltiQf
	7LJS/lSVqrBMM/OeL0YuvF+j9U6blp0Z3943Uejt9fv5C5MI2YfANQJmrRz2m2zhcFxEa31Pe3f
	DuQisHlxXOOzGtkO4ZtTwPeXNnUXu7JP6umshpbCxawWAeNf1ePwE0ifRDDavX6ta8ZaMQ2jBqH
	iOnZE1l4=
X-Google-Smtp-Source: AGHT+IHVP3sqI9WR0JC6BmAf35Aekr2m68O6UQ7+CYnOwpfaoULDxjPzxQ5ztM8jaKZSesOZCm2gjA==
X-Received: by 2002:a05:622a:53c7:b0:477:51c:d853 with SMTP id d75a77b69052e-489cbcace6cmr36646021cf.9.1746018205036;
        Wed, 30 Apr 2025 06:03:25 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f0d0efbsm93035061cf.26.2025.04.30.06.03.23
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:03:24 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c922734cc2so113478985a.1
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURIp54Q16cCQAEitCq9wguB/w0K44DI/AYQ9Vy3X2cH02efqqmQczrhlX0ccR0lYsft5I=@lists.linux.dev
X-Received: by 2002:a05:620a:2890:b0:7c9:574d:a344 with SMTP id
 af79cd13be357-7cac7b5c591mr351112885a.25.1746018203056; Wed, 30 Apr 2025
 06:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 15:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
X-Gm-Features: ATxdqUF5SmUHR6IS83F_BlSTuqKqxW8yJEwc4_Me4L0hReYlvlJOP5xqk2h4aew
Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
>
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes =3D <1 2 3 4>;
> -                    link-frequencies =3D /bits/ 64 <445500000>;
> +                    link-frequencies =3D /bits/ 64 <222750000 148500000>=
;
>                      remote-endpoint =3D <&csiphy0_ep>;
>                  };
>              };

I guess the link-frequencies property should gain a rule that it
needs two values, too?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
