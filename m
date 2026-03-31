Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2541421A00
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973034; cv=pass; b=sSYONg3UPz1+sa++k66ZSyi/ZzbhdF4E5snnuZnxrKMq3iHdeztrtI3zYRUfG5RlL7I5pTNo5GAw+HIZ0T8Yiu3QO+8AywFQWxLbSG2Ud4SdG1KqOv2ZNn9e9LKCmx7SLnlH29yMlShxas5Dz6r3F4x8FvrAD1AlGxF5nCt9XCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973034; c=relaxed/simple;
	bh=2yavj7EK1PmGo4upHMwJjReye7feEWJp2Qv0943llFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/Bl6yHYG4VULYvyGpW92ot4Ha4BlLSQ7xX38CtgTv2nrs8X9czwWV8kzO9ycmX6wLaFHtKTFF23YMShCnmyYX/BT4kxe3fHCo4p5K5qwepu0zUl9DR9LsFrJA62U50/StLdJZqNWcUHh0oyYizIJUi0owE31DuDFFk6l+PlU0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFXK1A0Y; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFXK1A0Y"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-650158138d9so5281108d50.3
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774973031; cv=none;
        d=google.com; s=arc-20240605;
        b=bxc/PpJo0y4xEVX3SMg82n++ZpzYhZ/Zmr3v5xn/th1G3iXIp3zLjUEZd78G8OgnAM
         wQloXhInwhz7DP6is6wAv5Iq+8xNgHFdgTjye17JbeYvKDZ5QZQDXOCfYBBheYBpnjr9
         F9PnEpnKVk3xZmrveRI9/9VJ6PQLwpHmBm1TA6JAlC2fsYav4D0lfT3URvVRuaH3PolI
         1KQ48u2hx1TceWyOdynAR0udjDD81RXlWsRl1aPp61HsxzSCSYH7d2qLXqnBbVfoPLVp
         /zLNA2B/iW0FCkKBFA3wQV0Ffa9raOST4eUXLviZ6HQNz8jb4QbTctIeu50Bjy42GgeU
         lTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        fh=xhtI4DMtS24vY5xgX4y3HRPqQw2kX/U3QfQz0O0xOLs=;
        b=Arwdn6lCtHoMagX+S3Ekya+Ne81evpqg9E/0JS2bSdtU2Junjh/rDZgZeLH6SxN9mt
         nwEKH4wzNeK0oJjBU4FotQvNyO/uZEIUG9hi4I525GtvmPtxjciQJAe3kkNNpK431cUG
         LRiKVQntxpk60uIUM3Hi7qB2PNUqUp4/XTnwbwu6LbwAzpUyBgvJDkY0Zcgb+AD11/Hs
         WBgR4fmc9uZ3tiCmWuPRQ1mWz1758hSoMeYiYDimVMUNIpMBx14AnK3ZZEsp3nkVc9jG
         ks4u6OVlneVAtpJf+UE95lCNZG+Ug+Q1O3s9bLjN8YBTYH0cZGEVIq1s8qHL7jZY4h8n
         1Akw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774973031; x=1775577831; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        b=xFXK1A0Y3jCphbc9VHtjwsaU+sv+0NZSYTa/z2L4LZrmkB4htWF3FHzFmEb8XTXDUP
         rrkkuRjlqJ9TVG++jbdwyikx+ayuVWk4C54tvpT2D3h1cgGjHI2AUbeqqwhh0oKVBuUj
         0V06WcpmFwVLP4e95RaVrXXFBtpl8cspya0eLJQ1jhkSC4fQiHrqHtRX2Ax5OapwOP91
         1Q87GAqrn+OxQ6IjHDZdFNF/kJa3w5VEmeiCBSc3xY8IbwhgJWSDsyn1zFQaN36zZhaM
         Mg488AYXMTs2yAGk8jT7PQr5xRG7NPBObbPkYAiUCr/q3/wJGrrYsGwBkizZVIoPtE71
         NYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973031; x=1775577831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        b=Obc+qwNsJKx8SesRwBymZY7C3I7NYll9wkbQKxXm1CLN3fmhfm8915rRAWmDgtsDQS
         ZHTeHANKYg0VNaa6uj9qxVP2q4NN1J7BUnsQfDphAjEzN/rDbZTaUKnSa+P5dSeXTrIn
         XWKxgtq575gYk9DyMeCo76TVzfgaovbEGxbxq9MISdAn1CtkxfXafmIHYEHVFRO1Dae7
         2sRmps09oT+uN7JFcenwqkIYwSI+IpIAqPOJY954Jn9dHUdHX7i534uB5Oyhx1uiXB/c
         DJ/+y22AfmHNX9+6RlUf7Ow+w0soGzdAoqlBGVO8bgY197e8UkXzvp9lKtV+VgMyXqxj
         G1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRgvF8nqkEHnNMEe7MzeikMebx4eOxihVghYk9HwAV/mLK64buuHEUgHylsXFwj3lD6Qc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywig82+y+mrVLRTDgrDf4uMDsBO+5D3BtjPP0880Cb2juujZsb9
	Yk4DcPk2OlYjSEYaaY2WlprHhcIf13T0zcdL6iXEDjz8WoEfJiTpJ+JgHvCVTS8zwtkGjVaw8PM
	z1d6Eei7EJ7grSZMZarnZtgqNorTkFQf0yCUPvJHbPw==
