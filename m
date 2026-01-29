Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE402EB5A6
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676649; cv=pass; b=f+J1gkUnSO69zkwvPhVz1gwGB3ECIIHQYrX7/TH0WlVzo/bCv6j7RkPyyucSK/Twkc+m2zMQVMknwDrz5R8liRrWh9aKAjjZEZdpjfxuVXL5sJ7TmMdq4jvlJLwSSw1OyUvp+Jf54s+y6s/XUdH/xgnq953sNLPvdp8ZL53IBMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676649; c=relaxed/simple;
	bh=DTjqSLomGJLvJusWZVnjCMIBAVwdlzh1nRDiu1cGAsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bupwVphcCVu0Wv/G6Jlt/i32picmKg4jDAnZgrHA1DtU048UNMpGM6MmSXQCuNvOQsOMCVg9pstIDREJceDQLuLQf+ZEhQUt3RiJAMPU06eZLDZIa9JaFdYeDHiyyz5nR/hgIEJs6fCoNmrDv1udROR8jFz0WATObPRNiOkj3gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTEm18GL; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTEm18GL"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124a635476fso1013054c88.0
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 00:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769676638; cv=none;
        d=google.com; s=arc-20240605;
        b=FyuaDgv4KTRNa4hi6i6pzC34pNWJKybkPEPcRwa0LMnwal7JTzcD3WdNjiV6YiT4FA
         v3r2lpZWPCqGViq4hQhRF8l9ZfgzGkwti9ljBcbdxPbRIka6EnHvu824R8L8YSBjMVfO
         //ZsPMPCq7QWPaF5kCnjgnFd+e5EezsbhnDSNeGu/vTMnkY5kTe2WWPiwwP0wRB6FgRO
         vLQhj4sh3z6g+BuVu/EPf1F0b8La0Niw2AdfMxQpcaG+MTE9XX6paqLy5sd5q29Cyow6
         q7/cwXV3ihFRXaQhgWaQ80eZsipG5VOry0eetEu2zCG+j4vjCBTrUVF+H40C/cldim6C
         +P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        fh=cpFWDqk8bZiNZR5UyrC7Csg7KEUgmunui2j61EkBckQ=;
        b=MnapyDjNqy4i51EF8oyKChoBF/gQsssOQCxkPnp+H+UTT+lCgEc8x9O/0cZrMbVGgh
         QXgqks4cq8azf7iLibovboULoFDGnOLTJoD/qkP4CficBrr0z3Xl1xg9jHTRnXX9x02o
         R6uebNFjYj3I5rljLot7B3H9NdlU9IYT1DK+xFg7cwv63dwBHevL17B2XDv+8XcO/o+d
         bkbuJ+Xf6fMiN0r+a4SNRSnSRLMe+hFRYhFpSfMLj95z2qm4gaI93zkIq4s1BNEXnG+5
         Ks3TlQ1d2RH9HQOsK+PXWzBLQchlIaV+bmE9Y7g4f81gpfgIA2TWOOXEvTJ3yfWej39T
         1Law==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769676638; x=1770281438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=BTEm18GLWosWQS8UnL5zJCbBJM8e4JFcwEX61AzJzUUGMX4ktJDneSWF4AKn8YXO2H
         56qilAdBJuvQUMiYPeHXOMbLwjnqkIJoa4wtyr3zAncVAhXlvNFTaZgSMmqWXLMBmorG
         5eqUSKZNSI1Jo43wWFrxFqhwibcOztEdoCGRxJqxEJagwCbY6OuDe2OfoRYMBFufMEGF
         qbtSnfJPCAc2632X06ojyeCktyTs1az4Alv3qN4yBzG7Uf9kaB6bbuI5SL7ReMmXBwTP
         oC5yvL37VGGHcqgdtfzapBD8CCQH1yWLB2ZOpIr6r51WaxFhNvVPvYwVWbqR7EtQPXP2
         vn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676638; x=1770281438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=uz/o6rcLO4vWq8dQFD3ro1bGJZP6E/7tYTUh1rcd2kD9cX6yzkrI3OBQ5Lk4cmm2LT
         NJqRqUEJY60UJGymKjxD6O+nf2yqTaYi1qVWIz0eFEh78TuvAZ+502tBk0iVoOJ/OMNH
         srBfoHqcapUve7q71wUqMgx9Gjp40q2Rmgu5k9/3zW3D/yoJnemb2C3MnDAkycSSGZjs
         jBfgwRHTnqdRtiZeyZLE0prjlRhqZDamvm1/oIjYA/7TfPLxoBfFk1hDd6IvOnYUa++z
         FaxguoRlaBa5pWcdknuIDomwtEoTwqgwCBfZzJuzwWLsLAQ+wEuXjSeE6G1erJ4R5q4E
         8DSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUjuuZ83CwT0QJLHpEMOAEx3GK3Zpj0htIP9NEBht3ZM3hjjx3MTTTKuZyeKJ6IJg1+Fc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzejq85WF9Hl5mC+9FaHcP+flefhu9nQKvNg0+jcSGDF4zjQmSH
	RyNeV1IvqZ4bW6fmrj0JPj2sPjuvCjoSCrf6Wu4wlMLAFK/W5fBjK/CCBQSX6wRIuu5Fp9qNdPU
	Sui7XuqsiAb5//LfdPrxFxPu9uGs5M0g=
