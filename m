Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6241D624
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377503; cv=none; b=q6V31dpm+9JIh4JTGBzM05MskcNCPwD+1DwbnN6XD+7puVre2PVWDH0JtzdQmEbwyRFdk3KZlNgYFgYNvLsqYZXzqY87o0E+DmIqsJ3gXwB07/1MjRjN99IguXbwbWRDiWZFNjKZrXsDy19aFCcFrtA9ce6muxhiAR55y7shKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377503; c=relaxed/simple;
	bh=y+XthYpwJa0ncDZ+rJaH7UIirjA9bghrnQc1+p4y9tI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwQaYfsmA7/ZCRS0aeyjda6r6GQNReKdyCrKa5kvoAOfwEBEVQ1eda5bSLogYFqVBldnJQ0XzNPPJJ3zG34di1vnnH8+zTa8pF6sdyUvgAacbm5Cs6Z04sjQkfzFIPV53ukiuR+0DGyryDrsYYsov7q+CGjC/scO+hMEkCMIjkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huqoo2Wb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huqoo2Wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A44C1F000FF;
	Mon, 14 Sep 2026 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377501;
	bh=2YL3MC718vW3UHSqqFd9vlO0hJLQr7pBGsPwZmNxl1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huqoo2WbDiUJYDQVo7Wm4fXnki0m2SpndKb8grWRqQSLwBTFm9AvswKt+WtJOP2SL
	 j1IRgTmAJqAKf6E1oxfRoG0duwel/UV2eAsgp1gdainZ6ZE47RXhc7vX5sQlUYEibE
	 NX2008x6hLliHdgOIkkWwLLuW4xU28bgU0+yJrnFq7Hl5nAGOefKLYs7BDbW0jvnKJ
	 caasLViCVdlXtjweMeja9Nm1KiXNmjOYYPQMAuU3/iQvINiP+1/AaNn3Kxf9Rk6cZu
	 05btP8NjnF1PWS4J8cHqyboN2MwaXwtnCg9E8dpYqDEPXooMUveuL6Okz2UOYF1Yux
	 Qobs0TcB1Cc+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: release clocks on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260914090718.1666333-1-lgs201920130244@gmail.com>
References: <20260914090718.1666333-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:18:20 +0000
Message-Id: <20260914091821.4A44C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Manually disabling hardware clocks while the devm-managed interrup=
t is still active creates a race condition leading to a system crash on spu=
rious interrupts.
- [Medium] Ignored return value of pm_runtime_get_sync() leads to unbalance=
d clock disable and reference count underflow if device resume fails.

Pre-existing issues:
- [High] ISR unconditionally accesses hardware registers without ensuring t=
he device is runtime active.
--

commit aa70bea937f841715508dc37222d676d4d04042f
Author: Guangshuo Li <lgs201920130244@gmail.com>
i2c: imx-lpi2c: release clocks on remove

This commit modifies lpi2c_imx_remove() to resume the device before disabli=
ng
runtime PM, ensuring the clocks are in a known enabled and prepared state. =
It
then drops the temporary runtime PM reference and explicitly disables and
unprepares the clocks during final teardown.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 49aabef7f115c..7f4bc98325853 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1613,8 +1613,13 @@ static void lpi2c_imx_remove(struct platform_devic=
e *pdev)
> =20
>  	i2c_del_adapter(&lpi2c_imx->adapter);
> =20
> +	pm_runtime_get_sync(&pdev->dev);

[Severity: Medium]
If this fails and returns a negative error code, is it safe to proceed? The
clocks would remain disabled, which might cause an enable count underflow
when clk_bulk_disable_unprepare() is unconditionally called later in this
function.

>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +
> +	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);

[Severity: High]
Does disabling the clocks here create a race condition with the devm managed
interrupt? Because the interrupt handler was registered with
devm_request_irq(), it is only automatically freed after lpi2c_imx_remove()
returns. If a spurious or delayed interrupt fires during this window,
lpi2c_imx_isr() will attempt to read hardware registers with clocks disable=
d,
which can cause a fatal system crash.

[Severity: High]
This is a pre-existing issue, but does lpi2c_imx_isr() also need to check if
the device is runtime active? The ISR unconditionally reads hardware regist=
ers:

drivers/i2c/busses/i2c-imx-lpi2c.c:lpi2c_imx_isr() {
    ...
    u32 scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
    ...
}

If the device is suspended and a spurious interrupt fires, this could also
lead to a system crash. Should the ISR use pm_runtime_get_if_active()
before accessing hardware registers?

> +	pm_runtime_set_suspended(&pdev->dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914090718.1666=
333-1-lgs201920130244@gmail.com?part=3D1
