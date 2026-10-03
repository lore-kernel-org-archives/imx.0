Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC4351C0B
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049762; cv=pass; b=ddjV/q+qvilS8s4VvAMUro9+B5Kh3DF6zJYCGt2Hz7l9bNEzoASgUqHHO4s5uopvpY5bzJpRD9tanTGcyyTMS81AesZOkoZ7u7m6lUTIFcz1jjYnV+qoKuXu2Ze9LFL+FHWHeQ6lPgs4lZQhWVUJVflS5hqJ8RX5YVWfsxrFrBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049762; c=relaxed/simple;
	bh=YD4inc+qwfxdmXNsGOoWhpIhRzxHQkYvOht1VXxPM9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By2QWBtb4bFNOFKZiCIXuOfG1hZOJTTakt/MiBqg6GkeCs6eshhd+F+6R4GjoShxv7WWMYbheWeBqYUmoVW83WMKV8LIJUgVhb/ODSURMZpmuLeMAkFVQFnOyOnGW5c4rMs47nm08FXVu1bRZhY7qfTnvPb7hfBj2TqKgLFBDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGXwDbnt; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGXwDbnt"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e59b02972so99670766b.2
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049759; cv=none;
        d=google.com; s=arc-20260327;
        b=dK+/b1+J4ZFl/bm/eR3lEPe727jTCffFYokCTLBTKxHkvlPghLFkn8EWlQqaKK3AJn
         B4BUtO8FQQoh/lqEWMiVP8U6yyFJ3ddAmGkCSuB9qbGntwYbsilP+Qpn82cplercCTec
         d0hZYo/n+DAhCPhALMjiav7V+YKwc+8ZJhOZtw4xq39sl3Giqu/DZVEBFuh1XeHHFGA7
         umUE09thNJclzoYcolqEVE3qytuo7QNWsmhbRXUaPc17nn3yLfkc6EX9dBaivhQKWsVq
         WcBbHbHIfgG5OmD2EU4JzT7p6NpxTL10Zk9rk2GbR39bkfOp5Sf2kGLwhjaloJa78Eh/
         o/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        fh=SbtHS4fR1y/qTv8VHiTnapaQt6FD+tHn7XYi+8WbGKc=;
        b=kNxreUqIbrxQLi2K4FIHszloyHjYu3//qra7AYs3y6u0ck7I0/tU/G+BvEPt/kaAES
         4zsDcNuXqerA5qIZAbFXdqVikNWEyrEemWd7OIyPJCd4Rmzm/sa3d0P1A0GOPfeiVznw
         6JkU5Ni4EaomdyU7mnIowBB3b0v3DB/N91CC/kRs2lKlAUV1aYBt4acxlXeNdBwNnt6n
         7QtK8quubcNrgaYib+iVervQX0pumOXQ262ueuI6AJ2kvgID7I5bEJYeNDoCue7EmmPH
         SNMe0nheeNAbHXS1L7cFQKFTsY2YktdvUL2wyazSfXPjcitxV+k8UrCPZoMRjMMSgWa8
         N18A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049759; x=1791654559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=kGXwDbnt5JZOORL9/GhuAxzRfqJpD0csnjMqyrr1Shru5Ar0II/ROvYZzNyPYvtPV6
         h1AC/owwCPmm2ETfE8uG2eWuyw3VsGZjZR9QUCWar6i7nrQldrei4y+WqDQv3O8WEt+C
         nEI5smt5bGg2RYC4JEeT0UP4ybOefe3p/D8BON3WhsSCdiknERpsb8OSOQDL3icQYX2v
         i/RV905MUgiztpCl2i+kZ7W1PHAmwIzXPngZB9bdVHJsck+FGdGa6zDLZfthUhWUEJ6b
         W0BYZggTzINsm4lzcnwBQTwJ5GS94P1I68JmmOKtkPqxxC+jVgewlEhm7xB5rAzKQW8F
         m9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049759; x=1791654559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=PdgwtxF3D/zC8hQ1UVRgpm+4AHZGSHczUmtu2/kkUA1npvUP0SzhzMbIj4EAVLPjdo
         aJSz4vtHVTY/P/w3kkmYxGVrOQrfpdz8VJ/ogdiKCA6EbXLRlmzcVkrE9PQ17MKv+TLC
         k0OE0h5QAyxM0edPugzXm6kKRHsrNUJNQYDckJcgwkLGH2DJxCM2XumA3CVV6O+tUttL
         0zIn6IBaToFR0tjqGUT7kcc/Ha3N4fsg7uXKek1x6PuQPH2/Lxotwqud05CzV5bUo2Pq
         +WrAGwYpfJdafvD+zVHU7rOKIaGHtTyEJdJYvXhSkedrVh5sRK1MwO3UogC36JNNJBvQ
         VuUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoi3721x/0AB9Ev2Mg2JSr2fY2bYGfcypkAFL2gVrK9+OhnrXay4MbC/e859X99+e+QJc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJwsXOzNnMMsZq9utaYs10ICoDaSfMKbnRpRO3q9X0knpOj/xmI
	2NbSCDjEp2OPQduVSVy7tWmARRvC8jwrwVwk3nidletDYn4bq+4C3ewOgiUVqnD7s3vNVW+eZ57
	VZmwEpNB8ll6QGQcFaNJmiDCq0FcpsUBK1jdU+gIT3w==
