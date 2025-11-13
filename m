Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6220B81B
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041467; cv=none; b=c6LywyKPVSvyFKJABNmwdEm9W61uLracF9J/aU25ugYUsRATa2ptwgWPYeJRVE9LbacN1/elVFfECLKB2oI1fqg9+SBOANHPT+nRR/M6xVcyO4d/Q4ss/3F0QmqpNfLFEhXh3ubgZ9tCWwVZ3se9HDe4NO5hRu5sco0v+G2OyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041467; c=relaxed/simple;
	bh=n3yn/Qzs/10SowO+cV6IyFirX5NhFXBaRiN32HGuPq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj/j5lqlopUWgNEavFSCCvVLGl03ExwidZwwz/bqurrmIbAFWGyhPRUDFa9W+C1t6+gaaU2dmQlNbnXmm1jpenlBS9/gprJP37P4OC920ixPCZzR2sOvxu6/NsZqzvwQswOTiHTe3Q/6ataxyw0/rZ8OkxofXRawBTMQDb1ZilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IWgWSFHL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IWgWSFHL"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957e017378so934882e87.3
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041464; x=1763646264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=IWgWSFHLiKpnggWGQgVk6uffPxj4G2UaFGgUi5Hx/OvAlgVB5OzKPmHMzDoiAvLjzg
         WO8xRk2E/AHtcNEVjatGbF2jLYsjCIzpvjCmE474QDoWh43ZzeQSyMvL4++8kRwwqzz/
         AHkOuWNzXV8218DImG9h1Y7i5WQmBNQI7O9F25m6ri+VdbDJPMDZtdwOyhTSF/grYUih
         Vi5gy61oWo7JjW3ZWelb9MyDqbQJR5KPcKZk2vNRJey8dtitGOhvV88SIJLflA0Ijzf2
         wp+OyyUCX6n0ygCO1QdtfS+lbrcL1Bo2JlZE/VeRJ42Ewne7O/Ow+uZooLgSTIp+HBdi
         qOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041464; x=1763646264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=hYFtwFFKGbagLAlxtHts/jnxwmJw3H95mVQ5ODvfsk5N1QOOq9K+C3aqSgPL+0Lpgx
         7KNu5A4yfgTgZ9/EiTccNropXA0VP3Z+spZAEbAx+2OADmDLGHgi8DHOnzF7N41XQ9Gc
         bMPYs5drt3s+q2LYNdTG2Dn2FosXBGtrOYQBavZRUWq0w6fHcMkc39AML+G4TD6QUSBH
         QmhRDcrQGC/pE9qNNvxhrY/ZoearrM0lszuD2BAVEvGEqAoS4vWJMXYW4TdFqHyshIMR
         9EX5DeEFpWnC4q6wWxlnS7EPT8SEP9XvfXAoj9LNNaauEs5BuywsHYLke+heoXDSv0gu
         GV7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsU+xDutXg/cy8aTKfRBkseyaAPg4lGjMycCFrkzewp5RpEiUxrL3WXNVo3qREzWIoCl0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym+TDY3buom5yROUde8GwWA7Lv4pC7s0By4DYlbLGVw5OLXcEJ
	PUSll/3DiVYqMRmykQW1nEwXzL1ayepEr6ibCqZavosYgeh0IPpgkFP0uFFCv7vtcGF1eLaCBAY
	HXPoF4oGppIESE5exkIeVcsI2OiwxYoQTW+KEW5a1bg==
X-Gm-Gg: ASbGncsq71644180FT9RSNyHDpwbj+ypRVffP3U29NLOSbvPONRzO0QF9pSLFDL0XXY
	aqyxhz5BooI1b+pzKVP6yhNrT2ZF+BZwKvvdQHqtfADD/2+tFg+LscVG3dOUkdlt58RJywSPBFz
	QdFOhpcLGOvYjBcmaNasCgfwF11CGPy1ZZwXg39Vn/OyzBw+8ZFydbOkPktcmu+3qaieI573O49
	GLZO00BAg5Pvu+aDf/2Y99XTkwwTW8FqmIzRkBR+OtiLTQE5yddwLbaczkUJUpZSBJPHRKNF2Xz
	WDBCACqmnkwd5Bxq
X-Google-Smtp-Source: AGHT+IF9+pE/QXln9/ghLnXjpwA3j+ZQdhSMaqAds1VqCnmNiZvVcKXj+XjAJW9rczSh1FwGivl5ToawEe+J2/Cq7qU=
X-Received: by 2002:a05:6512:6d4:b0:592:f7cf:9f6f with SMTP id
 2adb3069b0e04-59576df5dfemr2184445e87.14.1763041463584; Thu, 13 Nov 2025
 05:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org> <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
In-Reply-To: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:44:12 +0100
X-Gm-Features: AWmQ_blnqOG7JKELYBN2x3sW4StFzPpU8xniVnWCV7D_4z_I3CQNMw3VuWKeQ6A
Message-ID: <CAMRc=Mf03rYoi-C+kMic9RYZdk2vtAW5LDMYNMqg-H5vJccUhA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
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

On Fri, Nov 7, 2025 at 12:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With match data split into general and power-management sections, let's
> > now do the same with runtime device data.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++--=
--------
> >  1 file changed, 25 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af=
2769ddff4964e6596 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
> >       const struct ethqos_emac_pm_data *pm_data;
> >  };
> >
> > +struct ethqos_emac_pm_ctx {
> > +     struct clk *link_clk;
> > +     unsigned int link_clk_rate;
> > +     struct phy *serdes_phy;
>
> What is the benefit of doing this? PHY APIs happily consume a nullptr
> and NOP out, and the PHY is already retrieved with _optional(),
> similarly with clk
>
> Konrad

Because it clearly divides the driver's logic into the manual and
firmware-driven variants. Just because we could, doesn't necessarily
mean we should just call PHY APIs with a nullptr if readability is
better when we don't.

Bartosz
