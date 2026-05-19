Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACA4921BB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189199; cv=none; b=txc9HKTtc+H+4o+dTZVBqRWq8YkEwd+6ekHFeOXqUlw/6E/sXnAP7v/WMIUOgHRumZPXnhI+5kbeYf9t57xwJR0q3jZOgPFBZV9G/U5AMapEM1yQ9AlmOmdFyeDKcCFHC1In4OrL5BzkGwM6tkPUEcKUHZjZCqXU8KymXgzI94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189199; c=relaxed/simple;
	bh=2RvDwF+cFCWqQFLsd2XNln4FOdy9ZQF6T5xeM/SH348=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDbPhqveKMVPgNpb6s6WbMKiIrQ0F6mgqmkhG1/MqiEFq5F4bRGBfoQonTe6y6Q+H46/ZAJxYDFAzrbecq614B63pRiYQu1HMad2EJ9+SIMp02LRbr0IH91Al5Nt/9zdlfDyWvheodD+a/TlnsLYFtDixbthkjF8TnA49o0kh90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu39AeGM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu39AeGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9707C2BCB3;
	Tue, 19 May 2026 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189199;
	bh=2RvDwF+cFCWqQFLsd2XNln4FOdy9ZQF6T5xeM/SH348=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gu39AeGMs16+dSUiURswhG2MqLetii1hYZlQSJ0X/e19coqL2kzjcL0QVbysrVFqc
	 Egdr6LN2+NDbyibJ0rnFLe3qIVPJQFvL6rCMMyfjPPqVUZxwbyaIketIRpM4KIFFrN
	 9StUOQDRoLYIfQUcsJqV1w0DPwDQxbAN4I8UyyRNiSJdTSfI12MRU2OWXQg3dbWch1
	 rd5td0/eL6U7lYlRRX2uG5EE54pfiY8ZqrkMnSMWtCvDJVhydsea78xBFaAZdTb5oo
	 xCI6X9nmfsKERashssDj4uJObzuXAafNxF/oenib0510BkHUM7RyZATvuqKdeZZMTu
	 6SyQZBJjkd2/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/37] drm/bridge: samsung-dsim: attach: return
 -EPROBE_DEFER is next bridge not yet available
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-20-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-20-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:13:11 +0000
Message-Id: <20260519111318.B9707C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double fetch of `dsi->bridge.next_bridge` in `samsung_dsim_attach(=
)` causes a race condition leading to unintended `-EINVAL` errors or Use-Af=
ter-Free.
--

commit b9977e0ebaa4dd776acdd10e8085cc7df8ae862c
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: samsung-dsim: attach: return -EPROBE_DEFER is next bridge not y=
et available

When samsung_dsim_attach() is called without a known next_bridge, it previo=
usly
returned -EINVAL. This commit changes it to return -EPROBE_DEFER instead, in
preparation for bridge hotplug support.

> drm/bridge: samsung-dsim: attach: return -EPROBE_DEFER is next bridge not=
 yet available

This isn't a bug, but there is a typo in the subject line ("is" instead of
"if").

> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 555e343b386d0..83c74d57d0d44 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1828,6 +1828,9 @@ static int samsung_dsim_attach(struct drm_bridge *b=
ridge,
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> =20
> +	if (!dsi->bridge.next_bridge)
> +		return -EPROBE_DEFER;
> +
>  	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
>  				 flags);

Can this double fetch of dsi->bridge.next_bridge cause a race condition
leading to unintended -EINVAL errors or a use-after-free?

The commit message states this change is in preparation for bridge hotplug,
meaning hot-unplug events could occur concurrently.

If a detach executes concurrently during an unplug event, it could clear
dsi->bridge.next_bridge between the if check and the call to
drm_bridge_attach(). This would cause the first fetch to see a valid pointe=
r,
but the second fetch to read NULL, resulting in drm_bridge_attach() returni=
ng
-EINVAL instead of -EPROBE_DEFER.

Furthermore, even if the value is fetched into a local variable to prevent =
the
double fetch, could the bridge be freed by the concurrent detach before
drm_bridge_attach() takes its own reference?

Does this require proper synchronization, such as holding a lock while
checking and obtaining a reference to the bridge?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D20
