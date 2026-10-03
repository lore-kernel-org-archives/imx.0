Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5A34B1B0
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049572; cv=pass; b=nEyKMbbQm8+ml1RkuKx2VaFRlEiB/IVCya8k1KEspz5W5zfdwZuC4whVnNtirD9T2+IDPvffFIjZL2PIL6CjqKvB5AsbxOpfZkoVkfCzgWA7TkSKeKT+wAfEmH72mDnBRWhTUfiHiHXPTdFkHZUCZczXk3M6LvDilqadHvGTkPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049572; c=relaxed/simple;
	bh=z2MbF46EZ5ucv0Rbn4jpxSOSlpvuR5oe+FtklMkMybI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKvEtooT3sV8tUAe/Y8TwBxKDm7qiEb0NqgZMWNg+eBic34+7oDT7mWPXKucu/7si6k94D8s4tjkW2y+y8CQwQDVIdDrXQwkKpJUJEaQaFww3IAw1sqjcK1yR0CSeVUtFazmb8EcLCn1RxWD8v11E/I/bR5WKf2TkjIAuEzm510=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcxpSI1P; arc=pass smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcxpSI1P"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so131415366b.3
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049569; cv=none;
        d=google.com; s=arc-20260327;
        b=XUdP8UQTDSBqQv5VIfQ87TZ4T/m5dnTumMwZPVMkGApVHHlxl0hTjPfirhmCWj2A/e
         xOxcYJ19xr7Xxx2hRqRoOq6ZyDoaIssWd/nn4ZFLnuU7TAJr4SRvXg35ncUTYfsgkHGC
         2iImojOCm3MdhdA1ziWlOI9fNHXgEOUJLTy2RonoM6oW1TemeqdQPsWYSJOurRwjMzUE
         wULtpwWQpoXvU3rzcsrmYk+X8uFuGk6/i0dq1fPeP+KHs1k9CPIBFU4NWoV8NgLyQqDu
         Js4q8FqUZSjcy3Ht7hyhd6YQqJOl+uDMHD/AG86qhZBI2uYsdhesCjU5ebUnmei5A+Fs
         VRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        fh=GsV3ua8mFOrqi9+KvJKXHFxIHF3B4N9zmeJd9kqZZCY=;
        b=gyj3wS/JTRN1HGGDaGHGugb2yYuaMtyukPC1S2kUQ8GR+EXVOkvdUJDL48TdojBHBB
         IXxve3RHQVg9Jo6vz37J51BcCdUABvAF79J2CaWi9MdQ1eKewZ06mPRWvVGizVXK11cR
         jZKkNBN0OKrlLu1njw5j/l6Kmscryxl2fvB6NZ6I5tQOa5j+oaWLzFRTxFovRzZMdtNU
         +jSi9CRElGa1C6fcugZgxEjtCVEU3TRoQ6gnJS3/g0hedBK6Rgnm4uFBCRhj57zKpbSQ
         sInxBJQDN++c3ZCiaut0heZsfd9+O4DUFbU5BpxaJDjuR/4gTEjNupjGyeDbB575rKRL
         v+cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049569; x=1791654369; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=DcxpSI1PtiJJZs4yJrH5UwVLo12NcOw8tprBprPHqtu7fG5Br7LJQi/Ct18D4zV9m/
         XLzAD1ySZcl9as+xs+0tk+v0/z4a5rk+TzcpXJsevP2SMwVTSZMMaisHzFHKXEJsOvMo
         tPhmdUrAOar2xBwiXFaVW1c1EJi/oX+fqV27MQk1pvGPlnBfBXlFe0ctSrhMCBq6mBLN
         VE6WEeIk6ncVydt78FXW6mhopnVpkhJ76qkoDkLG/BaV+JV4xwF94n1dQUCE87Y3/Sw6
         UZebrtdW1W6w4I4NlGqRm8h8hvc0hytYaf60tyo/O440Cb6F9yyG2QPDV3dSW6+PeZ3z
         ko0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049569; x=1791654369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=PvQ7l3NsgWtCfN4xH6Ez16p3ttJdg6hK5RPp/NhRT6g9IMc2nUIfXFT91DAlVNcOJj
         35pcAkaSQz8YsVMwldwZM/YRzGozwAUKCE+YOloUHdcksEYUGjf59ilMTpREWxEpGMYy
         UF3Zh3v8BDs8XRgXp57OF0QVoV7knD41KNkQ+gWXZR6mKXrXGoeeEKj4AmlUcJVR4xKO
         ieMa5I0j4yAWX+Dc7IEoh39CWzVzYHUvDJQYUxUe3ubky88pHBFzVafzLc9fp4cJAYIu
         lo00ct791d2UcVsHZR3NzIgBUouC+Dn6Knyuya075BKgDcHlXmV5iUS75ncjHqKIYNs5
         S1qw==
