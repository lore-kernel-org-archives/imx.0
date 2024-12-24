Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD61AC448
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735042748; cv=none; b=urcdWse4LFJS3HrKAmboZhzAHLtHTt204KSBnbemp0FHCJb3ZLm7ah8liV6GE/MH/c+YLWKw3MbojIrK6tcWXuZ2agR7qYRBC/6DQIRUePOutgis+icJqF/b1CLYbNy7lpnKYMwcoACGHGvnWZnsqj9Jr7YYjT8dMPcpF0VfM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735042748; c=relaxed/simple;
	bh=iSZbopuJTWSo/8vniA36NEL/klC1Puu0S5meTNnXccM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axzFnCdQQuszTvcjjehb8V/C8bVGvMRBlVqFzpYdnc+Yi1qvi1JaDI2E07WjP0niGAqd89gMa0ip1K7so5vQXfaVLxqQYLk9lXOhQ02WuVKksZjnsx0mPuc3IIJuc2dUoPy8SAM2LjakcScHIxC/SvNXmId6whh233gahX6kOuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rvJT2Vu4; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rvJT2Vu4"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e46ac799015so4249591276.0
        for <imx@lists.linux.dev>; Tue, 24 Dec 2024 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735042745; x=1735647545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=rvJT2Vu4FXgvqBALADhC461nLB0bY/UEsiAdekhBTidwdSx+XgCEoV4zgsLGfnLCeC
         SDFrKtSiLcowWoBoV6kRo2ZJUYFczfR9sVJ09SH9+/gwRzYMgKPUxyBjIW/ZHbFigYbC
         2cIXYfj6rOXL0tk6MF39hT8OUEIpdsrLjKRB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735042745; x=1735647545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=OBJ7R4rp5+WQ9frjBEShcCaA44FGVpx9qQq/MN1BZ60ceNilw1KOJUDFpGpHtC3gRj
         LS79fVN30+jw/cDzJZcYILebpkpu97RQGu+tfuSbsRSLrI4IyJaSWDBO20h2yIMQRjDt
         ZNd+QFVGEMyw9iDvLHjf39tgdeIPH3oWM4S5iH+mXYnSbeNEx6SrGnHbUjS/sefqqJmU
         x0r4uan4Vog8XTN2JhWDE5eXHtdj96GxMfJ/YG8yrC/5N/7rv2MyH8hShMw8p1C4B5f1
         +QqRq8OJER1DIgGiC5BmTdzyYQLLaja6SvE+QkyOS1PW5wyceBMhFVMlszdEYRKV3pAI
         sxkA==
X-Forwarded-Encrypted: i=1; AJvYcCV/abhlyLkFLpR3uvFEX2lRbxT7tAJLGWaI3pKqcXJ2xLzAmcqwZckXf9jUXwxCEnjV3cU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLeYtTx43Y3ScPEqzQHoqGMGXbMhPeVwzhbbeBOow8aX5GudNo
	srVkpQGWcD9bvPe9M5xD9MUgmOA1wo8dBLSY/JSDYSPOSLItHCTbsOI46zngFjpFrFWu5ZzjPqw
	8kvaBYjyHaL3whXmdCkaR2L+nqLZUNu7iGRb5sA==
X-Gm-Gg: ASbGnctI/y5SkUHx88UZheLxM6d19gIE1EunNDr/WL0HXLhBMJp5koeexkBffSC5cA5
	AHRKpVWPsIMKbfHK2ZMXUYsuM8Dx/bBm6ehw=
X-Google-Smtp-Source: AGHT+IH0riz8i408V1go9BqRjnhl3rg4DSK4AgKGCx/MVPvbG6Ayq1HxKA9H10UEg0e3O98yC0fCqBHSM4WINMwLeDg=
X-Received: by 2002:a05:690c:6188:b0:6ec:b10a:22a4 with SMTP id
 00721157ae682-6f3f814987fmr118816497b3.25.1735042744731; Tue, 24 Dec 2024
 04:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com> <20241224032223.GC20573@localhost.localdomain>
In-Reply-To: <20241224032223.GC20573@localhost.localdomain>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 24 Dec 2024 13:18:54 +0100
Message-ID: <CABGWkvrdMF-sUsHt4Af+Wn-OUgwbjpOpUq-yzMfOYo334_BTjA@mail.gmail.com>
Subject: Re: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Tue, Dec 24, 2024 at 3:17=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sun, Dec 22, 2024 at 06:04:25PM +0100, Dario Binacchi wrote:
> >Get the hw of a clock registered by the anatop module. This function is
> >preparatory for future developments.
> >
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> >---
> >
> >(no changes since v5)
> >
> >Changes in v5:
> >- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors
> >
> >Changes in v4:
> >- New
> >
> > drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
> > drivers/clk/imx/clk.h |  7 +++++++
> > 2 files changed, 35 insertions(+)
> >
> >diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> >index df83bd939492..9a21f233e105 100644
> >--- a/drivers/clk/imx/clk.c
> >+++ b/drivers/clk/imx/clk.c
> >@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device=
_node *np, const char *name)
> > }
> > EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
> >
> >+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || =
\
> >+      defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
>
> drop the guarding macros, then this could be reused by i.MX9.
>
> >+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
>
> how about change to
> struct clk_hw *imx_anatop_get_clk_hw(int id, struct device_node *np)?

I designed this function so that the caller, i.e., the CCM driver,
would no longer need to
reference the anatop compatible in any way, but I agree with you that
it would be better
 to add the np parameter. Do you think it would then make sense to add
a phandle to the
 anatop node in the clk node?

clk: clock-controller@30380000 {
    compatible =3D "fsl,imx8mn-ccm";
    ...
    fsl,anatop =3D <&anatop>
}

So that we can call
anatop_np =3D of_parse_phandle(np, "fsl,anatop", 0);
instead of
anatop_np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
This would require an additional patch to
Documentation/devicetree/bindings/clock/imx8m-clock.yaml,
but it would make the CCM driver code more generic.

What do you think? I=E2=80=99m waiting for your response before sending ver=
sion 7.

Thanks and regards,
Dario





>
> >+{
> >+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
> >+      const char *compatible =3D "fsl,imx8mq-anatop";
> >+#else
> >+      const char *compatible =3D "fsl,imx8mm-anatop";
> >+#endif
> >+      struct device_node *np;
> >+      struct of_phandle_args args;
> >+      struct clk_hw *hw;
> >+
> >+      np =3D of_find_compatible_node(NULL, NULL, compatible);
>
> Then no need to find the compatible for every function call.
>
> >+      args.np =3D np;
> >+      args.args_count =3D 1;
> >+      args.args[0] =3D id;
> >+      of_node_put(np);
> >+
>
> Thanks,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
