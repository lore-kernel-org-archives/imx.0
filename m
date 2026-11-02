Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578580;
	b=G/2pBMYrNghknRBoAFzOCWH74369E9qW7a9PthfOK3bpgcBcooYDd7SpkMwgpct/sBmI
	 lpaQT2F5toK7ZnOfBRrviG388B1Cty4uhVRqa6sragnRI05Kmh1AYhHR4FOsyO+PdjdZI
	 s3w+Nj9VYALjjfvcv4H5Agb6lvlWwRC8A3HP7vt+EW+lIyCxW6r4NGsznqLNSN1Eiqn8d
	 /LeOQPbG3C8Z0YiDgK7ohSBwv1H3uHYPtw6TzfTTDw3dXs5t425h44AO1j9Q5ZjdO1MYP
	 Tp6m1prtYvfLAI088UuuJyykdbc4zfIzdM4/8A1BbdGyFgdlZ1Qj9Ddgez42ZFGvYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578580;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CFTQ8i5kvLroXvvGM2N06o5LjB0QVRIRg4MJYZWDvE4=;
	b=yDykSMgho9wPJcmsAoNL1gwwa/BXXAxBsRUG/hj1hVCPpDhelmKq9SI2JVafRUS2Nsg3
	 q61SKp6AAWFg8HqTTarkzQEVPZwJ7rjPPedex3Dp0uTYQzVuESwSqSHwrFEisDBEhAeH5
	 MkVd4TqT1eJlzuM/p56r0iKN/QDdaegM4SqWKkvPWYJREAMtWkhCBtZpj5udjHNNDn1B1
	 /dHAJh1J2jcDjLXfKNLOg1Y751qetQce6v3jlZx/Heg5KEMm5P3jxeNYwzYpu07N1dS5o
	 +EEAx8dVP0Amew4HQx0M0yrG+xzhWk+hvHLE0oy7Q8BYVUvRKPPOA57200VqIF+8Z4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xb0c4kJi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1A606A324;
	Mon,  2 Nov 2026 00:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xb0c4kJi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283CA1F000C1;
	Mon,  2 Nov 2026 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793578579;
	bh=CFTQ8i5kvLroXvvGM2N06o5LjB0QVRIRg4MJYZWDvE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xb0c4kJi455KvrjSvErmDTORlon/LPBWd1IyQCzYT+YNG+o4QQUhwTxuArugsKm20
	 mh3qXwzq+kzRs/IgBzDgY5dUfBxbmw7lYShsc66vj4hIweu6HQMS6xIZMqvw0Z8MIy
	 uDzblAU38JXA98na7CbZqOQscxKlsPpGHEmQ7/tWSicULp7AVMQLiS1QeupC9Grrty
	 AUN57A28FR1Kxp0/J1JrrDSzBs5eP5UgLy8z9iG19RJKeWOjUOiatQwiHaGIdbQXP6
	 Epnsa6CH1hEpeBKl41e9sGh51fRDgk2SFRgwxCOlpKBbM684OsDu+abeKa4D08fpJ2
	 ZvgQmX/83VX/w==
Message-ID: <sashiko-outbox-192792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 11/11] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Valla" <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-remoteproc_virtio_map-v2-11-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-11-26b300e01c62@valla.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 00:16:18 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] remoteproc: virtio: unreleased reserved memory and dangling dev ptr
- [Medium] arm64: dts: imx93-11x11-frdm: PoC multi-vdev changes not meant f=
or integration
- [Medium] remoteproc: missing dma_mask and dma_range_map leak on DT vdevs
- [Medium] arm64: dts: imx93-11x11-frdm: fw_devlink moves v_gpio consumers =
to cm33
--

commit 36664d55421d235cfeb718886d0f002fe5e55c01
Author: Francesco Valla <francesco@valla.it>

PoC: arm64: dts: imx93-11x11-frdm: add multiple vdevs

