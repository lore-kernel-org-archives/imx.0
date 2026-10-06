Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC633C4B79
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275816; cv=pass; b=qI9QmOnqFKgOre7H0mdGMzcNjhzFg56dzUH+iPww/Ax7xnhJ0EXvk4NGDdVUV89ZS8VuugvhQd1w7UVvGIVj772Z9Sd1q+fxtpIohcvM8Nizxe32qYff7PKq56BKomZvAiNL2xLm8zalrMo6FLmhoZnlsfsF0vkj6T+ch2hc4/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275816; c=relaxed/simple;
	bh=QLEBVnIW+aFeWqP804aoo9rQfAzOmPivw26f4x4A/wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqmG5HIdJretPZVXEHA4Vffyly5bf1mEpg+Rna9W7nJMR38lg/Lg/pxtCGNXpAXKDZdCebmCNs+Wopl9jsoCtTWHjX5+9MBQMzXt5vfZIVl+7rDhjYGLVvBOA7OKV0J5K4uFN3GCEe1dLaUtleefwqZASd8GqQlwGCbE006F20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVHUuuud; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVHUuuud"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c315869241fso201536266b.0
        for <imx@lists.linux.dev>; Tue, 06 Oct 2026 01:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275813; cv=none;
        d=google.com; s=arc-20260327;
        b=qwjF0rjacAxWVhCWqCY/iHYmNIiM2vxtnbxPBxrMpFl5AIjnNOCRAz03godJ0rC34A
         aToRutQOdVPnfptCVgW4M1k8esQVSGSCnk6OvsAKKDBQ9RpTg8ck7/0VGgP1aEmhW1gj
         +3QLrznCuKLqkeBp++et8MVXGbf5TFTJBCp77EwaOlpjcKXwEAFLGV4iAjnUdpIEjiJD
         9MjppCscMnD06gp5jN5KIkh9StSkP7MP7AXu5/gg/y8zesXBzInTt1dioGCsXG9m3W1n
         EeSoWpwnQTuDdC27+RAoWlhvreikDS6/y7VgrvKe/OaItyEZDbycM9kBIyV79iWoi3rM
         mutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        fh=knVr57QjCNeqsA1U9AZI1+8bKfB2rH/tUyogThv1tN4=;
        b=at+AmcEFZc7hq2zbQd+wiY0iHTGqUOA0tBhSXiUVPYGs5VekTQauslPsrMxx9lzWuf
         vCNS47lxhgxcOv2bSExQtSfF0IuUm4PqYJZ4dsKIsp0P1WJRqt/nSTSvGPvfF9CCQg+v
         HJUtgpsgzKyXP9Hp5z2FUE67So4T5fvVSrxcmofhGRtpGG+ua2Rl1PZv9II12kS/e8x/
         /EKjTPOsLZJ6tgwpXBxKbJivLJ7jBMo+/0fgY63hBWU+PGowCgs4g1JkqpPaBBXTnoOG
         rz68Fr8J/X4cwwxmkPVClUQ1tDKpO1wvLgk5uPHSrg2BZeY6QmhttaYPaQndzksiNgOZ
         gIuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275813; x=1791880613; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=UVHUuuudrvYe5bcwl5+aC8OxtdhPzrLUGI40DHZvcNJEO4WjS2SR+WdIQ2jIjD5hYx
         T2oWfJ+zicqO0yGMb50X/+hFW77Q58tE2ffrSK30ru5eE6wO1dzSGh24PtOkq98+s1yV
         vyAeqocCYEknGPItRgMsv4x/M/cxHcQep5avFPa9IJ3EGQ61voVi2iCNZoIHWYnunbuT
         nrEDPHUOLFqpTRl0bZXcUEQppzaNUCy1NwWRtUQ9lVNWaTmuIivwigj06/7l5flo6V8u
         4R18JSVrLiqP9gEZL0+RVc0lBiFOOllCqM9cQ0F7fQL4y5ParVbV+N2cUiRLFubi1Q8R
         HOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275813; x=1791880613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPUBVtwXpkjB73xJy9d9sGCYrAAokkcesa5s+T0NIQc=;
        b=Gu+slcGIc65XJb2MKkkNMQQZr6u1p+pWFIhlFnvhMWsylw/0gi0FQPk+2Pe7/9CVvM
         z+xgiLDOK10LcvMza+rn6jOI6HY7zNsJjqQiy2OJ1rXRAAIzfCO2v2BloWfS5CkFOSqK
         /ktsPBVKRgfPGJFpmfhgUFeLnCnUdYpITnj+rHfL3H1Yh/cSfz1Ngpd3Ac9MYT2iLTLh
         kbKP4M+1mImRiOPzAejoAYxQ4nrZEqiB6mgTXMnQyqFxDwe2TywfH+D1ZpEYGS4hrGXL
         r8juOLSBwdCo2tomhiwpYof0M1yINLNa+qPPrAAQE6mwb08eZQQ1HxQ8fay/iSkJHL33
         3eIg==
