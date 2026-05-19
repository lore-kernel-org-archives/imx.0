Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E47480332
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188768; cv=none; b=MKw2W1Yjy7XHeDktIBEJqc1PjCaxDBRG0uUm6Z2q/A4+CBDsHs2n7lVx1/3eLiTmp7fQBvpFq5rg5K5iflC4nMnDKHXA9hnkrkt5BGWougWLiYCGv//QkFeoMXXRsFLRB/3XC4Vw0I2N5q5UIxJsUiakahVdDlGE4BeqeZQzAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188768; c=relaxed/simple;
	bh=CwCtFdewT31KuAO/Wt0Uonm0TMb1Kif8cJPuZ1jmzZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TZi/K/7qfTjpTh6ogxn0Uz8QWyNjQnbs+kPLyKocTikK3DjKjhgNXJx+itttwhuumXQTSHXs69MdaWaLbhY+rqcsLrgZ2xP3iIXuHGMCNO2lbko790IwdfEbUxdCIElj2ELqoAkEZD1B16gR6aIYrx1GUyzioNdOV0Z2vb2MKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGbTqrNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGbTqrNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB44DC2BCB8;
	Tue, 19 May 2026 11:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188767;
	bh=CwCtFdewT31KuAO/Wt0Uonm0TMb1Kif8cJPuZ1jmzZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UGbTqrNMy05uV1p3pWMKw7xvzVeiC8oX+FNIOn3Qxm7Lux95xIkKWUvYFJW8Nguw1
	 DviA9C0Q/OvrUWn9Hd8zI5QFnHaxMLbVSKlru90JTnpnOVfXZmft3UjVegEzb8qgdE
	 5yO+MSKJla9hyePoH9siVg0uNl7mo3Ah8XgubTgJNvz2b9zJPyTl+vHR2anjG2vi1A
	 lmkIZ2QuRyBzG/XzLPLAyQ9mj0bpo7KETb8SXa6U3gaDLKS7DZlYOcINWJC+J+TqLD
	 fePy6ioajTEdj3T21eetVHzScWL/f22K4cEvpxrJvd2ao03X7Qygu0IaHiaxxHYINc
	 T4nU/UIJS/tLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 26/37] drm: event-notifier: add mechanism to notify
 about hotplug events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-26-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-26-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:06:07 +0000
Message-Id: <20260519110607.BB44DC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Global blocking notifier chain couples independent DRM devices.
- [Low] Missing forward declaration for `struct notifier_block` in header.
- [Low] Kernel-doc mismatch for DRM_BRIDGE_DETACHED enum value.
--

commit 233daf5d4ef6810bfafb5fb5ba8829a7db6987d3
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm: event-notifier: add mechanism to notify about hotplug events

This patch introduces a DRM event notifier to allow interested parties
to be notified about bridge hotplug events. It adds a new common file
implementing the notifier and defines initial events for bridge detach
and MIPI DSI attach.

> diff --git a/drivers/gpu/drm/drm_event_notifier.c b/drivers/gpu/drm/drm_e=
vent_notifier.c
> new file mode 100644
> index 0000000000000..76af4dd4cdb02
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_event_notifier.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Internal event notifier for DRM drivers
> + *
> + * Copyright (C) 2026 GE HealthCare
> + * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +
> +#include <drm/drm_event_notifier.h>
> +
> +static BLOCKING_NOTIFIER_HEAD(drm_event_notifier);

Does using a single, global blocking notifier for all DRM hotplug events ri=
sk
coupling independent DRM devices?

When an event occurs on one device, it appears this will trigger callbacks =
for
every registered listener across the entire system. Could this lead to
cross-device lock contention, or cause listeners on unrelated hardware to
unexpectedly react to the event?

[ ... ]

> diff --git a/include/drm/drm_event_notifier.h b/include/drm/drm_event_not=
ifier.h
> new file mode 100644
> index 0000000000000..78afc014ec9a6
> --- /dev/null
> +++ b/include/drm/drm_event_notifier.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Internal event notifier for DRM drivers
> + *
> + * Copyright (C) 2026 GE HealthCare
> + * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + */
> +
> +#ifndef _DRM_EVENT_NOTIFIER_H_
> +#define _DRM_EVENT_NOTIFIER_H_
> +
> +/**
> + * enum drm_event_notifier_event - DRM bridge events
> + */
> +enum drm_event_notifier_event {
> +	/**
> +	 * @DRM_MIPI_DSI_ATTACHED: A MIPI DSI device has just been attached
> +	 * to its MIPI DSI host. @data is a pointer to the &struct
> +	 * mipi_dsi_device that has just attached.
> +	 */
> +	DRM_MIPI_DSI_ATTACHED,
> +	/**
> +	 * @DRM_BRIDGE_NOTIFY_DETACHED: A bridge has just been detached

This isn't a bug, but the kernel-doc references @DRM_BRIDGE_NOTIFY_DETACHED
while the actual enum value is DRM_BRIDGE_DETACHED. Will this cause warnings
during documentation builds?

> +	 * from the encoder bridge chain. Emitted at the end of
> +	 * drm_bridge_detach(), after removing the bridge from the encoder
> +	 * chain. @data is a pointer to the &struct drm_bridge that has
> +	 * just been detached.
> +	 */
> +	DRM_BRIDGE_DETACHED,
> +};
> +
> +int drm_event_notifier_register(struct notifier_block *nb);

Should there be a forward declaration for struct notifier_block here, or an
include for <linux/notifier.h>?

Without it, files including this header might get compiler warnings about t=
he
struct being declared inside a parameter list, since kernel headers are
typically expected to be self-contained.

> +int drm_event_notifier_unregister(struct notifier_block *nb);
> +void drm_event_notifier_notify(unsigned long event, void *data);
> +
> +#endif /* _DRM_EVENT_NOTIFIER_H_ */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D26
