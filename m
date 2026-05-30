Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B952772E
	for <imx@lists.linux.dev>; Sat, 30 May 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171654; cv=none; b=ZyBoCN/9W1Rogo3utpX2/3/tONpk5DIFpjBg26IXjdj46SidHOBjmMUpussVclKioiwlqAgumjt3qZL0k+RieiZNBih/IAIU+6+DMQxrD152sBPFroR47PaqMbALbfcvR3GTRwpYOdfErpjEnKMC1jHPEHqy9nU2DiDgvdc4ah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171654; c=relaxed/simple;
	bh=2KSW4d9vkjFpVdC4TXbQyFtzXoJZBh2629uePWOGN3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BL50ood/UU+oi8P16F1UBSdG90HJFbT92c7/eMkGVbYE+9uJgWDRs2WqjgRfjm+nkLvw+SDr14/hFXtzwpOH2YzEH9nsJxGtQ7Z1QYULlFURlUaU+apmea1NsnCdGB4UbD/M83RDQcODmR1No0075mO4uuOsGLO806VKma83MxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw9uqd7K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw9uqd7K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787C81F00893;
	Sat, 30 May 2026 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780171652;
	bh=VWur/QGnupglgbs0nINyKDpvI86/rt5fezYid03C2uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aw9uqd7KD+Wy5URuY7ox3kdCAns6o2Wvfk6mvVnLpADz00CPwqXvHDoCDdVmlf4Xa
	 44fpdgv1+7wXbXyLUYE2ICKeiisc9x/3h7C3K7syuhUAB90ZwHviMHgBl/fb0UDVB/
	 mExkoLIFb1DHYK9kIr0OQ5N/UX0E+AJ2cKC28y66nsIgxMcF+aGTX69/Z7M5H9sisy
	 MxjiCdEf8V3B9sfG1rdfogSDxyg+cxfhII2kyWX1cvdLdCGv2595iBCjFhvyFeGBZJ
	 3yNX6XI616VxySpv8dDo9NMUtHEVt3BQ4DwpAR8wIJd5w4SRtoPQ7j3APo7nr+2yaZ
	 Pq+gl0CyI2f6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] serial: mxs-auart: fix probe error paths and clock
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260530195525.5059-1-rosenp@gmail.com>
References: <20260530195525.5059-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 20:07:32 +0000
Message-Id: <20260530200732.787C81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The unconditional `clk_disable_unprepare(s->clk)` at the end of `p=
robe()` breaks the serial console output.
--

commit 09d89989b2eafe8aa07311d7fa3bb051e4b94c5c
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix probe error paths and clock handling

This commit fixes probe error paths and clock handling in the mxs-auart dri=
ver.
It resolves unenabled clock accesses in probe, fixes port array bounds writ=
es
on DT devices, and corrects out-of-order unmapping during error handling.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..a583a897a8f7d 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c

[ ... ]

> @@ -1652,15 +1617,34 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)

[ ... ]

>  	/* ASM9260 don't have version reg */
>  	if (is_asm9260_auart(s)) {
> @@ -1672,20 +1656,13 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
>  			 (version >> 16) & 0xff, version & 0xffff);
>  	}
> =20
> -	return 0;
> -
> -out_free_qpio_irq:
> -	mxs_auart_free_gpio_irq(s);
> -	auart_port[pdev->id] =3D NULL;
> +	/* Disable clock =E2=80=93 startup will re-enable when the port is open=
ed */
> +	clk_disable_unprepare(s->clk);

[Severity: High]
Will this unconditional clk_disable_unprepare() break the serial console?

If the UART is configured as the console, printk() can asynchronously invoke
auart_console_write() from atomic context at any time. auart_console_write()
relies on clk_enable(s->clk) to temporarily ungate the clock.

Since the Common Clock Framework enforces that clocks must be prepared befo=
re
they are enabled, calling clk_enable() on an unprepared clock returns an
error and triggers a kernel warning. As a result, auart_console_write()
will abort and drop all console messages between the end of mxs_auart_probe=
()
and when userspace explicitly opens the port.

Should this check !uart_console(&s->port) before unpreparing the clock?

> =20
> -out_iounmap:
> -	iounmap(s->port.membase);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530195525.5059=
-1-rosenp@gmail.com?part=3D1
