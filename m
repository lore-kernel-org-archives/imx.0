Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B01226D18;
	Tue, 12 May 2026 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556775; cv=none; b=Ld6gDphaUHCr+Ui8TWAl/+m58tJPsBDOVM9kzBAnM2LJdmAjy+3IJG8N5SSHLxWGNpsImvQENBVjwt0VPE/uk9mvpaoxytUHFuoWuPCNQXPZi49wSm4gv4naf2xxuF4HYM81aZg+Ejj3KGYGQhD+MzX3M33PeraNEsiSLDCaGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556775; c=relaxed/simple;
	bh=nxger7V+QEy/ovx/iNDRDBunzWL7Du9evVSd3aAb954=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sns/9RHUZsyONE9+qKGI03DUyGQpTHAibUr5qVph8oi2LB83yKlxsEg6imKDDoN+swqqDKhM3jGd49HkG7LdhHpJHh3hzh0fYirhoVi0WZcTR3mYy3CHyk3D3ePJ/5uxnLf0HomFNEKeGMBtlBu9ylFahO2jEkQSWGJ7ykJTfVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXfnRJyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXfnRJyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC778C2BCB0;
	Tue, 12 May 2026 03:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556775;
	bh=nxger7V+QEy/ovx/iNDRDBunzWL7Du9evVSd3aAb954=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JXfnRJyRMKBrvKwy4fy081sUBTWqyWVjtaBMXBhtlXSUCQDGUPkQ1+IFTb67MxagV
	 TgOx1Ry5ExiADMksdsp+wKFUC3Ly4lmyc3JYrlwrVO6imnxE7TStS++d+xQkK0I2BI
	 H2Y8YbJUWl1Fo0yQ6L8pJ7p0nFZqMsxaM+zaofUxx8otiWbwVBb0sHnOrgqVIrOsV0
	 PwBmToKPsFTQwksoMuupSbCcNcuWTaH9exf3vEjSovE64Cn3PiU4CGV5Q35uKFQmQk
	 SjQcBrr2/hxFYGVKXx25Scm+DmbpYdSxwZqjOtliOjKZ/IoWZX7dv7S4mG8kflUfu/
	 IsmmpEej7xOzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 16/21] drm: bridge: dw_hdmi: Use delayed_work to
 debounce hotplug event
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260510124111.1226584-17-jonas@kwiboo.se>
References: <20260510124111.1226584-17-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:32:54 +0000
Message-Id: <20260512033254.EC778C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Asynchronous disable_delayed_work() in hpd_disable callbacks allow=
s the hotplug work to run concurrently with DRM teardown, causing a Use-Aft=
er-Free.
--

commit 3caa1bb48d6eede4b5fef2227a86e8e2d0b2a913
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event

This commit introduces a delayed work item to debounce HDMI hotplug events.
It enables the work during the enable_hpd phase and disables it asynchronou=
sly
during the disable_hpd phase, and finally cancels it synchronously when the
module is removed or suspended.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index a6f2702bca83c..f32eea9106b00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
[ ... ]
> @@ -2517,6 +2520,20 @@ static void dw_hdmi_connector_force(struct drm_con=
nector *connector)
>  	dw_hdmi_connector_status_update(connector, connector->status);
>  }
> =20
> +static void dw_hdmi_connector_enable_hpd(struct drm_connector *connector)
> +{
> +	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
> +
> +	enable_delayed_work(&hdmi->hpd_work);
> +}
> +
> +static void dw_hdmi_connector_disable_hpd(struct drm_connector *connecto=
r)
> +{
> +	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
> +
> +	disable_delayed_work(&hdmi->hpd_work);

Could this cause a use-after-free during teardown?

Since disable_delayed_work() cancels the work asynchronously without waiting
for it to finish, if the work is currently executing on another cpu, it cou=
ld
access the drm device after it has been freed during unbind.

> +}
[ ... ]
> @@ -2959,6 +2978,20 @@ static const struct drm_edid *dw_hdmi_bridge_edid_=
read(struct drm_bridge *bridge
>  	return dw_hdmi_edid_read(hdmi, connector);
>  }
> =20
> +static void dw_hdmi_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct dw_hdmi *hdmi =3D bridge->driver_private;
> +
> +	enable_delayed_work(&hdmi->hpd_work);
> +}
> +
> +static void dw_hdmi_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	struct dw_hdmi *hdmi =3D bridge->driver_private;
> +
> +	disable_delayed_work(&hdmi->hpd_work);

Similarly, would this asynchronous cancel allow the hpd_work to run
concurrently with drm teardown?

Because the synchronous cancel_delayed_work_sync() in dw_hdmi_remove() is
executed only after the master unbind fully completes, the work could still
be executing on another cpu.

When the work accesses hdmi->bridge.dev:

drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:dw_hdmi_hpd_work() {
    ...
	drm_helper_hpd_irq_event(hdmi->bridge.dev);
    ...
}

Could it dereference an already freed drm device?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D16
