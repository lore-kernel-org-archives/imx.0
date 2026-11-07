Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050345;
	b=uR7+652v70IjiSv04/iCgMyOMdACDzThcNxoNOYGIRiOHtzrFpz7jaM8GkEX9ibkNTE9
	 8HTzuvHlWNk9a0oHqtr9V6dJFJpYmdpzUgjn7WljAFLkpTs3gCtuo6oSThKU0pPRa4P0G
	 R8vlwhSOyHYuxJYhwa1uXNNuo3osqP5oaEdZ4mb9msXkvVz1DR1FYASaUINqbRFcGVllo
	 lWqwraazA1x4+1NSsOredyOBXNQfY61rbYHb77YCGxtglwkgDsqQ0MS0YkjhTCI4A/w5Z
	 uUg8xWiyvCTRTOdF9lhiTqaGasY/CLgcidNJDuchkEJ4oZDNE12J5Mrn0s8t4gofjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050345;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YtuVTWGrUP1mDeFWkKsdD7n1oo4E0Md9WL8rq3QNzDw=;
	b=EWGpeNDEVw8tofxvhUKvYwCcmOKbJzBNNTCWZB7PsdG6JcnMn4RAf5X1rsdDaQVa5u5u
	 4Tb1Rkdvm/Cn/8a/Cf9rFCZOP6pfUFJAVVWmkwciBsPQ3pf7WxGOogq5/DI3W8rJl9wr4
	 KaSGQYhrjgG3yj4epvBtRvgdtv9dMrBI+WYcUGhLmq+sW7DYpY5QYmmUvuFa8VySB3vcH
	 hO2Vm7/C+L/chLd4bEhD174QmfbfjG6L3KLCtPuM5756vkSoQ5Y94jsdMyfNoSIwNxQ7T
	 rQJ+mYL31rnQP/Q3+Ayh3uEEN3XQODuWOIVLhM8aAsFB6YhhXyZZBjhYoHuFRSAlB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDa1R07u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6EC606A330
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDa1R07u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2F1F008A1;
	Sat,  7 Nov 2026 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050344;
	bh=YtuVTWGrUP1mDeFWkKsdD7n1oo4E0Md9WL8rq3QNzDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDa1R07upVN99xpilu4mcTy9ZfSK52clOKpT1Jvehmetm10M0Vo5aUoXv12IjaHfb
	 nnB+dEjiuB9lOs/OvEt8tFkmdjCg51ZMCvI65X4XWYGJQvQoNuMZSpIcoim4ExspHc
	 eqx+IaMOCJM+8R3fXE/YhVUtyYdB9Bf6okr46NzH3Ek1bWexW8PNeq4qs0urrOnTy2
	 ZSS0CjFQr0HsEG2gJD5kO9J9rieb+JVaNA9xOe/jYioTatl3kKtJSMQTpnb5TDT+0U
	 MYJiXZHMhjwydsY752pem98Lv8/Ahkt7iDittjN+4lWh2TTIUA4DZhCSBvqksb9EX5
	 Nd4qbVIcMIo6A==
Message-ID: <sashiko-outbox-202850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:19:04 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] i3c: master: svc: clock and pinctrl leak in
  svc_i3c_master_remove()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] i3c: master: svc: broken probe deferral in
  svc_i3c_master_probe() [1]
--

commit bd316ea905bc7cd25e557b9e7ceaaf86534b31c5
Author: Joshua Crofts <crofts@kernel.org>

i3c: master: svc: remove redundant pm_runtime_dont_use_autosuspend() calls

This commit removes pm_runtime_dont_use_autosuspend() calls from the probe
error path and remove callback in svc-i3c-master.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index e700392f0801f..9b845b2955be4 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_dev=
ice *pdev)
>  	return 0;
> =20
>  rpm_disable:
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);

[Severity: Medium]
This problem wasn't introduced by this patch, but earlier in
svc_i3c_master_probe() [1], does passing -EINVAL instead of
master->num_clks to dev_err_probe() break probe deferral?

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_probe() {
	...
	master->num_clks =3D devm_clk_bulk_get_all(dev, &master->clks);
	if (master->num_clks < 0)
		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
	...
}

If the clock provider is not ready and devm_clk_bulk_get_all() returns
-EPROBE_DEFER, probe fails permanently with -EINVAL instead of deferring.

> @@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_d=
evice *pdev)
> =20
>  	i3c_master_unregister(&master->base);
> =20
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: Medium]
Does removing pm_runtime_dont_use_autosuspend() here leave master->clks
prepared and enabled and pinctrl in the active state after driver removal?

i3c_master_unregister() calls i3c_master_bus_cleanup() ->
svc_i3c_master_bus_cleanup(), which wakes &pdev->dev via
pm_runtime_resume_and_get() and then calls pm_runtime_put_autosuspend().
Because autosuspend is enabled with a 1000 ms delay, that call only arms
the autosuspend timer and returns with &pdev->dev still active and
master->clks enabled.

Previously, calling pm_runtime_dont_use_autosuspend() before
pm_runtime_disable() caused the runtime PM core to synchronously run
svc_i3c_runtime_suspend(), which disables and unprepares master->clks and
selects the sleep pinctrl state:

drivers/i3c/master/svc-i3c-master.c:svc_i3c_runtime_suspend() {
	struct svc_i3c_master *master =3D dev_get_drvdata(dev);

	svc_i3c_save_regs(master);
	clk_bulk_disable_unprepare(master->num_clks, master->clks);
	pinctrl_pm_select_sleep_state(dev);

	return 0;
}

With pm_runtime_dont_use_autosuspend() removed, pm_runtime_disable()
cancels the pending autosuspend timer without running
svc_i3c_runtime_suspend(), and the later pm_runtime_reinit() in the driver
core runs after runtime PM is already disabled.

[1] https://sashiko.dev/#/bug/linux-7f6f30e6-7dc6-4272-b9a7-e0326db501a1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-dont-use-a=
utosuspend-i3c-v1-0-80a1546354ce@kernel.org?part=3D2
