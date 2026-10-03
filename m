Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233E221FB4
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048982; cv=pass; b=lKmIP4CJVVI+PhiYD8ffu9EgxCRWpHPU/+DmNByH1gWCVgIpqh1wjmZ80uXyskVv8vF9jdQQwCRZr2pOwZhZyj9d8nHkwaLLydhCYmO8wcmUIKn+TOpl3+fiPdk9BkrtQKcTgHfWIF2YulmbUtMrEVNLmBh7fDeE8yg3a1If86c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048982; c=relaxed/simple;
	bh=AVGS2+zsEMRd39ALRXdLR1/q0pZdvoIhDfXKsnzunTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfmmDNmIlE4s80+WAcy6gTKCIRzftm4ruHAPnMYrq4F/g7SPIkZ5RlLd6IpkcX01BcABYHyXwY+8zITo012qtufwD4OEGtDjNuUprDrFaYuuU8V58ZHH14D2bWvVlfjxIRqiDUiZILlSEbiYherEa+n9ExyRTBAlpVOdffoSLu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkHYLyNu; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkHYLyNu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so96626666b.1
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791048977; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+5FKWgBC94Ts0Uq00lNLvcKsyJ+nabpG7EIzq6HBdhUQlewvgNKFUz62Qs3JQtlOd
         F8vHDBGuYH96Z4CfzEPqw3NaF9UNzNScC+W1rdpxVVlryLxWaecGi6UuaIsGPX6rQ89y
         sYB8DfymxPdD0m8Hlw43pFF2A4dOYWDmtI3/r0ik7cUnsdS9+B/gA5r0fCw/YNVdRg35
         v9GiPRU11t4p8PXSFFIpTwb1x9gwpzYPZRNdEZnQmE050F4+cmcXeqF1+23w13CB5j5q
         jOrflzg3bfUjstzIUpKzwFjuPmyeAlhKQfZtRCLSkGXHnlX/zbvHD8lxNopf8SzT2vXF
         U+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        fh=UUuOkkt5fKRcUZYzfV6xcJeERG85+yxqrhCHN6mcOp4=;
        b=ae21gm1nTAmJfAyb+XrBswStXFHPlOViABjJGZXt524PiQrMo1CiVkGEgn2NcvfitY
         VUz55fZ84aTml0VkIoWn8125QVjqtrARFOrLdRn8dE8kC4rohA3VIdM2JkqBwRy04p+a
         oWZPtliDMPlWhHfA3rZHBaDrQCoaL2MyDqgMD8yS3Hh785QaIU6bo1aHJOTaGNXa9Pbx
         Lk0Otd3K3Xyfh3gHL1BpHsuzvB1oZ0bAVEHcKG0aDUkhqP32YMTe5dEDxLgLFo4ye3UU
         LkkvNWtQ3+hXbNnDDK2/7aecibci8vW+3oBonQNO+CRvirI3DMTCwpAKAScWzbnb6Iix
         y+kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048977; x=1791653777; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=CkHYLyNuLlSFkUqrWpcfxlng4M5hTQH+fZsoxzw2dWK0TRyRQeSPyl5Yx275tmm0XS
         DGVHE+PmK/+gdPdpHLj7n/uZLGw3OZAN5DGWrJ+04EwfIp82Gm9WMV+hhD/+kOJUlu3r
         l9aG9YYjXCM6gk0MlCtDHZ9A8TLDD3Yy80Q4l17fD+Or2KsHAplr7L1HijmDBCM7Hpk9
         R+S7E5sLItBfw2O0ZclDpX8ucEJtBqoCvfJvFYqTaXAadv6aZAsg/pxcWj7x3F8kSxY3
         UF/i2GXoMTkLy7lcOy6QLVgrzJASXCN2M0sxZRlO+glfVamnBEcD77CKOGxqUvtMijEz
         7e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048977; x=1791653777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=0CcEiDi87ZC3LMT7rKiDwKQ1PJuSPt/cXB11ZUHuDfqtIzRCf6IfW4SHvt/Ag8h2CJ
         X2Qk1UFckJcVSmsrcwmJ09N9WAREYwXAsKHndw7bX+jQqMX+OCi+iRwpA7V3lHM9mAzS
         pE6Fwnl8VM9vCtn5/whpi37E9PuI2xQHC+T+DwY33TZczhgvz4bK/WPdbMkFrNbJmLOb
         AQ3NrA+bSycGi6YIGsGVe9anH3y947k8zhCE7CUrZ/1wwpjjLxJoz+ur3pzy7aceiP9r
         4tWGAot2rSSJgpOoVETUu0ZnWn27xtdm2YdLKuCeo75BJSOJbHdh4j6J3klMi7OjjYLl
         UQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHNBJ/Sm/hHfYB649J0g1JOcZ556Nhe9HoIqwlSh1jaCt15U+VkQE6whE5PdsuojyQvnY=@lists.linux.dev
X-Gm-Message-State: AFuF++mWvzsZWTrTZcwZ4a7kB6C505QxVJlELcGqUmyS+7gFwRRuB50e
	W9+V9lZcIo6N5Q9UIyZUqvAHmWA1ppb65AX43EupPpW9xQ5DfIWcL5n73zBsXq1p5IXxsl9IuAQ
	JllZYIxDZHINcCj2heOsbmdcYFP47OqI=
X-Gm-Gg: AYBFou2TqUL3QrWj5GWVb6yvWhI2g9GDTK6kyG7tDrPP1770fEJop6EPc0Q5mwHqjXG
	4VrFaa2evoHzJcxF0ine+OSxshFeybB2nfeMphbkaKqdQpbEdgQbdIb0dFgpYsai2ZItwC6ls91
	0sn/WivVquZwUgkEQ548kH+astn9i+lM8Focg7rZ+cZ6Hu6iLIbSu1fowqNVx7bLBC5avwy/m63
	wk3iUN6Bf8iNnxAK27jC1F8XHYqf4LmtMJPUHnhB0gJHCMRZxwmu9ou3RNQRjzsvCYgTCA+DgBa
	TjBW9IIS243e+nsxUiZLElDzw9mlfRWmxqytbMAZtvutprUi8/Hrej1yQDFjyh13+UhFdqbZMxE
	7M6iW+etFmHAOTxRYRAqQD8fDvS5/Scv9Agh/eOlX4USYskLPW6ubE7fdK6ik64CJCU7JWndzdE
	FYV7WQktAQRmpidh41Y3wyPrEFy6vjjEbBI/LEfPKx
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id
 a640c23a62f3a-c2e6e7ce8femr227244866b.0.1791048976875; Sat, 03 Oct 2026
 10:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:35:40 +0300
X-Gm-Features: AclHuK9bpapDMgc469XMoVwaBwPajoR_JzR60Owqy_i8pAhthfGXkoi2ZLHq1Yw
Message-ID: <CAHp75VdWQZSsign6YBM34UAtis=Jj5ENqKcNzkhW4vS=v-bqmw@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
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

> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps (gpio_generic_chip_ini=
t,
> devm_gpiochip_add_data, irq_domain_create_legacy, or mxc_gpio_init_gc)

We refer to the functions as func(), like you have done above, but here...
(No need to resend just for this.)

> fail, the error paths never unregister the chained handler, leaving a
> dangling handler that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.

--=20
With Best Regards,
Andy Shevchenko
