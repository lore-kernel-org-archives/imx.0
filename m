Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CF154C0C
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864109; cv=none; b=M+64HDkK0V21inEV6sp/8knvzyPNlff5vrJ6W9A7g73RJ4OOAxeUEbCMYImGlXu3pic44fJ2m4mEWN1Q23r1T0PupU2Iw7OmYyglNttBJSjCmNrmfT8dC/TD+qryeGFk7KdbQv/2dArjO11AnJZ2sZVdsYldnM8zufAgCnVEG7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864109; c=relaxed/simple;
	bh=LlGCdn4gmS9vKqDqzx5PG7X13gnoxDt95fVagGj41nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgwHHsBBxhvGaC/MZ1aaRaVN4tWcRhA6SP/TjjZIWIBRXXlI9eM4ZQxeTfOrttCLDvj5CaJy9mi6CLVaju34y8Xmdj9XyHb3wsnwiapbcTJCHot+Wa/rekENjviiPWBB1KR9nSOeRaq0YLTl/mW0NtzTCeJk3OJS4F9AcOJpuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee+o/sdY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee+o/sdY"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so95481341fa.1
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724864106; x=1725468906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzLCaerU2ulUqAzKqCghZCU7wS5Z6un4oXuuL2wHZDY=;
        b=ee+o/sdYK5XMX56VSUBS47/IcJv/C4TDBInRrhh7y2ONOEYcTQqJnsSIaFIfj9xSnS
         H86L4Zkp4JlgRbHfK4RRwm7NnqV3+O59QN6/wf1CklqrrSd9Id7WuWQ5hNpCVjYqilJu
         oKGyTxx8deL8axQN/+yZ4n4W41Un6uFmiSz/tep+UIHBRy6IjQMwbjOEbfS0SnDoK7i8
         owMZZtH9DFyyPXGjf3c+rcmG9E5+5d0uF840TexD8MtDypEk8G96ViELGmKOCYOfpUZW
         EgbHj/Lqw/PbuDYlzF9dvh1UkQGz5qLJeSzFHZI3Zv2sWDoI/Qx/wOZKp/GjFZXplVYR
         k+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724864106; x=1725468906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzLCaerU2ulUqAzKqCghZCU7wS5Z6un4oXuuL2wHZDY=;
        b=k3of4UZ9MJOQsT5cSLuHNU3mmkHhv8nhvT/Iz7CBsjKI1k25quzGfcey5OJ5wooOkX
         TZ0d5cJ7d5CGXeCbs5dfEqfvseHHRbCS72mxzQ0uhrDNcDS6ywSZ9Kl7uKQb0u8TO7ao
         UWbmPO2+klF3nTL6GsT9k+Vkb9jF+gQqlSz6ZuJJoBRucdUSu8pcapmeYX3BPy+9fKuQ
         uMFtWWNsAlsf8xwIoPLFOPneFwilLMZXQWw4Wp4bdtZMEwo0Vp428z93hWiEUk+qzqA3
         oElXUc+q68daX2GOV679wR+Q1PlTEq0HV5PSEFcXYsPdxC9KHgPNjaINhnzENMsTlfoa
         4Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCVihn9ODfcGzYoMrfH07ZmdDFHDCbuzP5zv+otsbwua4xPHiBDU41GYgrdrvQ7GkZKvki8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Dgc7oaWlUdrn+8LNM3IQZlzHUmSLC1rYCZ76P4hdbwgIAZ56
	O5UPUg3UZbHKc3bYYlBppu7V86oV4sihVp4b7FGKL+q1cRNCIrvFaDvF67lroMdXrvGoGAns3Kh
	iOqzwpBILHf0XaV/Fh0jgU8mDhcM=
X-Google-Smtp-Source: AGHT+IFszjTy0HBztUxAkiVJbnS9m4A3Y0CgrHfUgDP3LEjN5Dj948b/bGuRY8jMqphFrbvurqJt7mw9kw+accWCagY=
X-Received: by 2002:a05:651c:2112:b0:2f5:7ed:abb0 with SMTP id
 38308e7fff4ca-2f61070787emr2913281fa.26.1724864105650; Wed, 28 Aug 2024
 09:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828112139.2665814-1-lukma@denx.de>
In-Reply-To: <20240828112139.2665814-1-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Aug 2024 13:54:54 -0300
Message-ID: <CAOMZO5BOCOuf9t5uH1TfcWyoi-ECrw=3HztRVVXi0WR4K6EqZA@mail.gmail.com>
Subject: Re: [PATCH] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Wed, Aug 28, 2024 at 8:21=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:
>
> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> some extend similar to already upstreamed XEA devices, hence are
> using common imx28-lwe.dtsi file.
>
> New, btt3.dtsi has been added to embrace common DTS properties for
> different HW revisions for this device.
>
> As a result - changes introduced in btt3-[012].dts are minimal.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  arch/arm/boot/dts/nxp/mxs/Makefile   |   3 +
>  arch/arm/boot/dts/nxp/mxs/btt3-0.dts |  12 +
>  arch/arm/boot/dts/nxp/mxs/btt3-1.dts |   8 +
>  arch/arm/boot/dts/nxp/mxs/btt3-2.dts |  12 +
>  arch/arm/boot/dts/nxp/mxs/btt3.dtsi  | 320 +++++++++++++++++++++++++++

All the i.MX devicetrees start with the SoC name.

What about naming them imx28-btt3-0.dts, imx28-btt3-1.dts and so on?
