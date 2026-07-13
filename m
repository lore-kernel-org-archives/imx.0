Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C33FF8BD;
	Mon, 13 Jul 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944532; cv=none; b=d5QY9BxO286MhE7Kc8y89Kr3zXkFKyRv8IGSEt5JzYq3vjZuAr8Az2Ev4UOJjCpENm8xoqlb63a+aioIECe8TrsBB7673pCecPq0/PD7CRa75aDyc+LOHZ8hvNTF8SBLdKNz9i59ENHCHXB3KIcZxDqZxiQtKFlMiIZABokie4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944532; c=relaxed/simple;
	bh=qPY+ftbHtdVh44IsU7zDhLZU5ZqcO4Q7S/bLvj77eFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LShIqmv9FmwD5KhAQxPFngvn1KFvHX1tenE/+Xz7T5AgpLAkd5VlJzVmKtZUSqf0QtnBAi1j+737ZIABWlkv8J8IGWUWP5h/RYQI65kum+pF6YO6URH+JPPk+W1/fjJ8LxrFxLBo0LljlLUjmyQxrpA/Tf5Ikt4zQa2O1/1D/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRGGotfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRGGotfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A971F000E9;
	Mon, 13 Jul 2026 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783944530;
	bh=FsObjmWYAUve1NK1KQo+HH5UBdK3xyiqAWwC+NNw56A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRGGotfKuwCZoT9QGYvVXkHRw8K3zpSM9hZOPCZFH/yGLXk7YgNUlizgL9R31ZNie
	 xJ0Qv7n4pxLvVyA/U3VXoP9zv2OnsmgpMRMGzDTe2nXa/gm05oGEFfzp9aZp+o4kn7
	 eW9MJ2pDagm/8bcQKNs5425vWSlCqpW0OvN8OlMMCurQPe00ly27HLqFRN1aWIxjLu
	 U26FlTBvRkGb5QKcwYXbVu1gFnsioAQa/+NwyZ5GswQZlTzDTCUOdWlM/blw4YjJFM
	 Rr9QQLvkuY36BCjQkgJSirFxpyKlvt//IIGTO0nvk9nMZPaAERyYzp39hvfdaj2YGr
	 4OouoOiGXiuow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a
 counted reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org
In-Reply-To: <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com>
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 12:08:49 +0000
Message-Id: <20260713120850.50A971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Drivers calling of_drm_find_panel() directly leak the returned p=
anel reference.

Pre-existing issues:
- [High] TOCTOU race in drm_panel_add_follower() when acquiring the panel's=
 underlying device, leading to a potential Use-After-Free of panel->dev.
--

--- Patch [4]: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a co=
unted reference ---
commit 5cd4c479944cf29f6f5aa4a3e31207bf48dc0567
Author: Albert Esteve <aesteve@redhat.com>

drm/panel: find_panel_by_fwnode() return a counted reference

This commit updates find_panel_by_fwnode() to return a refcounted pointer
to the panel, mirroring a similar fix made to of_drm_find_panel(). It calls
drm_panel_get() under the panel_lock before returning, ensuring the memory
is not freed prematurely. Callers are now responsible for balancing this
with drm_panel_put(), which is added to drm_panel_remove_follower().

> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 72cf86253c0cd..a00ae98ed0956 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -542,7 +542,13 @@ int of_drm_get_panel_orientation(const struct device=
_node *np,
>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
> =20
> -/* Find panel by fwnode. This should be identical to of_drm_find_panel()=
. */
> +/*
> + * Find panel by fwnode, returning a counted reference.
> + *
> + * Behaves identically to of_drm_find_panel(). On success the returned
> + * pointer has been passed through drm_panel_get(); the caller must call
> + * drm_panel_put() when done with it.
> + */

[Severity: Medium]
Since the earlier patch in this series updated of_drm_find_panel() to
also return a counted reference, do drivers that call it directly need
to drop their reference to prevent a memory leak?

For example, in bridge drivers like lvds-codec.c:

drivers/gpu/drm/bridge/lvds-codec.c:lvds_codec_probe() {
    panel =3D of_drm_find_panel(panel_node);
    of_node_put(panel_node);
    ...
    lvds_codec->panel_bridge =3D devm_drm_panel_bridge_add_typed(dev, panel,
                                                lvds_codec->connector_type);
}

Because devm_drm_panel_bridge_add_typed() takes its own reference to the
panel via drm_panel_get(), does this code leak the initial reference
returned by of_drm_find_panel() since drm_panel_put() is never called?

This same leak pattern appears to exist in other callers as well, such as
samsung-dsim.c:samsung_dsim_host_attach() and
rcar_du_encoder.c:rcar_du_encoder_init().

>  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle=
 *fwnode)
>  {
>  	struct drm_panel *panel;
> @@ -554,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const s=
truct fwnode_handle *fwnode
> =20
>  	list_for_each_entry(panel, &panel_list, list) {
>  		if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +			drm_panel_get(panel);
>  			mutex_unlock(&panel_lock);

[Severity: High]
This is a pre-existing issue, but is there a time-of-check to time-of-use
race condition when callers attempt to pin the underlying device?

When find_panel_by_fwnode() (or find_panel_by_dev()) returns, the panel's
internal refcount is incremented under panel_lock, but the underlying
struct device (panel->dev) is not pinned.

If a concurrent unbind occurs before the caller pins the device, the device
memory could be freed. For example, looking at drm_panel_add_follower():

drivers/gpu/drm/drm_panel.c:drm_panel_add_follower() {
    panel =3D find_panel_by_dev(follower_dev);
    if (IS_ERR(panel))
        return PTR_ERR(panel);

    get_device(panel->dev);
}

If the panel device driver unbinds immediately after panel_lock is dropped,
could get_device(panel->dev) trigger a use-after-free on the destroyed
device?

>  			return panel;
>  		}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-drm_refcou=
nt_wiring-v2-0-d3bb61f4bd4d@redhat.com?part=3D4
