Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DB1E49F
	for <imx@lists.linux.dev>; Fri, 22 May 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435655; cv=none; b=fpJ41KDIaI9gSp+L+pgIK72rRwFFxpK0pcZW+rugKVFu6Qu6TK6TCOi58jMPhmBQXjNWkcURQtA6+5xaHED475U1esExN7Os3FBgz3GSJpDt6RIOAJbTMNl57avQ35cFjNKLP8bFtVLuj7KWcH/yQ75/iyJQ4ZdnwszLKzRQ9B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435655; c=relaxed/simple;
	bh=fInRgumXU23fTc9x1pvOQTjgaG8bSVhqndWI/ytCa+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4SNK3mMvsk0tL1djvvsHC86dYxUgbEWhzUnUBKoKP2n0Fvvsj6N+SbuwkjkAj0L9ScYXuqEvKqiQewVwJqQIVGRke36UBarLbl6oMKqJUMa0QzGxG+BK2IT9FEzVTx+0zJi0JgXe8mYnvGZ49kxg1I61LeRtLhrQ2uz57hrd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvpohnV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvpohnV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF901F000E9;
	Fri, 22 May 2026 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779435653;
	bh=lgwDcXVrXn5cBCRt7jhj15mk9UrpTHeFcfAhcTT6CP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvpohnV8dnqUPSKuA3ejWcYpm8hoWJ8BWu4u2bT9thEfmTKcsjkpjID9yuCnNQjrw
	 lTeAq3t2gRUVHS8CiTNS4Wavl3RB4MqSnwwLRmIXa5oXEBjTQ4gF0EGyrnIPx33MnX
	 lszoi1F5xDlSDtyYB6FEVjLY+mN4iNP30cqGHfJzYMaBsXuOh8B6Nq6fRKhs3dyiI7
	 A3vGEqgqVV9OfHcstIJGJh0HT1U/Q/c9/4m6AVD4a2R7nzjaC8CiTfwItjyq8knRRn
	 gshXL1dP+qyis7+XsrvXtaHCFn22inPP0ebuFFpTzD6uEIAxfZpCWvBgw0f33XFafG
	 7k9lu3TKlmw3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: mxc: use BIT() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522070118.800671-2-alexander.stein@ew.tq-group.com>
References: <20260522070118.800671-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:40:53 +0000
Message-Id: <20260522074053.7AF901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value from `enable_irq_wake()` leads to permanent=
ly corrupted wakeup state.
- [High] Missing locking causes a data race on the shared `port->wakeup_pad=
s` state.
--

commit bd0f86527c727096d8a5aca0060d7d08ddaeda28
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

gpio: mxc: use BIT() macro

This commit updates the gpio-mxc driver to use the BIT() macro instead of
open-coding bit shifts.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c

[ ... ]

> @@ -330,13 +330,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u3=
2 enable)
>  			ret =3D enable_irq_wake(port->irq_high);
>  		else
>  			ret =3D enable_irq_wake(port->irq);
> -		port->wakeup_pads |=3D (1 << gpio_idx);
> +		port->wakeup_pads |=3D BIT(gpio_idx);

[Severity: High]
This is a pre-existing issue, but does this function properly handle
failures from enable_irq_wake()?

It appears that port->wakeup_pads is modified before validating the return
value of enable_irq_wake() or disable_irq_wake(). If enable_irq_wake() fails
(for instance, if the parent IRQ does not support wakeup), the bit remains
erroneously set.

The irq subsystem core reacts to the failure by leaving the child IRQ's
wake_depth at 0. As a result, subsequent calls to disable_irq_wake() by the
driver will be ignored (triggering an unbalanced irq wake disable warning)
and will never invoke gpio_set_wake_irq() to clear the bit. This causes the
bit to become permanently stuck.=20

During system suspend, mxc_gpio_noirq_suspend() could then erroneously
program the SCU to enable pad wakeup for this pin, leading to unintended
system wakeups.

[Severity: High]
This is also a pre-existing issue, but is there a data race when modifying
port->wakeup_pads?

This callback is invoked by irq_set_irq_wake(), which only holds the
desc->lock of the specific child IRQ (the individual GPIO pin). It does not
seem to hold the shared GPIO chip's gc->lock.

Since port->wakeup_pads tracks the wakeup state of all 32 pins on the
port, if multiple drivers concurrently configure wakeup for different pins =
on
the same port, they would hold independent child locks and concurrently
modify port->wakeup_pads. Could this lead to lost updates, potentially
resulting in the system failing to wake up from suspend?

>  	} else {
>  		if (port->irq_high && (gpio_idx >=3D 16))
>  			ret =3D disable_irq_wake(port->irq_high);
>  		else
>  			ret =3D disable_irq_wake(port->irq);
> -		port->wakeup_pads &=3D ~(1 << gpio_idx);
> +		port->wakeup_pads &=3D ~BIT(gpio_idx);
>  	}
> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522070118.8006=
71-1-alexander.stein@ew.tq-group.com?part=3D2
