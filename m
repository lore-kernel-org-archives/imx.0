Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD48D2F532C
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249495; cv=none; b=sKQCSk6+yoBF/rfNauaAyAeNB0m4uHJD6V+kpXH3PDnFRecn5CzyoiLyEw539cQ7UkssOpTK0FyTLS58GW2K1etWslkEv9X2jUgnES4nurxitlSHtNp/EhQkXtsjwPiiWStASlh1eyuuRZ8XKYODHiLZpULl3imAnRmsukHpaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249495; c=relaxed/simple;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXaHr23Siq9kHCUBPaHkzAxYNj5VO1l43Qx0sRSkO+CHYvbq8GYU1C1Fg5LPfVSkdVOSjNZ13drOQOZQ0iGBEkWJR5Vu0uoXysbEP20P9VdJ2DTl3ajcYvnq0yOz+gWpEw272nZJtLdgO+Eld9NJgj/1LzX205hX9TxR5+QXbwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q95qr3S+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q95qr3S+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F6AC2BCB5
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249495;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q95qr3S+CbvJ29vl+vCJ4t5jUwTLKQmLtHRx0KuH+kfcxcNXDI/Kx7KK0W2ctTRvm
	 ObqE98GetffbgSX0p/OL7dDHRFg3sANFe+F4Ww+iz7Oj9C99hvDTRbzxlJhkJoFll+
	 iwzVIi1ExaQmkr1+idbtxyjbBUxztnp+DboifD2PVEN72tfcmt4OIeah8kMk2chvFL
	 /zSHtr90oK1vhfakVS0BhYgIvWzbgQO7dRpJrb6apCy7M8HbqijRMf106nUwRuClYJ
	 mdSWB0AiDOaDZjjKIHiPc5Ylv8kd9O7cnpFj3diJ5g9DgZfWUxNU4DF1q/fOKgF47O
	 ggal+Xagy0rwA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a3066b68bso1599501fa.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 10:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoNm4aj2fAEPNr2PKiHIgppvP9633N3xooanr1EACyythD96jIoRA+o/ZMT5wQqXb7VkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCgusEJqecEaXI1U4KZhrOzgBrRwQNmL012DNOh1WCFEnvycg2
	BgWw2ELIo8ZsMBAMSgY+VMHq0PS+N9++oIflogIb2awU3tx5TpFgSQWEa3Lb03cbRterglPWiw2
	orC8sec5HfRpo53VyYfm7Tby59SY1qpJx9p2E0jtRMg==
X-Received: by 2002:a05:651c:1604:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a67e1ba60mr11617111fa.18.1773249494042; Wed, 11 Mar 2026
 10:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com> <abGizL-uYnahlcEt@shell.armlinux.org.uk>
In-Reply-To: <abGizL-uYnahlcEt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 18:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
X-Gm-Features: AaiRm52Tw2Qo9qa62t56mCoewk4vwmQ4zN4g67WY5ySxyBb-ueDnRqCKEIOABSM
Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 6:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Mar 11, 2026 at 06:03:37PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to drop the dependency on CONFIG_OF, convert all device proper=
ty
> > getters from OF-specific to generic device properties and stop pulling
> > in any linux/of.h symbols.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Please postpone this for the time being - I'm trying to get stmmac's
> pain-in-the-arse PCS support sorted, and I've patch series out there
> and pending that make a large number of changes to this driver. This
> is likely to conflict with my work.
>
> I'm limited by the rate at which patches can be applied to net-next
> and the rate at which Mohd can provide me feedback. On that, I notice
> you haven't Cc'd Mohd who is now in MAINTAINERS for qcom-ethqos.
>

Do these two changesets interact with each other a lot? Do you have a
WIP branch I could take a look at? This has been post-poned several
times already, there always seem to be some new changes coming in. :/

Bart