X-Gm-Gg: AYBFou1HZATLI7+ogCuPns5lEj3JWDcckffHKRXLs178gnALADlWpRVbecu1dTkjcWi
	SVgLmZ9FiBbdaPUlm7zRG+92hQIvxq1fUXqP3l2dLg435GcIUZxwres8oA9WG/nqu4hzCCN9lLX
	Pvu57bl/RLcJXM4n4MGvM4FPXVJCUQBGkcNCcuXBi/b1W3JNdE0PyzrRv1grwaZyAVFkev4v6H0
	U7ibxqK/+g7B0+a0zQsI/Fx45AkTCX8PiGbxEzA3em/PU7VwCh2QlCOP1/bV5n2IFzCi7E7wj2R
	6fNNqRBBdPY5WtVxn2HbSQG32LWN9MVLIpTA/sxi3HH/rvhHC/Wnzs3lrFc0sa0hcqkFIYzEK6/
	fIM0JfpFkz1WKkfjuuuV/WT2vyGsebnY0Imygi2Zz0Im0sxA9dNTm22rM8Mf3qXI3GiIfrd7e5I
	KdHSFUp6qv73Di3V31HalYJ7jeRmLl2SqRXYZajgk0
X-Received: by 2002:a17:907:3e8d:b0:c2e:7da8:f7b0 with SMTP id
 a640c23a62f3a-c2e7da94cddmr75113166b.30.1791049759013; Sat, 03 Oct 2026
 10:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:48:42 +0300
X-Gm-Features: AclHuK9Bi3Crqpp_pF3AiMgGWXYXjjoKWwAR4Jh6xG5aSPocrJMAmDcagVfOoRQ
Message-ID: <CAHp75Vfy7pbHaANK2pv6TSWctn9phVwby1vMjY7akeFPaKn2-A@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
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

> Replace the manual irq_domain_remove() error path with
> devm_add_action_or_reset(), so the IRQ domain is cleaned up
> automatically on both probe failure to eliminate the
> out_irqdomain_remove goto label.

...

> +       err =3D devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_=
remove, port->domain);
> +       if (err)
> +               goto out_bgio;
> +

We have devm_irq_domain_instantiate() and the respective wrappers.

...

>         /* gpio-mxc can be a generic irq chip */
>         err =3D mxc_gpio_init_gc(port, irq_base);
>         if (err < 0)
> -               goto out_irqdomain_remove;
> +               goto out_bgio;

This is simply wrong. No devm_*() call should be followed by goto.

--=20
With Best Regards,
Andy Shevchenko