This commit adds reserved-memory regions and devicetree nodes to
imx93-11x11-frdm.dts for a proof-of-concept multi-vdev Cortex-M33 firmware
configuration exposing rpmsg, entropy, GPIO, I2C, SPI, and CAN virtio
devices.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx93-11x11-frdm.dts
> index 6e8351d120160..84324b02c45dc 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -137,3 +137,191 @@ MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
>  		>;
>  	};
>  };
> +
> +/* Multi-vdev PoC */
> +
> +#include <dt-bindings/input/linux-event-codes.h>
> +
> +/ {
> +	reserved-memory {
> +		rsc_table: rsc-table@2021e000 {
> +			reg =3D <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		/* vdev0: rpmsg */
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg =3D <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg =3D <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@a4020000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/* vdev1: entropy */
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg =3D <0 0xa4010000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ vdev1vring1@a4018000;
> +
> +		vdev1buffer: vdev1buffer@a4120000 {
> +			compatible =3D "restricted-dma-pool";
> +			reg =3D <0 0xa4120000 0 0x10000>;
> +		};

[Severity: Medium]
As reported by Sashiko on RFC [1], the commit message notes that this is a
proof-of-concept not meant to be integrated, and applying it directly to
arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts (which is also included =
by
imx93-11x11-frdm-pixpaper.dts) modifies the production board devicetree.

In particular, this shrinks vdev1vring0@a4010000 from 0x8000 to 0x1000,
deletes vdev1vring1@a4018000, repurposes 0xa4011000..0xa4020000 for
vdev2..vdev5 vrings, duplicates rsc_table, vdev0vring0, vdev0vring1, and
vdev0buffer from imx93-11x11-frdm-common.dtsi, carves out an extra 1.375 MiB
of RAM (0xa4120000..0xa4280000) as non-reusable restricted-dma-pool regions,
and adds board-level gpio-keys-virtio, leds, and eeprom@50 nodes tied to a
specific Cortex-M33 firmware image.

Would this break backwards compatibility with standard NXP MCUXpresso SDK
Cortex-M33 RPMSG firmware if merged into the main board DTS?

[ ... ]

> +&cm33 {
> +	memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> +			<&vdev3vring0>, <&vdev4vring0>, <&vdev5vring0>,
> +			<&vdev5vring1>, <&vdev5vring2>, <&rsc_table>;
> +
> +	virtio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		/* vdev1: entropy */
> +		vdev@1 {
> +			reg =3D <1>;
> +			memory-region =3D <&vdev1buffer>;
> +		};

[Severity: Medium]
When vdev@1..vdev@5 are registered in rproc_handle_vdev(), pdev_info.fwnode
is populated while pdev_info.dma_mask is left as 0:

drivers/remoteproc/remoteproc_core.c:rproc_handle_vdev() {
	struct platform_device_info pdev_info =3D {
		.parent =3D dev,
		.name =3D "rproc-virtio",
		.id =3D PLATFORM_DEVID_AUTO,
		.data =3D &rvdev_data,
		.size_data =3D sizeof(rvdev_data),
	};
	...
	fwnode =3D rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
	pdev_info.fwnode =3D fwnode;
	...
	pdev =3D platform_device_register_full(&pdev_info);
}

Because pdev_info.dma_mask is 0, pdev->dev.dma_mask remains NULL when
really_probe() -> platform_dma_configure() -> of_dma_configure() ->
of_dma_configure_id() runs before rproc_virtio_probe(). In
of_dma_configure_id(), !dev->dma_mask triggers dev_warn(dev, "DMA mask not
set\n") for every vdev with a matching DT node.

In addition, if an ancestor DT node defines dma-ranges, of_dma_configure_id=
()
allocates a struct bus_dma_region array via of_dma_get_range() and assigns =
it
to dev->dma_range_map, which rproc_virtio_probe() -> copy_dma_range_map()
then overwrites without freeing:

drivers/remoteproc/remoteproc_virtio.c:copy_dma_range_map() {
	new_map =3D kmemdup_array(map, num_ranges + 1, sizeof(*map), GFP_KERNEL);
	if (!new_map)
		return -ENOMEM;

	to->dma_range_map =3D new_map;
}

Does probing these DT-described vdevs trigger the "DMA mask not set" warning
and leak the dev->dma_range_map array allocated by of_dma_configure_id()?

[Severity: High]
Because vdev@1..vdev@5 have an OF fwnode whose memory-region points to a
restricted-dma-pool, really_probe() calls:

  platform_dma_configure()
    -> of_dma_configure_id()
      -> of_dma_set_restricted_buffer()
        -> of_reserved_mem_device_init_by_idx(&pdev->dev, of_node, i)

before rproc_virtio_probe() runs, adding a struct rmem_assigned_device entry
with rd->dev =3D &pdev->dev to the global of_rmem_assigned_device_list.

However, of_reserved_mem_device_release(&rvdev->pdev->dev) and
dma_release_coherent_memory(&rvdev->pdev->dev) are only called in
rproc_virtio_dev_release() when the child struct virtio_device is released:

drivers/remoteproc/remoteproc_virtio.c:rproc_virtio_dev_release() {
	of_reserved_mem_device_release(&rvdev->pdev->dev);
	dma_release_coherent_memory(&rvdev->pdev->dev);
}

Neither rproc_virtio_remove() nor the error paths in rproc_virtio_probe() a=
nd
rproc_add_virtio_dev() release the memory region attached to &pdev->dev.

If rproc_virtio_probe() fails after platform_dma_configure(), if
rproc_fw_boot() or rproc_attach() fails before rproc_start_subdevices()
reaches this rvdev and cleans up via rproc_resource_cleanup() ->
platform_device_unregister(rvdev->pdev) -> rproc_virtio_remove(), or if
kzalloc_obj(*vdev) in rproc_add_virtio_dev() returns -ENOMEM after
rproc_virtio_init_vdev_mem(), won't rvdev->pdev be freed while its
rmem_assigned_device entry remains on of_rmem_assigned_device_list with a
dangling rd->dev pointer?

> +
> +		/* vdev2: GPIO */
> +		vdev@2 {
> +			reg =3D <2>;
> +			memory-region =3D <&vdev2buffer>;
> +
> +			v_gpio: gpio {
> +				compatible =3D "virtio,device29";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +		};

[Severity: Medium]
Here v_gpio is placed under &cm33/virtio/vdev@2 and referenced by the
top-level gpio-keys-virtio and leds consumer nodes.

When imx_rproc_probe() finishes probing &cm33, devm_rproc_add() ->
rproc_add() either schedules rproc->boot_work asynchronously or leaves the
remoteproc offline if auto_boot is false, returning 0 before
rproc_handle_vdev() or register_virtio_device() creates any child devices.

When imx_rproc_probe() returns 0, really_probe() -> driver_bound() ->
device_links_driver_bound(&pdev->dev) runs
fw_devlink_pickup_dangling_consumers(&pdev->dev) on &cm33. Because the
descendant fwnodes virtio, vdev@2, and gpio (v_gpio) all have
fwnode->dev =3D=3D NULL at that point, __fw_devlink_pickup_dangling_consume=
rs()
marks them with FWNODE_FLAG_NOT_DEVICE and moves v_gpio's consumer links
(gpio-keys-virtio and leds) onto &cm33.

When the remote processor is later stopped via rproc_shutdown() or undergoes
crash recovery via rproc_trigger_recovery(), &cm33 stays bound while
rproc_vdev_do_stop() unregisters the virtio-gpio device and gpiochip_remove=
()
tears down the gpio_chip and frees active GPIO IRQs. Because gpio-keys-virt=
io
and leds only have a managed device_link to &cm33 rather than to the GPIO
device, won't they remain bound to a dead gpio_device across remoteproc
stop/restart cycles?

[1] https://lore.kernel.org/r/20260916-remoteproc_virtio_map-v1-12-dac8c5eb=
4aa9@valla.it

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-remoteproc=
_virtio_map-v2-0-26b300e01c62@valla.it?part=3D11
