Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B923F1ABB
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887676; cv=pass; b=K+qzjhnPjpPGtR22/2aa3t8WmbMRsrJCrvyWiXu3k35QWXlXr4dJZ1v4YfCk6V2GqMnIT7O0Z+v9eItzEY1GRNivBq0eqEIwkaEMSnzp40s5IEP4bLX39yUbqqb+BWAQJWYXwDOTIwa+dV6tr3ACaB8hH2YhSt0WDOS/6TH/N7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887676; c=relaxed/simple;
	bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xygv7pxXVini8iQOPA+3Jzn6dii8ANTgoTRUJ19UZQ0wpoegXxCtawB5I+uFJmNZOKQdkCdW2XOxzVQp7pa7MD90uTn+001QM7AhQJS/uilB29KK1KJNAhs2DWakpKS5oClU9avcq8jxFhOZFjwCIqpkGdj5LhT3B/U9rmujT8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCKaTpIr; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCKaTpIr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e5d08214dso363869766b.1
        for <imx@lists.linux.dev>; Tue, 13 Oct 2026 03:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887673; cv=none;
        d=google.com; s=arc-20260327;
        b=moTyPPCn+dMaMaqxA3CcKnsNlz6OF8cSdmYX3HwjCR4oKGl9b4UEpuXIMhZt5HzYWh
         NDba8onwZiQwSShszdXb1DDdj4IUUvow5+WqiL8XT1EUodztpR7FrCrE1VJIjsolW0PY
         WjS+3sMT6Ps2+Nayl4d0g9DCvYvExH72GiBbzf4YuN5Ivq0QTSb7tLFtEJwY9aMrhHTa
         e9w0pzu8wAYJQRx8YQMnkr9JCeeZxzwB+ob4Lc8xnHuZz/JKyTnIwRVcjTPpstNw7RcB
         0fgXI4EKScvBpdCRg6eIdjJu7sNX9lMztVP09B8ksPrnTUWaxCMgLms1N/tod6Xf60Jw
         wdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        fh=G07FDY0RcjywTLJAVngJtcw0a+UZI7w91iQlCPa6GtQ=;
        b=FBfIE5kF8Ry5gk3sulzuDQXSKcSYYGVgyAQg1q+53p4S+ruwkeCnLodqVgO0MUC3m5
         JgMOifeGeOxJWQ8pD+1Ja29lAEy+VOZ4OzezATioV3zLtt34uJMHRxT6wxkgENs78taw
         b7fISk+8YGwWuSnaKZUPX8bYl3W51OOJBHieV4msr+WnwHnixTPx5EB1r7oRSUAt7R8y
         h3U07lIOtNl34uWAR1mUIMsesH/awpsrh5Lnuv9eQ7qkcp0Y6u+kBbjyunol4rvx9bEa
         EYzrSqrJz+YMVSFIG7LLZDMs5zxUQPltO5WzvSKxUqIvWvZTKGviOwxm1hc8TkfoVgyz
         HQGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887673; x=1792492473; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=mCKaTpIrUHH5IufIFv6h9slRAjf/jCzJVZ31s9I58cxKRlvHSuNia6fE4k7Gs9yVxS
         rV1lKaVpIa+Sm7SjoxjgKVCQElItFPCLv4YBD1XyceDyAZ6kgGohAjEiQYL4HNzUoRRX
         sTqtvikKaRUgZqr99Fr7T5gQEn5CHvjJlaOvsAW/zxa4Rv5TA1LxrOem15TbJMyExcRV
         R+Y+pHHQSZHXUrHneAaZC26mGe6b/lXetkUYm7na+GXzeWepbbbJeZ4HQYDVdDhSsGLl
         zevN4qyehnkJSjfMSWfM9qtqgEUFeMuvzgjZPKHMeZeGdlqVUhSoIolK0agjF7cZQT9a
         uG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887673; x=1792492473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=ITGeEKlJ/4bpJpXHvZz0rmIU0iqqKWM/vaSko2cO3BE9X7a12jfp2JLAt/dU5qMaOG
         lPCPxaaEkYwflAI5w4qVezE8+SEL+coZE0p2dIvdmqTeP3PGM1/8jm7cdOJaX6DrJ0yL
         xvP4nGAMUuzsV98qXjhJB+RtlqviB5+N8VuX0XThwxZKQW1ETQ6E2AMnUFbegSKyUiWQ
         YWO9IxhOtFMf7f8X0BdU3fIoCDyYZLwCdzFgJChxe/hIzzDaAiYwrKGcva0ljj/Topaw
         2v2Pl1wQCT+Khja1SIXK1oZbZ5AsdihsNdHCLjmiIKFUWOQCOSxvvf1o2xnsSy2NS2OB
         tdjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwugrsRhxgXtncjM99hYncqT/bP33X2BIdJjjdiIepnwKptrCNs+jd4ldDJt0MAd7CL39w=@lists.linux.dev
X-Gm-Message-State: AFq9FYI3twTw9EukwOuvv03vmjyR0zwEP6uV/9QE0d0h6jNc8ov/imjY
	/Zut8R7EiGDPGJr2g4L+HXXs+AEt0LyBZT8qvWLanQPIxJr1WmtlSklyz4f59Ekrg/57SgK4SnF
	KdKPFikDIRBRIwfwQfwEpGNdnJcjmBG4=
X-Gm-Gg: AYBFou1RlXJEOB8Pn6zYdTOMjE0uGJiiZVu1p15dAI9KEvZi5/hI29ZbWEqZQTrrJHq
	+DSpI2osts6GEWC3fLBrXDaP9q0xZPi8kQIysJuTSZ+xstJk3n5Tm2IFULORMPT4hKlUGWKhkSN
	fO6KCylmNJ/nhYivR/odAE6HTYRegsN+Bp+Pk5pZciDP5BjSi0ycPhFg+ofWb1BzsN55IqkyiAM
	hh5ApNkjpHDoe6r7TYRvfBGiMMSk+0cTkLz7Qa4hXTy6t4Xr67eHIMoh8P3KBoGvNs0ZzkBTHTx
	mcADPVDQlz6YfZeM/kKs6a8yqB4htsLydyObuZHG1HbvzKm7XWKfrjJNHr2LFd+hQu5KGUJkaLF
	IewjmyhoyreORbHc/Ku3QKhDUUWgwTN1bPZIR5oSXhBrhtpOJErCQApQdlRN26kpSe0qB19wbGL
	PEgDLyrG9+gSSrVCehEUWTQU/Rt7Z1DPejl2oWeL+o/uQEJw1v1bI=
X-Received: by 2002:a17:906:6206:b0:c2e:7da9:6e6 with SMTP id
 a640c23a62f3a-c31a9b0b9bcmr1021852966b.11.1791887672983; Tue, 13 Oct 2026
 03:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:33:55 +0300
X-Gm-Features: AclHuK_kuegeo_16KZLM0-Cx7ehUYRa3QfvyF2aUqaBfecJPa1rxTPSqFEfgNHU
Message-ID: <CAHp75Ve6KduhGHyaNDBM9MqjQV4dTzOz-_1o2Zieq0EKyCtiSQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)

for_each_set_bit()

> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.
>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko
