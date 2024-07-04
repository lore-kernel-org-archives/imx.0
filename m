Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F072846F
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098821; cv=none; b=delZj03isqrADJswjWILvyh38ogCnN2zphpSRCOPvDYItPgi96Uo9tHcfaExR+vltdFvCPwiT4cQXa7+yiMGwPjFJtQ8pwlkyrETF+CxkzPCCDWQTiXOitjbcn3LPGWdYlxq5usODO51/+Ckqq3hHCwxLZ24QvqUnNZnIMx6wz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098821; c=relaxed/simple;
	bh=m9rR2mQ/wSygZXAZMY/B7NSsL0tnpf12HSm+Z+ZsFD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPaaS6kOZ7Mul/4Tc5knQPlKFw1n6Rh+vbysrrM/84K3wGkpjKR/AKWD1JXyjkTv82d+/7KsqoH0sQxzvnWvfp78Yco4rDzbIuCx38SdM8/QTAQbwhVFZPER2H99j5sMM/bRq5JbLm5eq6INa7QNKtEZiLAGy512bPXINXi7+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx11Tjy2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx11Tjy2"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee871fd456so932521fa.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720098818; x=1720703618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJOBBEbKWmJTuqge2NQgqId9OVl2P7+HobXFfEpNUao=;
        b=jx11Tjy2DSANIRm4GesaTpdNBlx03iy3pm37JYNte4zxe7F/Y6nxLT8laTTzI5xpAc
         Q8a67o4LyJqe2oeOzQqXeQVahnZsUCH5ZnJ3YS9AvLqZuPXL7B0EGHVFIjzK1LMN5yu4
         ScNrqoMxQeeZtiBKXu+bXr802vSM8rZR/l9khb1/1bGrN4QzVm926LXmzIlZg54asDt6
         ++kHGIrYAtnV/XXsb5uNZBDEi6E98QQc9YF+9hPvd/GKLlOOvbIhgKkc9YQqmbBNRlDr
         Mj1uszq761Hy/j7rSWbsdNbVAR69PD8gY4MfnQFrZPE+GBsret/nUEAraWZdt2O5qe+/
         Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720098818; x=1720703618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJOBBEbKWmJTuqge2NQgqId9OVl2P7+HobXFfEpNUao=;
        b=rjZijVvvO/dJ1Qealoy5dGP7mbS7SCjWB3A7nrle+wTjnY30LM91puJTN1gUDY0oPX
         LIEh187RqKf6jUA0AbU7C+4vLJYdUcLzI27LqSlQC9B7FXfutMpDq4piIfrxP/pRBW8I
         hLxhmGPfb+cuB7aeoCyRKpn0PGrPhnzGIRix8s0xOMYoTGzoRUCdi70vcPwokGJ/pI9g
         RMh6yr1WBVzyXtGjwPocT29bn7/8S6oANK/fXlKvEfoduc7gRJa2nGzJuLBW/V0r/Jtn
         iQnPoj8/DJr30QTVzhCkizk+Nt/CzlOQIdxTJS4+N2XEjypbamuQal+FeBsOV02TsHGj
         Kbbw==
X-Forwarded-Encrypted: i=1; AJvYcCWMNwlQxTmH5mJj6NaXgB7uhR0LKGbuDAzqYitxQPah4kF7SCUuD6hcCrV4Ixok97w+88/z+dGNsCM4b4tkFJiWrOvg
X-Gm-Message-State: AOJu0YxSRrjv+7SZTxRueK/CIfJKDJlT3xFSPiNQ8EJKOPLJ/33WiPjk
	S0LEarPTL47gIjxT2ndhUMknN3rxKu+SMBaelG/Zx8KMNkvKNHpGKk7xE5pNm2vVZa1H3n6Aom7
	DmbXBeyuk0DeY8UqS7VniPFRDfPA=
X-Google-Smtp-Source: AGHT+IFFj5rrfeuErSdp9ogor+1Ve/j/MRQZsX5zn9HGTR5tBwuQsJibSORbuPOz5HTC2RdE2S2VeDPOERJJ7117MHY=
X-Received: by 2002:a2e:2e08:0:b0:2ec:5258:e89b with SMTP id
 38308e7fff4ca-2ee8eded7d0mr10868431fa.3.1720098817502; Thu, 04 Jul 2024
 06:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704120300.2849264-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20240704120300.2849264-1-ciprianmarian.costea@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Jul 2024 10:13:24 -0300
Message-ID: <CAOMZO5BVS71UWS2u15EvbNLohSqRz8DamvXBQzRxFSNTobJG=Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: Disable usdhc write-protect
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, s32@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

On Thu, Jul 4, 2024 at 9:03=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:

> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -145,6 +145,7 @@ usdhc0: mmc@402f0000 {
>                         clocks =3D <&clks 32>, <&clks 31>, <&clks 33>;
>                         clock-names =3D "ipg", "ahb", "per";
>                         bus-width =3D <8>;
> +                       disable-wp;

This should be better placed on the board dts instead of describing it
in the SoC dtsi.

Some boards may use a GPIO to describe the write protect pin via the
'wp-gpios' property.
