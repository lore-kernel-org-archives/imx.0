Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72C3EB7E5;
	Mon, 13 Jul 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943236; cv=none; b=eVUlX6bOZnk5E9kfjHcw9Ec97O3FvVAQhVDILoPwQWRo+hiTehr5RNow5+H54u82KMLbAjXSdy2roa8DBd0MTrPPTUgkHDotf22nBIZ7WJe+Z96k7lcvOAYIktZNAMjt5yhFb7hA7dzZxKgh187KszBJIyuEiU8p1PTfUOX6obU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943236; c=relaxed/simple;
	bh=IYlhCTMZSXD9p/4HMZM5y8vlb6MoTsrIgv4mAE/jJ5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ll6Be/M8y9T5T+vO479tq5OTpa2lFEs/Y5N+uVxWGSqkiY4+xfu9s4448M6KPLcQ/lnP7AxU8FVJnCOMKyzcPW09kLhgwqJJ8SKWHqDH9lMX+SVS70MAr6yA2ksKxXE+S5gTdoQD0M1NWuY3um6btPlH6thNRWGB/gNE6BrKanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqDxFZdf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqDxFZdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7061F000E9;
	Mon, 13 Jul 2026 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943234;
	bh=F9Y5wmd0OMGDcMsnLjUMdDrWMZUpmnNlVL6E87GpvTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqDxFZdfXq3apogr1vWekuYy5yOsGSPlqesAGsFEzG2DzFT2Pcskr/j5kPCbIlDcs
	 KnX9cPuW6w8qlV50YwVUdeFsw4ysKm0F6iZZBB9KGm9lPBnyquql1DudwP9aYHHPhn
	 oiq9HWuQbxPdrytF0ACI4SQI6AG4Wi/1xb+47YEx5usk3eQZO+GTAYx84h9KgV2H4n
	 flQ+C9VEEGygJQUP82jhFD/3A+7VhyfJTPVC54L9ag8Jg760Ttuh0sAWZ/2mYGpC8c
	 ii196VHBh8JXpTg4cgBGzoE+XErnjgG91NQ5zJz5XO5L0e+3Uj6T0hjXxHrc3hBKAn
	 6dHCqdHxs/zAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/18] arm64: dts: ti: k3-j721e-main: Add multiple
 channels for CSI2RX DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260713113423.2310443-3-y-abhilashchandra@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:47:14 +0000
Message-Id: <20260713114714.9A7061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver unregisters contexts before unregistering the async and=
 PM notifiers in remove(), leading to Use-After-Free and data corruption.
- [High] The driver permanently leaks all requested DMA channels during pro=
be failures and device removal because DMA channel release incorrectly reli=
es on the PM runtime status.
- [High] ti_csi2rx_runtime_resume() leaks successfully requested DMA channe=
ls when failing to initialize a subsequent context.
- [High] Missing pm_runtime_disable() on probe error paths after pm_runtime=
_enable() was called.
--

--- Patch [2]: [PATCH v2 02/18] arm64: dts: ti: k3-j721e-main: Add multiple=
 channels for CSI2RX DMA ---
commit 9792c8b4a6bb16010ee3d8cdeef37baa49738183
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-j721e-main.dtsi
> index 5a8414fc57519..b1988437f52dc 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
> @@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
>  		ranges;
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
> -		dmas =3D <&main_udmap 0x4940>;
> -		dma-names =3D "rx0";
> +		dmas =3D <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x49=
42>,
> +		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945=
>,
> +		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948=
>,
> +		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b=
>,
> +		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e=
>,
> +		       <&main_udmap 0x494f>;
> +		dma-names =3D "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
> +			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";

[Severity: High]
This is a pre-existing issue, but does increasing the number of DMA channels
here make a leak in the driver's resume path more likely to occur?

Looking at drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c,
ti_csi2rx_runtime_resume() loops over all contexts:

	for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
		ret =3D ti_csi2rx_init_dma(&csi->ctx[i]);
		if (ret)
			return ret;
	}

If initialization fails for a subsequent context, does it return immediately
without releasing the successfully requested channels from prior iterations?

[Severity: High]
This isn't a bug introduced by this patch, but do the DMA channels get
permanently leaked on probe failures or driver unbind?

In drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:
ti_csi2rx_cleanup_ctx() checks the runtime status:

	if (!pm_runtime_status_suspended(ctx->csi->dev))
		dma_release_channel(ctx->dma.chan);

During probe, DMA channels are requested before PM runtime is activated.
If probe fails, pm_runtime_status_suspended() returns true, causing the
cleanup to skip releasing the channels.

Similarly, in ti_csi2rx_remove():

	if (!pm_runtime_status_suspended(&pdev->dev))
		pm_runtime_set_suspended(&pdev->dev);

Since the driver forcefully sets the suspended state without invoking the
runtime suspend callback, will ti_csi2rx_cleanup_ctx() again skip releasing
the channels?

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk during
driver unbind?

In drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_remove(),
the contexts are cleaned up before the notifiers are unregistered:

	for (unsigned int i =3D 0; i < csi->num_ctx; i++)
		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);

	ti_csi2rx_cleanup_notifier(csi);
	unregister_pm_notifier(&csi->pm_notifier);

If a system suspend or async notifier completion happens concurrently during
unbind, could it trigger callbacks that access the already destroyed
ctx->mutex or unregistered video_device?

[Severity: High]
This isn't a bug introduced by this patch, but does the probe error path
leave the device with an unbalanced PM runtime enable count?

In drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:ti_csi2rx_probe(),
PM runtime is enabled:

	pm_runtime_enable(csi->dev);

	ret =3D ti_csi2rx_notifier_register(csi);
	if (ret)
		goto err_ctx;

Should the error paths (err_notifier, err_ctx) call pm_runtime_disable() to
clean up the enable count properly?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713113423.2310=
443-1-y-abhilashchandra@ti.com?part=3D2
