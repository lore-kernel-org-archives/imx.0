Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697594;
	b=oJ2TK9oGxs4kPEoIFU+HvlZmgCnfvIS58KUtbK9+ub9UV8LiLtyiV+lyljkRLuOnXl+0
	 pqeSgS/POE3VEWCTfn+s5NVk4RqSzbEqB0nDpy0h86mw7l+oDWSMlEE70LOTCJJzPVor/
	 ktuqdwROzyFED9clJgFmM5KUJ8r/mj6S2722T8dB6p8LyyXpr62aZ203zeCBkRCBU3I0I
	 iTABi+cRGKhfzCj7hilIGQRLekwp3TxcSN7DIV8c75/9gRrzBOXsdiP9IIF3mNS1N5vyR
	 catxQkh3Z6sT7Ow5CwzpTIEoW2Lkwq0gdGC9cbSXCLkvAgOYvX7XY6ooButubdPnWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697594;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q3PzFJ3hbYSCea9rHodUJxc+bUxixgVlxzIsC4nrb7w=;
	b=1HhFswJw5SiDB7BL+hzuT/CWryT/eOVANiAmiC/0kbL4yZkmS8BKapaPGaAK9sJjQNru
	 Ylcr8hjHpsgmoQTghuQUrN1RIB0tjk/eJPYM5I+vmSJf1zb6jWHR79EEU41AN1XxDj1Af
	 130++zzTslQO/P+/+WlrTUV6/tuSHO2FGoYG1kZJ1Mla4b0Ihv99YPcJwv4ogHkx7/5c3
	 VUrp340una1gr/HlDIQ8fklGlqBxwCdj9c7N1AmSRXyrt42cR7mvK+nX7AU79hLuRhRaz
	 5PF9dWE57MMhLHfeCWItghCRgsQ2vDnhwGdS2gC9eWQimLNAvJj6CbvDn3Daws2oQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPpEeEcK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56830606A329
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPpEeEcK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E051F00A00
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697593;
	bh=q3PzFJ3hbYSCea9rHodUJxc+bUxixgVlxzIsC4nrb7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HPpEeEcK7Qisws2Yn2HR2QKFv32My5gHCW/8A9zrInx19MWi11iDKK6VrCbEVVOUc
	 54mk7Xuyy+fUcUxmEcTpFao5KArkGJ4xRfCrwKfLM5YwpcAoW/4INXtsxGtZFZ4G5l
	 7k+xY6aEuv4JCnKsfHXJzIdh8femk6oi3DkGXYdY7RKArxdfMAZZtDybnpSkB1KIob
	 g8WDaS1mIGqnajzeLFzav47q/orkl5QZWAdJ62iMw2zuFzo3PAa2p4129pHOKZ1SsK
	 VikdTI5+VJ0uSbQMro5L3gt5zEm3hrLNyX+p8xOqjOptcU5nutkiVRi/Qq+VH/1iY8
	 iu7TcIZjKjh6w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso8958558e87.3
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 04:53:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDLqqH1xUFb2m9MYUVsHeq53u4FAl7rZMBgEKapqSqF3E6/xUxL3lda5J/z38eaW5Z3UE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8alIFuG4lUxgo87Fsz/R2xOof3mYLBZNOfE7DKTPX9eHlUUu9o
	FcD0GrQdtUJkkBWRJ5cmnZN8TmtaI2ZlYB4LwO0HOdWW7Xs1qlUr7WAw0/vfGf8WBkRyg2Nd+8a
	Ss86kZ05l0uBWPElw4NKC8HUxNrkoU48=
X-Received: by 2002:a05:6512:1111:b0:5bf:a172:db47 with SMTP id
 2adb3069b0e04-5c1bc7fbf6emr6119152e87.16.1795697592407; Thu, 26 Nov 2026
 04:53:12 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:53:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
X-Gm-Features: Aa3M54q-CsXp8NzMnoFlWGAu1EmQEOW5kQyf9eE8X0_RcR3iOaRDqKTNl-NFIlo
Message-ID: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW override
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Wed, Nov 18, 2026 at 12:00=E2=80=AFPM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW. They are read-only in RCWSR12..14 of DCFG, and are
> changed at runtime through the override registers in the DCSR view of
> DCFG, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery"), fsl-lx216x.dtsi drives the override
> registers with pinctrl-single for the I2C bus recovery. Its first pin
> state clears every other field of the word: a board whose RCW programs
> a non-zero pad mux loses those pads at the first I2C probe.
>
> This series reads the fields in effect from RCWSR and writes RCWCR, as
> fsl_guts_rcw_rmw() already does for the SerDes protocols:

Once the review is complete, can I merge all patches except the DTSI
patch through the pin control tree, i.e. does it have the right ACKs?

Yours,
Linus Walleij
