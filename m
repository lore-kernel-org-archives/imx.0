Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E12D322E
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859683; cv=none; b=NOzSVZk3Oev+VnPtub2bM0PnfA5ThMsKicGSldZESamOI0AHtE+5O9yysaqPfjVGw3MPp9hNbHY2xru+XEJkOn57iz5n8Jfulk+DbTxfr39odJU6RL+6I2OrcNSD7QlEt6cKhPeIVwfcyKqjbWt/rcKEs90FeAsDKmJW2t6hbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859683; c=relaxed/simple;
	bh=GfD165c8+hmAkxftDCKh5AaJs37A+lxBxFNOCtv10hw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h8JlKbd5WT+kl+Zob7jZrbmB9eGzOnJLG28kFXt+62jUP3hZOpJLq4wylshzr1R8x4s1fzZqzufh1o0wif9rVwutKRuuOF8AU1XZdHIL9nSEdqat3nSYhkqMrIsx0E+DJXKyxoHMjKIS5n3RqU74ViNZrY4GJ42yXbQ4KX/SzPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byQUjLMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byQUjLMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585E41F000FF;
	Thu,  1 Oct 2026 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859682;
	bh=9E2kSyttxXvOS90cVrgaVyXoUTGZcBLnJy0WM9wTRNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=byQUjLMWZVqfe3kYCCb5KhdRUFco1rlZGbetR4nN0AaB4Au5+ydOwIrwhbGwAsJFF
	 3sdYhRZFWbXC2BYARJqnVjiV/+bLp/9yJAzureKLHLVZHlpGxo6rmwVBLn1v/LrbXz
	 lcFizL1aKr5L0xRzs5P3ZEBGJ0OmeceeJaZLXQajUnBRkgX9VdajJST1GbHLMAiBRT
	 ewaAfsabWhKEmChsPD/M+SaMLS9ETLkYKmyO4ZWQrszsttftQrttuIetO8st5JS6Mv
	 ODMRFps2fpcFr4O5MuIruqnTONYnbF8f4CA690zTPBepruKWEotCSYInmY+7hjSkoy
	 U2U5fq6MjiDvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 07/24] drm/bridge: samsung-dsim: move
 drm_bridge_add() call to probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261001-drm-bridge-hotplug-v2-7-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-7-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:01:21 +0000
Message-Id: <20261001130122.585E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/bridge: samsung-dsim: UAF in samsung_dsim_attach() due to data=
 race
--

commit c28866fd6b4a2bff1ae13053f73c850e270af34a
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: samsung-dsim: move drm_bridge_add() call to probe

This bridge driver calls drm_bridge_add() in the DSI host .attach callback
instead of in the probe function. This looks strange, even though
apparently not a problem for currently supported use cases.

[ ... ]

> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 480e568dd2c9d..b2de447dc6f43 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1827,6 +1827,9 @@ static int samsung_dsim_attach(struct drm_bridge *b=
ridge,
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> =20
> +	if (!dsi->bridge.next_bridge)
> +		return 0;
> +
>  	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
>  				 flags);
>  }

[Severity: High]
Could this lockless read of next_bridge introduce a use-after-free
regression due to a time-of-check to time-of-use race condition?

Since drm_bridge_add() is now called in probe(), the upstream encoder can
attach the bridge while the downstream panel is asynchronously probing.
This allows samsung_dsim_attach() to run concurrently with
samsung_dsim_host_detach().

If the panel concurrently unbinds or detaches, samsung_dsim_host_detach()
can clear the downstream bridge locklessly via:

    drm_bridge_clear_and_put(&dsi->bridge.next_bridge);

If this concurrent clearing happens between the check here and the
subsequent internal drm_bridge_get() call within drm_bridge_attach(),
could the kernel execute a kref_get() on a freed bridge pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D7
