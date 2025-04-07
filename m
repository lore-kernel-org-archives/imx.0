Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89772139A1;
	Mon,  7 Apr 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044650; cv=none; b=JhkpX1YJ06ymOOYl1iLRvAcqjCpNlSVB2N/863DHr2/6nXyxisFAT9HhYQJhg0cC9b5G657b3oaX8IZ7341+f43Idhe/SBd+m9q+nZUmmodzlRTQhYHdIpOzUlzaoO9HLQ5A1ua1+388MXl3ThRjFc+ERGkUL0ji/4FCZOPWimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044650; c=relaxed/simple;
	bh=9rKDfEvc7K+7LzU7nTcuoqeYfX0y7c5G08Njz5uF/Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1UoxyPmyf0GPp2OzvCKQFKGpU1QaQvrmZ7YJhHFQ490qVB0Q4eAj03lEZKG90aloYdCJW+Bi0BiVEdqU0nmHMeZz+TR2nNksLRLAZXNh6QHXtJRPyqc2riZJQkCpSyXRgcBIiBPOJUnjjy2ra68Fu9eBYrjO4ejy3eFzavHPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp9MSWDJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp9MSWDJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7DBC4CEEE;
	Mon,  7 Apr 2025 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044650;
	bh=9rKDfEvc7K+7LzU7nTcuoqeYfX0y7c5G08Njz5uF/Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sp9MSWDJaaAqP1q2SYIWKIo2g5ROm+6P5tR7LFd8E50X8gK4zuhxBadi53VkyP+Ic
	 Mjsmlr7jxLIM1qBo59vxeEqPR6FZPe9YVLx4CPyU2A4DHmeFfsEwHB8BxVshIFEmeC
	 12MMo2b3egIrNo05eXUirOJt6tvZCoIHerm6NWQWppuvtrt7Sdv8HQefioWs1cgwOv
	 mkQpF5mP4YM/Mqvyo83b7cKwtpLn0eBZTzXGJBE6sjFWjRkVl9Js0s32ghUeE+0pJ2
	 vKcR/Tzpjum/ZIgOGGfWTmbdDSesqQEtB6FpedtzQIqOmygCuQe1BApOBiIe8k3tMk
	 ZEfSj8h17KEtg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso7608749a12.2;
        Mon, 07 Apr 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy1f+SlwWUs/MM4m6MOqUUzEX+9WjbsDyFInRLB+X9Hjw+bjU7S70RJ+a9vUWsCOMm+j8=@lists.linux.dev, AJvYcCXu55+MJlMksvN9VjQSgfsHo32qT7+aU77s36Ig+CDHUhSU/ysLBu4O4D0tEKKSeQf0JL5AfMT+pCunVFI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMFeA1vKSBVyL9RBywvgfiKyypQI0BVgNaxThYXCMLGM9T9osl
	VJCEe7COOCJjfw1zMReRb4H4bnWIpX8yptRAhG9DZoo3/kiIq2FWRONkZxsENrRh2UDfPaqylU5
	Ogs2TdZeKXx/GyG6B5BVI8tw6qw==
X-Google-Smtp-Source: AGHT+IEYKsKGhFSJY/Ew6wLedApBd8mm5Tfxxs3oUxIJoVcHTWnGkb+RbDSqCHxLGxft/yGwgIdnVVemND8kyOfPXZI=
X-Received: by 2002:a05:6402:26ca:b0:5e7:c779:85db with SMTP id
 4fb4d7f45d1cf-5f0db7fc898mr8148611a12.4.1744044649254; Mon, 07 Apr 2025
 09:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com> <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
In-Reply-To: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 11:50:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
X-Gm-Features: ATxdqUFxTokrKuT9iYBdxHBpsv0NfQo4Eim7mTXXSg7aEaclQFxJWUQS1crmjko
Message-ID: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:23=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> > >
> > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrot=
e:
> > > >
> > > > The "power-domains" and "power-domains-names" properties are missin=
g any
> > > > constraints. Add the constraints and drop the generic descriptions.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -313,19 +313,15 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    power-domains:
> > > > -    description:
> > > > -      List of phandles and PM domain specifiers, as defined by bin=
dings of the
> > > > -      PM domain provider (see also ../power_domain.txt).
> > > > +    maxItems: 1
> > >
> > > There are more than one in some cases. The most is probably three, I =
think.
> >
> > Unless I missed it, testing says otherwise. What would the names be if
> > more than 1 entry?
>
> "psci", "perf", "cpr", etc
>
> The "psci" is always for CPU power management, the other is for CPU
> performance scaling (which may be more than one power-domain in some
> cases).
>
> I would suggest changing this to "maxItems: 3". That should be
> sufficient I think.

Again, my testing says 1 is enough. So where is a .dts file with 3 or 2?

Rob