X-Gm-Gg: ATEYQzwKhw72J/S2eVo8fIgPAeIZ60oMCaslhys9JgHtkPzmLRI30Ns1Y2R1x0Mzf6+
	zzY/UdukUYB5PXjKKLrJu3zAA4VYKfMob3LWQhR6RveUlyGW0loZiNboS2UqXPYAS/GOtsatOxF
	enR61wDfJOb00dy6d+ne9xOtM2hunSQxzNqvELGnxCVkRuCLn3/1Ury8PK9cmG5ng47+Ge8Bg0E
	R81xOLc9QtuvMULLTqfqCgGmrJ4XIn7tKSdbEuPVc5XDyHCRGj1x0ANuDpMjGMuuJK/9DHkO4xQ
	GC+cSvukFVsyYcrQNCA=
X-Received: by 2002:a05:690e:11c4:b0:650:2379:665a with SMTP id
 956f58d0204a3-650237968d3mr5493002d50.27.1774973030427; Tue, 31 Mar 2026
 09:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320-imx8mp_hdmi_hang-v1-1-ccfce0517999@nxp.com>
In-Reply-To: <20260320-imx8mp_hdmi_hang-v1-1-ccfce0517999@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 18:03:09 +0200
X-Gm-Features: AQROBzC_bCTqHlcTi3-7217Va-IAxfmw49HgqDKRyv7Q0XoLPSqjyqoAOhtHuJQ
Message-ID: <CAPDyKFo57xyjyp4C5g5PYvVj40bTXaFaEGe3kgrNi1X2HB3BUA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled
To: Jacky Bai <ping.bai@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Mar 2026 at 09:41, Jacky Bai <ping.bai@nxp.com> wrote:
>
> Keep the NOC_HDCP clock always enabled to fix the potential hang
> caused by the NoC ADB400 port power down handshake.
>
> Fixes: 77b0ddb42add ("soc: imx: add i.MX8MP HDMI blk ctrl HDCP/HRV_MWR")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 8fc79f9723f07e34fd3f5162f2c9c549dcdaeb5b..3f5b9499d30a0c8fb8ad8ba3b638d7de1fc55ab6 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -352,9 +352,6 @@ static void imx8mp_hdmi_blk_ctrl_power_on(struct imx8mp_blk_ctrl *bc,
>                 regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(12));
>                 regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0, BIT(3));
>                 break;
> -       case IMX8MP_HDMIBLK_PD_HDCP:
> -               regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(11));
> -               break;
>         case IMX8MP_HDMIBLK_PD_HRV:
>                 regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(3) | BIT(4) | BIT(5));
>                 regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(15));
> @@ -408,9 +405,6 @@ static void imx8mp_hdmi_blk_ctrl_power_off(struct imx8mp_blk_ctrl *bc,
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(7));
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(22) | BIT(24));
>                 break;
> -       case IMX8MP_HDMIBLK_PD_HDCP:
> -               regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(11));
> -               break;
>         case IMX8MP_HDMIBLK_PD_HRV:
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(15));
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(3) | BIT(4) | BIT(5));
> @@ -439,7 +433,7 @@ static int imx8mp_hdmi_power_notifier(struct notifier_block *nb,
>         regmap_write(bc->regmap, HDMI_RTX_CLK_CTL0, 0x0);
>         regmap_write(bc->regmap, HDMI_RTX_CLK_CTL1, 0x0);
>         regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL0,
> -                       BIT(0) | BIT(1) | BIT(10));
> +                       BIT(0) | BIT(1) | BIT(10) | BIT(11));
>         regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(0));
>
>         /*
>
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260122-imx8mp_hdmi_hang-e7c5b4bdf1bb
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
