Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB944179958
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717864695; cv=none; b=ZF63fekGyaaalcbXk8jINRk22ta9k65Tf4P9ckpycKXsMxTOmLlmV2csBFlLJke7/a80SZBLFswg2yY5O259LwFSAn50w/tfGIan5+qmS/A0N6eyLXeH8zl0MogNh7B122qP8el9iVcWXwVB4JiH63dSINjgATGMG6b6Mue8Pcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717864695; c=relaxed/simple;
	bh=lavqlrHogwUC9mmcwJckb+cT8mAaADZdVbxJ/+8gRqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZuftdQ+TrY6YaeZ3uxFheQtSXv2dMD+yPXjy8F5KZ6Vd2vXEqALCEGc9KUA78DnK3nQLEmo0KjiIYpTgARxq+x9Sx0SPXq7FyCRUMesiB3K75mgJbrpYQX9CrDnlIuGmvmsqK34bmh2NDthO/9xRbwtXhBftLrOKE4v4dpENuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgU8S3I1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgU8S3I1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c2db1fc31fso59745a91.0
        for <imx@lists.linux.dev>; Sat, 08 Jun 2024 09:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717864693; x=1718469493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFLGmunAqvogS4M4bBRmmOM2b1Zn9U568WT3k8G7wyI=;
        b=lgU8S3I16cBCt7qYoyC54lMc6mRXVIwcbnrpf6U/sg8KquJzzthmJQQKTFEx8fHbkv
         +wuJEAJnyfr8Lh2pakfOpGkbpCab8PRRCvjwcd7MfHUuY/kxuuzN3eC8VcmFRevDwsEV
         OjxoMfTANvlMjjyGT9xgjFS3WzYOPRhv3c6G/OnSK0uNPY0/X7RxLI30xFsxc1hyhhPS
         8P23eANzN0UiNEXO+wAbPOFrxdOo5hvVtwBqvm6HgPmJyBZM4y2iWj2uKUoO2FZ1IsEj
         0KE8jc40wUefCdjxI32qitZ1cj7KUFX9JMFPqqQe1Mpu6tg3/WkqZ2fW6q8gaYrwOUUg
         zQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717864693; x=1718469493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFLGmunAqvogS4M4bBRmmOM2b1Zn9U568WT3k8G7wyI=;
        b=seMQC1cC4m+gdlXVlIqTQ1Niyb0MKrZt1ROHL5PJMxDVsQCNqfmiGF9iLc+9hRzVZS
         ULdxe9wTyZYxIt/IqcS/BqewEv0KQQ45G9Gf4CYxsk0HWTKXRBVi/PhDA2YOItiC9VEs
         hk1FhIKcA8Xp8zhWDimLe6Ig0d4LIhcGYtWze/8nSvWvJPODmz/ziOhIrjWHLg0h7KbB
         jpYkmkNbSm2BEIdkg8FlBhvQVaB7EziwOsIqX4rgJ6RvpALfWlSAeG3il2WEGkAQI8Pk
         fGQYf6feZth4txsk8gS8a0NCQP53sWgaisk3J2PhOytkMCmYhpPS2L/Nf7mMNAiXk0Ni
         oM2w==
X-Forwarded-Encrypted: i=1; AJvYcCWjZMgOWsD1mdfjxxNMtSfEX+TqGA5iMFiiBuphWb8VgokaSH7+OKDItPN2LBPtywlmtYdgwyQA5vz9wSqnFoXzzbp0
X-Gm-Message-State: AOJu0YykXJpwyxHfvTqIbCzljeZe/3FnEGPdQWBYDi775oqQGhhtDLz8
	kQqoNNaddkDcvOT2VrKi3iU0SbmERk8zzvJOMV1/AHsp2W1TGaIU2GBn2Wk2gUIpG54uiUtcoix
	4JDfCVsLcAf0A5wdPsHYyMNu+T54=
X-Google-Smtp-Source: AGHT+IE2ziVnC1MC1kTN0mv56FYXjqtcSrVL6RMmoiz89YlFDp70YXWA2nD7FwvijH4AQBDt/5JXZYdR8kCY0SsMays=
X-Received: by 2002:a17:90a:4591:b0:2bf:eddc:590b with SMTP id
 98e67ed59e1d1-2c2bcad64d2mr5285074a91.1.1717864693008; Sat, 08 Jun 2024
 09:38:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605094812.1074027-1-peng.fan@oss.nxp.com> <20240605094812.1074027-2-peng.fan@oss.nxp.com>
In-Reply-To: <20240605094812.1074027-2-peng.fan@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 8 Jun 2024 13:38:01 -0300
Message-ID: <CAOMZO5DJ0oeOmm-PpDMpGwXfsjcm8ju6+EzpG6f9BxH4okLFxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 6:39=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> +&usdhc2 {
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +       pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +       cd-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> +       vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +       no-sdio;
> +       no-mmc;

Please remove 'no-sdio'.

On the imx93-11x11-evk, this property prevented me from connecting a
CMP9010 board into the usdhc2 slot:

https://lore.kernel.org/linux-arm-kernel/20240529034854.1595664-1-festevam@=
gmail.com/
