Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422762;
	b=1vAxHoYUfLSWbFOzVNoj0WNnS+5Ilx4giaCPnO1Y+5yzyDcHJ6kbKelpycx1I/FfDnam
	 QBNq/oO2zJCRPkSoIwDKuy9RqshF22Uc+Kt7k8hwB1arRMZ1KSweVccofa2FqBhaR0XKR
	 ityH+PuyyT/bY9GSe0xb2C3Pr9hW4q2J3vpJCIitu6pSx5ezKqvi5ZyDYKVuK2nzZELp8
	 V0zwIAe4aAyvpUhL6jKubULntig5Rw01Av4QIlW/TYGBhQQRJYPvYnmSUE3GkO70bJgIT
	 ycaFLjIQ8qClO/mTMkFNi8qH+y0wQITExfyAKlWR0iNN1zp5Q+eEzNu5WIaEV5JYFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422762;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iIpyOaXECDqrIP29D8LBoN6PCkxmxknOELMzFUhz4h8=;
	b=GDyPTZEa07uagATRYssPa9auS+iFUoqE3dFkz8coMefbrbhWCAy7wOlQCe7dOWJwgRD1
	 ERaMctffJflnN2ejN4cD5Z5W3PkZqcZb4UzBkQuqQBTnBdIAkcTXxs8+FyTn8IRDHdA5V
	 IFit1dBDgDki1mZIM4w5MAPzGEC3JLqGnurxkVrdYeEhxLzzepreyKGebjBsPDgGgOfu2
	 JHzuLRW2NpZYUZhtNvwxqXIj2KSMyLy87vCFeApMSmFYh8o0EvZnqrQEfWYInsfwiFF3F
	 9G+4MC3TDHjx6wa2N+WpSC0qhSZCdkIEdTw4bdI6ynoVzJpVP+POIb4VX1N5CJ7ZG4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ey7WW4p0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A26098A25
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ey7WW4p0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996D01F000C4;
	Mon, 19 Oct 2026 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422761;
	bh=iIpyOaXECDqrIP29D8LBoN6PCkxmxknOELMzFUhz4h8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ey7WW4p0+x7mXJ13MCKBhmCAik9IIsqSqlgNvsaQmwP3B2MOvdfxgYUbLXpJ0zqER
	 ZGWQ8+26nGwnd1Er8k178EVmPy4IBP0oxWf7KzTJ+Pw/shbN2H7yYCLTVPLpNCNL/W
	 1ZRYQ1dqJBy8uJ2iWZeN4QaRE1KelwPlElgUJss1jHmCT0y1e3FS4IZdQhUajaDWsu
	 8UnmhRYPAHCWCFYb7I7p8uqnCjLDhfpjxnkPGLO82VpeIP2v64lEkzM8ryP8Aqme//
	 j5+u4JkyTMahBysgONngU19hveblJ3tc1tk5RtWcoO72deSWpCrX+cjntK/wzryOus
	 A+OsXXsRSC5Iw==
Message-ID: <sashiko-outbox-177646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] firmware: imx: scu: manage mailbox
 channels and global handle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261019135441.1420968-392-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-392-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:12:41 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] firmware: imx: scu: missing irq channel cleanup in imx_scu_probe()
- [High] firmware: imx: scu: unmanaged soc_device in imx_scu_soc_init()
--

commit b4c62f6aa45071e2c25e829dc030f6a6f0c1e4ec
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

firmware: imx: scu: manage mailbox channels and global handle

This commit registers devres actions in imx_scu_probe() to release
requested mailbox channels and clear imx_sc_ipc_handle on probe failure,
and depopulates child devices if devm_of_platform_populate() fails.

> diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-sc=
u.c
> index 8c28e25ddc8a6..28d745ae06067 100644
> --- a/drivers/firmware/imx/imx-scu.c
> +++ b/drivers/firmware/imx/imx-scu.c
[ ... ]
> @@ -328,6 +344,9 @@ static int imx_scu_probe(struct platform_device *pdev)
>  	init_completion(&sc_ipc->done);
> =20
>  	imx_sc_ipc_handle =3D sc_ipc;
> +	ret =3D devm_add_action_or_reset(dev, imx_scu_clear_handle, sc_ipc);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D imx_scu_soc_init(dev);
>  	if (ret)

[Severity: High]
If devm_of_platform_populate(dev) fails later in imx_scu_probe(), does
imx_scu_soc_init(dev) leave behind an unmanaged soc_device whose attributes
point to freed devm memory?

In drivers/firmware/imx/imx-scu-soc.c, imx_scu_soc_init() caches sc_ipc in
imx_sc_soc_ipc_handle, allocates soc_dev_attr, soc_dev_attr->revision, and
soc_dev_attr->serial_number using devm on the SCU device, and registers the
SoC device with the unmanaged soc_device_register():

