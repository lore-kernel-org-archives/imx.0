Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038543C0606
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892227; cv=none; b=lpIDqF9TBLSU3Ol/xJjW4hpLUqF0C/k2WIsYQoGxG2UCjrfj8Wy+9rvSQte3ZB48+D6771+PDs0wHywMKrowrDqqjXLRlcakzCAqC5t7w1pm1j8RPyapvwH7fxfKo8Susg4D/cc6u6Ku9+lIDQ1QCw0R2tvzJ0g14L4V2FeCCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892227; c=relaxed/simple;
	bh=KbUG/Lzj94CuSVCXFQWc1VZGNfdldF0klrQbP7ulC9g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InSRCzkiKE+emItY47Iwnh25lKxWFzgksJYrhauh2J9ldkheBVHEqugHioCUQLXMOYi8P8fPKqWMXJfT0h8cxRoemFNeoCnZh+EDKOtyCAbrAUtp/uclCoeqGkxIkJ7gWjud9QOKW0zlx6s9ycOdAgvobLEbD82imy+yRM/tQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DczjMUBv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DczjMUBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CCC1F00A3D
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892225;
	bh=xWoQa8RFTTk84aEoAC07qJog4uQPcmRTcxfNGLNDxJg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DczjMUBvKfp5CMbsOROhYOGCOLsZpYRnR4v/M3FcrVtZ7ab5uweJIGfIFRAulsUab
	 RQyOOY9042JI8cfD+xhwBMIrVwgaBGnKuFFEiapdo11rUNdUrRqaRmffpzzfxieieI
	 T/0aqk0CcKZjuzJTm6sbYauBENXBRGY1J8L3MfLT06EoG8bIya0xqXHaeiMrDG4LLF
	 xrtfqYoz2mUp/RMDIxrUwEZMdoaPLaT4/4z9gVNtlYguLbrghReud4/Ano4SYiJ4pb
	 qJM7A0Nz8PrS5WA1ceOhrWNQoO0p6gPnjjQgD0YxRt0AWSQA9wQsBDEMNZUwVXRDpY
	 t+ceRvuSwytlg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso3076751fa.1
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpz3T/2iAtmKCujngLXcd9qg92duBEztoVZvikrMkXvqf7Q3kuxznWyzWTCj6QmpuIVFIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB5hCnmo0xlIgxiiumqi3bC0sgrB7bfPlMImolR1wijjgGjpq5
	sISE/HTAiI6OUgdVOQsRQ4usIOsJnHye3se9Z+EtkW0yvrh6sHCw+rAmjEQ3Uim3XZUncyo/Ndg
	P/SDMQSZzqegEWLw2oqose/9PYpSPyxTAXi9Qjhe4GQ==
X-Received: by 2002:a2e:864f:0:b0:393:6934:6104 with SMTP id
 38308e7fff4ca-39b340ed172mr905801fa.19.1782892224586; Wed, 01 Jul 2026
 00:50:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 03:50:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
X-Gm-Features: AVVi8Cf_I55n91eLuPB2Yr4k-M3SBY1DoYVILdNZ89grAvuz-pPqlnv6xDy3sRA
Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] arm64: dts: s32g: describe GPIO and EIRQ
 resources in SIUL2 pinctrl node
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 14:54:03 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Update the SIUL2 pinctrl node to describe the additional register
> ranges and DT properties used by the updated SIUL2 driver.
>
> Besides the MSCR and IMCR ranges used for pinmux and pin
> configuration, the SIUL2 block also provides PGPDO and
> PGPDI registers for GPIO output and input operations,
> as well as an EIRQ register window for external interrupt configuration.
>
> The driver supports both legacy pinctrl-only DTs and
> extended DTs with GPIO and IRQ.
>
> Reflect these resources in the SIUL2 pinctrl node by adding:
>   - the PGPDO and PGPDI register ranges
>   - the EIRQ register range
>   - gpio-controller, #gpio-cells and gpio-ranges
>   - interrupt-controller, #interrupt-cells and interrupts
>
> Keep the hardware description aligned with the updated SIUL2
> driver, where pinctrl, GPIO data access and the EIRQ register
> block are described under the same device node.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
