Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022828F948;
	Tue, 12 May 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550105; cv=none; b=sq4qxCJZAyRssDp+Fqm8emaRw+IS/uUhiTPnNkUdeQZ8FBSgx7vRSx8KDFTSryqLfi3BM7ZFHHmADgGJOLtkIWhYxjGBe8yMwXfPvWtMwNZ3LpQEt3CL4oM51IaQ8lS/AqUt+ChxF6kZuDIZWpaXAuiyoUsr9EKifZSyKc3dYZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550105; c=relaxed/simple;
	bh=sebhaN6tzTE5Fs4/65z8od0hOE4cI7esAoaJnd5S92Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3X1+2Y17WI2W8UDkwoKoRHy7HgDk0ZTMZuQNtKZIv8P0onN8xM1nPbgjsXpcmU5T/7Rg+G0hgp2sGyUFI+sqjTgi2jcFj78gxcSRSvzAdBtC8QLLGeoPbdTj6cNYIkwZBVELO47JfdmtheK8Ir+VVJ4VwA6D3+zdV6RjBRjs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAgfJ3D2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAgfJ3D2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4EDC2BCB0;
	Tue, 12 May 2026 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778550104;
	bh=sebhaN6tzTE5Fs4/65z8od0hOE4cI7esAoaJnd5S92Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GAgfJ3D2cX2apchLYhUa55uI0nPsvPfw5DaDd9Yg36EIafnHXvADZ3x9kiUdQ1cOW
	 lM+4NstJp4kWXp9h1RNWtFcVXXEKqUPXCpi/MsDvI96nLmxIRVslWXcdTydprHcT/+
	 dlas9S1FAeyEFvRIPpwEPf89sn8mXgkbkmcWlcpw2HaUis3UpE/rRT7XSIY5VeY30w
	 xWyLKjF2EiVMOrVjSW3yGDH9rBWo6HAwVy/NRhxHtHFMpCQ8ontYzGaQxzPo4sH7n7
	 9dkj8byOV0DJWmhZEYS6rL07TjyPIGSnIb6mB3RhUwFyY6EWl6dnSUADhvucEgZSHI
	 kbrPbw1Ljm8qA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/21] drm: bridge: dw_hdmi: Unregister CEC notifier
 during connector cleanup
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-sunxi@lists.linux.dev, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260510124111.1226584-9-jonas@kwiboo.se>
References: <20260510124111.1226584-9-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:41:43 +0000
Message-Id: <20260512014144.7B4EDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] State Corruption / Lifecycle Imbalance due to delayed CEC notifier=
 unregistration
--

commit 5799bf779b149e6405697c67460f8e90064bcce9
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Unregister CEC notifier during connector cleanup

This commit moves the unregistration of the CEC notifier from the bridge
detach path to the connector destroy path to better align the lifetime of
the connector and the CEC notifier.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index cbbd155780425..5fd26ff8f55b4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2532,6 +2532,11 @@ static void dw_hdmi_connector_destroy(struct drm_c=
onnector *connector)
>  {
>  	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
> =20
> +	mutex_lock(&hdmi->cec_notifier_mutex);
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);

Could moving this to the connector destroy path cause CEC state to be wiped
out if the bridge is unbound and re-bound while a userspace application hol=
ds
a DRM file descriptor open?

Because DRM connectors are refcounted, their destruction is delayed until
userspace closes all references. If the driver is unbound and re-bound befo=
re
the old connector is destroyed, the new driver instance will call
cec_notifier_conn_register(). Since the old notifier hasn't been unregister=
ed
yet, it will reuse it.

When the userspace application finally closes the file descriptor, the dela=
yed
dw_hdmi_connector_destroy() executes for the old connector and calls
cec_notifier_conn_unregister(), wiping out the active CEC state for the new=
ly
bound bridge.

This issue also doesn't seem to be fixed by the later patch 'drm: bridge:
dw_hdmi: Use generic CEC notifier helpers', as tying unregistration to the
drm_device lifetime means it is still delayed by open file descriptors.

> +	hdmi->cec_notifier =3D NULL;
> +	mutex_unlock(&hdmi->cec_notifier_mutex);
> +
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D8
