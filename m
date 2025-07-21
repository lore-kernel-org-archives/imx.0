Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D17B2DAFCD
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107838; cv=none; b=DloejTs8PTIGVxqPS0hGlby1UiHs7zSlvJm9RBdnR9Vrbe62SUPZD4GbIQNQ08lgeSItYDf6WpuFmPRdBtOGukevByUKWg7zhmm63o8su8SPVIfDA2v7rweFsq+28fi/ON6f8r5tJ9u1JsHSuT6fgfv2mokvh76FjWUPRdMib6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107838; c=relaxed/simple;
	bh=9UWeOXuEiJg9VoDu4+qGBOxg4g4hjfQ2KqGwyAhrNtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm6A6J2PxGgasWH4I2gJhWOUaKrPqjikSjW9mhPvGznwBXYgFe/Y314ibMFMb7zlYuPoks8H3FEVpcu0LHC240MvV6UNUpMcX88484aeSz29d7dnwXHX7Oq54gAmW+7HO77RIkuMyQAYM//+u3uZwYUdHzjBL8IXDtoHGu85QzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CgSL/uvZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CgSL/uvZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so6602592a12.1
        for <imx@lists.linux.dev>; Mon, 21 Jul 2025 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753107835; x=1753712635; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SEyx7mXp0CBN5U4A0GlAKryjyrraw4ilP0q5c6hZVxA=;
        b=CgSL/uvZnGA6eLPPZevhPE94IVrV4bLwDOX5bxxIzzIC8Gq/FI3I9mBYh4izJ2vHzt
         WOQs0ti7khgVvz7Ci+48BXRXvdNZJd2HTw0gJz7ziiAX88ru9n3udamD28h0lxnk+vBX
         m3BnqW82SwVxf7EDkO3Wv8f6wzfailDpxdLvmMgWTEHvbrmeGN2cQtpiOSH4iZWC4I1w
         zLTQ5vhxNfczof/WomIByOYSaZWGIHtiQbvbiDsoijw1LLC14nKs1uZtfjZ5u1hfPgXV
         IGWCHT6Zt3fA9WHGokocuqbAE+hWAQ+jyZmGeyE/KfqCDR8B68GHwvs/wD+gJTyHg+0z
         tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107835; x=1753712635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEyx7mXp0CBN5U4A0GlAKryjyrraw4ilP0q5c6hZVxA=;
        b=KPWJNF72FAjzLYcWttH2BYokUIVrwx+8lw8ieCW741i/alHfj1UaQL92fjnl1Sslqm
         jNZcxaAPEZlP4XsyC/DX8LzIM2U052tHFbqm0VaQvfATcxjKod110wl+/YIITKhdPF3U
         QL+ZykaU3V16cD61YS4aU5pcp8eWY92LteHWidBKMiFCyDty/vIwAs2vrhk2cWEZpgcR
         ZZ+Jg6sNoarKmyYSteDdRqYSaJ9dBzf7UesIg+cag0IhI7B4muHrFK69orPM3A3RrcT7
         Yz7FGZFEcw4GYNbc/ML7Y56ud2k/S5u4FcX4nx4G5QuaydKt9NH8AAtG0C9xm+UXkcIv
         KCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHLJgIfhLEC2/Wchr+23tzFkovaQR4cqbMqE2blrIZngb268hxJorVU4eifLqVeSwAto=@lists.linux.dev
X-Gm-Message-State: AOJu0YznDVcGWTWCNrIua5aKtVcEDSV5BH7wc9x3SGmxCowHTQ8p/85B
	fFQ1Ur9qjBITk5KJIlpIN9DNQnJ+aG26hkIp04ODL78M/Ic12yENNLYLJN7vwuPiICxi8MQjD/R
	FtZngk1+/hJaknLKdFiUqbxZH85xE3aPlhKBZeSY+NQ==