X-Gm-Gg: AZuq6aJjjDeUBWr/8eiegtpfy255Jz0s7pmY+cRkEB3Mc67n9u7OTO4PVT1BkKPHlWN
	Z5C97UsUVZofHgWKNf8bGyXmHFxALJNgkaBV+EM/P4MC1CXl+8Qd71KcMjyoXCwUwgevu8Aj8Vw
	1IMfCAC5iuTETSWznPBEsGnffj1z9ScJRzy9njnu+0LY0d6p7o8FFzWrZDxjU9x7SxO2+pZHI1C
	RD8LxhWH5q5VUsqZwO7yxrv+telIWb9A67WQHCMEOceRS04w01GvGn6O+u1JaYqCS0FTgMUt27B
	PBdPDOF7yFI4bplan1KqSHgvDIyVGdcOzNt8nc6N3eg9CQFQjkjeKRcY5oQm3vCeEAeCWwbEiXu
	HriioLg3+vNweHrtnWgqsjPkh
X-Received: by 2002:a05:7022:24a9:b0:119:e55a:9c08 with SMTP id
 a92af1059eb24-124a0114330mr4531675c88.36.1769676638430; Thu, 29 Jan 2026
 00:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 10:53:22 +0200
X-Gm-Features: AZwV_QiJoPjxBlGc_n241-eebqcvpnHRLF4wcryqHdHTimEnsnf5j3OD_trI938
Message-ID: <CAEnQRZCSQ2o-P8ABCf257UzcYhojfg1m4d=oCmCxcCYWZ1AsGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, "S.j. Wang" <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

I've tested this series on i.MX8MP and unfortunately it doesn't fix the iss=
ue.
This is the serial console output: https://pastebin.com/dvJQ0HBy

We can talk privately and can help you test if you have debug patches.

Reverting:

669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")

Makes everything work again.

thanks,
Daniel.

On Wed, Jan 28, 2026 at 8:40=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> It appears the i.MX8MP does not like when arm_a53_div, or rather the
> parent it depends on, sys_pll2_500m, is briefly turned off during
> __clk_core_init.
>
> In the past, this clock driver could get away with not declaring the
> clock as critical, as nothing ever fiddled with its parent that early
> on. However, after Commit 669917676e93 ("clk: Respect
> CLK_OPS_PARENT_ENABLE during recalc"), this changed.
>
> In order to guarantee that it keeps its parent enabled during
> __clk_core_init if it sets the flag CLK_OPS_PARENT_ENABLE, the clock
> must be marked as critical.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  drivers/clk/imx/clk.h        | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index fe6dac70f1a1..ee10f845faff 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -655,7 +655,9 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_CLKOUT2_DIV] =3D imx_clk_hw_divider("clkout2_div",=
 "clkout2_sel", anatop_base + 0x128, 16, 4);
>         hws[IMX8MP_CLK_CLKOUT2] =3D imx_clk_hw_gate("clkout2", "clkout2_d=
iv", anatop_base + 0x128, 24);
>
> -       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core("arm_a53_=
div", imx8mp_a53_sels, ccm_base + 0x8000);
> +       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core_critical(=
"arm_a53_div",
> +                                                                      im=
x8mp_a53_sels,
> +                                                                      cc=
m_base + 0x8000);
>         hws[IMX8MP_CLK_A53_SRC] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_A53_CG] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_M7_CORE] =3D imx8m_clk_hw_composite_core("m7_core"=
, imx8mp_m7_sels, ccm_base + 0x8080);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index aa5202f284f3..97cac1d623ca 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -454,6 +454,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *=
name,
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAU=
LT)
>
> +#define imx8m_clk_hw_composite_core_critical(name, parent_names, reg)  \
> +       _imx8m_clk_hw_composite(name, parent_names, reg, \
> +                       IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITI=
CAL)
> +
>  #define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_FW_MANAGED, \
>
> --
> 2.52.0
>
>
