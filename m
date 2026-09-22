Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E12580F2
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 00:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037641; cv=none; b=i/Q/2Lhewg36m6tPOg5yhxFzdhWNH9YHtq2qEh67RBMYeHRcCKY2S7KlCEFYDZPYfEiVG25Gvxx5KGV+1jh/IsqfVN4iC0DVqJ53yknlLC8WNlY6HEs6949vHMvcwV/1yJYdK4IcYFZVWfaQjC499WRgdZ530zCE2hLE7srDA2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037641; c=relaxed/simple;
	bh=7ISat5d9FjXsUnnsNwSeYeA2t+9URkhh6P+2aO3auaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/4copN0USiryl9dp5B12cjS0kZMgHsTqOmnb5dYMGl5mXPyOfOdPki7trkrajMJzc1J6sjpuCP7tnGDAnsCkAPJVtX1JfkvhdwwX7Ge/+cpe3Bzg/EZQ9I8xUGd+S5HM+zNSI0s0WVuKRBl+6eI8owGtRA5C3YH+lSbQdEHWIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPVj0naZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPVj0naZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB35B1F000FF;
	Tue, 22 Sep 2026 00:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790037640;
	bh=OocHG7kGWztX+Objxys0i/VZBHzIZVAbwIOTvoXRGKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iPVj0naZ4wQigEuvdOpUvJ83OkzZJ4eKweXPM4oKu+XHyV/FTJSE+K/W8gzSzT/LF
	 JdPWAjKUZbu2g4J2qs1Q0J98xCxMq25DAl56OGfuNVIjyrGC70QndB8KKKRqv3sStH
	 XEl6eB3ZKOAlBiW6Zl11SvsyLIYfmvsUh2zbA39lS4R60Nps92By4nEW67ikP8vxpL
	 8Zjhr+2R6rMBz8JSYbawgt2NPQXp1PnVeYmSogMCKlFhj1zR7exDXNaUlL3RkeyHgV
	 +cdJQxjuI89v60YrjG5dKrUF5RVBd7G7fiu8GaKqGAHrTjf/spBAbc+gSLhqOQ252m
	 I4kH9zsEVIgLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: sm: publish the protocol handle after
 the ops pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jaidev Shastri" <jaidevshastri@vt.edu>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
References: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 00:40:39 +0000
Message-Id: <20260922004039.BB35B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Concurrency: discarded smp_load_acquire result creates TOCTOU do=
uble-fetch
--

commit bbaeb64e803a74302b103407c87f99c75c2cbd83
Author: Jaidev Shastri <jaidevshastri@vt.edu>

firmware: imx: sm: publish the protocol handle after the ops pointer

This commit resolves an un-ordered initialization issue by publishing the
protocol handle ph only after the ops pointer is set. It uses
smp_store_release() during probe and smp_load_acquire() in the exported
helpers to ensure memory consistency.

> --- a/drivers/firmware/imx/sm-cpu.c
> +++ b/drivers/firmware/imx/sm-cpu.c
[ ... ]
> @@ -26,7 +27,8 @@ EXPORT_SYMBOL(scmi_imx_cpu_reset_vector_set);
> =20
>  int scmi_imx_cpu_start(u32 cpuid, bool start)
>  {
> -	if (!ph)
> +	/* Pairs with the smp_store_release() in the probe function. */
> +	if (!smp_load_acquire(&ph))
>  		return -EPROBE_DEFER;
> =20
>  	if (start)
>  		return imx_cpu_ops->cpu_start(ph, cpuid, true);

[Severity: Medium]
Does discarding the result of smp_load_acquire(&ph) create a
Time-of-Check to Time-of-Use (TOCTOU) double-fetch race?

In scmi_imx_cpu_start() in drivers/firmware/imx/sm-cpu.c, the result of the
safe smp_load_acquire(&ph) fetch is only used for the NULL check. The global
ph is then read a second time from memory when it is passed into
imx_cpu_ops->cpu_start(ph, cpuid, true).

If ph were cleared concurrently (such as during driver unbind or probe error
rollback), this second load could fetch NULL and potentially cause a crash.

While this bug might currently be latent if the driver lacks a teardown path
that clears ph, this double-fetch usage bypasses the acquire semantics.

Could we store the acquired handle in a local variable and use that local
variable for both the NULL check and the function call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-mb-imx-sm-=
v1-1-39f17526d253@vt.edu?part=3D1