X-Gm-Gg: ASbGncvx5YQ0G0MTN/jrnpewPVG9Z39WMqWFm2NK5p5EoFtxfFun/ObspOl3kU/p6nl
	4iKSCPwujdFsnhb8cxt0suBNC9oCEGTTxu1U72CT4l5k20iSjRiac81C5roa5O5YMTAF+2ZoB8r
	3lB8zWTYxmxCQiHCURoNPvk9Yyqz21E+4MZwER1LhiswrBD7OCj5N705jq21rdZAyX34mxP8op3
	f6DOX6OjCwhXZ/YALjts2DbBNSBrsampm61OZfFgA==
X-Google-Smtp-Source: AGHT+IHor38rIn1pKQ8nwqf0yJIzbBDIXbeXdkm2JdEKFu+t76hq+Bk4KT28Qumkw/JEGQLQ2XhgOcoW88Ao9YcH/5g=
X-Received: by 2002:a05:6402:1d55:b0:612:b057:90ab with SMTP id
 4fb4d7f45d1cf-612b05793femr13050702a12.17.1753107834605; Mon, 21 Jul 2025
 07:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s> <20250718082033.GA25126@nxa18884-linux>
 <aHp-_BRk7Iz81OFp@p14s> <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 21 Jul 2025 08:23:42 -0600
X-Gm-Features: Ac12FXyw4hdh1l-EicP3Q_nexU8h_sXbH3xvX_eih-XxJ9DgAS3dub9_bfFRYgM
Message-ID: <CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Jul 2025 at 21:08, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 11:06:04AM -0600, Mathieu Poirier wrote:
> >On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
> >> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
> >> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> >> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> >> >> >
> >> >> [...]
> >> >> > New warnings running 'make CHECK_DTBS=y for
> >> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> >> >> > a7123e857dfb@nxp.com:
> >> >> >
> >> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> >> >> > scmi (arm,scmi): Unevaluated properties are not allowed
> >> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> >> >> > unexpected)
> >> >>
> >> >> Same as replied in v3.
> >> >> This is because [1] is still not picked, not because of my patchset.
> >> >
> >> >I won't move on this patchset until this is resolved.
> >> >
> >>
> >> Not understand why hold on this patchset. I suppose you may not
> >> understand what the error means. The warning is totally irrelevant
> >> to this patchset, there is no dependency.
> >>
> >> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
> >> &scmi_bbm {
> >>         linux,code = <KEY_POWER>;
> >> };
> >> But this "linux,code" property not landed(missed to be picked up) to DT binding.
> >>
> >> This patchset does not touch scmi_bbm. I could help address the warning
> >> in the other patch, but I do not see why "linux,code" under scmi_bbm node
> >> could block this patchset.
> >>
> >> Please help clarify if you still think to hold on this patchset.
> >>
> >> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
> >> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
> >> what I should do with this patchset.
> >>
> >
> >I was afraid of that.  The best way forward with this work is to wait for the
> >"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
> >he, or anyone else, picks it up for the next merge window.  If that happens
>
>
> I respect you as maintainer, but there is no reason to block this patch
> because of "linux,code" property. It is totally irrelevant.
>
> Even if I help to resubmit that "linux,code" patch, there is no chance to
> land into 6.17-rc1, both Sudeep and Shawn sent their PR to arm-soc earlier
> before your comments. You could raise in V3.. which there was time left.
>

I don't know what you mean by V3.

> >everything should be set for you to resend this patchset when 6.17-rc1 comes
> >out.
>
> Because of the code conflict in Ulf's tree, I will hold on until 6.17-rc1.

Exactly

> Patch 4 and 5 will be removed from this patchset in V5. The two patches
> should go through Shawn's tree, I will resend them in a separate thread
> with "linux,code" patch included. There will be no more CHECK_DTBS
> warning in V5 for i.MX95 remoteproc support.
>

That is a better way to proceed.

> If you have concern on patch 1-3 or else, please raise earlier. As of now,

If I remember correctly, those patches looked fine to me.

> patch 1-3 in V5 will be almost same as V4 with only a minor code
> conflict resolved, with below change
> @@ -1030,7 +1030,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>         int ret;
>
>         /* Remote core is not under control of Linux or it is managed by SCU API */
> -       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> +       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
> +           dcfg->method == IMX_RPROC_SCU_SM)
>                 return 0;
>
> Regards,
> Peng
> >
> >> [1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u
> >>
> >> Thanks,
> >> Peng
