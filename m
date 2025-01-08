Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47D14A82
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341283; cv=none; b=RBuFByuzSilQkZ63T0+b7N92QB8Z5h9Lu7JLdoCcautggzHmAuIqwOxoxzAKHtjH4jrDxkZjeYDXJcMEPCty97m4YXeugzUdV2fNNGbXfEzZ4xwZLJ2Xo5yUeRBL2Npso6PT5YZb3Rkp6DAqeZLZxbRMT8g+PABBkgr4or49aUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341283; c=relaxed/simple;
	bh=00s/VYsuB9ND1dR6ygEJ0bPI546crCnvjdTjUa2ST3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIJY18iKqQFwiFk5xHQoJ8oFeV8vdsHrzR4u+O89oY5ZiSvN45hZ4Vs7ctPAt9djyZyorMGs4P2rAW+i7/FLWQGWcVFHfjLxw28u8D2vQvhc/ALu4ujLL8ME0Czc+mg7frf6QbwVLMa7o388IXONaZc/SZe7WILS12eg0HVd6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dccccd429eso149980346d6.3
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 05:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341279; x=1736946079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DPVgWRoBgp5UUwkNErzWNpDubic5Irpv9/KSUHnOLo=;
        b=m3fpGYDVKiLk+HnVwyu2uHRts0pAKM/GMGIXTViargM3HwMJsyRZXI9Y9w/U3qhp5/
         85bAZBjhrPxCBWqn//t8+eFfsDUnBGIFRJoO+2mOy+NSzNZ7RVdNuHPb8hwUH0+D2lLx
         lsZ1zywQZmAFMsSE2wX+LAIZajWRmsCkUNV8KVvYksYTaLOyackMFi0GhvdCLTBrawwD
         KOhDUnkRg/p/eW+zl5oyGXlgQa12mGBO/7TuRkS+uQ3aWil9O+L4KUhki8CCHsRGhMZC
         sEqAdY7NgNZeUO6SEifcfLO8KyyHoREI7jKJqUM+c1rK9k98SuwWose8J0ofJbgiyoUH
         LkNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMWpCxVDFyW6+SEAuI6+Xb4saSbe2KBlN66uB4aksiS0YPMp+yx/g7OMrLW1mkDn8sh9s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD4x/1Nwgh5HN+znbg6nP0xemDH6ooR0nrMUuBBEgZNCOsEp2/
	AK0HqxqPubQQslP6j4d/SObbu1jgSKKi83liAE0gl90apmSVKiK+RXbLeXKJ
X-Gm-Gg: ASbGncv0CfQd2ur8/HYojrQYRCHAx3Vm/ZBquIKUl4a9Emmp3m0SAzJ4NYHdC2wlF+x
	a03fgl3GSuNSZwWzaVgMY7bJdoDurII49GnBvcvb6WkruONRHt3IAGOs5uIN2AvS6BNzPNVUYF+
	ICQzb23SO+tUJo8kgUwe/ipvKYq/gymM2xwsbmo8HzxL3VCCFLIh3XcrUPPKP7XagPHB3flyRRc
	gNLu00U+1HeNh02xewN55btQIv6j21m9aI1KefI8V8xfNSPrB2Epkulk+XkRGgAj8hw4DcfidfK
	Z24FzrYqlPrFziYDQYlDdh8=
X-Google-Smtp-Source: AGHT+IGPSvyTKwidR/MoNF/8WpHWx44ioyoLZfFvktnyyXD+ZXNj8xDhCAkyxuuGuB6ZTnonhjxdlQ==
X-Received: by 2002:a05:6214:27cc:b0:6d8:d240:9f26 with SMTP id 6a1803df08f44-6df9b1eebc1mr45935976d6.16.1736341279432;
        Wed, 08 Jan 2025 05:01:19 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18110112sm190807826d6.33.2025.01.08.05.01.19
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 05:01:19 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679fc9b5f1so125587191cf.1
        for <imx@lists.linux.dev>; Wed, 08 Jan 2025 05:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlKqpFRCO96TobDt6IOXPxzmP9csoS0bROYGxbltvowil27Me+5D+eNX/znfhbS3VTb9M=@lists.linux.dev
X-Received: by 2002:a05:6102:f11:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b3d0f94834mr1605383137.7.1736340813382; Wed, 08 Jan 2025
 04:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
X-Gm-Features: AbW1kvb03s6-ioyEsxQhihv8HJWEPeM4AbdJ5u2RlFP_T025eauQBHNT5poBSNc
Message-ID: <CAMuHMdXq3pLB1K5N9gFmBF6B0ohpLdKf0aj0WSuK17U-Bs4oUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
> @@ -58,10 +58,10 @@ examples:
>      #include <dt-bindings/power/r8a7796-sysc.h>
>
>      cmm0: cmm@fea40000 {
> -         compatible =3D "renesas,r8a7796-cmm",
> -                      "renesas,rcar-gen3-cmm";
> -         reg =3D <0xfea40000 0x1000>;
> -         power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> -         clocks =3D <&cpg CPG_MOD 711>;
> -         resets =3D <&cpg 711>;
> +        compatible =3D "renesas,r8a7796-cmm",
> +                     "renesas,rcar-gen3-cmm";

Nit: the compatible values fit on a single line.

> +        reg =3D <0xfea40000 0x1000>;
> +        power-domains =3D <&sysc R8A7796_PD_ALWAYS_ON>;
> +        clocks =3D <&cpg CPG_MOD 711>;
> +        resets =3D <&cpg 711>;
>      };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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
