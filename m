Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CF21D009
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583834; cv=none; b=DBir6lOE0e0izdEQuTNCagbGc3XEN6cHwhaWjznTpeIlTaYjQj3QJS/Ddhji1D1mJASovcS5vvsj+awtofRCnei61KXyjjLBSuHi+y7oroUdB2YFBNVYCBU0chnMTAVZJN1w5lqr6g773UVZVd2UnxiiL8YcI+TTriwMt1DyPJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583834; c=relaxed/simple;
	bh=jWzDbbQHO9gEeKekcUVkcixWDMvI3qej9AstFronzn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmRubPwOXD8IyCr0nuaYx3xGEhwHbe58dDSxRcBM6aXLvkL0MnBw2pytZKZX7pY/YbRz5b+UtfbrdkG9tQHq8MsLg7KWBGl76aNe4dTuLh33ZsroP3/xH6P7T67RJtnZtt/gz015U6Kz0GjAraj3NK/Tv4yhN1ZAEYb0TT4A14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPlxAzJt; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPlxAzJt"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fe93d7a588so612017a91.2
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583832; x=1741188632; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
        b=nPlxAzJtRZwuBbeimV1KVR3qu7cts5XAO7US9RCNR4DNHiDWeaWLcB09OwOYGIv1YF
         cMjN8ALZFjwedB0WfXsD2331pWEKcDJdv1c1epZSKsKMuRsZusr3gOxVUYVyRxtVAJ0X
         XjOc9dCFXy9RyvR0vcu/KGEY2OCGfp4eK9p5gfRhsdOyIl2wJMjjHH5MsHrVtLzgOfXA
         TuJ3Oa+zqrY1vV2Ef0cx8rzGpK3x0JEL6/b9TLYnrjdL6bC0HDMx5mJRtbpq1kvhcfuI
         cNwIz88yD2Gaf6yu/X8h/tBP2/3ehxx+MQCTpdN6Cl66FXBkjMBHf3l+ekgyyw5YPaYn
         s2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583832; x=1741188632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
        b=mlzF9TtXKM3xp/iWnQo6Ltmc/eOf+GUVbqKAecExMNh48RiKeehW2QY8erWKvox32o
         YyWo+/Mz3DTBMmkgNMjVgiSclrWnlvIVLn2tvH6kt4yQ6mUWIAAKeo4eX6SYXoHdbZXL
         wU2lVNe6JE7cn/GzrjdvJv5FymG8bWS92l+ID2rMBXn1jQK/CUCY9cR6dTHAx4ZDbBGa
         ZSPXlZA4/DuE6P8zFWDR5buYiH9o3Av9QZT9Lfzz3ZCB4XQWwOpCFhtJpNLb8zYEeBF/
         jTDRfhDt+QTMgTcPZRYSChH21m+izlrtyTah7HuSpKbXw1SufFnL3xyRCXA+kAUsKLy0
         49mg==
X-Forwarded-Encrypted: i=1; AJvYcCW1fmR7DW0CORRBy7cMCmrNTjnLyNq2jMKzqnWGMBEVonfotJLABJHydFs9AOIsI0F7Kdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVOCEYhEjQjUkFtw1pSp2EdBv/yEL1dmz9ME7VoYT5pb1lIW01
	NvyyQ+qUL5WfWa91gZwwkkwTtbSI9KNZq53CTXz9Qo7mTQor0hnyR9OJZ40ixWV/bB4ETC65FGx
	xkP9qV13dOAcK+iXLgTqqVS7x0BQ=
X-Gm-Gg: ASbGncuAy5dFRJ/GEYxvFKs1rq83ubcLZ2RJrEHtSpD/1EmAATfgpGgdIfQF8creV8e
	yoePp609zWjZkE6lg2iNr/aZ57evaFxhyJ1ZsoLMZ/7mBROlaCbSIxonn5xR6CQ7KzM1Gx71tqy
	utYAiA
X-Google-Smtp-Source: AGHT+IFo6DOoGnTsS38LlUXMIhC0H9EtIGCJVFbM5Bu56nEtT839xcPAHtRDebmakeB9TC+KDHHS0qohqRpYH+q6d2s=
X-Received: by 2002:a17:90a:c2c7:b0:2ee:e113:815d with SMTP id
 98e67ed59e1d1-2fe68ada148mr12284035a91.8.1740583831681; Wed, 26 Feb 2025
 07:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com> <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 26 Feb 2025 17:32:08 +0200
X-Gm-Features: AWEUYZnVDiZ00SedBZ6EyKd9EOM22xcDBV6m1uAzMRnVUY2vdD1K52vvrRAuSvo
Message-ID: <CAEnQRZDXxuviih+o-iFOtiS6j8=JqnhUOHaZf3RhGL++fg=moA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: imx8mp: Add pinctrl config definitions
To: maudspierings@gocontroll.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:23=E2=80=AFPM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
>
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1=
d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/=
boot/dts/freescale/imx8mp-pinfunc.h
> index 0fef066471ba607be02d0ab15da5a048a8a213a7..0927ed11ec687d5b273c4a4a6=
455e8d81468f676 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -6,6 +6,33 @@
>  #ifndef __DTS_IMX8MP_PINFUNC_H
>  #define __DTS_IMX8MP_PINFUNC_H
>
> +//Drive Strength

Please use C-style comments /* .. */
