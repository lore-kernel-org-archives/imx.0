Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84255513550
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680872; cv=none; b=qMS1WDtTTvgra2F+N7onWo749oQ69siExuNb7848IWBhlQua2W2BpFKcRNUwbRmPIEip2jZnqBfFJY4YzpmpLtFGIiNoROSBUK55vyCtFgFBoR6gpE8n4ZR2G6T/yYjiYK1odsDDV8LbPRCCoZw/pLR3XEIuLE4Z/bFzTmAo/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680872; c=relaxed/simple;
	bh=q/R73sU3HlFWsIY4lv7m5azFCJiIp0o64yNMluJbtbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TYXAsOqp6vEKGSTGvpn/hhnJRU3K8KRjCjG/nkcoCCP0v5hk9SC+mn7WeW43Gwff+e4tju56D/6GSmQpQpqWu6KrOWF/uib26cYa+Gl8F28wcEyJ+J/k9xj0lioiL7fgB8Ve2Fb6ldsZdcqkwV74EP7m592/AUC0ZULWk1+50Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Filmn7Gu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Filmn7Gu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAA51F000FF;
	Tue, 29 Sep 2026 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790680871;
	bh=GA38cMiGogZVDgMjBn996Oc6nmpWsGsKPZoPwJ2yu78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Filmn7GufNPUoWEs25MRRYybA6DbhQ0EBHuvWXpMGi8ZxB7cKimp7zqlzHxnM4t8S
	 8fcJlErSV4pAJZR+McC2Pd4d8ZyHl5VhfSTZDxuSzYP4vAgXNHWe7/02WhFQ45tdD8
	 GU9ev/qpcFpi7jLTh1Nd2Zp6x+M3bjrTAK2g7lsv3x7DyHIgNJmA/qxgxeHDm72ZO1
	 G8tgIE4mcmvZibmoMobQGI05CQRKV+0PJOMMHq6uXWxtJa5l4kF/ZjtMJxgBT9Bw0C
	 j5PGBD+wzLhgjgXuJ0p1kcu/Fugqu8aqAqdWwha0HN1vh1uTmMzV15oQP3648q3xqD
	 l28F7AYAfazGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-6-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 11:21:09 +0000
Message-Id: <20260929112109.BAAA51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/vc4: dsi: bridge reference leak on bind failure/retry
--

commit d1b5b987d3dbb5f94782b8b596d7895539b38c8d
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()

This commit replaces the deprecated devm_drm_of_get_bridge() with
of_drm_get_bridge_by_endpoint(), storing the refcounted bridge in
dsi->bridge.next_bridge. It also removes an unused include.

> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 0148f2befed14..30598738cfcf3 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
[ ... ]
> @@ -1749,9 +1747,9 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  		return ret;
>  	}
> =20
> -	dsi->out_bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
> -	if (IS_ERR(dsi->out_bridge))
> -		return PTR_ERR(dsi->out_bridge);
> +	dsi->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev->of_node,=
 0, 0);
> +	if (IS_ERR(dsi->bridge.next_bridge))
> +		return PTR_ERR(dsi->bridge.next_bridge);

[Severity: High]
Does this leak the bridge reference if a subsequent initialization step fai=
ls?

If a later call in vc4_dsi_bind() fails or returns -EPROBE_DEFER, the funct=
ion
exits without putting the newly acquired bridge reference. For example, fur=
ther
down in vc4_dsi_bind():

	ret =3D drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
	if (ret)
		return ret;

Because the component framework tears down the drm_device and its actions
on failure, the drmm cleanup runs vc4_dsi_release_action() which drops the
dsi->bridge refcount. However, because the refcount does not reach 0,
__drm_bridge_free() is not called and the next_bridge pointer is never put
or cleared.

When the bind is retried, of_drm_get_bridge_by_endpoint() is called again,
overwriting dsi->bridge.next_bridge and permanently leaking the previous
reference.

Is there a missing drm_bridge_put() or cleanup path to ensure the reference
is dropped when vc4_dsi_bind() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com?part=3D6
