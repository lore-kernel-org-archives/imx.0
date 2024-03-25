Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6A12FF6D
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711379829; cv=none; b=YbW/QOg4eC/z3RmNIWC2fMH0/ZzgfJiSZjx0RRvsim9atPSwF4+Ze+eWXRJGPuRGDpBdXpDFmigEEvmt1a8N7dLv7DMGfcWd2TBgleii9YBnPAc/5fD2toS3E8Q4nGChNpYwrJofRXPVnE2pWvfVT0k4d/tYhzNjD0bsRf4PY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711379829; c=relaxed/simple;
	bh=WyVNxFVZcEYyYfqmpd4SKh+OfXlzqKGLav1b4PNJlA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvSNBI+xMkS+YNI664sGQnIZcTx3A0dz34/UjopUf5Mm+fRdc3D0VNA2RH17BSJ7k7IqH9S4vSW38py7V2X54Ga8NA7kop3VaQK44+tlmV7mmnsW+mwtMKgeyFpKqLOdkSZyfPKkUBxs8bPq/xFY9xCOeELng0yNMk/L0BI2S/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlCGRyZg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlCGRyZg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29c7512e3b8so3431761a91.1
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711379827; x=1711984627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYv9+ubT1aFkwlAK7nrR+j5WepMeF/OxK42YaYD8t+Y=;
        b=nlCGRyZgHrWU+E1vntFCh98M06xbllonr80YoFzks0n0QPyUkv+Am1rLBGa8lu4mhA
         QBUT5+HZEEi8MQ2E+8ddN3Ukvyrsd97giJ33Z6Aupa6k1fwCQxnq3Cqo4wmY2iKPQ3ig
         XFVQ1E4DpPDXs4k8T66s8koGco6KE6+eqM2BEZt2P6oM+gV4iY/MHXKuq0OM4MsSUN/Z
         UbC+/ngVZRW2AZ8pzxHZYiUlJ0QicwcW3EbzTmE/zq7EUdQwznH9HU2+1Wilyi5Ibgjr
         wTFknuWDfdrc/4ukB59axE0O2omGp1LRzoDEBUU4rzjgHdRVx/gj6yfr9TP9dKxIhPvo
         WhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711379827; x=1711984627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYv9+ubT1aFkwlAK7nrR+j5WepMeF/OxK42YaYD8t+Y=;
        b=wwEai1xIq8fPnKf4L/9/sX6bKbHA/U4aqHavRWWf7egP+ddaMYh3Jh2w+aLEQ4EiMh
         LaSdPNzNyx6xvwJZCQdvc8H7LyRoIFHOovVQHY9sFeUH0Uo/YA+MShHGq+yRsUOdC5ZS
         j9w+6Ivw3m2wC2GHXdCjXGhwV7FMM5y2u6o0JFRvS5UmYlXji2vJDQMUzQWc/RfAiu6B
         ApUUwDGkj2Cm4vm+8lkEOtS+YyKW8uQHzNFx0g84XAdO10opyR+OyJ4XfJRgWdSmd4H+
         32QuKSY1PwxYsPZ7wh9yAjCarIJuwo5PDjPTD5ox+8DEjKfdxWevLk0xbNRrO12VtDCw
         BsaA==
X-Gm-Message-State: AOJu0YxYYuo1cB1r5DtIY863CisioC1YK2+KJFCtULWL11x/3WTlQ5Gl
	bJIVF4yUHnhJxgmvGRKB4bVg3G36tCdbQf8XE43T2uaa0lUBwKj6tTZkJ2gEKbawy9/7zy2U8ni
	TWApvHbeuEsqFsOROa/wZxOZncpo=
X-Google-Smtp-Source: AGHT+IGxNy9NfDKlwNHZ49+tiii8GXivXNYQXTT5vw7CDpwRWufYuCeRvfS7JvxCdsXBqAbwZHcoyqMf2rDXDlDpu9c=
X-Received: by 2002:a17:90a:c505:b0:2a0:2a36:91a0 with SMTP id
 k5-20020a17090ac50500b002a02a3691a0mr6173246pjt.18.1711379826833; Mon, 25 Mar
 2024 08:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 25 Mar 2024 10:16:55 -0500
Message-ID: <CAHCN7xLjMwmr9cryu7YK7P6=NJtu3ei7ivJWNtbG+CG23RDRzA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 10:13=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tested-by:  Adam Ford <aford173@gmail.com> # imx8mp-beacon

> ---
> Changes since v1:
>
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index bfc5c81a5bd4..1d2670b91b53 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
>                                 };
>                         };
>
> +                       isp_0: isp@32e10000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e10000 0x10000>;
> +                               interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_ISP>;
> +                               assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_500M>;
> +                               assigned-clock-rates =3D <500000000>;
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       isp_1: isp@32e20000 {
> +                               compatible =3D "fsl,imx8mp-isp";
> +                               reg =3D <0x32e20000 0x10000>;
> +                               interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROO=
T>,
> +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>=
,
> +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>=
;
> +                               clock-names =3D "isp", "aclk", "hclk";
> +                               assigned-clocks =3D <&clk IMX8MP_CLK_MEDI=
A_ISP>;
> +                               assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_500M>;
> +                               assigned-clock-rates =3D <500000000>;
> +                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_ISP>;
> +                               fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> +                               status =3D "disabled";
> +
> +                               ports {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                       };
> +                               };
> +                       };
> +
>                         dewarp: dwe@32e30000 {
>                                 compatible =3D "nxp,imx8mp-dw100";
>                                 reg =3D <0x32e30000 0x10000>;
>
> base-commit: 4cece764965020c22cff7665b18a012006359095
> --
> Regards,
>
> Laurent Pinchart
>
