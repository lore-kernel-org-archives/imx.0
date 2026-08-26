Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF53B8BD9
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740829; cv=none; b=ieN3kiMmFQXfsaTPEd6ZwKPZGCJWK9mSWljEIZjSa75sJzjgOT8/oPsZ81xx3vu6D/cEAgKW9ZpE+H2WseVK0phJbmwbxSfjvYXUvizppu97JmnNY5YeET97L/1Rvt0ToQemGmn44+YoRceJR4dq+bVivXW82Wncf7p/i9BFDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740829; c=relaxed/simple;
	bh=aUhPrteKVZEYjpJga/NpMDyfIf/bhzdWKs6dGApGMXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPEomOMtRJqg0apen0PK8l7/AFkaD4wBIYtP+g+SuKJ0B+zpTZds/Q0Mc7cLFv9Knjs2O1Pq7ZHo/Lj6lSJYrAp7uYfPEFwILPHUJxHg/NWKp6oV5zP5mm7q+Wxb3swsd8wmMC6459ywLNR62iuT8E1r+R7N8Uuby8yx/J7TqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFDV89hu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFDV89hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BC51F00A3A;
	Wed, 26 Aug 2026 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740823;
	bh=4vij5ahnbLKjV/US4ZDz9GfJFcmGH3Kd3YmULrA195Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFDV89hucg0gFvOB3Vh17KsdftKx1pSNjSfOhd21XsCMZsqIPPI///sl5/bLHud4v
	 a/H9DZFmeng7KAido+4JylPwKgekclbyVWfFFEbV/mt1onovJX1e0yJpvo7Ep4Wj3V
	 4B4y5xsTzh91NHYbIqNcAfqSHCwn0dytdS8kouLMzMCrY2F+SxRgVCAlEs+2zpp2gj
	 pQw1KdxzA8CBZ5TeLO1Edmsxdb0/kHUuSqwFA45tEYJ/6sOusBNCpzHRX9iPkFrW3d
	 VNqW4M/PIfADLi+qp0rABIvwP8C9kA/dd83Db1TqGD1JohSjLeymf9Vc7FyW0UIW8q
	 r7aXvZlo4Lcmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] firmware: arm_scmi: Pre-register protocol, name
 tupples for standard protocols
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hans de Goede" <johannes.goede@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
 <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:40:23 +0000
Message-Id: <20260826104023.A6BC51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unloading a standard SCMI driver destructively removes the pre-reg=
istered protocol tuple, permanently breaking udev auto-loading for subseque=
nt SCMI servers.
- [Medium] Memory leak of pre-registered standard protocol entries on `scmi=
_bus_init` failure and `scmi-core` module unload.
--

commit da17ae54ea251ed3f7712cc26cfcce57fdfbf1f9
Author: Cristian Marussi <cristian.marussi@arm.com>

firmware: arm_scmi: Pre-register protocol, name tupples for standard protoc=
ols

This commit pre-registers standard protocol names to resolve a circular
dependency between udev module auto-loading and scmi device creation.

Link: https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm=
.com

> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index d12d5de15a1a4..111727904a892 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -77,12 +77,13 @@ static int scmi_protocol_device_request(const struct =
scmi_device_id *id_table)
>  	if (phead) {
>  		head =3D phead;
>  		list_for_each_entry(rdev, head, node) {
> +			/* pr_debug() because dups are expected for std protocols */
>  			if (!strcmp(rdev->id_table->name, id_table->name)) {
> -				pr_err("Ignoring duplicate request [%d] %s\n",
> -				       rdev->id_table->protocol_id,
> -				       rdev->id_table->name);
> -				ret =3D -EINVAL;
> -				goto out;
> +				pr_debug("Device already requested [%d] %s\n",
> +					 rdev->id_table->protocol_id,
> +					 rdev->id_table->name);
> +				mutex_unlock(&scmi_requested_devices_mtx);
> +				return 0;

[Severity: High]
Will unloading a standard scmi driver permanently break udev auto-loading
for subsequent scmi servers?

Since this function now returns success on duplicate requests without
maintaining a reference count, the pre-registered tuple shares the same
lifecycle as the driver registration.

If a user unloads a standard scmi driver module, scmi_driver_unregister()
calls scmi_protocol_table_unregister(). This function finds and
unconditionally deletes the pre-registered tuple from the
scmi_requested_devices idr:

scmi_protocol_device_unrequest()
    ...
    list_del(&victim->node);

If a new scmi server is later hotplugged, scmi_device_create() will fail
to find the protocol because the unregistration deleted it, preventing
device creation and subsequent auto-loading.

>  			}
>  		}
>  	}

[ ... ]

> @@ -579,17 +580,49 @@ static void scmi_devices_unregister(void)

[ ... ]

>  static int __init scmi_bus_init(void)
>  {
>  	int retval;
> =20
>  	retval =3D bus_register(&scmi_bus_type);
> -	if (retval)
> +	if (retval) {
>  		pr_err("SCMI protocol bus register failed (%d)\n", retval);
> +		return retval;
> +	}
> +
> +	/*
> +	 * Driver module auto-loading requires the devices to already be created
> +	 * for udev to get the necessary uevents. But the devices are only
> +	 * created after their { protocol, name } tupples have been registered
> +	 * which is done from scmi_driver_register(). Pre-register the tupples
> +	 * for known (in tree) drivers to break this circular dependency.
> +	 */
> +	retval =3D scmi_protocol_table_register(scmi_std_id_table);
> +	if (retval) {
> +		bus_unregister(&scmi_bus_type);
> +		return retval;

[Severity: Medium]
Does this code leak the memory allocated for the standard protocol entries
if scmi_protocol_table_register() fails halfway?

If scmi_protocol_table_register() encounters an error midway, it returns
early without cleaning up the successfully registered entries in
scmi_requested_devices.

Additionally, if the scmi-core module is successfully loaded but later
unloaded, does the module exit path need a corresponding
scmi_protocol_table_unregister() call to clean up unclaimed standard
protocol devices?

> +	}
> =20
>  	pr_info("SCMI protocol bus registered\n");
> =20
> -	return retval;
> +	return 0;
>  }
>  subsys_initcall(scmi_bus_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826102734.3176=
6-1-johannes.goede@oss.qualcomm.com?part=3D2
