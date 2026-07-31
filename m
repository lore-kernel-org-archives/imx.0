Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F983C3789;
	Fri, 31 Jul 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493879; cv=none; b=gttkVchHM/mR98Dkfr2n3fWb5O0y2mK+hiqh7p6REPbqTx2g7y0vQMi9UhbFzSht6HKkogwb8eryn8gH3YFU2LnMzhGTzDUaA1n/2Xm60evyKWlwZmxhw/uDgaQBIg97PIDc+hBxUH1NLf0k71nDIT+2qlRNm8VUq5Y1sNp5WKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493879; c=relaxed/simple;
	bh=IC3ireqBsGWEK+cIfQL6mSXn4zKUpiRizS+9rPexqs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sW581i89NNLDlWjmxXBqdoUAYEU/CJ5MtVL3wgTQQxqHAMcfUvRAI6PX+mfGYRwdC02pFbMu8yiRncSFH8r1Z5KtvttFYuNn7T+hxBCotL91ymcHjIiE5zgZb1CNeXJZs6iGpVWiGjOmQGMfbqIALItqEDre9TOcOZU56HlftFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0xE0J4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0xE0J4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C871F000E9;
	Fri, 31 Jul 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785493859;
	bh=9cnpHXNfb/HB/PG5lDmW5IElrZfF2Ajx8Jg8BP+iQnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0xE0J4IB0x6h9nNg+2EJczmwL5AHcVLlGD2aV7/KwePesO8Ort0mwr1vcVuGudSl
	 HtHwiyqzwxB/zhdtsNZ3iFnAnSyCPeRprhL+o5WvqD9GOlq/Qs5fEv5s8ro+fUxdeS
	 kJgB9hkXBPHZkBjRe5Py/kvd1iySIUKepDHuRKQKmpkI0MhbzCU2zzFgfJBm1dvPSf
	 Nn2N7nWtweS7wSzcQHuhRii/WdCgNJ2zJD3R+gBwkUE2MI4GkhMZvlXiTWNCypSOm5
	 fjhDMJQutE5HcFUInqbzGoPHyycYWQjf8XjS+x4fNNyJhxcYVlVnYuRBgkfDe6QfMJ
	 xfywAYnljQ8CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] regulator: core: use system_freezable_wq for
 init complete work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-b4-regulator-pf01-v2-1-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
 <20260731-b4-regulator-pf01-v2-1-a406c8737fdb@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:30:59 +0000
Message-Id: <20260731103059.B0C871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] regulator_unregister() uses flush_work() on a delayed_work, failin=
g to cancel pending timers and leading to Use-After-Free.
- [High] Delayed work 'oc_work' is never canceled on unbind in mt6363-regul=
ator, risking timer list corruption or Use-After-Free.
- [High] Delayed works 'sc_recovery_work' and 'ocp_recovery_work' are never=
 canceled on unbind in qcom-labibb-regulator.
--

--- Patch [1]: [PATCH v2 1/3] regulator: core: use system_freezable_wq for =
init complete work ---
commit 7f543933219647c14311f3aa93aefaa15b1b5acf
Author: Joy Zou <joy.zou@oss.nxp.com>

regulator: core: use system_freezable_wq for init complete work

This patch fixes a race condition between the delayed regulator init
completion work and system suspend. By switching from system_wq to
system_freezable_wq, the init work is now frozen during suspend,
preventing it from running when the I2C adapter is already suspended.

> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 2e61606fc1d05..6a4008f387b5e 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
[ ... ]
> @@ -6899,8 +6900,9 @@ static int __init regulator_init_complete(void)
>  	 * we'd only do this on systems that need it, and a kernel
>  	 * command line option might be useful.
>  	 */
> -	schedule_delayed_work(&regulator_init_complete_work,
> -			      msecs_to_jiffies(30000));
> +	queue_delayed_work(system_freezable_wq,
> +			   &regulator_init_complete_work,
> +			   msecs_to_jiffies(30000));
> =20
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the use of
workqueues and timers in the regulator subsystem, I noticed that
regulator_unregister() uses flush_work() on a delayed_work instead of
cancel_delayed_work_sync():

drivers/regulator/core.c:regulator_unregister() {
...
	if (rdev->supply) {
		regulator_unregister_notifier(rdev->supply,
					      &rdev->supply_fwd_nb);

		while (rdev->use_count--)
			regulator_disable(rdev->supply);
		regulator_put(rdev->supply);
	}

	flush_work(&rdev->disable_work.work);
...
}

Because flush_work() returns immediately if the delayed_work timer is
pending but not yet queued on a workqueue, this fails to cancel the pending
timer.

When the timer eventually expires, it dereferences the freed rdev memory.

Can this lead to a use-after-free during hardware removal or module unloadi=
ng?

[Severity: High]
This isn't a bug introduced by this patch, but I also noticed missing
teardown for delayed work in the mt6363-regulator driver:

drivers/regulator/mt6363-regulator.c:mt6363_regulator_probe() {
...
		config.driver_data =3D info;
		INIT_DELAYED_WORK(&info->oc_work, mt6363_oc_irq_enable_work);

		rdev =3D devm_regulator_register(dev, &info->desc, &config);
...
}

The delayed work 'oc_work' is initialized on a static array but is never
canceled on unbind.

If an overcurrent interrupt fires and schedules oc_work, and the device is
unbound before the timer expires, the timer remains pending.

If unbound and re-bound quickly, could the subsequent INIT_DELAYED_WORK()
overwrite the active timer's list node and corrupt the timer tree?

Or, if the module is unloaded, could the timer fire and execute code in
unmapped memory, causing a use-after-free?

[Severity: High]
This isn't a bug introduced by this patch, but there is a similar missing
teardown issue in the qcom-labibb-regulator driver:

drivers/regulator/qcom-labibb-regulator.c:qcom_labibb_regulator_probe() {
...
		INIT_DELAYED_WORK(&vreg->sc_recovery_work,
				  qcom_labibb_sc_recovery_worker);

		if (vreg->ocp_irq > 0)
			INIT_DELAYED_WORK(&vreg->ocp_recovery_work,
					  qcom_labibb_ocp_recovery_worker);
...
}

The delayed works 'sc_recovery_work' and 'ocp_recovery_work' point to a
devm-allocated structure.

Since there is no devm action or explicit teardown to cancel these delayed
works on unbind, devres will automatically free the vreg structure.

If the device unbinds while these timers are active, will the timers expire
and dereference the freed vreg pointer, causing a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-b4-regulat=
or-pf01-v2-0-a406c8737fdb@oss.nxp.com?part=3D1
