Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97D33E7;
	Tue, 12 May 2026 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544014; cv=none; b=nDZlHNMbDyKf8U1fEIISNUxfMgbsVGLPaGT2aiWgMW594bycUGPBT+BgFSM1YUG6+TFDLu6IuIc3XD0lxc3td16OBKt98Ic4bOKhkLSRTDxhLZ+elA6NdUThcTufFDTZQSWaBONnqHfbTQU9vAa/p/rWlRic5/ITFwdDg7AodI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544014; c=relaxed/simple;
	bh=FtwEDNz1C9yL56SDo/Ds6d6MvGf/4KDYqZXzVudJDmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jIm9IOvnK4ekh2nSZ0/fKJu2xiBUS7ZG1XxLfFmOtKoVR7Y99kWefPlGf2xMoDBMfxk6nIDtY9VS7Fp9wJTVst0LyBvuZMuphdB+lcjVbkJYUjWC3TBEgd3lyKa3fUCwB4tIf16KGXTQE0nptImO+FEo2Degq83BpIKhQNUh1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmRsYzN2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmRsYzN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1941DC2BCB0;
	Tue, 12 May 2026 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778544014;
	bh=FtwEDNz1C9yL56SDo/Ds6d6MvGf/4KDYqZXzVudJDmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SmRsYzN26I+1Odpndx2LJ4jCzYD8bffNU4vNX4FIsBDRDDLaD/ls9ywWUXaZ0VJui
	 MlkYSk5QyG+iSm06gfE0csswxU4pg0z4NYdQlo4/Ys+ikF/e562veB0qaE/zxG3qc0
	 oJ68AzQVgAOrUGuqyJCsATL3mlpfXOfU0R4JDXiDDk9ZuGSH8IuVZ48V9B4rSjKP0W
	 odIbU740Q1mupVjBVYY0GWW+oNFWVyhl7OfWNRCcJlLwheFwf/tIunCeFRdE7z6LpN
	 6fDyZnmfBpdNhUgQGuIyx9AOJ5YS88EFYUXaz0Vub5iQakNjnUhAFH0N1Hp0ffy58X
	 asueZdYONX4Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] remoteproc: imx_rproc: add autoboot support for
 A-core
Reply-To: sashiko@lists.linux.dev
To: "Jiafei Pan" <Jiafei.Pan@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511023928.39640-4-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-4-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:00:13 +0000
Message-Id: <20260512000014.1941DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unexported kernel symbols `psci_ops` and `cpu_logical_map()` are r=
eferenced, causing link errors when compiled as a module.
- [High] Unconditional invocation of `psci_ops.affinity_info` can lead to a=
 NULL pointer dereference.
- [High] Negative error codes and pending states from `psci_ops.affinity_in=
fo()` are incorrectly treated as 'ON' state.
- [High] State detection logic is flawed for multi-core configurations, pot=
entially booting an already running core.
- [High] Empty CPU mask logic error leads to incorrect auto-attaching to no=
n-existent cores.
--

commit af57d4202637d4c4549d5d1bd6d7af8d8a4bbb7e
Author: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

remoteproc: imx_rproc: add autoboot support for A-core

This commit adds autoboot support for Cortex-A Core remoteproc by
implementing PSCI state detection to manage CPU cores. It evaluates CPU
affinity and online status to set the remoteproc state accordingly.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 8a3de27c96b78..e8d239bef5c95 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1286,7 +1286,24 @@ static int imx_rproc_sm_detect_mode(struct rproc *=
rproc)
> =20
>  static int imx_rproc_psci_detect_mode(struct rproc *rproc)
>  {
> -	rproc->state =3D RPROC_OFFLINE;
> +	struct imx_rproc *priv =3D rproc->priv;
> +	unsigned int cpu;
> +	int cpu_aff;
> +
> +	rproc->state =3D RPROC_DETACHED;
> +	for_each_cpu(cpu, &priv->cpus) {
> +		cpu_aff =3D psci_ops.affinity_info(cpu_logical_map(cpu), 0);

Because CONFIG_IMX_REMOTEPROC can be built as a module, will referencing
psci_ops and cpu_logical_map() cause undefined reference errors during
modpost? Neither symbol appears to be exported to loadable modules.

Can psci_ops.affinity_info be NULL if the system runs an older PSCI version
like v0.1? Should we verify if psci_ops.affinity_info is populated before
dereferencing it to avoid a panic?

> +		if (cpu_aff =3D=3D PSCI_0_2_AFFINITY_LEVEL_OFF) {

The affinity_info callback can return negative values for errors, such as
PSCI_RET_NOT_SUPPORTED, or 2 for PENDING. Does this logic safely handle
those cases, or will it bypass this check and inadvertently leave the state
as RPROC_DETACHED if the CPU is not online in Linux?

> +			rproc->state =3D RPROC_OFFLINE;
> +			break;
> +		}
> +
> +		/* in psci on state but running Linux */
> +		if (cpu_online(cpu)) {
> +			rproc->state =3D RPROC_OFFLINE;
> +			break;
> +		}

If there is a multi-core cluster where CPU 0 is ON and running the remote
OS, but CPU 1 is OFF, this loop will evaluate CPU 1, set the state to
RPROC_OFFLINE, and break. Will this cause the remoteproc framework to
incorrectly attempt to boot the primary core while it is already actively
running?

> +	}
> =20
>  	return 0;
>  }

[ ... ]

> @@ -1391,7 +1408,6 @@ static int imx_rproc_probe(struct platform_device *=
pdev)
>  		bitmap_copy(cpumask_bits(&priv->cpus), &cpus_bits,
>  				min((unsigned int)nr_cpumask_bits,
>  				    (unsigned int)sizeof(unsigned long)));
> -		rproc->auto_boot =3D false;
>  	}

If the device tree property fsl,cpus-bits is missing because the bindings
specify fsl,cpus-mask instead, the cpus mask will be cleared. With an empty
mask, the detection loop is bypassed, leaving the state as RPROC_DETACHED.
Will removing rproc->auto_boot =3D false here cause the framework to attempt
an attach on a remoteproc instance with no assigned CPUs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511023928.3964=
0-1-Jiafei.Pan@nxp.com?part=3D3
