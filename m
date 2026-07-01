Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DD421880
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901718; cv=none; b=s/EcvaXPOBO/SyOWLUYSmWjXQVQ3sEwnngQN7sptLXhKXj7BiBFI629t07J9NNDfcMZXj8U2pIkO7TJclODNZzOTDckGwddnCPqkp5lVRKSmqDluvAIj9ZkvolB6OjWK/B1CalmqIxXjddBwlpdKnS3j/Ojko35JJAJi6MwKmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901718; c=relaxed/simple;
	bh=0AV4NrJc9Gh5gAcTi7iqFcNb2grT5WAw6b2kKXlKejI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYagvQhh3P/qaC3vCHHMASIkMRkCbZNsiagkeuFx7Tq2P0+TYvPa+YktS99ITpXuLUy7HUv8EHrXCd+MhyukWgZnmWDtSolj+Hu5+kb6twAkzEb9Pjwdiz5NN581dMPoysb1GDqQFYeQAvBwMWA7BYWR+tTT4baWxQl720fBVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZdoysyy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZdoysyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8058B1F00ADF
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901714;
	bh=dFB4Bp0YBQbqUpXC3NxsL0hV18fZ3rk9FR0tAgGa+/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZdoysyy2AwRuTceUJvoZOL/a54sXju0V3+M5KCqODyfHx4KHWmATSxu7JqEhANNY
	 ds+DQ+QWVwMaPYit9Rhmzfn6G2KLkXwYr+s4wdfp0kUEQ855d0yIvs8zOyBlUjduHI
	 3b5rtwzj+JvIJ58Kj5V9LWPRuQn/ORN6voCKSUS04uslmBPf5Ui6DZJrii4/k7BpFX
	 7ZvnDWg8r4Ik/roEq+O8JaLkUxklpFWLVPaUijKuOMIOHmz/aDQ2d3wM1mswr3ZKmM
	 VvgBrzc7uF4b3s3tj46EZW6aqz0oJXf2ccrqW0qK785u0/a4hJIa9DiB3k0bPKrmvh
	 8Ecrf13lGbp2Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39669bcaadfso4933621fa.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RooicoLNGmd7tTakbqJ4PFDlVe+e/QaJ7qCANWNiwueFnP120IoezvSNL8C0koRBHz6FhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlrvoWCZptwXy6btgxVENnyq12KfUDRp2Jkor2kZO6I/mkmtem
	gEtQbCAJ2HtyTwSFEJ2xlApfUezYOW794mSF7gUSS9A7D1PTN8QizZGhao2o+fWPEwaWh3l0sic
	LlMyc4YhCGIXvVXERxDKzXhjoR9y9EN4=
X-Received: by 2002:ac2:488b:0:b0:5ae:b7d4:b68 with SMTP id
 2adb3069b0e04-5aec801077dmr7489e87.2.1782901713165; Wed, 01 Jul 2026 03:28:33
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:28:19 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
X-Gm-Features: AVVi8Ce9zRwSC7YWDdpFS7YxJ1muCcN5kO1IIt7fv-PQnrz6ioPZPYbslWakb_g
Message-ID: <CAD++jL=5YBkLz5YQ45cT3uVmBfVbCZ_cy8zAg1J-sqwzhVNN3w@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

thanks for the updated patches!

On Tue, Jun 30, 2026 at 2:54=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> Andrei Stefanescu (2):
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32cc: implement GPIO functionality
>
> Khristine Andreea Barbulescu (4):
>   pinctrl: s32cc: add/fix some comments
>   pinctrl: s32cc: remove inline specifiers
>   dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources

I applied these 5 patches to the pin control tree.

>   arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
>     node

Please funnel this one through the SoC tree.

Yours,
Linus Walleij
