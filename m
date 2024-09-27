Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E016C6A1
	for <imx@lists.linux.dev>; Fri, 27 Sep 2024 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442244; cv=none; b=bv18LfrgAW8tuENwyirmQth0iZIsSbbJuuWti0iTJeayaKVqeO71c6H1X7ir3SOuQpLNvkieIr10y4+eIW5IwaFwIDu3HuizKYPAhQQv9klxx+qQZ8sUJOhU4U53x/LE5tHbWAtMNoxj+GAwPu/iK3aXOBLaIOgK2moMQmCogOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442244; c=relaxed/simple;
	bh=lMZjaaCr3EBfndkZEzdIumPZ24tnOworlO7tnZ5+lEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFtDG407tOj7LTuGnLAfDOr1bC/2ImUdiuM5UdssO1k2rz1Va+InnBHE1RR3uXfTUxPZwgb7jGn2CVRdQ9g418drig6zWgJzNUwWyp6d+mHstpMh2WMxY4WL/zQkc84YmK8PlBomYc8vIzcEzp2YHu45UnZYzMZbWhIjJiVsgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpVi17nr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpVi17nr"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so2269159a12.0
        for <imx@lists.linux.dev>; Fri, 27 Sep 2024 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727442243; x=1728047043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=kpVi17nrRJBUp8kRA29yR4vChvjJYRdI6zHmHluy5Fs9HPLfP6afV++IZ6edNWrf9p
         Y1iw3vGgs7oyfaHNPdugWY6aQeD5dtLzAVIONqSqBthF9XoUuQ2STuTIG1ivQUCn7L8y
         60f3pX0rtHGD8eX4H7cEqN1KJwNEbSHVGprjvr5/uK14t1a0s66GUk6VDrz0XOCPrWNV
         IDHKlP2Ctc1Mhsdo4ji3PAnDfL8ptAOPQPRZwX+q55kV3GD7WRl9DoAXH2LL9NWTgqlU
         1EEAe58G/drQkBoHKYJwYhGnrsM/7xO6aa+ZC6zMitHwo4+DBGwzqcS79eUh4w/n0VQy
         UdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727442243; x=1728047043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=FyjE5oybYe7IEmbm5s+M7UdeOpmzKEasu5PqPFh+FiR+kzrILokKt3IHm08iIx0oBt
         183RNWeuUyC8ZF69/C3YO7NAxF+E7ie1bKVCkijKnPV9DPYcyFRp3PRMDKjKyV4tOJN+
         ZwqTi0kIs47iKEGVkuwfIuRKE7Yt7BMOX0curkrGCjYV+JaovLaJHAB8+Jf7jQ1c3Tfz
         Vxo8lL2QPLpjSQE81DmSLfSoMRvv8GBuyuagyOIrPh5R983NaobtzyGFGAygP6E/aNc5
         CDV9hDCWWW7RVfEheTPN4KvkaA+d8BFs5PXRkFOn6jNXD/MMHpS73hxLaXdUL6nAcOyi
         A/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVvuU2trxTmniC5+cRoxEDloJlir6Pl6ks7LpYabjkFkkDCCvUAOVT8MFPXpYRiIiZllCw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5j/+fK+axBy9gWJQ2HfCCc0QXuQw1V5vzaUVtvkPVNP+S3oik
	HZFwlthu+HneHn5E+VPVl+ExbGrMIH9dq0eY9XBIUBkcYtDtSYK8hr9JqSQuYVI9Xo0EczEEW3f
	1e2YOp86d6QD4EyJFn2+BAOO91Qo=
X-Google-Smtp-Source: AGHT+IFtB7KLDPn+GDWKySAL2J4hNThlacj2FyNRmL5tDSlTqDrYlCCyOxeg5M2NMx4sjqT6GHGIxy0O+b+GZDd+MQM=
X-Received: by 2002:a17:90a:8984:b0:2e0:855b:9b21 with SMTP id
 98e67ed59e1d1-2e09111a9ebmr10387052a91.8.1727442242759; Fri, 27 Sep 2024
 06:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
 <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
In-Reply-To: <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 08:03:51 -0500
Message-ID: <CAHCN7xKywTnuW9W-5abwpq8txNYhN39G9OX8zJDy_j=fqJFPfg@mail.gmail.com>
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> > "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> > Card device nodes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
> > handling of {hp,mic}-dt-gpios".
>
> Therefore this should wait a cycle. Patch is good, although maybe we
> should keep both properties for backwards compatibility?

I also wonder what the point of the customer fsl-asoc-card is when
used in conjunction with a standard audio codec because the simple
audio card works just fine.  I think they have some special drivers
that need it like their ARC/eARC and HDMI drivers, but I have tested
several NXP boards using a simple sound card and it works fine.

adam
>
> Subject: drop "nxp" prefix.
>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
> >  arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
>
>
> Best regards,
> Krzysztof
>
