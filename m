Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD2823CE
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713201370; cv=none; b=crBBsHkbCmaUIeWgG+a3i1kffpQc6nQpvMjAzZJ2ba0m1YQaSWGsgcO/LMkK1/iwGmKmXNayowdBBVbvZNE+4ms5rcTHjMSZNLdTqjFKUBHTEnx/vtzvjBcd0BqNzHdPma2DQS+zfJV8CJoJ4H0ilAfx9sxohHQT35oSD3m4TI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713201370; c=relaxed/simple;
	bh=clBNt8e+6YrryyfPUqSdkx19pn4NeG8mB3JuyFyvw8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3tCmMoZL9l0/gwq31aYYXasTIF+gW4ZW9cTjYmWRJoq1ZfMfXp4p0/fJo2cNexviGcE0qsc4sk3aRUJGHvMxOl+l31h7tapNgtgmkDUHTbh/2gdHJkSH72vVjUJmiPdnHkobKXTjuUks38Qy/xNY1AwlLMUzugJiJzIQscau2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiOTkWnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiOTkWnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119CDC113CC
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713201370;
	bh=clBNt8e+6YrryyfPUqSdkx19pn4NeG8mB3JuyFyvw8c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XiOTkWnpcikqzTLyG6q9HC8Yf1PFVtG1Dl1eBbOi2IQPINtjXOmksWhu/RyIA2nGG
	 bmfF3V54qeEX3IpXHIifv7E8ENg+5KnL+R8XaMweuzKjaDZ+inUH75nRkchBFJ1zJq
	 xcTNnQcKQAuY4CWnXeFDu9TkH67PCScmY0LNAtw8O/Y/6hMMHDk+5vuRw0Dcflmngp
	 Kn8kt8tslfLQjLc6fW/IUrtxp/l8xiJ4QnD1DBJyJ/H+QxkGzB/5YdqlSj8EGtAe+y
	 BOsg3L4kIx2VJCEoF7I/XvN6Kpyx1JSr0+stmnA4mSlqoXHDJFrvLCS6HtZhkO5Ava
	 W/HB1Pjdv6YXQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516cdb21b34so4425406e87.1
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 10:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNQK9ceAuvZUZ6XuLTpkNj3oHoytoy8COOXVeQ4BUD9OswizIMNOE8nFzUSBpoLJh8E7jQSjpqTJb1Grg1Thw2DGGC
X-Gm-Message-State: AOJu0YzWBaa77VR0tSf5k3F58TUIunH83aC5DvTfrWv2qmV2EdeFbW8u
	aA8YVjkagS/yZ7TV2HWnPg03SEWyG8tiIy+rkEy0hxecrFspvv2hiau0X7gGtdXFMq7aCJCJ54j
	/64I/22mPUEe+tXkV550r0ZmxPw==
X-Google-Smtp-Source: AGHT+IEkz26w525DUde0Uob20fmQI4fd4Chc0AN6DRGivhpSGWQdBtr0Y20V2JMzBwteB/hWf3vT168YMa0bRGYd8lo=
X-Received: by 2002:ac2:41c6:0:b0:516:7738:bd5c with SMTP id
 d6-20020ac241c6000000b005167738bd5cmr6496177lfi.4.1713201348179; Mon, 15 Apr
 2024 10:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com> <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Apr 2024 12:15:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.co=
m> wrote:
> > >
> > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > [..]
> > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > >
> > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> >
> > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > sdm660.dtsi. Ideally it should come as the same patch.
>
> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> well. Will drop sdm630.

Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
A53 PMU compatible is an improvement over the generic one still. We
can't just add kryo260-pmu compatibles because that breaks
compatibility. We could have a fallback, but then that introduces a
pattern we don't want.

Rob
