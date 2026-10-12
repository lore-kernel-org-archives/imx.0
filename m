Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185573A71BE
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797449; cv=pass; b=AFW1JGO/2uhkFtTKLPX7rDiMy6+K/LggWhs7Wi1KhvsVKCHpUXIvHqSsHP9WTa0e35a/g+EgQorHwwNPsbjEsZByc/qxlc7rWpJbGdpH7D3jmJXQKxx4I1Zd9LoU3ltpOc8bWkc5hezsPk9DzTWp7Ob4rgaONQ1YCy9rQdw6ZVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797449; c=relaxed/simple;
	bh=z49hML89cIN3imf7VrsC7tsy8ZMFjhTuJK1MAzYH5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4fMlJLgEXfHWmq7sKs+7Awo0oQoBxnuVouNsy/w5vMqub18u/N3YHk1ORO0m5ipFDWDUNxz681mRwd4NSIHdcSSRo/YiKjc2OiDJ/xoWKL7JSriukyMcfXQJWmSdDH5qmOMXgHj+KPyZk3XwBGyxzChhYlIu4jl5a+WBS5pqtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbZzx76c; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbZzx76c"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso12252061fa.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797446; cv=none;
        d=google.com; s=arc-20260327;
        b=ljcUu5XFcuKpB0znYzebSoHQLNRWz63S3zSm9psxTnygj5GuwBCDlK+/xvve3lzNrK
         KvFQLtNfNnltBNf/F5PM3lU1+z9xxDz+E6zrMeelZpEpOTKmGXs8T99bzeIJ57qd0IJl
         F6hn8n8KdKDk24ZpLCqo5dUtK18858KK9BD1MsnVNTBEyMF2jvUA5g/5eIuJLY25yFRJ
         eNJ5hunsbegTxoU9rLZOJEEd0rkG95S1mzXZNdmKY2B2y2Q59dQqUVzvpX3QgppvmbxH
         vPHQsNchpsAn6ipRaNZk3rXBPtWmhUTNTUctJMp2VHzphvlb0+FGKhPgeGlschUqgGRP
         phrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        fh=T50wsQCUqwj8RqXAesA2kXRyQzhwNXr49M1gOjx7m1k=;
        b=XJK/4pFnBBI+1E0FfwSXF7TaxZazKnZ4w0Vh9yzNwPX0chxtza40ekBqckYPGZNPs6
         ggCmz4V/a3FKHhLgx3TN6WOo3qnzuaE78AtTDUJQGpz4Swxu3QCtR+RbssLesHxNQBgK
         iiovPXMvxV36giNf/p/FzosXdiZ12a7uqr8aNugBsa2yMSIdqbJe0VFlyqnLtvB0J9xe
         UpB8HrbK3c+Bb1PoMJ9b00Zw4QigbmVQwSWIIYZefvPUo1Gu4W7hF1rPFMXW0KjgSqHE
         Qb2v+Lv5Qa4hYwVLGZtLbB0wZRGSJqGwI7v0gCoxAwB4Lbk3L6EXsaY7tiUQM+e3uXlY
         2qqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797446; x=1792402246; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=YbZzx76ckh4IYWBpgOdhtvrrKUAgxC2uTStx8E5tm3YJ2C6PkT+wYRNAxwDE6CJ4Yv
         WPPVJnhJ4yUdcqbySuGEdQrvnIQIjSzw/QQEbe606N5WLLL1/jQzY35OuxQPE4tTYzOO
         lAjepDBRPQXpr7kO8UOEAnukVokTme/xgmF6II8CJdLPN3W04fYrRKH0rM7x5HJWwI19
         IPR0SdC8s/kusn5irhM4Rel0gyQVlbvv9+bDSQgiqRgfuYKB4Z90p67Rfo5Dl6xPw8kd
         NOyv80FygrPie/1wcrzY8ifK8Rx76xoJ2NmEsyiVMrmszLxMjEuaFRYm08RhFGnM346P
         z20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797446; x=1792402246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kV/daCkEcG+SwQxwP8rLI06AhxP77k2xK+9iHAJSDFM=;
        b=SvNaG/pP5QM6T5T16LFjGJfuT0m4n3DyP7EBqiO8bfm+f7SGvm1DzJhRrlge4M2UoK
         sSLw+uC1Zc+eHYkpmKOhJ3Y6aHTSHNFO5eZ+g2fCypSD75s2HrNV68PiqwDdrKrIxzHP
         12AycjfD/6QG3DvziddrorRx5J9PhbcFcLqe0GY5MzGJmUMZOk8GKsGZ1uN1/QWhiZDL
         kNtFhh19k3lzF8Fa3o5BFetQfXzgMwOmFlG3+f2tOxU7Y9oETdvgs/mKwqVdSWnXTW2D
         dr3SleJ+0tjkaWmD8SvA74RV2IDdf+tcOtzSppmxGAJi+7A5QDurwj4abrCvce48sL3w
         YLNw==
