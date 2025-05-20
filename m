Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8E136351
	for <imx@lists.linux.dev>; Tue, 20 May 2025 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777899; cv=none; b=YHtN8LpX2BI9THVSAJyfLAnzimwDKwQEy/VwxLfEQ8jEvsJlLXhmCynNr6hde8csSXVwQsDV2TLycUg81F97HoLdKaG+EZmufYl0c3UqfV6oJtXqpGV7OvR0y5L/RAMW1nFmFQSA4bwom13+qVua6jMPbmCfpc0tK1Uj1aE7IeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777899; c=relaxed/simple;
	bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2E9nWxi+l3Jgeb3Q+MmAfVrR/ECJsmPuWm1UvOsunEMzD2MqoTnGwn4N6+EvwWQyUNOVscNUCjZh+EEe+aGMDFsYj6Tudcaf+5I2jqveuVI46SqT/Ej+M2Z9iOl2/eAz8bBdOBNyQu+nbjyhc14W20Dhp3Ii+jkgb6/FRBmnGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/YuQK7e; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/YuQK7e"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so7197212e87.1
        for <imx@lists.linux.dev>; Tue, 20 May 2025 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777895; x=1748382695; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=d/YuQK7eweA2kFsnywP8feTqGgcjlDszziCMQw0+8A7rUk6+ivBo5buFnagLT4AISj
         rys9Y90975+IsYyeW3k3O29P5Dg+zcX+chc2d/PtW1CfsMRfBpaBP1Rb22WLRsPRaXTs
         wO5ASUWwhUJ/N+7I94UfsST2GBhOhESPCxa4/7dSwWCaOFuA2u0XDL2cHjkIVng/jy0o
         Ozw5XdVGm6WEAlGmX1L6yEQ05lPA8tMgH4qHeiYtQcL0ojRn4GQzIpkTLtYCy2yP20e9
         q09oZdWqvL1jWKgxcvndw+wN49A1A2hqpRfyYhu4c6Y0YQSIg5iKwBv+em6fKcibH603
         RqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777895; x=1748382695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YcxJa4AFvNZkS0xWAAHV4pBceL+Aa87KE1RhOakO3I=;
        b=kLUuN3FybEyoApngr27CyK2z+7G+hutQDcXKKkDYikKxvOShuM/yv/oMFWy4z3vqj9
         9mmXpwVSw+tcpNV7l2hXQl5odX1KkPxD7Pl5zue5n/yEld0oWD19lSsXNJJBrjtEoJqk
         Vq+MPIRkQLzZz593ASy4qa3BFJoLBIW6MiPXDsvzOHx7FhAP7dU9uihovic8fQK0XHoD
         5CXkWkvdOs/X2GEZqdRzGCk57moMyHt9id3522xkhMRBmv9KmlgLLnsvJ+UCucZKF1cO
         VVQPIkh7zs4VqYM53iYcnn1L37yN1A3moCSgdGcilO7vlOQXToElPPOC7Fm67eKgAlQ9
         2ACg==
X-Forwarded-Encrypted: i=1; AJvYcCUl0CGtOLvaPiw7boZqPUUI2GeRK6Ql0dZso2iUybP7+JPW0VwfSjY8zdV29OeTIsdjbj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSwdWbbnMEhV1qZmkMw61+r618keBr5W+DIvOoUVueEg0Nj3a
	COt+AZ47P8MbQxRGwZm2LJwK+bh7BdOoqtJDEZeKAwaA24r4Mqn43z/ZR0ISEcnv0MrsO4wUaNs
	GngFp31e6TimrxCCq67UBl8QiP/J8Xz6PQyQQNuI5Yg==
X-Gm-Gg: ASbGnctuekkMlprZ54iB2P2HPp/mdWBoTPw9BL8PkR/FYsnavV3wEQpgR/Hl93R+itd
	djZlSauiAcngBLtHcl0eifmmO6/lHYsQZh4gpFwhvlJK3HG9cQZFwrGQt5/wC+pzAoSHV4cNSoT
	yjV5Anw7tmKotR2RQI3LKngyfvPN2HQKwZ
X-Google-Smtp-Source: AGHT+IFVkq4h2CinjfVO4g88kIBTXBbAWFl5Mto0qgQ5kuq3Zs33wt1FkBPYSfQEYVpZKmi9mKF3laDdRT+6Oo5QVNI=
X-Received: by 2002:a05:6512:6081:b0:550:e648:182a with SMTP id
 2adb3069b0e04-550e7248117mr5466218e87.55.1747777894769; Tue, 20 May 2025
 14:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516100423.1685732-1-ping.bai@nxp.com>
In-Reply-To: <20250516100423.1685732-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:51:23 +0200
X-Gm-Features: AX0GCFstJNfbhxP8OvAOpZb2VTNEUaus21faETIiRrX0PcV1DOJb07Ynai4P9Vs
Message-ID: <CACRpkdbXfNs8a+YEwsxROpUT16S9m7NxYXnTsOJNpi3ds0wKDg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 12:02=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:

> The i.MX943 System Manager (SM) firmware supports the System Control
> Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
> The base offset for the i.MX943 IOMUXC Daisy input register differs from
> that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
> i.MX943.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would merge it... but you also need a patch adding fsl,imx94 to
Documentation/devicetree/bindings/arm/fsl.yaml
do you not?

Yours,
Linus Walleij
