Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B61E2007
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246166; cv=none; b=Zm61Do3oSGjYRbHbZmUE0pfhHCTgzI02C0jJGs9sAIth5NpQLmSfuJ3OxJ3ExtBoLQMK6X/OrhJpzq58IerbGONTOjh93PcyL9+mr9sed1Udl6yAjKLr7x4l9mJFOUKMoxznK1l5M3BBO029c4QZZa0p3Y1FpDcwa54U9unk9os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246166; c=relaxed/simple;
	bh=V46PQ8mG34pgi2wB7fE68m4CiUds/VtZ4km+ZeQTlNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VL6FtEFHfep0UsT49DPkEPMM3fbU/7VZcEkc3fxIMebb8nFzWzcW+fGMtY9FLvwoMho6M2MGSljfQcpbPYNp58vDlzPUM3lTqQf+46V6p8T6KUM7SP7+KguEY41ZG14O1okfNg3VJcHYsF3cKU2U1vNUVHGUphGBsZe6UMejmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPn//grC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPn//grC"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54025432becso16140202e87.1
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736246160; x=1736850960; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
        b=cPn//grCf1jV2kUmj4ECNYA6Ik9lLwFUIYsLNk/igcNApN8QRz9wtd7qoKeT71BkQb
         hBd19Cp0ZZk+RVYKycH+cZwWHoATb784GkwsUWmk0amVBTuGWrxHgYIcvwrXiwRnkcOQ
         ufqIBlMtUGoSSPWZkN4lQBE0TskE+qR1p6pEnjR0vv5VeFUtzgzsN/A3/UixzS189BdR
         MVJS04K7/xC5L9PnX2w8Fbw0wMzHSIWMdUapvt6w/VSxzvGWQhT0M2akrdkjcrX8woi7
         Ql7gD/+NNOJGoEQ7nVA3dhWHVOIJIvBFgXj8Ra5gsId/fppSReedO9sh8Hwlfj23UWKL
         oIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246160; x=1736850960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
        b=s7tQnqBgnLRM4n18qilj74AD/GUOpTywxy8o1FT64GYFI37VCdWAY4VZzqELPbpLeY
         CpwQ34kjaMKN5IjB0Yv20CTQzNAQYSCqv3hkHLTC2LbgBlUM+qO0fLrW8TS5y6D0u3Wh
         4MpRH5S/PezDD9Hfp2s2FfQNtX+blKL4LmelwtEVYWzhUoXp8gyphKG8guqPjfbJp/GD
         +ZSWxP6e5xU3sujDbSDRnYjJR9h9dQFb0OA6yNvp8HCjqJ+0D8TzF6u1hKmYr2r+9ZRH
         W8inqj+JK522AnZKH86Wd+BgEP0atiq//j2Oygo3JUe9k+LCbx2Oof4JnbbjQB9j+LE0
         HPpg==
X-Forwarded-Encrypted: i=1; AJvYcCUbM2gcgtWCekaRkp3v5dbFuv237VmN/gk0C0ok8JcjLtN7ng864LT8fFS+f6X5tozHTMg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYJN3o23kImwoihQw0V/1XyCkDaTozDMtMrLRhdt6T3K3VmNla
	t/PmzIxCEHTo+2MD5/wxfDByEKROsVY2rWNMtzDcRxqkUG6VG2WO8LQpY2y24sSrm5iHWHq6ci1
	jm5p91YsdvrGmBVi1r8v4CgxBVrE=
X-Gm-Gg: ASbGncvFkBgm4Q2WNCG6EdMmDdF2kDmLPPjASLQr4lbRAlB1XMckPuI1iUpcMNUhviS
	NRvJHfDf2n3cS5JfkYM4wQLOCAP4P/MEnTbTTnh4uACq677l3A5ceWVB1aYWzBPxstL7iqg==
X-Google-Smtp-Source: AGHT+IH/zgB5AIW8SXe9fLjt6csgYHV150OAiMaYUNGL55jIFK9HyFHffxA0F1up0XAC1lvyFU3qoTZjri7PgMpYmPM=
X-Received: by 2002:a05:6512:104c:b0:540:1fec:f321 with SMTP id
 2adb3069b0e04-5422958243bmr18443941e87.41.1736246160170; Tue, 07 Jan 2025
 02:36:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com> <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:35:48 -0300
X-Gm-Features: AbW1kvbqKfp_hBVMEYDDaHbQzJ92mQ9GQWt0UJSLPvbJH41ssSImPCn2Z_2AU3U
Message-ID: <CAOMZO5CasQDRu=U7zUxzuFVBHyREZ7oyG8+SJjg2BF58B9G3wg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneO=
f' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

The warning here is about using fsl,imx8mm-mipi-dsim.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 4ed7a799ba26b..e43fec5609417 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -27,7 +27,9 @@ properties:
>            - fsl,imx8mm-mipi-dsim
>            - fsl,imx8mp-mipi-dsim
>        - items:
> -          - const: fsl,imx8mn-mipi-dsim
> +          - enum:
> +              - fsl,imx7d-mipi-dsim
> +              - fsl,imx8mn-mipi-dsim

But you added a fallback to fsl,imx8mn-mipi-dsim, so this does not look rig=
ht.

I have already sent the following fix to address this issue:

https://lore.kernel.org/all/20241217131431.1464983-1-festevam@gmail.com/T/
