Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A091E864
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302332; cv=none; b=Oqmui0zs8YOYjMRfGONrLrhuitO7vzuandfIPVaowozdBBH1lwrZUoq6e8rQ8QNvLtsmfZJJzLW9vJbbyHFxVzzUZBo5dgQZ8CcwZUqnhR7tKeQOMhpX2PZxDJA3ErMnkGJ8aCxglt609rErEftm7zhm0rR2Ipp2PH4b4SFIYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302332; c=relaxed/simple;
	bh=rHxBWPbUv6UV42+sEgbA1iJcX867tFp5OytmZQZ3UGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONt0pBKMAdQ1HGnUG6OVlwr9SE5eZn7pdTxsL7f7kmDQUUlWBIp16LdP/uMyI+9bJojzuZlMkQv+DPUa9bhL1dPFuok85yj6KwSyzz6GLU6ijG4g13lrxgHIA3GWWynNFqyNrZPm5Ycm1DZqFION+o7ujX464GF7hltBUTywFls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j10pScDJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j10pScDJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ab1ddfded1so131856a91.1
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713302331; x=1713907131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBEr7AmEEZkKSiw3BsMpmaMNJ9Caj0ON73VIII8SWsI=;
        b=j10pScDJ/0mmeSlv460ktiUgaqF9H/mXBKEkp3DTiRc0U3VohKK0vGls/WMh0YoWnL
         +wP/Qf8g5EeSSn4gxRv/bEhgUekFzqB/U3QvwOThvzoK4c9hCyj1ifKe3MOCgtVqaqeI
         87nJD5sKKVH2vOlSb6mSiZOoZAbVneXBTKVFbZdNd+w5PMCuVkBYR9AvPO1/vva0GGsv
         4zBGUlmDFTYMNIyamjMRA3H20TEczS4Om99OSQXS3cq46mCdQ5Bck7kEVFlV4a/bMK4Y
         VC6BFr5ZmCLpT51Ho5asxQ1s/O/dc5TiCI8G4TYrD4O7k9hGYpyYzV0ZYMNLa27yUTop
         s92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302331; x=1713907131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBEr7AmEEZkKSiw3BsMpmaMNJ9Caj0ON73VIII8SWsI=;
        b=Mjm4jMuOHCCeE3lPFsJjJIdVlt9/S6YUOA4dyzvLW9M2QiDhYcu8Z5Bk/ScEpgoonG
         XuecdMb4iI94mg/E+XVYjf55yGmLd4Z/tUqmMZFF/CCPwzfl7GYZVAqw/ppG6vvcAcDL
         tsG12jfmLA43eedv1CeHAaKEc0cjj3IpA/rRWSW5fRxO8CH67Ee/voqIvjtU58f8U4GD
         J1qgId04cw/gQP7V7EleoPFGKNS9Fv6Hcg+yO9SIFT1VdsmA0YhER1HolkjVBNDws5/q
         vQKg7TEUzAVoUPUwoZuXS3JAYcEx97tbRl/JUrvNOizxjgEvjFQAw78n+1myl9cOjdt4
         Wozg==
X-Forwarded-Encrypted: i=1; AJvYcCUN7O2ZpWDAqN30O8MGqnvKnU6403j5QInpxF7FLdz5aGmIcG2gCWeB0OIboGB7MPpvP5c/YreMyT439qFhmOm6FXQi
X-Gm-Message-State: AOJu0Yz/DXlf2+gh177JWb3DoJDaYii1Xfa2VSyTSvw9sbN4Kkt2qByl
	b8U1KwxGmKbWyHXfpd/55CMlXPH0C9mgtTeOlFGReBrtiIUVrvS7GvNBFo6qnz1igUEgbf41w6i
	7pakXdFO/uYIdE6HuJTEqG8bhwGg=
X-Google-Smtp-Source: AGHT+IFhlEFxkQR+ieC/Pa0fKkP87ACk2PMEqPN62geu1ZxkPfEDzM2tLQRrA2jUzsAT+yFWyAIlwAZgs2PhJ+8rSX4=
X-Received: by 2002:a17:90b:180d:b0:29f:7fad:ba50 with SMTP id
 lw13-20020a17090b180d00b0029f7fadba50mr13315078pjb.8.1713302330612; Tue, 16
 Apr 2024 14:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com> <20240305004859.201085-2-aford173@gmail.com>
In-Reply-To: <20240305004859.201085-2-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 16 Apr 2024 16:18:38 -0500
Message-ID: <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wrote=
:
>
> The DSI to HDMI bridge supports hot-plut-detect, but the
> driver didn't previously support a shared IRQ GPIO.  With
> the driver updated, the interrupt can be added to the bridge.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Shawn,

Patch 1/2 has been applied and sits in linux-next.  Are you OK to
apply this to the IMX branch so the hot-plug detection can work?

Thank you,

adam

adam
> ---
> V2:  No Change
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> index a08057410bde..fba8fd04398d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> @@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
>                 compatible =3D "adi,adv7535";
>                 reg =3D <0x3d>, <0x3c>, <0x3e>, <0x3f>;
>                 reg-names =3D "main", "cec", "edid", "packet";
> +               interrupt-parent =3D <&gpio4>;
> +               interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
>                 adi,dsi-lanes =3D <4>;
>                 #sound-dai-cells =3D <0>;
>
> --
> 2.43.0
>