drivers/firmware/imx/imx-scu-soc.c:imx_scu_soc_init() {
	ret =3D imx_scu_get_handle(&imx_sc_soc_ipc_handle);
	if (ret)
		return ret;

	soc_dev_attr =3D devm_kzalloc(dev, sizeof(*soc_dev_attr),
				    GFP_KERNEL);
	...
	soc_dev_attr->revision =3D devm_kasprintf(dev, GFP_KERNEL, "%d.%d",
						(val >> 4) & 0xf, val & 0xf);
	...
	soc_dev_attr->serial_number =3D devm_kasprintf(dev, GFP_KERNEL,
						     "%016llX", uid);
	...
	soc_dev =3D soc_device_register(soc_dev_attr);
}

In drivers/base/soc.c, soc_device_register() stores the soc_dev_attr pointer
directly in soc_dev->attr.

When devm_of_platform_populate(dev) fails, devres_release_all(dev) frees
soc_dev_attr, revision, serial_number, and sc_ipc while soc_dev remains
registered on soc_bus_type and imx_sc_soc_ipc_handle stays set to the freed
sc_ipc. Reading /sys/bus/soc/devices/socX/* via soc_info_show() or calling
soc_device_match() will then dereference freed memory.

Should imx_scu_soc_init() also register devres cleanup to call
soc_device_unregister(soc_dev) and clear imx_sc_soc_ipc_handle?

> @@ -340,7 +359,11 @@ static int imx_scu_probe(struct platform_device *pde=
v)
> =20
>  	dev_info(dev, "NXP i.MX SCU Initialized\n");
> =20
> -	return devm_of_platform_populate(dev);
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		of_platform_depopulate(dev);
> +
> +	return ret;
>  }

[Severity: High]
Similarly, when devm_of_platform_populate(dev) fails here after
imx_scu_enable_general_irq_channel(dev) has succeeded, doesn't the
unmanaged state in drivers/firmware/imx/imx-scu-irq.c remain active while
its devm-allocated backing structures are freed?

Before devm_of_platform_populate(dev) is called, imx_scu_probe() invokes
imx_scu_enable_general_irq_channel(dev):

drivers/firmware/imx/imx-scu-irq.c:imx_scu_enable_general_irq_channel() {
	ret =3D imx_scu_get_handle(&imx_sc_irq_ipc_handle);
	if (ret)
		return ret;

	cl =3D devm_kzalloc(dev, sizeof(*cl), GFP_KERNEL);
	if (!cl)
		return -ENOMEM;

	cl->dev =3D dev;
	cl->rx_callback =3D imx_scu_irq_callback;

	/* SCU general IRQ uses general interrupt channel 3 */
	ch =3D mbox_request_channel_byname(cl, "gip3");
	...
	INIT_WORK(&imx_sc_irq_work, imx_scu_irq_work_handler);

	if (!of_parse_phandle_with_args(dev->of_node, "mboxes",
				       "#mbox-cells", 0, &spec))
		i =3D of_alias_get_id(spec.np, "mu");
	...
	wakeup_obj =3D kobject_create_and_add("scu_wakeup_source", firmware_kobj);
	...
	ret =3D sysfs_create_file(wakeup_obj, &wakeup_source_attr.attr);
}

If devm_of_platform_populate(dev) fails, devres frees cl and sc_ipc and
clears imx_sc_ipc_handle, but nothing tears down the state created in
imx_scu_enable_general_irq_channel():

1. The "gip3" mailbox channel ch is not freed with mbox_free_channel(ch),
   leaving chan->cl pointing to the freed mbox_client cl (which causes a
   use-after-free in imx_scu_irq_callback() on a gip3 interrupt and causes
   __mbox_bind_client() to return -EBUSY on any later probe retry), and
   imx_sc_irq_work is not cancelled.

2. imx_sc_irq_ipc_handle remains non-NULL and points to the freed sc_ipc, so
   callers such as imx_scu_irq_group_enable() pass the
   !imx_sc_irq_ipc_handle check and dereference freed memory in
   imx_scu_call_rpc().

3. wakeup_obj and wakeup_source_attr are leaked under
   /sys/firmware/scu_wakeup_source (in addition to spec.np from
   of_parse_phandle_with_args() never being released with of_node_put()).

Could imx_scu_enable_general_irq_channel() register devres actions to
clean up the gip3 channel, imx_sc_irq_work, imx_sc_irq_ipc_handle, and
wakeup_obj when probe fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-392-sashal@kernel.org?part=3D1
