Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3A18EFD4
	for <imx@lists.linux.dev>; Fri,  4 Apr 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765948; cv=none; b=GuK8fzZfmuqwYUs8lNo9L7hAC68StIKw4OutGeozfMbLWA//setHwqtvO8cIyJ3SO7Pfa846AASS1frDJ7geDVNAnYaon/CMaEthsM4S3L0plNabXp6xgFeveZGyG/3WWLkGsY5QvpkWlAXCuB5VbB0qB4PgkI/kP3BC14BwceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765948; c=relaxed/simple;
	bh=0tQ/t1mzdr6retFmDkrkFsBJ3Zo6UBCaL1vFCtbj47w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErHXJL1yykwi0hCyqGS8C7zFfLAzl3vk3RmmcK/ATRYRObIQrXj2P99ezXoS2c2Tdjp7cIUYPuJgJJEusfvD4U/4afd9e1MF0+ogyXcUEY/cnuaMjzXvWvuqfbr1kSZS3SAaRX4+y78xI2+NHbyiytCPdCRZCpG7ZMjFmyIDefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD9WVjaW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD9WVjaW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3014ae35534so1602320a91.0
        for <imx@lists.linux.dev>; Fri, 04 Apr 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743765946; x=1744370746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=GD9WVjaWqie4QEmz8EF2Fsm8MCKFuG51bxsk2HoAZy+vBWrace8MGJHAzgNfkLwEC9
         vveQkGvJZx4pyko2xGm96WY8qrqKuCSgtZLoZaoJKfGSVNggSn/09W67SyjbCdc37iw+
         gLDofw+OqBDV1K60iaAGgvOqTZvkpyvsDU90qhbUNu1JkZ0HF4MBmhwWQyA9QQaEzcyZ
         YLRehg8xvVuiFcc8oWH+HHv3MYRKukrmmbwCV00bUiUK8dZjejTrCZfyalT8u2+Z6D7U
         wOWYV6KdbjxppnWu8YNYzmWQ1eyNIw+RYG1mmuS0QS+0FFRpFflszOArTv0dSZY1qpyL
         vOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765946; x=1744370746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=fop6oho2cWr0Kb/okqGCAA1AZATV2TNNfSa2q0ztcllfXPe7l/2qe+Tg10m0J0AEkZ
         KwK197f/LSXEHEmeSEArsvgtplJjefKyexOOAlqkBEkg6w3nMqSzKyI7JmPkvTwmLJ+c
         CGAH6nQJTTdwFj7CkF6GP0tudNal1VS4dRtC9LaHJI+upGzx5vfvWHnsgtWyFpHHYOGB
         ig+Vgwgvwbz0Nrw4Jp8Fkb94YWV522KzJ2pG1ycJs5KJU2d/SbMfh8tAysOa3F1XkVDs
         3XksiMbktukYAY5RDPk/EwMOjU27z8wofwrkS0mRhL/xRPOR2anULTW2D/sF+8aPeo5L
         V/4g==
X-Forwarded-Encrypted: i=1; AJvYcCV7g8rzbtrevzyb12nPFF8qmNKjnQ9W4O50wynnjtS0H3PIFZnjYq+/vxDeRqr52ey8lyk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK+ucL18yEfF/DuoCQJCbNGS8ME9oLxYXtYmT440Ql+Ot0A22n
	9fn2K+eyBlGLnzkXeEBMtCUo0s6BQrW7n4jqSESUPF5i3QODGnt3wM2r/VZFZOjwOqcpCLqmzzp
	Ug6X+lX2h9OkuFJBYbX0UWIMCdqGmbzgxFVn2HA==
X-Gm-Gg: ASbGncvtK+s8emqi298zLVFov3KNjX/Ps2TlPp4AzLHy92mv0zdQuWz5/nQPRV6ub50
	x1kXW48o2omi3Yhegl2t5VU4GZwAFUX2pqKaHzsvtXWtAXK9ktpHw/YTVvVAm0+DjsyycLaI0hG
	Tq18CPcit6F28tArFfPpkwsgg=
X-Google-Smtp-Source: AGHT+IHzfIJRZpdeONCKC1hscbpEHgL+eOok3ABpVp7t0jI5xsF+h571shGT73MMq7pH/ucoJCkY3wGkF1YG+WPKcMw=
X-Received: by 2002:a17:90b:5443:b0:2ff:796b:4d05 with SMTP id
 98e67ed59e1d1-306a485edb0mr4690761a91.11.1743765945929; Fri, 04 Apr 2025
 04:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404105359.18632-1-ivitro@gmail.com> <20250404105359.18632-2-ivitro@gmail.com>
In-Reply-To: <20250404105359.18632-2-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 4 Apr 2025 14:27:31 +0300
X-Gm-Features: AQ5f1Jo_vwVCsJBIV6IqomEQgPPhk2OrizKxFzdzrwjdmKaE32nMnNYDWv9ZEsk
Message-ID: <CAEnQRZAkPJJRit7qrxHc4KtaR8Xej9qBZYgYTukWtKM6fwTSnw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:56=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wrot=
e:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
>  .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1288 +++++++++++++++++
>  3 files changed, 1586 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-de=
v.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dt=
si
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index b6d3fe26d621..8106dbeffd3e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw73xx-2x.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw74xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw75xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw82xx-2x.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-toradex-smarc-dev.dtb

I think here we should go in alphabetical order. So move this in the
proper place.

>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-ivy.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b=
/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
