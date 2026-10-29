Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269385;
	b=YkdiqpZ/3H6427HlU2zfoBhMqgnj1V9wbOQw9dkwJ44HL2TM+p0k9tsUbSXhnvGguwjv
	 22utcRp4dAGmP62R1bpuC14TwXL4csTRlCSPKLjE1M1msMvfnOvFwEd1xljGldZ1vOUAP
	 rq4GVVLICh7r1IKufMXYfMxZmIsK8vGsf15c2N6VMhGcuUkJzFtlxHk4zgmKK4h2cWk4O
	 GKLKngALkYbFZW4iSWkVm8HSnsJqGLg3KLAHSdt7gMr+3WvaujVO/sNb0CR7fOLAXhmw3
	 ad1AxBZwtOjf2mxvO65XQ/ajYNDudhV4Xw9D2JmxA2LJc40W+BlyjhcM1INtE1bpHFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269385;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	b=twjdZCBmL2tpivXXrUUNoWEW451T7EZB4w/1GRXv87nAUfWew01s33RzY6weRlmH/iH+
	 SkoDe6aZlUQ59NJWVM52oab0KnszynTYcC4FkSpw1JNhnhk+HT0yqNLreKYe+VE8Pl+/R
	 pMX8Ub00a5XFiig2SXkYwph2jF0MeIvYBJ3Un/sEXTwPLcqsWUlMYxP2TwEucp/Q6dRIl
	 QcZjA9VoNwqE2bfPd5kuo5iaHpS+3TL1ZelNzuyf34uVba2ohM2CNxv6ZVZG7Q+cbaskY
	 3F4L76QNriJy3GxR1uamzMhC+LcTqgvthVHm8XFIsKhyt6Ks2m1dCLLtKENfrxQ7cyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kv/z32sT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8E606A31E
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kv/z32sT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D591F031E8
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269385;
	bh=Pm4shQIXu/YBtkkHvvK7yJLwXmgaG24l6vzhneZ0tVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kv/z32sTIuRqbDuFRY5H3/gUkbCHg5jcWqiz8ua+9UWdLO2gKpKI5eYNDiKVzDnBH
	 ZExWIGDrtF0J3w2Cr/3Hgh9ERZkziyUsoCnSyG4R25dGZ6ulKYCgd+uof/qCzzKbOr
	 9LtBWCjQ/zMEyjNHf2pj2SNostdFCF2nI6DPcrOxhIaBwpsatOZx/TCV2T0NdRK+MH
	 Rrw2Jot9G/ycktHUQxgUi/zXj8/bn1f5HWA6D4FmjciMu2GNZNBebOP6Ul9GnBx7Li
	 NdOeaxVlaRSFEjIK1Ih3aLpGEzSUYhbGSMfF6v0yaeZIIe0JO4LXSqMkpHWpLm/TCi
	 W08vCoO1bHcRg==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6faddda49e7so1658397eaf.3
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 03:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCYOUOP6q1IP2dv4qIbduNuvBnyK2pMtRkGGy6xOkWPeSWit+UAiMX4npSnqlhkozViwg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIcj0/M0XIjm0WSdVuUjzkZ5HNmq9+en36fy/sfQXbtXWrWRqF2
	1Xkz7ms5ekVOFQHDtW5uFkKVyaXGXU6fkR4wrk+feVB8vsuqO0BoSWIMXWvMdmCaQlvyJMfeaK2
	KAtRYbWCwjfWtf5GNbszdi0FQDGTUM2g=
X-Received: by 2002:a05:6820:1501:b0:6dd:3534:478f with SMTP id
 006d021491bc7-713f1f4f57dmr2819317eaf.73.1793269384310; Thu, 29 Oct 2026
 03:23:04 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 11:22:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
X-Gm-Features: AclHuK_F2FYCXxfvG5vSK3S2hpbujv-j-QBd2VPacOk9bLxQe1BEL834ojBgIss
Message-ID: <CAD++jLngEKZOQm6QK7BzMdCRqNj9-9Ui8JxP+yvCtOOvGFPWxA@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
