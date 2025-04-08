Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDD268C66
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114667; cv=none; b=UAIXt1I9ZJQ2CC8zfM/UtUrICxj3sJLjLOAAfdecclpiRmGxH+hJnrIFxJZOUbr2WUZNW7+N/lbIV+D4WRvPyqDkIkPYDNjaXf7GhkMYW/7LTXlx3n/roiD1pW5s3kI4uKAMl5xKUYeMgYHvntBCMmIda+eQpDMe7OC75UC9S/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114667; c=relaxed/simple;
	bh=zrTv3Igv/b40jizFm6EQbXgK0TIclob8WTp61FIgQrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQhjYgz08s/6NJTaq9ziL0piaBWGRblhPtTDWyipLKCJEKiebqX1/ZHsRkYyaDc9kYbqgTOKSNvmLX7j0iP5Y2Nz8rDvWGMkYF9SgjI18JjHfvuNFVHJOP+MJxzdzPP0m8GCY43uPKUFoL9dOaIz0mahFzJNZaBQt7UzA7OqFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEGx/DgW; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEGx/DgW"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ff1e375a47so51932117b3.1
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744114663; x=1744719463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=QEGx/DgWq/A1ZGoe6kie7fK+witqNnSFLKrF4Nh+8fE4EUKpTk6bdf156OBA1mzJp5
         rQNRh4ZtjCufwXJMG2pbhqhWW82MzYtJGzAn2XgHo98Qne5mWGe8lacJJQ3lxM8Nxj3s
         PKVFy0wldxgzxq7RwYHTSzKfPZ8oK286f+eRxtUqP4N3id0US/TLXZ+k+Xo1whMCmnd2
         WWKfgwbMj3cbgiDBQ3lMPaqusbPDabPNjK5qRz8CyGHhMdFbF6PWTHaTYHIyYZZfH8VW
         sYhD0UJzHfpUziZUCEaBhaD6ovmULci5LDtVi9yobFrhU+8enL1ne9SzyIPcHjgAVoh0
         /e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114663; x=1744719463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgQfANebtdqnI5c6U+NPo92x9wLAySpUrYEpuKhqRpM=;
        b=igC/jlOgTWKdd0lMKm6eGh/YHdLkdYvI52Qp8VKW8yiS/ECl9A7XhRI0Z3p6FrFDkl
         5jGZHORtz/A7cnOZIyAtNFSGGOBJnq/jTBapQfdFDKE5G7Kk3rlTffBUS2rKERPuTPdZ
         +GLGfDafZcBYy+tflDrvjUS0G5yC31+Sx25qJEfNDp2yZ6CVGHvdl4QACYEQc1r9CbQy
         yuHwC12h6B8vXdWQsmTatOVEv3UYPtv7dd+jnTUp90nO+ZB2DPydAHFAwGWXkt9dQOKp
         NZjc/DUGLFX2k3wABe34Uu5el7CM1upzh+9Yv0dIuwgL9vcp0PkK0zhQXYwHMOu4nT17
         TGqg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZWypjxAIG4pwAq8Q9WsgvsuPxytiwrqW5hnDOQJ3J9i8J5U2pQe2BrsH+pql1TUNHO8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbYULruw6Ziw5X+lC1lO3kJ6Xoi3X3ACGfj+oNLZqbpwc+gFHr
	v72D8V4P4GAqUffaXDJz+Ky+XGzR9ivS4HbmxgRjyp1gG7/rL2mWjcVBOF/XviFMZyt4FmRfi6m
	mUJxz1vnf0PcJnMnMgL4jb/5xnP5aRLUgjqmF5w==
X-Gm-Gg: ASbGncsOL2fo2+kzKa7lOasyOofmHLksnw2C/iJdrrVmNbWTCXh5+OGO0GCHXDnmZIl
	bZHr+K9hD+8rCfhb4Gh64bhGQvIEzFcbUuiMIVW4f1dJJ5fDvUU7tVwnPu3tYRpMi/EBxLyxmC+
	5LDNisMylrlmv61VOYUblwwhO8Hm0=
X-Google-Smtp-Source: AGHT+IE9ys53OzSUdrwDVzPrCpJ3j0rVw9UiRXdXpPHOiJneCGTZtJTMxzg8Xq2rdR9GYtx0ZTNP05CFJHjGpzcayc8=
X-Received: by 2002:a05:690c:67c4:b0:6ff:28b2:50e1 with SMTP id
 00721157ae682-703e14ffd3dmr297170407b3.2.1744114663553; Tue, 08 Apr 2025
 05:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
 <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com> <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Apr 2025 14:17:07 +0200
X-Gm-Features: ATxdqUE7frfhfuxoKUlf3DinAq4W783EiniruawsYcgTKF9-ms73Ag05S_dZWTY
Message-ID: <CAPDyKFoKdj-Y4-dCwYRG7TLdS1HcSH=i9EN-b9Cpyo50kMmC5Q@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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

+ Stephan Gerhold

On Mon, 7 Apr 2025 at 18:50, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 7, 2025 at 11:23=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linar=
o.org> wrote:
> > > >
> > > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wr=
ote:
> > > > >
> > > > > The "power-domains" and "power-domains-names" properties are miss=
ing any
> > > > > constraints. Add the constraints and drop the generic description=
s.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Do=
cumentation/devicetree/bindings/arm/cpus.yaml
> > > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > > @@ -313,19 +313,15 @@ properties:
> > > > >      maxItems: 1
> > > > >
> > > > >    power-domains:
> > > > > -    description:
> > > > > -      List of phandles and PM domain specifiers, as defined by b=
indings of the
> > > > > -      PM domain provider (see also ../power_domain.txt).
> > > > > +    maxItems: 1
> > > >
> > > > There are more than one in some cases. The most is probably three, =
I think.
> > >
> > > Unless I missed it, testing says otherwise. What would the names be i=
f
> > > more than 1 entry?
> >
> > "psci", "perf", "cpr", etc
> >
> > The "psci" is always for CPU power management, the other is for CPU
> > performance scaling (which may be more than one power-domain in some
> > cases).
> >
> > I would suggest changing this to "maxItems: 3". That should be
> > sufficient I think.
>
> Again, my testing says 1 is enough. So where is a .dts file with 3 or 2?

Right! I assume those with 3 or 2 just haven't made it upstream yet,
but sure they are cases. If you prefer to update the binding later,
that's fine by me, but I just wanted to avoid unnecessary churns for
you.

For example, msm8916 seems to be one case that already uses "psci",
but requires an additional two power-domains for performance-scaling.
At least according to earlier discussions [1] with Stephan Gerhold.

Moreover, it's perfectly fine to also describe CPU's idle-states by
using the power-domains/domain-idle-states DT bindings, according to
the bindings for PSCI [2] (no matter of PSCI OSI/PC mode). In other
words, for all those that only have a "perf" or "cpr" power-domain
today (or whatever name is used for the performance-scaling domain),
those could easily add a "psci" power-domain too, depending on how
they choose to describe things in DT.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/ZRcC2IRRv6dtKY65@gerhold.net/
[2]
Documentation/devicetree/bindings/arm/psci.yaml
