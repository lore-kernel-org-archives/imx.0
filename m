Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD537F73F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896513; cv=none; b=Mkg2tmtZ8lUafpirnl4F7j9nwFgOGFR1ds3L/T1RwwvI2eiJLfCWQIjiCHL5ReWK8tHnOLj6rSL4hezv2FIbMcSsSfDVsfmDRY5G8TLrGQoH01oqtBi6j4nHjwpFWixBHtu8SVBO2/kF25bjG4TjuQDKkEAcLmkahZzjnJPBwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896513; c=relaxed/simple;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnHbhMggQpZXgwkT7PiN56tnDzZLnvmUb9h/DRnLa/2aXkdDbk8Ha9rJ5drZYpAydN3pnBpgx8uIy+IwuWeCTAwX96EPAvpqXKld8y4BFixrpYbAQ6eliPLIDmV9xGfE2D/JaidWU/3RCHJ/T3G6SXjh3meHpTxRwSXJF+z5H2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8ET/ZWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8ET/ZWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A043C19424
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768896513;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8ET/ZWaSEu9/MbotIBXsUekx0xcCP2Z8bYM+aLhxaY3CuxoZ4AvAvUMfE3WM0XmS
	 Jrsh+L+YxD4EVdd5ogjiMCP6QWRXv5diYGJKeccPips8pGytxydfbrUV3WeXaQ4sF4
	 522wXmz4PHiAlSnAt4eLThw90pMZTM29EFCPcSPxLmSI2dpv8SDGTQUXWaoQ4ia4V1
	 bfXw6Z2uyju/m6KIPVMor+RDkuW5DLkO3oXZ3o8fgsXjT1AJXJ8c+lre3mU0oWKDRl
	 BxU1QnmY6QFHDZJGWfsSLGtGTZInZPe4vIXgtFElZ5VrCdi6O1zA9rtslcb3GYIiZw
	 SCf0j35ZnVmfg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38316445a67so40252591fa.3
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 00:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcaBiq3a7AzUIKX4D3Nh7mrHIKsXmAG1jWFTF7sNUodaeLMR8Zt6LOIHhlJYSEMJNo9T8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSRfXERKKO0kbT0gbJVjdI7cyEJZRPOt/v0gIYfV7qaULz5L1Y
	HWHzzYNGlyAIjL9dO5toFYJfGMnCGwnuURSxvNSWRPBwRp+w+EhxTO8X5Hd0QPp/hkgpwGcpULj
	60lHsIBjV4rrz98CyRaoJMX7+RA7tju0H+LGwCbNYtA==
X-Received: by 2002:a05:6512:114a:b0:59b:7a1e:d3f with SMTP id
 2adb3069b0e04-59bafdc1eefmr4627613e87.19.1768896511812; Tue, 20 Jan 2026
 00:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com> <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
In-Reply-To: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 09:08:19 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
X-Gm-Features: AZwV_QiFAPGyibgg_I9f0WcLSHJHA7hiPV4XToJPEVHONcLHBS618t-hqReMSp4
Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: wens@kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:05=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
>
> I was somewhat expecting a matching change to the Kconfig to add
> COMPILE_TEST to the "depends on" line.
>
> But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?
>

Yeah, that would be the next step but there may be more weird
dependencies hidden in here so let's do it separately after this is
addressed or we'll get stuck looking and buildbot reports.

Bart
