Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EA13DDAA
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422873; cv=none; b=fuuLiutnO8BD7w3qRv3nPUIiTaxYW/tBxtje5pQ2c//IQ9YbtKmJjcZP2TduUfhLabH0L2/mTzR6fowrV3Jrv+yIvorB+Jv4wByOBt5r/QBodfazOAn2HYFT8yYmibkbsRQ1eCuco2JzVWe+uecQPNZmC8P8C2gtpq15F/uWtac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422873; c=relaxed/simple;
	bh=q4HuwyxtdWWJYNMfpF+PrIo3e0E733zE6IV0inpeUcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrLwuYMYwddK8bQuLDURxlIXtdEbq+LVnybLW/otAQvNdjQ4ooHPJv646XxvxcK7K6t17bwdE/DDHo0Z92Xtd7iWq+9fuUMvKSCWi1D7IuI86BJZAz5njscmaJjR2/XchY/KINHCf4x2cHFvWMT3zfJ7xkYsCeb5OmrWdEQ8ZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek2Pf3Uv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek2Pf3Uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A66A1F000E9;
	Tue,  7 Jul 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783422871;
	bh=dWYFkmZjj/mBuN+j9r9CkBSfjWApAn8RAjMoBZMbuEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ek2Pf3Uvndvx+dXzIIwTx28M1Qa0eQVu0msuPmAiuBF9uQ1BEObbQ+HNrAwtmkul2
	 w5rOvdTEHOubQUBqNJcNropGe5YWQ4giL6P2E0KSVfXZ8wPq+qm44HvyLG7DCF9BvS
	 QaS6kLyUPaKBWBGAszwH8c8vulmad+aZ3EwkHK4WqUX8BuVmdZYz4mNJKiHKMkx4is
	 5zmnj1hLKP7YZXCgjAjvhhKQd6rGeXI7WPZN4VrL8vS6aUlGfKn9fqVEdNvUx9UcjO
	 41dCyZqo9JMf0nJ/6dH/GDXLUfvP1j/vQ3iSwUVKZW6++SqDnRr8Ji7gUXi3psCzhH
	 fsZ3JIUHBk3Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] mmc: sdhci-esdhc-imx: make non-fatal errors
 non-blocking in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707110303.3779799-8-ziniu.wang_1@oss.nxp.com>
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
 <20260707110303.3779799-8-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 11:14:31 +0000
Message-Id: <20260707111431.8A66A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Ignoring `pm_runtime_force_suspend()` failure leads to an unbalanc=
ed PM state and potential system crash during resume.
--

--- Patch [7]: [PATCH v5 7/8] mmc: sdhci-esdhc-imx: make non-fatal errors n=
on-blocking in suspend ---
commit 4c281f4618f6273e8644ab8fb66535c0ebe7c6e2
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend

This commit modifies the suspend path of the sdhci-esdhc-imx driver to
make failures in pinctrl_pm_select_sleep_state() and mmc_gpio_set_cd_wake()
non-fatal. It logs warnings instead of returning an error for these cases
and changes sdhci_esdhc_suspend() to always return 0 on completion.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 7818f351a58ae..6cb84690fde4e 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
[ ... ]
> @@ -2108,7 +2110,7 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 */
>  	pm_runtime_force_suspend(dev);
> =20
> -	return ret;
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
pm_runtime_force_suspend() lead to an unbalanced PM state?

If pm_runtime_force_suspend() fails (for example, if cqhci_suspend() times
out and returns -ETIMEDOUT), the device's runtime PM status will remain
RPM_ACTIVE, but the suspend process continues.

Upon system resume, sdhci_esdhc_resume() calls pm_runtime_force_resume().
Because pm_runtime_force_resume() checks pm_runtime_status_suspended(), it
will see RPM_ACTIVE and assume the device is already active, skipping the
driver's runtime_resume callback.

Since the runtime_resume callback is skipped, cqhci_resume() is never called
to reinitialize the Command Queuing Engine (CQE), and clock enablement might
also be skipped. Subsequent accesses to the hardware in
sdhci_esdhc_imx_hwinit() or later MMC operations could then trigger a
synchronous external abort (if clocks are off) or lead to I/O errors
(due to an uninitialized CQE).

If the error from pm_runtime_force_suspend() is propagated instead, shouldn=
't
the driver also roll back the operations performed earlier in
sdhci_esdhc_suspend(), specifically disable_irq() and
pm_runtime_resume_and_get(), since the PM core will abort the suspend and
will not call sdhci_esdhc_resume() for this device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707110303.3779=
799-1-ziniu.wang_1@oss.nxp.com?part=3D7
