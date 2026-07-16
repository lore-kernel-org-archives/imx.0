Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27F3D47A7
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198974; cv=none; b=HORNHGSPr/wP1/rRoLhfQBZb3VKlPJKtwGOrbKv3KMipk1k8vv7uhhfXEIdFnVqT9hU5tCMCZS5ffniZd8hFbK0TkTVSjGvha3EhL7QBgxmDhBlGfr3HX1Ea5JToiIS6hwsuqp+BfL7RK9oPnbmPmPhH5eWKbtcHxtQfm9VgT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198974; c=relaxed/simple;
	bh=Lhwaz8sxo5rkeWHUcCEMqtE5PT1Q6zr/alrF9Wa5H1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUg0NQsMDKlDpcVJ3yflMGe2A0XC4ZaYEwXo3wDGSjTbg8aqGvyk3M7G9/zxyWL7hBnL/90Q0ObN/Abv5FuSXta36yn9S0313os85dguN+HfHJfPycwXtxbX+KHgCSP5/ZWhnBqcKaAcQouE1Ks4N04hVc2Ug0jFLigE8w2sNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+Xd5hlb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+Xd5hlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4D31F000E9;
	Thu, 16 Jul 2026 10:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784198972;
	bh=P6DnXyB9zvUYe2Q540P9fHm1T39rE1y505aIPizxHrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+Xd5hlbKrG8i5xnQmqTEQKLwXMoUfh1bpcg6bG2QsUfrEt9ZeSoesXqQRxLoCGgT
	 UoHI+d7oFk56zhLdGCJKI+2wBjbu/spgE0PtXMC2QMGTHU2TbPnwfi6+Bg+oI28fDG
	 x8NuNbda4gLJJnZQ/RF4/yb13Hbk6fM1qQcasOt4J4imtB2GMdkpgyNld76tfi2FSs
	 NllOdW2mpO4YlRwiqkcfxuL06j7SOHipVanxn2Bt3R4UYewwsILmBk16uiTaSOXDI1
	 5QdEQ4Xc6TLA6MIp7uUb/KctS5bwcUVE4t+phvJBVF9VbAiuIZdp6nc1BvQJTSkpIh
	 JZ7ZA9+6m10hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: fix usage_count leak when
 autosuspend_delay is negative
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260716104126.2763454-1-xu.yang_2@oss.nxp.com>
References: <20260716104126.2763454-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 10:49:31 +0000
Message-Id: <20260716104932.6C4D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Background tasks and timers are not properly canceled during drive=
r removal, leading to Use-After-Free.
- [High] The hardware is put into low power mode during removal without dis=
abling the devm-managed shared IRQ, leading to a kernel crash if the IRQ fi=
res.
--

--- Patch [1]: [PATCH] usb: chipidea: fix usage_count leak when autosuspend=
_delay is negative ---
commit fdadfb5f628818e9f20b2b5de671e334ccae62bf
Author: Xu Yang <xu.yang_2@nxp.com>

usb: chipidea: fix usage_count leak when autosuspend_delay is negative

The probe function calls pm_runtime_use_autosuspend(), but the remove
function misses the corresponding pm_runtime_dont_use_autosuspend() call.
This fixes a usage count leak when autosuspend_delay is set to a negative
value.

> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 07563be0013f4..b53672f3ea634 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1250,6 +1250,7 @@ static void ci_hdrc_remove(struct platform_device *=
pdev)
>  		usb_role_switch_unregister(ci->role_switch);
> =20
>  	if (ci->supports_runtime_pm) {
> +		pm_runtime_dont_use_autosuspend(&pdev->dev);
>  		pm_runtime_get_sync(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
>  		pm_runtime_put_noidle(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but does this driver leave background tasks
running after removal?

Looking at the remainder of ci_hdrc_remove(), it finishes with:

	dbg_remove_files(ci);
	ci_role_destroy(ci);
	ci_hdrc_enter_lpm(ci, true);
	ci_usb_phy_exit(ci);
	ci_ulpi_exit(ci);
}

The ci structure is devres-managed and will be freed after ci_hdrc_remove()
completes, but ci->otg_fsm_hrtimer and ci->power_lost_work are not
explicitly canceled during this teardown.

If the hrtimer fires or the work executes after this point, could it cause a
use-after-free? Furthermore, since the timer queues work to ci->wq, which is
destroyed in ci_hdrc_otg_destroy(), would a firing timer attempt to use a
destroyed workqueue?

[Severity: High]
This is also a pre-existing issue, but does entering low power mode during
removal leave a race window with the shared IRQ?

In ci_hdrc_remove(), the hardware is powered down by calling
ci_hdrc_enter_lpm(ci, true).

Because the interrupt is requested as devm-managed and IRQF_SHARED, it
remains active until devres cleanup runs after the remove function returns.
If another device on the same shared IRQ line triggers an interrupt during
this window, ci_irq_handler() will execute.

Since ci->in_lpm was not set to true before powering down, will the handler
bypass the low-power early exit check and crash attempting to read
powered-down registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716104126.2763=
454-1-xu.yang_2@oss.nxp.com?part=3D1
