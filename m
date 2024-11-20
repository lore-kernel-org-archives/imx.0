Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3623812B93
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732074374; cv=none; b=ldUwQfpFPMDuv42eR5sgWPKw/NYhhagIeAk/kA9W6yKOVVMZ3t1BF/tyK6auBTsqMBVww7S22i7ugb3rZcu9ikgCkWPtXclQy1xkdixfHj5nF4s4RS9+lZS6q1jzdU3lAVMqCDQuHDTcaetSUlonz0nptArbuZlozl+45BHuC3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732074374; c=relaxed/simple;
	bh=yRv/tKkIxw7/PgCT7gTfrWds7b10frLZZ6468UJWe/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Agp+FJ2osLTnegMwQfFXW8mlN250EdwQPrbXosIhIshR14YN95PR9kYxHcJloSJWBEEsjJDsDoPR1EZkqVszXKZpexFKef8bX4AfWy1J/lgKWVMzN9ap1/cXdVZ+0LgalklRScuGyRUF5xmyQFsSXeu5MQrZX+DIOxMyWvrEs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmfK9bFr; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmfK9bFr"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a752be9f4bso14735795ab.2
        for <imx@lists.linux.dev>; Tue, 19 Nov 2024 19:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732074371; x=1732679171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jtk1zl4aSk9+lvWPZY5UumKAQmiBiNYz2jEHrbWkiE=;
        b=lmfK9bFryV6yxZCU5oOugpgrtwKTauXsCi9nYBUiDx1Z6RkSxKs7TcQrtJHyUmaWVF
         W+XDi4P6WIylKBJT+5mWgng+cabxAfh+Uo1G2t1c6HhAEtDv9Tt3P4noeItrFkYK1OLi
         mJPG9YsnfJ4IjSaZsuSSP+TWLUgMdL8oH4oc/XZWqv/zF9LQx8B0d5FzLRL7bXAElFZm
         /3/uef/upsySvh8KE9HWHeGM0Bb+0OvKrdoBcAi+hUqufDIli+Y6osjzQ23FpzymWArg
         Ew98KfwHHEYErQUjlYpwe2clS0IN2rUsvNLTwlfSI/fJXAZyllUuTYqTxF5sJCqVSoXf
         YbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732074371; x=1732679171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jtk1zl4aSk9+lvWPZY5UumKAQmiBiNYz2jEHrbWkiE=;
        b=LCaL+ginXAxa3WFOrLdw+O8J1sAICr+D/8zs+8Hb38evZq99qnfDUlopLISWiWGWyi
         HGMumnnw+0WMtZy56q1CZxic8JjXzMDxLVOUvs/dsKD6TSMd/DcHP22h93jSwOgfmPt9
         ti984GoeBevory7aDBd4PZ7Zxry9AgExMGbnCKT9wY4t5GE0EUrg/qCLT5Fy6FHMB6Y5
         yFl6HF0HLjInHFyEKtrzvW49GACeT1s9hYyHPT27O3SoqlntI+w3wtxf+LeD//f4bS8v
         ZS0Wd88KQDieCqUpH44FxC6wGdER/D8kwWP4d+Qx7JEV/uvcZpLbJMk6Xbyjs2JAbtKz
         6VKA==
X-Forwarded-Encrypted: i=1; AJvYcCVbFb/XiurXPDdHaAaeUZH2LlmiLfqSzpOoob8B1RnO2RJ+Z8sJEaFEf6+z50G5DsdrD+k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhcjrkr3pHmD/29rb1UqkmXDBRWNdQIVVCJUeOiNtHnH1ygMZ9
	iPbfJIgWIT3yYNMtqJk7aSW8m6PU4ZSgxd0Vf+9PK9bm1TSK42ENWDRONyUbSN8McvCX8n18eSK
	iKvC2eEje+hIPbAMO0hop1TrFKg0=
X-Google-Smtp-Source: AGHT+IGhh4aSgpURVT3OET61N9X1zKakDzkHXxCrO7/9x2Fw8GYnbqDbAbC3nVPeDgWEHh7NOxcLBWPVrQEE4C9TbXU=
X-Received: by 2002:a05:6602:1645:b0:82c:d768:aa4d with SMTP id
 ca18e2360f4ac-83eb5fefbefmr225028639f.9.1732074371282; Tue, 19 Nov 2024
 19:46:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115230555.2435004-1-arnd@kernel.org>
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Nov 2024 11:45:59 +0800
Message-ID: <CAA+D8AO8=NaNM0jPuSa68yvNa5pJQ7r207_-y06sxB__kqWdGw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Cristian Marussi <cristian.marussi@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 7:08=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
>
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_wr=
ite':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_re=
ad':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
>
> This however only works after changing the dependency in the SND_SOC_FSL_=
MQS
> driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
> driver it depends on. This is generally a bad idea, so the best solution
> is to change that into a dependency.
>
> To allow the ASoC driver to keep building with the SCMI support, this
> needs to be an optional dependency that enforces the link-time
> dependency if IMX_SCMI_MISC_DRV is a loadable module but not
> depend on it if that is disabled.
>
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MI=
SC protocol")
> Fixes: 101c9023594a ("ASoC: fsl_mqs: Support accessing registers by scmi =
interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> I'm not sure this is the version we want to go with in the end, without
> having read the code in detail, but the version in linux-next is clearly
> wrong in multiple ways and this is the best I could come up with so far.
>
> If we can agree on this approach, it needs to go through the ASoC tree
> as that contains the 101c9023594a commit at the moment.
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig | 1 +
>  drivers/firmware/imx/Kconfig                  | 1 -
>  sound/soc/fsl/Kconfig                         | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firm=
ware/arm_scmi/vendors/imx/Kconfig
> index 2883ed24a84d..a01bf5e47301 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -15,6 +15,7 @@ config IMX_SCMI_BBM_EXT
>  config IMX_SCMI_MISC_EXT
>         tristate "i.MX SCMI MISC EXTENSION"
>         depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +       depends on IMX_SCMI_MISC_DRV
>         default y if ARCH_MXC
>         help
>           This enables i.MX System MISC control logic such as gpio expand=
er
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index 477d3f32d99a..907cd149c40a 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -25,7 +25,6 @@ config IMX_SCU
>
>  config IMX_SCMI_MISC_DRV
>         tristate "IMX SCMI MISC Protocol driver"
> -       depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
>         default y if ARCH_MXC
>         help
>           The System Controller Management Interface firmware (SCMI FW) i=
s
> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> index 8e88830e8e57..678540b78280 100644
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -29,8 +29,8 @@ config SND_SOC_FSL_SAI
>  config SND_SOC_FSL_MQS
>         tristate "Medium Quality Sound (MQS) module support"
>         depends on SND_SOC_FSL_SAI
> +       depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
>         select REGMAP_MMIO
> -       select IMX_SCMI_MISC_DRV if IMX_SCMI_MISC_EXT !=3Dn
>         help
>           Say Y if you want to add Medium Quality Sound (MQS)
>           support for the Freescale CPUs.
> --
> 2.39.5
>
>
