Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31103F7888;
	Fri, 17 Jul 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286556; cv=none; b=NyO2P2ioq/cUEFJRljxeznddlr4YN5yYWsL64kWcGL22misn6UwF7OePt+PIk1ZecspVTCoE6mWxCOBTTWeFw0fua+rDcG37f8j7uJAel3VS096RKxCBqvq0Hf3tk3iAx72nd2Lvge3iIUO9EwYFZZMb6jOjFFcq4/BgN8p5kW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286556; c=relaxed/simple;
	bh=TnKMW3KIzDbiRS+WCCvbOX2d9PQkepWShG6g06xL/84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0M4/pRyTUEVaaTD778XB7axZngpE0nxFPQkHEsxXtq9lPR393vAHE6+RHh5HEAmz8PfYivXx4NZ5wQb+V2XCdMq2lwD7AKuN/QbwYlOjsDr2hhKMwlDhOQG/BkEScYdvPSaTmxwI7dV3BidS495cHzsvTNHmP5xDWD75t8sxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEBrkHwc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEBrkHwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F661F000E9;
	Fri, 17 Jul 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286543;
	bh=Yd4FjM1y0K+z4qkw3/6BpjEybSAgejUBHiNrNNQ4Q+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QEBrkHwchFxwIbuAx85NGa5SG65p/RyEDVXHOwgwsDfR2rq4RqLan9kItzasx2/Z4
	 kdcvhaQF/zU5/Qj/Rt4Ik83qKOhCboZY3ZUFOfUi/XqfXphQE7DWWmct8UK5qivoe8
	 lo1tKrN+6FVUCq94vGr3d09YhQvj9DM3J7E8pplANlEDd6+PJIkeb+fX3DGmwIyN3n
	 /UM4sbJZda63WPLAX9ginYmM9ssnA9GKhNuj4N4mSIvG1CAHM/9S+EYJ/4NEjgQw6r
	 /p0a/nKD02uTTNIDPp+I7JEjcm/qD4nHTEkaVpmm6/dsuGKVAGxEIECmbz6cTtMb0e
	 d/bVSCpIs030Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260717-imx-se-if-v28-6-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-6-0a9659c7e69d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:09:02 +0000
Message-Id: <20260717110902.F2F661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Bypass of the fw_busy circuit breaker when a signal interrupts=
 ele_msg_rcv() at or after the timeout deadline, leading to DMA memory corr=
uption.
- [Medium] The `hsm0` (`secure-enclave`) device tree node is missing the ma=
ndatory `memory-region` property, causing device tree schema validation to =
fail and the driver probe to unconditionally abort.
--

--- Patch [6]: [PATCH v28 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 241fbc418ec78fd2d90f05f09b33f7f8fd2d525e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node
   =20
Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.
   =20
Add label sram0 for sram@2201f000 and add secure-enclave node

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf388..182f1444b6434 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
[ ... ]
> @@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;
> +		};

[Severity: Medium]
Does this node need a memory-region property to probe successfully?

Looking at se_if_probe() in drivers/firmware/imx/se_ctrl.c, when the
compatible string has reserved_dma_ranges set to true (as this one does),
it calls of_reserved_mem_device_init().

If the memory-region property is missing, that function returns -ENODEV,
which the driver converts into a probe error:

	if (if_node->reserved_dma_ranges) {
		ret =3D of_reserved_mem_device_init(dev);
		if (ret)
			return dev_err_probe(dev, ret,
					    "Failed to init reserved memory region.");
	}

Will this cause the secure enclave device to unconditionally fail
initialization out-of-the-box?

[Severity: Critical]
Is it possible for the driver's firmware busy circuit breaker to be bypassed
when communicating with this device?

Looking at ele_msg_rcv() in drivers/firmware/imx/ele_common.c, if a signal
interrupts wait_for_completion_interruptible_timeout() at or after the
timeout deadline, an early break bypasses the circuit breaker:

		if (is_rsp_wait_with_timeout) {
			if (time_after_eq(jiffies, deadline_jiffies)) {
				ret =3D -ETIMEDOUT;
				break;
			}
			remaining_jiffies =3D deadline_jiffies - jiffies;
		}

Because this breaks early, the loop skips the call to se_mark_fw_busy().

Later, in se_dev_ctx_shared_mem_cleanup() in drivers/firmware/imx/se_ctrl.c,
since the fw_busy flag wasn't set, the DMA memory allocator resets the buff=
er
position to 0:

	is_fw_busy_dev_ctx =3D se_is_fw_busy_ctx(dev_ctx);

	/* ... */

	if (!is_fw_busy_dev_ctx)
		se_shared_mem_mgmt->non_secure_mem.pos =3D 0;

Could this allow the active firmware DMA to overwrite the memory of
subsequent requests since the firmware is still running and will DMA
to the shared buffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx-se-if-=
v28-0-0a9659c7e69d@nxp.com?part=3D6
