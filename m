Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236A25B085
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493837; cv=none; b=lbY5huehGaLjmXv/YEo7vpFWxOlk+G5LZ3YENas5I6l5vc4KmToP3ULt9MCffyCCbfZfxkuAZ2/I6SC8/WRzWC+yv2JUI98vRQGQ8MCLAfXAuoXZKqaQh0Qm+VhhCY8FcH3z1QEjPunq1tX++HjLsQI42KhOdkDe0FyAt0YXbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493837; c=relaxed/simple;
	bh=R81k2TNh3WkhVU5nwmQETsxU3ilSRRjjrvLutK6/H98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UPs0uoiCNEEsf+5TcwG+0PoaQTDh8lwUO116nEEaOtJuCPMMhBZvDTCOsKkOSfxh9KkZxyF3+pu+AWiG5Nt85PaeSChR/UYZbdbpVSRcZKYY1xb3UW/v2CjVEzS1Ig8eHF8cTKPiZkoGe1bgTgo1KC4YaCJ2tVVXCLchqxIkPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIvjurJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIvjurJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22571F00898;
	Wed,  3 Jun 2026 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493836;
	bh=L+/77bCz5KJ2/qDJWvMg0jzhXLqkWWC3wNqmbyICwVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BIvjurJ9vYPxRMmIhRwtxRvI9VjE7B32QBe9cECu03ZJGF63COlPH+1gpLUszEQ80
	 Et5YTAAp/3xtHpOfQVBCB36MJA6/5ifLil+PVb/qEpRquA+jLplUj0+QyozBZdMPys
	 RNnttHLfQymlKYkKl36nTNt2ob8+k9gHLBiD60xGY0CNSTl/a/Y9Yim0T93uUeorsy
	 6Kotq6jIJHIn9N+9k0PUsqZXyQXg6hwF7QPwScqCNqqyC8ReLlH/Rltnq/JI0dOMUt
	 m3b8OQT/RCCyDyZZyi2Gfskvd0GtMjV8jdUoYOxxbIzhuZ5GepwXo0Cc2JvlnhjDvP
	 eTSjnYtzxF6Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] mailbox: imx: use devm_of_platform_populate()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:37:15 +0000
Message-Id: <20260603133715.D22571F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced clk_disable_unprepare() on the error path for devm_mbox=
_controller_register() causes a double clock disable.
--

commit 217e9aa29dddb1723c211e93d96e446d0ea504a7
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: use devm_of_platform_populate()

The driver uses of_platform_populate() but does not remove the added
devices on removal, which can lead to duplicate devices upon module reload.
This commit switches to devm_of_platform_populate() to ensure populated
devices are removed when the parent device is removed.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 24cf704b4f9bd..1dda1437b87f6 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -983,7 +983,7 @@ static int imx_mu_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto disable_clk;

[Severity: High]
Does this error path trigger a double clock disable?

Looking at imx_mu_probe(), the clock is explicitly disabled before
devm_mbox_controller_register() is called:

	clk_disable_unprepare(priv->clk);

	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
	if (ret)
		goto disable_clk;

If the registration fails, we jump to the disable_clk label which
unconditionally calls clk_disable_unprepare(priv->clk) a second time:

disable_clk:
	clk_disable_unprepare(priv->clk);
	return ret;

Can this imbalanced clock disable cause a framework warning and potentially
break shared clocks used by other devices?

This regression was introduced by the PM runtime refactoring earlier in the
series and remains unfixed.

> =20
> -	of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	devm_of_platform_populate(dev);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D3