X-Forwarded-Encrypted: i=1; AKwUvBzyzDcYGK1fuAaXzpZn/0aFsuUraC+o/7vWNZ5z81hU36Mz80JcIxqoE0OP9Oh4+zocLLc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJKuskc+KGstqftQGSnGXWaDnlSA+og5vevrWR7Ma7cY4nKSv9a
	13xSEHf7RT5cB0tqOfm4wpM+kXtxkHPOTJFSS0T1tY1E/p8gyhrFqHpPXJEov/jZ+YcNdV+7U/2
	3R0Vhh9ZLCjAcwVfsTwH8rdaMZo21YLA=
X-Gm-Gg: AYBFou2DTg07YzYyHmd4t8Cd/I0z7CgG01OMZzO3wc8UdVLAg/XWs3U2+oWGIrZwxpp
	5zbZXto/u6NsRuhIPmsG74uBmoNkeKzlF0hjJfAUILuXWFCBPrH3N55lTfiIj2CbbBNC+3MQ3TZ
	5xrP7heKw0Ve+NaybwLxEZJRELcsPJGRkLpK7hX4qdM0MegD9Rx/SsLxsul6ZNtqW6+/DLsXqnQ
	B0qMeWOPpUx5BHTKXLNfubTm44/iZsgJs5TzKbfJ9dN/54vwiuoV/RVPsZmCpP/8Dirqbf/khAx
	s9ZtDZNXcJz/fomOnCVLKngxeowAHiz8BsBMEmr39PdiWF2qFvqJdCV1Fl44CD5Mip/BQuhmRTz
	EanL3gvDq+v0xARN3nk8vmb4RfJxIdxgRGj7gWeFOaki9R/h7LCCxgsFA0I5iX4UCO/JCBbBC+p
	D95YDQFWWcJw0+vhnFYsHOIzz7yDl3RG8aKvXaY9dE
X-Received: by 2002:a05:651c:3251:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3a9c539d80dmr19489771fa.28.1791797445959; Mon, 12 Oct 2026
 02:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:30:07 +0300
X-Gm-Features: AclHuK9e_oZT5Sa46rEJHVX3lFg1Q7os3EVH632mfdiuI60h5GYQ15qLL0jo-NM
Message-ID: <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.

...

>  {
>         struct gpio_generic_chip_config config =3D { };
>         struct device_node *np =3D pdev->dev.of_node;

Why not this one? Is it even used? Perhaps you want to have

  struct fwnode_handle *fwnode =3D dev_fwnode(dev);

here?

> +       struct device *dev =3D &pdev->dev;
>         struct mxc_gpio_port *port;
>         int irq_count;
>         int irq_base;
>         int err;

...

> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);

This message simply needs to be killed, with initcall_debug in the
kernel command line you will get something similar from driver core.

--=20
With Best Regards,
Andy Shevchenko
