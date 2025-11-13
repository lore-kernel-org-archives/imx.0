Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121F158DA3
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040846; cv=none; b=Gdi6onae48Rfs+gAFlVpQJOVdW80bELuKfSu1emjppLl5WsQAC3iR6MCksolTNgsWiiV1C29BglNWd25aeaGdPDGeZk4QsBEfUx1lvEpxKrlJCTBIN2gTPtUg4JyJCGA28US1L3ktjjlkYwt5T27ln+2v8iTCkCgsd3K6gB7VSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040846; c=relaxed/simple;
	bh=X3T5b32titXjcOm79yLB9wCfQXafLDscPPDjsVlvEkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djI3undCvfN4yn+TUe+QNNzZZVZdv6dWdeSmVDGe2m4gg2sE9Bz9W1Jq9RmkQXrl545XKaSatH4qK2YTyWA5hVWiZE16gUHoZWNjEuVWveC5XwxHh/oLt6+wQeMe6uwToKH3bHMZfnvBSwXAp/F7dfauj8TcyzZh9LS+EmV5LUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=raNMfCmF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="raNMfCmF"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5943d1d0656so1243002e87.0
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040842; x=1763645642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=raNMfCmFOywAJeu0uSW4gvqJrQOyryt7+zlv8XFX2j6BQlz7RHucY1jNO9yrBY5Bc0
         x3nG4pGPRtlGNGZG0QGel7lIWkVrq6TpcQJ2F+th2YZcNUDCOiT5zO+DvejQ0bs9WGWP
         yDW/5YXppwZUrP6gdmvMRqzglc4Dufbo9KnvivlpCjC6f0/1h6ui2toI2nFZtkjMF3Hs
         lI2hO9Z80blWCWth8EOo5FVWtBvfX9i3GjEmycrs92UpJrvMlpGFHeJlpXyQszX0BPsN
         Y0kgYn6pSEqrDIc8CTAlI5ERHccIWAt2njJGZt5NWvGhQq7DYBPn6C3COJ8I6tIENTVe
         0LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040842; x=1763645642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=O3nWAodVRGZlUJK4rDRvIFtmlhmJZW8JMWeR61imMX544/cYGx8G/g0xFuoXUpjKkG
         ApXXdLoH0ULEpa2AxWY94BBXL8Axlnx3T9SKy/9qSUMpib0mNY80rJ6jLVZoc95aQsfJ
         QGtMPs1Mw+vGjZxymC0vET17XwLuJiJkW3NyhFMnVkU1adMZXwiDF53ZlL9iI7Fh3U++
         ww/1RDqVZ4a6ws+a1vtknvdQAOY1Hk3oWAeVTsVRaeHWT5/ckLUL4LAX9AUw6CQfkpe6
         076aMg1BjCcw5pEnVYMuZ+fF+uHf7RzjTFe7oP+aPZfFcwyGplv0pANu34TyF8O77v5z
         pvZA==
X-Forwarded-Encrypted: i=1; AJvYcCV2qI0otKEEwBBv75Uf4tQnYYb2Be5hNXcdInjM7/Owejx3o5ubeLmgxdehjxxAF5QMKds=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNOc3XVqwZAGQf1A4kpFHquWZm1K7JBP7fjd2smaqu7qmHZUwg
	hatrkL9WHQOG4BVitC+NrA3E7LS2hzzsJ+BEV5dLSbDw3E7a52aN7+D9+VXaph/KHx36I/LXLWV
	8Y7dfuSEMSOU36AZ/mKx03RF5C2eglnKDWm955CsrCw==
X-Gm-Gg: ASbGncsHltLIzBdUbOslNrwtlQDQI2EBUWGH+S8qzf/6eIbED41dRGkQpp7dbxBUnZQ
	cXtBZSM2YwJ4XaDvheFd5mSSRBCTTcSuqZocragvxN6WThM3/FtQSOfSY+ogVfAd3pmzIVzptZt
	LBCEkNcQ2Vz1zBW9t4hSB7pgsii8B5Bd4h9aTHdITZCdhRIRLtYpAcWZWjiPe4yVjeDY5S0pm1H
	9p57waOLVs+hznbmWHCYqnQ/6+X3kx5oahHrT6BGjcdRfCyJXJuCz7RFqHd16jtlCFMPIKLkkIm
	hqTgxcveX2cu5A3Y
X-Google-Smtp-Source: AGHT+IGbk7EKeTNsNxEBH5I9gU0KP7DFoTOQ0KZ1rqq8QfnOf06KK/0zwgmGPB54vhErcQD0MD3GXM8/DDcCgOFKTlQ=
X-Received: by 2002:a05:6512:12c4:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-59576df8d25mr2057027e87.23.1763040842304; Thu, 13 Nov 2025
 05:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org> <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
In-Reply-To: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:33:48 +0100
X-Gm-Features: AWmQ_bmy5PXcBPeRnFHjyddkz8qETTfAAx4qoRDDnDLUNs7204p7vqOqHs_5gtY
Message-ID: <CAMRc=MfMQ3P-BK239953S9sTAe1_qSc_miWEFDNu83frE3aSqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
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

On Fri, Nov 7, 2025 at 11:54=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As the first step in enabling power domain support in the driver, we'll
> > split the device match data and runtime data structures into their
> > general and power-management-specific parts. To allow that: first wrap
> > the emac driver data in another layer which will later be expanded.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  static int qcom_ethqos_probe(struct platform_device *pdev)
> >  {
> > -     const struct ethqos_emac_driver_data *data;
> > +     const struct ethqos_emac_driver_data *drv_data;
> > +     const struct ethqos_emac_match_data *data;>     struct plat_stmma=
cenet_data *plat_dat;
> >       struct stmmac_resources stmmac_res;
> >       struct device *dev =3D &pdev->dev;
> > @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_devi=
ce *pdev)
> >       ethqos->mac_base =3D stmmac_res.addr;
> >
> >       data =3D device_get_match_data(dev);
>
> This change could be made much smaller if you kept a drv_data
> pointer named 'data' and called the new one match_data
>

I prefer to make a clear distinction between the two.

Bart

> but I don't really care either way
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
