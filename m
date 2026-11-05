Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868402;
	b=HnE7IglPjSyAcZlAQevYsDyuJGdqGyfNzrhjeRbtozAivpU6jLjBPXVPivpsurhA2U+h
	 b4Vcij6Rk4Yicg9xL96SVWBDn9qx9qGwhRJpZsxRCy1ylOSQHKj7I3wmOed6b6UieTst7
	 vMN1Vgh8tHMlqWSwq/0ChFYZJzqgjqIxQllJyN9XQkqrJs7Roq8rFAPsIWDAvKayQjAch
	 ntzL5CZv+oEmkL6Sf99880UiKjOX9bMG8Z2xuEqSjN7u7UJQS3nfOL4FlFqj0MZnzIDJQ
	 8/As5XvzD0/6lSRCx6lj2VKC4Iebu+AgorxiBe8ntp3koagVZdhx7AjEDYSPPF3D+DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868402;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	b=B0FyuK1vCJYBojeUZQWnnb68kMHT2NjkUf7rBMq9sojU70co++aeehqAq6n7xmv8eREK
	 g1Pe82/SWdvx5s8Xj55Ao+0tHyCun68J/hr5IXL80CscbrnvmLI74jCr/rz61Q+O002E/
	 JBicof3tQ+aES5tqkIuNP63SHWLPIpuy/bRmAaZBIgZ930hxMgazT7hXsTEne+4BME+y+
	 aQs4gbo3kZFxEdM3D9+rLfrEMDJjUI6+LO35UrRq72mSbFSXTyNDe7QVdGU1MiTpTd2TB
	 AEmw0SPRRapzCFm5IMVawXE6EMZJwpz+KJkt+o40LzKDhNYwkb7QWeg4ws+MkIzT9rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE7606A329
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666BF1F00A1F
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868401;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1ZMAeBQg6kCKHbuLmKMILx1ALCaS8Y0+Zqv0lRRgMedLGAqlsZG4uMez8fFtNAiU
	 /9iZK3348TAcStbdMMj1Ha4SogTv7sAy/TwkXNmql/LXQnCO2u/Ek83dq2QJ1uxHPp
	 ZNqM+jjFbnWdJSPFseY3diiIKuduVtFL3hLqr6tfc+5FAIE7yN98EP5SwFiuiU2M5C
	 qlU1+awYIYsBjDa3qpAIpH2kn/c0b+grnMmEnFrxfnC54FsN8lUy9XSfFe8EE/w0/O
	 epZ2aGNmdGBgQVlox4t1PiX0DOxfXhIZpb9sRP7vE+kEY3yzX7P5YKrga9+ReXyTgn
	 nMWxOLx1lZ3hA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1514520e87.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 00:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwgVagKhucpgZ7yDLnresRCN9I3hFyvStGZrogqMr4P7+VwpzXyz03+RmcXLszba/e3vmg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+iH66BYGZE73XRB+h3zxmjUVKKemL+kFs7BoIQBYncVQU7bJ3V
	9S8oE+DxltJZHsn6yXGdGbFVss3uOb0f2EMdCpx5E7C5BemBI+APJBwbilfCFeveBfLJ94NarK9
	0gRkOqlBfSHNKLx8y9T0cQd11i21IJ5g=
X-Received: by 2002:a05:6512:6082:b0:5bf:fd1e:1677 with SMTP id
 2adb3069b0e04-5bffd1e17d2mr318092e87.63.1793868400125; Thu, 05 Nov 2026
 00:46:40 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ETflp150o6Y4D_MC0oBw9nE3K4Lvwb5z2qXB53rv4YdppYnKd_3n9_hE
Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:52=E2=80=AFAM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Does this have compile-time dependencies on the other patches or
can it be applied separately to the pinctrl tree once the
maintainers are happy?

Yours,
Linus Walleij
