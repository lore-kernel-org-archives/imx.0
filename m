Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2337F
	for <imx@lists.linux.dev>; Mon,  7 Nov 2022 10:29:47 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id t85so6299166vkb.7
        for <imx@lists.linux.dev>; Mon, 07 Nov 2022 02:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaNxkXQ1Y4JKbXCKNHnI42Q7eEAv3p2c5wJUZMq4jg0=;
        b=LALeX+CQc6yEAIT60ZcvX38eVOtEox1MCHJCm/0G+Q1qAGru2yWXLRd6QBRUqHcjVw
         +Icd2aOOOtpj6szG5Y5HbluYDK658QcJ1pC7e8Yd76bRz5goJZxaF4Dy6PNa2Svh5f8E
         oOZBYeOzAX5bfxbgR0QGPyj0veg25b8GvR/kKsAZ0/q+ymIBotnrmLIPD3Orvvvz1Md1
         DWjqcAKNoq39Rm810RCCfBBO0mq6UJR+p7uaer3mD+yBfN19cUYBACUqJoEmsbt5eOXf
         pe/jtmGnlJL+BV8gkhtpMcJ8sESAPxYe7PhFW0/zCI2oNLv2E3p4C+6atNREHuuZuooP
         lVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaNxkXQ1Y4JKbXCKNHnI42Q7eEAv3p2c5wJUZMq4jg0=;
        b=wP5pkA2fe51hFigqxhQ1rTVL4YvAJLzROlQTPOeMxYrxMMm+ghGdaIiGWEW163Izbk
         oK01dkQMol3oTdcFckpouvVIXqMRRWWnowDJbVOSJ4bdu+4PAZNiSdDkFWHtsrwsCLAz
         BG2y7G9cHkIpFsMMPvLDE9NOMpQ93Jab3+rJryQ/UicCMtmqdtPuO3azZ8WZe+IJSSWg
         mqYdWz1UH2ZGr+WRTMg8gHfONmWu5eWAAhrRNWBZZrC1PMfRWaqGM3PRQ5dsp5McWIqz
         X6+bjqJD8q/NTv0ZcBC3DXWY3q1wAVdGkTsKu6dg4CQyi31Rrwcy/tyUj3JGYezyDfZ1
         GWiw==
X-Gm-Message-State: ACrzQf1DN5lYtNaMi8cXtsdW0ceDDrmF3wLOG1YkltCzrqGLIVUbUl0r
	nLBWoKRH8XJCkqxWa93kVXyLN+HVfSi9BrSVvrgEBw==
X-Google-Smtp-Source: AMsMyM54Yr6hXkptY8k/m5E89W3bthkgvtDvkRDLzEyVct04WyInaLWAUG81rqK49HcbcfuEwdadpXGnAPKFDHFttEc=
X-Received: by 2002:a05:6122:2219:b0:3b8:7fbd:9554 with SMTP id
 bb25-20020a056122221900b003b87fbd9554mr5383200vkb.27.1667816986458; Mon, 07
 Nov 2022 02:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <PAXPR04MB9185E538798F83B3C03C70EA89389@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185E538798F83B3C03C70EA89389@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Nov 2022 11:29:35 +0100
Message-ID: <CAMRc=McPXjixgSJNDfFLRzR=OM2Q9SuAuCumqEpjb_s2fdYa-w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: add suspend/resume support for i.mx8x SoCs
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2022 at 11:01 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > Subject: [PATCH v4 0/5] gpio: add suspend/resume support for i.mx8x SoC=
s
> >
> > On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source, =
the
> > GPIO block will be powered off when system enters into suspend state. T=
his can
> > greatly reduce the power consumption of suspend state because the whole
> > partition can be shutdown. This is called PAD wakeup feature on i.MX8x
> > platform.
> >
> > This series of patches enable this wakeup feature on i.MX8QM/QXP/DXL
> > platforms.
> >
> > Changes in v4:
> >  - fixed the format issues reported by Peng Fan.
> >  - change the return type of mxc_gpio_generic_config, and limit the
> >    suspend/resume behavior changes only on i.MX8QM/QXP/DXL platform.
> >
>
> A soft ping. =F0=9F=98=8A
>
> Regards,
> Shenwei
>
> > Changes in v3:
> >  - According to the feedback from Linus Walleij, the wakeup feature is
> >    moved to pinctrl driver, and the array of gpio-pin mapping is moved
> >    to gpio device node and initialized via gpio-ranges property.
> >
> > Shenwei Wang (5):
> >   arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
> >   arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
> >   arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property
> >   pinctrl: freescale: add pad wakeup config
> >   gpio: mxc: enable pad wakeup on i.MX8x platforms
> >
> >  .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   | 41 +++++++++
> >  .../boot/dts/freescale/imx8qm-ss-lsio.dtsi    | 38 ++++++++
> >  .../boot/dts/freescale/imx8qxp-ss-lsio.dtsi   | 25 +++++
> >  drivers/gpio/gpio-mxc.c                       | 92 ++++++++++++++++++-
> >  drivers/pinctrl/freescale/pinctrl-scu.c       | 30 ++++++
> >  5 files changed, 225 insertions(+), 1 deletion(-)
> >
> > --
> > 2.34.1
>

GPIO part looks good to me.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
