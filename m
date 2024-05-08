Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C610A28
	for <imx@lists.linux.dev>; Wed,  8 May 2024 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189455; cv=none; b=qDSgzcn616j0ybXKE1T8TMNVmqWwvyZb5dhQs68m2ib4qyNrovUW4a8a0ISMQoMvKnkYH4HccNOYkIujtkXIiSZxKJ8Wzq/m2pafZdkGSN+A3MbmfFUvTP8+0htPaKk+rNhjEK869a+aRmmfMc9lSYSM2lBhDnwAe0p8OwxVKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189455; c=relaxed/simple;
	bh=vYfE+uXBisYwplwMBgJYce9Fnn3PhzHMT3aXaLfTTEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pr3fI0lqxiOp6vtH+Xk0dzcYQ4GF7xO5fJnxlQ7DJZZ2l55YT609dwdm3I9atPQOJfeNwkJx99HtjQSgtlmrSjEBq8eWxCgxkr+V0a0KjrJRylM1Z12RW4WasBC8pn+iJ2bsWxQJRfqddv+FYFABlnVHNFxPTOtNcUEQtezIgv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiBF63Yr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiBF63Yr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b3c711dfd3so27208a91.2
        for <imx@lists.linux.dev>; Wed, 08 May 2024 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715189453; x=1715794253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fR68JCn/hWTtGUKbSoApl+GEYdIRkhWhhAj/uy4nvw=;
        b=FiBF63YrMRVBjPud/A+wGGYQjSiVgvO70gWCfjb7BvbULHgFgdhoULte8A9xawNeKT
         wr2wsehiJ9Wm6OZSoUscz8Q+271xJao0CGT0Z0QAtiuExD82KzJFagixit8cZnfiyfWT
         bvDHXjFl+m+E/5zqfQ7scoXTiy+XwrcR+VfS4u1tv/CNVMyHmbV8KHVLveSJ3bZkqhyI
         JJKZhL0zL9AzSuth8QjHqkAwsbSZshq3v3TQqdQ/L7mRIwIB4MuWEXEtBd91zEYj3jf1
         aE7N+oaE3d+x4Zk44b6x/kZYbAdfli6DPC/ytg+7GSv8l7qngfZciv7HAZitau0tlK03
         qaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715189453; x=1715794253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fR68JCn/hWTtGUKbSoApl+GEYdIRkhWhhAj/uy4nvw=;
        b=AkIOJwtEWCETz3Ty4oF6EPnMlzCpHsFCg7BjmUSuU2o7F2zGtKfTaPTfy2F+qKLeMJ
         tqsb/9l9MvYJI8xDIqB516YcbCakWrcffc++fNCtIUZ2t3znhLlOKsykpiWEf8xh+9zc
         LsreOsX/X9+skuOI1Jb9J1tVqggvXl9+efP7kQKIqBlApyrUBnl4D/7yda+vAI1vdKX4
         hcNpYasjr1QFWjvKvrIJ1wGxLR/NAphqzKFOE9W98ZCQQVkkGXWFxNproFc2blvvqWZj
         cfNkJav9uSwqiCmJQANdLaWxeD/g3DbIROSiTuVu7U4musRnXnLopM8DXWP2R2yJxj+0
         Y5lw==
X-Forwarded-Encrypted: i=1; AJvYcCWbEjtWMo3T8BfviZwIA+tqZKs/hY5sc76mb9GUcIINN+7knws6UPVzM+gXpkK7p6nghsqnCYqrXsAke8GTeNbSCqg7
X-Gm-Message-State: AOJu0YzdqvN5agymOnwMVjjSKeG823PPVp8o2Ia0PxFQwrYP5Kagep5M
	u9Jr8Kz6OvbPrx6e4GOga0RTcIFJZ2Q3dfdpXZ19+rmLR6hsWU872nnBov0Ofc4KcpxQElcV4M5
	M8cZQtF5IPyW0wgsI/jnqY74y5Ss=
X-Google-Smtp-Source: AGHT+IEApl3TxNSeIkqfktM/yAubKMXjdwKSRv8nVwvMfEAIehyTaQLljuSSDvebWx4PryXczfykg+2AXkwOlbCDIC8=
X-Received: by 2002:a17:90a:1bc9:b0:2b6:2089:e4ec with SMTP id
 98e67ed59e1d1-2b6208a10f3mr2568776a91.22.1715189453289; Wed, 08 May 2024
 10:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com> <4e781d80fbec0db13555456ab8af6bdae6dee168.camel@gmail.com>
In-Reply-To: <4e781d80fbec0db13555456ab8af6bdae6dee168.camel@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 8 May 2024 12:30:41 -0500
Message-ID: <CAHCN7xJF1=BNgh=wpsyd6WP=haOq2UdCYEt2AaL7rGfhDUh6CQ@mail.gmail.com>
Subject: Re: iMX8M Mini suspend/resume hanging on imx8m_blk_ctrl_power_on()
To: vitor <ivitro@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	vitor.soares@toradex.com, ulf.hansson@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	rafael@kernel.org, geert+renesas@glider.be, peng.fan@nxp.com, 
	linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de, marex@denx.de, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 10:09=E2=80=AFAM vitor <ivitro@gmail.com> wrote:
>
> Hi,
>
> On Thu, 2024-04-04 at 16:53 +0100, vitor wrote:
> > Greetings,
> >
> > I'm trying to suspend/resume our Verdin iMX8M Mini with VPU IP using
> > the latest 6.9.0-rc2 Kernel. While the system can suspend without
> > issues, it hangs on the resume routine. After some investigation, I
> > can
> > see the Kernel hanging on imx8m_blk_ctrl_power_on()[1] while resuming
> > the hantro-vpu power domain.
> >
> > Any hint about that?
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.9-rc2/source/drivers/pmdomain/imx
> > /imx8m-blk-ctrl.c#L101
> >
>
+ Lucas

> Looking at other child nodes of the pgc node, pgc_vpu_[g1|g2|h1] seems
> to be nested into pgc_vpumix.
>

On the surface, that's how it appears and it would be consistent with
how the GPU's work with the GPC's for each GPU calling the gpumix.
However, the VPU's all reference the vpu_blk_ctrl which itself
references the vpumix.

Lucas,

You seem to know this driver pretty well.  Do you expect the G1, G2,
and H1 PGC's to all reference the vpumix, or do you expect the
vpu_blk_ctrl to enable/disable the vpumix?



> After applying the following changes to imx8mm.dtsi, the suspend/resume
> is working.
>
>
> @@ -739,16 +739,19 @@ pgc_vpumix: power-domain@6 {
>         pgc_vpu_g1: power-domain@7 {
>                 #power-domain-cells =3D <0>;
>                 reg =3D <IMX8MM_POWER_DOMAIN_VPUG1>;
> +               power-domains =3D <&pgc_vpumix>;
>         };
>
>         pgc_vpu_g2: power-domain@8 {
>                 #power-domain-cells =3D <0>;
>                 reg =3D <IMX8MM_POWER_DOMAIN_VPUG2>;
> +               power-domains =3D <&pgc_vpumix>;
>         };
>
>         pgc_vpu_h1: power-domain@9 {
>                 #power-domain-cells =3D <0>;
>                 reg =3D <IMX8MM_POWER_DOMAIN_VPUH1>;
> +               power-domains =3D <&pgc_vpumix>;
>         };
>
>
> I will prepare the patch to send in the next couple of days.

Please CC me when post the patch, and I can run some tests on my hardware.

thanks

adam

>
> Regards,
> Vitor Soares
>
