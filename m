Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D921B0F23
	for <imx@lists.linux.dev>; Thu,  5 Jun 2025 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088280; cv=none; b=TTa1S2S+AP6XAuXe9Y/UNVRB9+wkIg3S3OhLeuS9KHYCdmKJQVC38Lyy/QBG0sLpO1ceh6ZDgc2baeShdjjoI979OBoMeVhn/ijXRO14uN8Soaau6+986NF59rCZRVJqvH41OmjTUxbJjKOUFYc1KcUFK3ejSwBss5yywnWl90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088280; c=relaxed/simple;
	bh=/x4DxIxH0BWpIRnk/qPEJtSiycWgqptgoe9uavKpWAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRcuCmMJZQXRqGV1CVgZMW40SE8ElC+tmIqSHhnykcUXDApTYwvaG96DmVWP1QW/FONnnxT7C0D0xlYQz9nqEC+UrLvR5geUtW980y2OjuLDNo10Tpt4a9f2ZtmPXBxaEeLJu7RVtjfMEKZhy4wMOyJfQrjVStlOZjRAlqOVJN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U22Xa950; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U22Xa950"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so463930e87.0
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 18:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088276; x=1749693076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=U22Xa950xAvzafaPBrCjsyVhCBFcodvU5ianitS7BA0UXpYEjm5PkB1mcOx/FFxP1W
         El6zbPL6tyz1PKJX2AorNJWzYTwJeKXwcbmOj5fV14nMrpGvxU5eBv4dDeFOJG7kZGrS
         qECzIZ7BywTI6s4Ve0X4+dw6VD09oO7gW+pDDfmPXc/Z9EQn76eQO4SOGAjK2OmepYS/
         b+Vkw3Wp8619INhahBqfum46S+8iCywV35VPox6Lwd1u8cdJQNFphEVkFDL0ttyOGziz
         KfN3oBNrNip1U/JM+ycH/JXeuhVrfW7+sg+hHx8HdxZn6jrbkQhKZTWb1itFaJBStvdo
         UFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088276; x=1749693076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=un4YXkvei7liHvmz2I3f8oeqQdlcpnksogk9xq2LBc2+P0tq1maoogyEFXep4M9TV0
         nYB2ng73LaTzxrzzAqsCfCF+6tmvm1wVV+8e5YcK9+negQi7A99Fq59ZggTwkOX/Rdw8
         LVUsvsVypJiliNkja/8uZ8XYNTad5qMYBMC5IUz4cAGIrU53v0FMzfS7F6CHcOPgsNhc
         O77dHdqZrsnLn09tZfBNELKiPA6RHpFd28hGd67w/ercoTR1QI6OTuagqzb7g83lXbsj
         K9yWNki/6PMStmKNRa7zIhXiP5zMxERHsKwFwvHDmcWUBtulk3h6JORu78uYoMIet4tB
         l33Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDBvWVaV5nDMaUKeqaWf9L2cx8AQi58En9LQ0ZkZxvhJSLPytv01SxT2SYKu5JNT0QhMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtEMR5187g+m/Srf6KNCxh4K0jLtJ6GS96oX8eSFaCZJkjFNeE
	LPWvoZGVzzCILcFTjTO+Y8JZFyhYpGHAR2HkWpEL92cRXuTaCGiBzjAZRvuJH0jk+RxahgfgC8f
	4TgVMve/Tt2ykpH5TgN2shMz1TH0gHpC0bwZE
X-Gm-Gg: ASbGncvoVVev4owe03+BVjUBdLF0Bvdg8jRljuxDA+qPPRyiCR5akh3VsYLevu9BlAY
	W+4H58cYzqp9r+LLasfyIUGmvhoiI3m8hANR/C4LBAwbZTJtslGWc8B38pO9xYBnPohe8t3gHcH
	R5LDXHIjv3pwwz2x4mtJ+JuPRYAGcGZbyX8jaDYtHuDDgDSNFBm/XMtaeP/TkF8RrLINyZhHWUB
	jYn1iNx8lt61Q==
X-Google-Smtp-Source: AGHT+IEk5Zzw6tHETC9Olgqf21/GWZkYciJCw0USM5fgKHPvApi5DG0a0gN6WZoczUuRV0vhQDc7Mouv0C1rm4TpyHg=
X-Received: by 2002:a05:6512:e9e:b0:553:302b:85ce with SMTP id
 2adb3069b0e04-55356ae0fb3mr1520607e87.7.1749088276083; Wed, 04 Jun 2025
 18:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604200301.1192096-1-Frank.Li@nxp.com>
In-Reply-To: <20250604200301.1192096-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 22:51:04 -0300
X-Gm-Features: AX0GCFvVFxob8EVb6NLsa3nj-286Crhe1GjgNqXQ3KjHN84Y-NY38GeprMrasXw
Message-ID: <CAOMZO5B4QQmZ3evum871m8AF36UTckbaPCwVyKF8QVN4-Z5=iw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2]
 i2c[2,3] uart5 spi3 and tpm3
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:03=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       spidev0: spi@0 {
> +               reg =3D <0>;
> +               compatible =3D "lwn,bk4-spi";

This is wrong.

I'm pretty sure there is no "Liebherr's BK4 external SPI controller"
on this board.
