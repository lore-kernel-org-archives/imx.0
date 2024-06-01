Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A57154BE0
	for <imx@lists.linux.dev>; Sat,  1 Jun 2024 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717263800; cv=none; b=oyz/+sj02YIJ8r1K5PC6zNS9yg3xEzwlx2+ajAuebmVjfNi5HqX8mUMyyoGi0JPtBm1K0He3sa1Ep0HW9YPE9oeKZBQQ5bCIIs2vmiUw9yfXoEt5D3ACo5DysgYZAeJqRSqtPju6iljxGIiydzA6Mfl15TheWCANsyqu9Pq7Pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717263800; c=relaxed/simple;
	bh=W0wuE5Of9oClh7yyA2twjLsZUMGP7wIYysfR+SJ1z5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDNw546trP38Y1ASjoc9DFBG+VV0rmedPKyNsJTfrCFZUIsA2KbFlaa1sNDugCZgqBx7wEPROIPIdcDLzl8TYaxhIEqp++cQNhV+c3aoV4vPqjlt/+wJfxht0Yxrt0qR2fkZMO781RU6sa8hXvSu+0H9mssP0M79Szb35svF218=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt9Uk8Sc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt9Uk8Sc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c1efa67244so154407a91.3
        for <imx@lists.linux.dev>; Sat, 01 Jun 2024 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717263798; x=1717868598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buYYkTl8li7ctanCOVUPnpm17gP2d9IWbg1xZ7qYW0A=;
        b=Tt9Uk8ScNJHuTUyZiZiaCAaCZhQ2VklA6GxYlX1N1dUgtAIpnWszTvaYHWy72XZTje
         GSC2bzG5cpsZqcjjAyWsFHWsJ+s2QMPFioE2VNMU318QoBRTf9wOruBCAU66Ipt/d+hX
         7BbcNx1JG71/Pprbtq92JzLknQza6DZtD8d6Ocl/Nsl2ARsj616/B6av0ZSGckJjHu3K
         Q6/ckSPCezvEeTgBtpkERGGj0uA5bM8cTlLqdS/WlgUnyrI18A4GOH1TZldkwkOsk9r7
         CbfCS4X8R3YlXxK6DSByxBEQlxwEFB1phot2UGAEUPLy5Dh3Y9oV/xVIHD0kw1AWX13/
         kaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717263798; x=1717868598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buYYkTl8li7ctanCOVUPnpm17gP2d9IWbg1xZ7qYW0A=;
        b=hsjvDMoKY17QUr0fLfILyZUc7y+eH26x2Cdd98H3Waqqxnsq2s5/wI4UQk71Re+m0l
         IPxw89EIzZRrh9pHXgGK9m51dxtpQmDYR9wtVGiOaKB4nomXZEtm/PDQ+OR9oF1ZkwVR
         ljJtTcUQucPRW3GGNksaW0KMW1ADpev3+wnkp5Pr/FXCWTA0MY4LixznsnFcpJINlDis
         RNZo4aUYTpb4rakbnE/7HyI4CozwyuVBBeaf9TS8HTozNfHqgBZ+Pseb8M5AwmbTWHTL
         F4ZG0GH+qOMr7AdkrloAk/07k6fzx52mB1PurN45JaSZB0In+E2rL4oCfsstlDtbNpl8
         x/hg==
X-Forwarded-Encrypted: i=1; AJvYcCU7nwhOanVCVsrcrtlyehE4B/RGjlmAgp+PZMsP2lNDY3YZPtIpggSNHM0bHHS5jdOmm5LNfcjiwJy4BVlvtHJuCsE4
X-Gm-Message-State: AOJu0YzUDvIVwcBiFMj8aXcwL0UDGirwvqG4QwGoC8LVyGEIMpX5brUC
	I0Vh8+NUGoUl5nRi7MwAw5V9yLjq49MUmCIUGgyEIKx6jEQqHNqJ0JaJw2ALFqdkvrwy5vRYQ7P
	WlcNsJVfiG7hFHz+ep38y8eK+W/o=
X-Google-Smtp-Source: AGHT+IH30qJm5Dn9kjIOog7TjJO9dDrnfu32rz4HIS3cmy1sSKziWOx6W7hrqbBQnUIoV06Ofw6MzPxn1IUshT9zD8I=
X-Received: by 2002:a17:90b:3b4c:b0:2c1:aa9e:1781 with SMTP id
 98e67ed59e1d1-2c1dc4b9529mr4732595a91.0.1717263798460; Sat, 01 Jun 2024
 10:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240601135230.89980-1-aford173@gmail.com> <20240601135230.89980-2-aford173@gmail.com>
In-Reply-To: <20240601135230.89980-2-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 1 Jun 2024 14:43:07 -0300
Message-ID: <CAOMZO5CVrEEj20v+EDX7rmCvW29wL+gD37mfMZAp-uY=tnz-rQ@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] arm64: dts: imx8mp-beacon-kit: Fix errors found
 from CHECK_DTBS
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 10:52=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:

>         adv_bridge: hdmi@3d {
>                 compatible =3D "adi,adv7535";
> -               reg =3D <0x3d>, <0x3c>, <0x3e>, <0x3f>;
> -               reg-names =3D "main", "cec", "edid", "packet";
> +               reg =3D <0x3d>;
> +               reg-names =3D "main";
>                 interrupt-parent =3D <&gpio4>;
>                 interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
>                 adi,dsi-lanes =3D <4>;
>                 #sound-dai-cells =3D <0>;
> +               avdd-supply =3D <&buck5>;
> +               dvdd-supply =3D <&buck5>;
> +               pvdd-supply =3D <&buck5>;
> +               a2vdd-supply =3D <&buck5>;
> +               v1p2-supply =3D <&buck5>;
> +               v3p3-supply =3D <&buck4>;
> +

The extra blank line is not needed.

Thanks for fixing the dt-schema warnings:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
