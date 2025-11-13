Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E951A26B
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040698; cv=none; b=fpFc84Mrx05ftMhJVwimPG26v+4Icn3U5TkPieCPRsDXJy328Y+76mWzfm1l9iFSdewcerhp/fqXptzAQ3QLVsViacUxBPlkfm+CkF3fUMWFwk+Fcu1ZE+Q9WgIbMjJAE6eYO1IS3Ghz79kpknzwa4drnH7J11ZDg2EdqaRgYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040698; c=relaxed/simple;
	bh=ozyIZ+DRAXgcmWNPabI3QVCnzbiWETR79BPnKWOg1ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHPSqlLJxwGug9fgCgkwnsBLQfCp6LL6AHfFQCsZj5jna6ePPrnzF8XwjLd7+Si7i9dpXj6C4PbrFVbIdUZNXjwkA09+cTKenlxXHevkTQTy40v48DBZhwV3gb9F9RP0ZGLJ46h0W0DBj6aK86TYL5Z8wcPt9esyxWF03HQNzuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AmffDvr6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AmffDvr6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so1457912e87.0
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040694; x=1763645494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=AmffDvr6EYtYu5G+UCRUc3bgiYQqeBIacvVv8kOAqw0zpSm2FBYNw0atrEJUoVFcJL
         o96jrJGTKglmsl3C8AfM3F041eZPkCL+1sMgzrunbRgReckw7Fv/G+fD0sIb11TjAemb
         ENnGFDfEbzhGWprGf2EXW0oul5XwRHGQSkzVR5EJf/kkKxM8jra9WJCm7WdHY3kEjCuk
         kb3obf70tXAxTFE3P6FKhC91+iZZIJyN7745TPkIyjSx0XgbbioHZIJ1Xx9vD2dEY/Kz
         ROv9Hpw+pJrtGWgpltwZQOa7C1X5/KDyfIyimly3Z8wYg0tY9rIBTpur7vNRbq6iiUGU
         7G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040694; x=1763645494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=Vkr/zbj1ziEJj+8hmfiNKJicOWMZb2i30m6H55DQYGses986Ww2SQAOxVlE7OmW55U
         1MyLFP3acDKtPqUpiPw7qMQkMUlJpmTiP1poDh18AjfIAR29KRou490S4pcW66MUeBV4
         h5EaFoQkAd2vqWP278+y4hL6rtL9ojEL1CFHvaGTDmPqGzqSpTHXHZzhiY2nPPVEtCko
         CPSnx5RgcwVLE+HfIk8bBP6AMcCrD0rG87UfOkT2CVTZPbcVJLRq5NBCNkhJiNvB7V5M
         iOtmPP5CbeAF8DHCDVLyn8Uo55b09otrbaURfxIyICx+Bg5Ec9nwbFCfm/fwgsJdw/un
         F7cA==
X-Forwarded-Encrypted: i=1; AJvYcCXt2vtodpbnZOWFKx2RCEvbW96r12LHGp+1aB0pzkE1mU9YfZO4xh2rr6313r2ljoJHMlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVX0Y6NtIQWMt1q8s8kCGxF2q6ZXc+UaQpB4HPXytPi+zEp0Hf
	N+RfCdeWEbysteT21Rt/dpjkLMsHWwKUz9rwewqrFnWKWptEio3ZbsRNEkQMG/QLPNQOI/Ftopd
	J+k6Xyq5N3Maco/m1mKtKavUfyg5DUDtHMHQDUKkjKw==
X-Gm-Gg: ASbGnctvCFIJ2qfnTStnAYVr136Gpsra57H5ggW9HntCQzh/q005O+huP66QSVe2nse
	I1vutlzK1jpJUceKGBHSge49XEI06aSYjReRwtAvWYXr/q0GS1s4r7v1sT4E4ylQEZJ0x3zjuwo
	apQVQRNySLdvcc/E+Kt8bYTwoAHQnIz5DIEyCeREVdqUS/0RpprbAkj8KbkC/LSHsQev/hW0I6R
	ZTGaaP2XAEq4qB2isBhELcjxwA5MqbUJU9qCzz7zdHEJLxsCg4Zcv7FacRoGybjWkO6YE0kovE1
	xByYtLh3At4SWsTo
X-Google-Smtp-Source: AGHT+IFmYGYaNrPxFWU0ghXUofhzNye14/5vushtgIFDWSfgA/MklzOW/JNoBE9rLO+zgbK8iJzH+WbW5agg2UGK7Co=
X-Received: by 2002:a05:6512:144d:20b0:595:7b24:d352 with SMTP id
 2adb3069b0e04-5957ececb1fmr730185e87.24.1763040694032; Thu, 13 Nov 2025
 05:31:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org> <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
In-Reply-To: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:31:22 +0100
X-Gm-Features: AWmQ_bmfo87z1zTXv8LP-M-WOLEoIFCS2S60P9_2zq_qXBjBuZTULdbiMAAMcS0
Message-ID: <CAMRc=MdWu5x5bgh4CfPsowJnF0Qh1W770KTDtTFMkGkQf4_LKg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres callback
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

On Fri, Nov 7, 2025 at 11:50=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > It's bad practice to just directly pass void pointers to functions whic=
h
> > expect concrete types. Make it more clear what type ethqos_clks_config(=
)
> > expects.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654=
da0bbf4ffa1eefa4e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enab=
led)
> >
> >  static void ethqos_clks_disable(void *data)
> >  {
> > -     ethqos_clks_config(data, false);
> > +     struct qcom_ethqos *ethqos =3D data;
> > +
> > +     ethqos_clks_config(ethqos, false);
>
> ethqos_clks_config() takes a voidptr too
>
> Konrad

Right. I think I had something in mind when I wrote it but I'm not
sure what anymore. Best drop this.

Bart
