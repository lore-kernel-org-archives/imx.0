Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0933D75D1
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741003; cv=none; b=nMLj9a1WIG/jPX6mR/Loq4pYaXaVwRsZYYfK+HQE5raMAH0y/8TjI9B4rUS8Uj8rHgkBnhi/QwoRJZ/e43Zq8U+QpZ3fv6oPI+kLOdoMsljfgojwUJpmUgsSbMxkCwZx3xpptmTQooIhN/MHIKf9a4vMfB7BAdpcSM0W6zQl9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741003; c=relaxed/simple;
	bh=8Zhr2d8DQBDDEnzjapCUrlTas5+XgHoPDu/tr7TfcCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hJ4DV+eGaVwUpn15mXLXF/8UVjizwulX308NtryudxqZZ/IgZmvIzATRj/I/X5gSZUysMoBcAncj0sKeGByE9GfrEUJ5oA/fA2RPxnDoFIqgZuNHbJ+efnRvA7W4pEx9yGEsmZvMcex45awHU5n4DMF11vn08VZueSS40n4whi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iduKQGV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iduKQGV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED2A1F000E9;
	Wed, 26 Aug 2026 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740999;
	bh=pN17dxApz29R8JgFHLKjO3hRCORgQe5LPqlPfibuRT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iduKQGV0cVZfDyz1RopAlErtpKIMO26jgHYY4ktNoFOC+pGzQYJe6KVCzhPqg1irt
	 8YajKsyNFiBlyFdt/Xv9/fcRBrNgWuxpd8I6F7XFs5mdZioNJDxrZVpBD7H4ZggK/a
	 vhYdOyrEkkqyfSMpnhrFWBqcmzciqQkK9PVhdB7/uQa6HrtRkfIPTwilt+EiGEwOos
	 kpqcEHqwXAACpLHtd0yVO+Anl3OkJ7TUu78tyPZnYmlUFf7JHxanoGqGPP0zD8JMbM
	 /Hdr8TEytdGoocrWESNuevgqaUe3bQFPjy4pz8e32mCJo1RgyUog2foUMisW42Qqkr
	 uZqP03BoBJqdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] firmware: arm_scmi: Pre-register protocol, name
 tupples for IMX protocols
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hans de Goede" <johannes.goede@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
 <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:43:19 +0000
Message-Id: <20260826104319.7ED2A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] SCMI bus initialization fails and aborts entirely when SCMI RAW mo=
de is enabled without COEX.
- [High] Adding vendor-specific protocol IDs to the global `scmi_std_id_tab=
le` causes cross-vendor namespace collisions and type confusion on non-IMX =
platforms.
- [Medium] Dynamic allocations for SCMI requested devices are leaked on mod=
ule initialization failure and module unload.
--

commit 80137af0c1515baef478cde4cc26837986f858f7
Author: Hans de Goede <johannes.goede@oss.qualcomm.com>

firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols

This patch pre-registers IMX vendor protocols to enable module auto-loading.
I've been reviewing this patchset and noticed a few regressions related to
these changes.

> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index 111727904a892..9f5740dc606fa 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
[ ... ]
> @@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table=
[] =3D {
>  	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
>  	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
>  	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> +	/* Vendor protocols with in tree drivers */
> +	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
> +	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },

[Severity: High]
By adding vendor-specific protocol IDs (like SCMI_PROTOCOL_IMX_BBM, which
maps to 0x81) to the global scmi_std_id_table, any SCMI platform
(e.g., Mediatek) that implements its own custom vendor protocol 0x81
will now trigger the creation of an imx-bbm-key SCMI device during boot.

This causes the NXP/IMX driver to probe and request protocol ops for 0x81.

Because the SCMI core looks up protocols by the platform's vendor_id, it
returns the other vendor's protocol operations struct (as a void *).

The IMX driver then casts this to struct scmi_imx_bbm_proto_ops * and
dereferences it.

Could this lead to arbitrary function pointer execution or memory corruption
on non-IMX platforms?


I also noticed a few other regressions introduced in this patchset regarding
the scmi_bus_init() changes.

[Severity: High]
When CONFIG_ARM_SCMI_RAW_MODE_SUPPORT is enabled and
CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX is disabled,
scmi_protocol_device_request() unconditionally returns -EINVAL.

Because this patchset moved the global
scmi_protocol_table_register(scmi_std_id_table) call into scmi_bus_init(),
the -EINVAL error now propagates up:

drivers/firmware/arm_scmi/bus.c:scmi_bus_init() {
    ...
	retval =3D scmi_protocol_table_register(scmi_std_id_table);
	if (retval) {
		bus_unregister(&scmi_bus_type);
		return retval;
	}
    ...
}

Will this cause the entire SCMI bus initialization to fail and abort when
SCMI RAW mode is enabled without COEX?


[Severity: Medium]
The scmi_bus_init() function dynamically allocates entries in the
scmi_requested_devices IDR via scmi_protocol_table_register().

However, scmi_bus_exit() omits the call to
scmi_protocol_table_unregister(scmi_std_id_table) to free these entries:

drivers/firmware/arm_scmi/bus.c:scmi_bus_exit() {
	/*
	 * Destroy all remaining devices: just in case the drivers were
	 * manually unbound and at first and then the modules unloaded.
	 */
	scmi_devices_unregister();
	bus_unregister(&scmi_bus_type);
	ida_destroy(&scmi_bus_id);
}

Furthermore, if scmi_protocol_table_register() fails halfway through (e.g.
due to -ENOMEM), it does not clean up the already allocated entries.

Are the struct scmi_requested_dev allocations leaking on module unload or
initialization failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826102734.3176=
6-1-johannes.goede@oss.qualcomm.com?part=3D3