X-Forwarded-Encrypted: i=1; AKwUvByjHHZY65d0kJACWyQJdthpcp0IHRdH/HOQXia1hG6sbFCTmIqLl21a1MeQE+aaZmJDMW0=@lists.linux.dev
X-Gm-Message-State: AFq9FYJAadskB3E6uhc9BplgJ0WIrG5IrI3qGz3MsVP8KSl509bewAS5
	doysU+r1jblscXwZO5K72ZOWLmPn/xIXsOXGyswF1AOv13jbubhY390yaEbZ/dPpm7ptKiRsel9
	mJT0NeTZN+1wh/6ZQfZwzoly6yAE5Nd0=
X-Gm-Gg: AYBFou1DyEDolPkZm+pmW+J3ZM2Jd49rYL/PRGJeNBgGWvZYdz+otJbAkY0zrUKXBaQ
	s+pqh75bwJsJ2u3XWJcMZf+1wRHkRExQlRbnuaCDhBSINLnc2aCZ6QCtHDNQcAaQswcxPINoKAw
	ZiQuIKqWdS049V4w8HHE613I1VCk21XQEkdX1Jzk9hzv1hJiRbVm6kskJtMAOb76iCprUKa5EWc
	thlPHpy/B3oNc388hZRo+vXSjqEZAvvMRB3iNu9Y09W2R8KPw8Rs11d5CklMmP3wX410wGPSP+R
	jW72+szaMh8HNlG6yIKnnDd0cgb0CXLrfwCSoZcQ3URZe4bN5XseSfzZADmrMYTwWYm59NHsnCF
	4w/RhiVP3p3Dv4LcrivE93cLf9msOP1JmkFBBUJRjXGImSIzjmQuv/Lfw9+2ur+NZWqbMLpdyex
	fjTixJqwbdagtxJgcyhjH2hgmO2zlqeysiWmkBH/4/
X-Received: by 2002:a17:907:7296:b0:c2e:3ed7:7da6 with SMTP id
 a640c23a62f3a-c2e4ada63f0mr521651166b.25.1791049569085; Sat, 03 Oct 2026
 10:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:45:32 +0300
X-Gm-Features: AclHuK_DTCjZOQTCqmPG6gDQzEj7LZ2x25KMdK3y7HmSttC0mQYSQAXn5_TTUz0
Message-ID: <CAHp75Ve+qpAhf-LcsNnFwyzQU31FmHkxqZGsEMxd-GEUZcEt_g@mail.gmail.com>
Subject: Re: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior. These properties are
> invariant for the lifetime of the device.
>
> Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
> during probe, eliminating repeated device tree string comparisons in
> the suspend/resume hot path.

...

>  {
> -       struct device_node *np =3D port->dev->of_node;
> -
> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       if (!port->has_pad_wakeup)
> +               return false;
>
> -       return false;
> +       return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) =
=3D=3D 0);

Too many parentheses, also the semantic of 0 is not obvious. Better,
for example, this one

  int ret;
  ...
  ret =3D gpiochip_generic_config(...);
  if (ret)
    return false;

  return true;

>  }

--=20
With Best Regards,
Andy Shevchenko