X-Forwarded-Encrypted: i=1; AKwUvBw6rSSswgqYYr3rT2vDoPJ5tgB4IwPumWMwQlTM1S2p17FwCvf6qRep2/aq3j+Q4eCtoWY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbHdIWzR1JPEMGBmSsrsvUG+sgTYEXRAt3pNTRWCMVKQNOCxNy
	ltlHsHw5vipyx8YVBTQJsYMQ8b4inRPSBu3R+NBU4yoWeahKhob1M2OTsynPEwmT9gTuqV7ArX7
	DPxQ4SYnNtw8x7XF0bgoUYDP8oupfias=
X-Gm-Gg: AYBFou3AzKX7aT0tocCmG53G0vBmv8Kcx+xBYTynaEuPcD63QDa1D6EiydqZRQOsB2l
	P03Nr6OG+oQyPPYQACCqKtegg/e6P1a0WSQt9go+cUPyZ238corY+8/W4thzge+Q9BjjvF6E+R4
	mOY8rqYb/sxmWkg+aOgtBrly+yHU1vL8cnU7ows4qEinxRgLLR0zuoCH3p0TR0W/lnJK5gy5flm
	ggsmX1nV3YLSbSy8Ft2RpI/QvNHw8X5Hq80CFvc82rrUr6F1wkZz3Ctismlln1AoPXhFWSUWWfE
	DDSsaPm+3B4T9deXrFaG7EYj2/ktnDm+epIU7PJJoaWfQ9IhHftmW9dg0smbt+8ER8n/IjSqq5k
	Ty67JHsKfoYngMjJX17BY3Cze73j5fqfRRuF4BpoPsmMYpv4ruudN2womj/7y23CxccLLutCcRL
	dNnwUBX5BxLqbkywN6Ro2Ig+THLb5QU7pmJ0d9Rg==
X-Received: by 2002:a17:907:72d2:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c2e6edd8780mr930969566b.8.1791275812937; Tue, 06 Oct 2026
 01:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Oct 2026 11:36:15 +0300
X-Gm-Features: AclHuK8Hq92bjRrFR2TwWslr-iyvEz8Se8OVWpb4AqiThf6eR9JzszKQNdfvLEQ
Message-ID: <CAHp75Ve+p6TMr7MwQw0orGdjxLgNBN8gfTw2SY+EKBBgCyYXgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:24=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so need to use atomic bitops when modifying wakeup_pads.

so we need

> Since wakeup_pads is u32 but assign_bit() operate on unsigned long

operates

> pointers.

This sentence doesn't sound like it's finished.

> On 64-bit platforms this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
> Change wakeup_pads to unsigned long and reorder to avoid the overlap.
>
> And the enable/disable path unconditionally sets/clears the wakeup_pads
> bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
> the bit on success.
>
> While at here, simplify the logic by consolidating into a single
> irq_set_irq_wake() call based on the enable parameter.

...

> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);
>

This blank line may be removed.

> -       return ret;
> +       if (ret)
> +               return ret;

...

> -       for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> -                       type =3D port->pad_type[i];
> -                       if (enable)
> -                               config =3D pad_type_map[type];
> -                       else
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -
> -                       if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FAL=
L_EDGE) {
> -                               dev_warn_once(port->dev,
> -                                             "No falling-edge support fo=
r wakeup on i.MX8QM\n");
> -                               config =3D IMX_SCU_WAKEUP_OFF;
> -                       }
> +       for_each_set_bit(i, &port->wakeup_pads, 32) {

This change can be done later, can it?
(I mean in a separate patch)

> +               type =3D port->pad_type[i];
> +               if (enable)
> +                       config =3D pad_type_map[type];
> +               else
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>
> -                       ret |=3D mxc_gpio_generic_config(port, i, config)=
;
> +               if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) =
{
> +                       dev_warn_once(port->dev,
> +                                     "No falling-edge support for wakeup=
 on i.MX8QM\n");
> +                       config =3D IMX_SCU_WAKEUP_OFF;
>                 }
> +
> +               ret |=3D mxc_gpio_generic_config(port, i, config);
>         }

--=20
With Best Regards,
Andy Shevchenko
