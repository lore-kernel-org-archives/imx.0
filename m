Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928A28C869;
	Mon, 11 May 2026 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541036; cv=none; b=rtJMEYRSTVYs3YNegBsFIUu+C5fb7y5XP5MajYtMc1KTehBnhiHB4/7V9q9YKf6NfxJ96UPLR5bXlJTf/QVd0pmC6dnY+VUjVRT6K5AAab5U/Vc3mD1ZsltPPR7oseViGBryRYaavML2oks2EszwfA0UIIyEyDLtU2jVWRNHdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541036; c=relaxed/simple;
	bh=BDAAGK/SUkFaNVMc6IBhN2SXY/XMwx9KwYIVA7okqCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+h67bWt1Q7+hLnbT9eF/e9IDX5ZRv1YH0ihjAwcGsoD2adSOtHCARc+qpoW+CibveBhEyxkqbTkGXyMgg9trSQYq3OVhVonqrBr/FJ89hVomYMKDuHl1MHfSDcOTpCuG6sWQ4EAgRbFUsjAFGe134W22ALvMx/48YesqLbrxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv4FLIJ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv4FLIJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C618CC2BCB0;
	Mon, 11 May 2026 23:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541036;
	bh=BDAAGK/SUkFaNVMc6IBhN2SXY/XMwx9KwYIVA7okqCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Iv4FLIJ8HMWNe5n7TFsXem/o3ayEC35tT3xl+R7i5vSgfC55Zy1Dmb6rLeaF26M1I
	 0fWZJadBAWwo9MqwBfeTQhSw6weUISz09LwNkAJNXDQuMcdJvoE1Rp+DMvDHJkfWjv
	 UYkmfE0G9wuimOTsYG3+SmhkG1Wdq+aDaxRsTI4xk1JECABb+a2KAVtuULIAkyGLXg
	 RlYegb5cj7m4mQa8W95MkAyYWL/I/Sd/8XRgqoK/3pR6E9P5oHR10OL+dt0EGXxP4R
	 9mF8VOcde16ICgK650yAUrLp1cZWOiphndTm/45zi/AexqqjT7r8b1pjsHUqTjKC4p
	 Kf8BpzNGU/x9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rproc: add support for Cortex-A
 Core
Reply-To: sashiko@lists.linux.dev
To: "Jiafei Pan" <Jiafei.Pan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511023928.39640-3-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-3-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:10:35 +0000
Message-Id: <20260511231035.C618CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] The CPU power-off polling loop in imx_rproc_psci_stop() silent=
ly ignores timeouts, leading to a critical Use-After-Free.
- [High] The error recovery path in imx_rproc_psci_start() improperly onlin=
es CPUs that were administratively offline.
- [High] The IMX_SIP_CPU_OFF SMC call is passed a Linux logical CPU ID inst=
ead of the hardware MPIDR.
- [Medium] The driver references internal kernel symbols (psci_ops and cpu_=
logical_map) that are not exported, causing module build breakage.
- [Low] bitmap_copy is erroneously called with a byte count instead of a bi=
t count, logically truncating the CPU mask.
--

commit 6acc0c2627860bf5f4e779a8968c861a2f039bd5
Author: Jiafei Pan <Jiafei.Pan@nxp.com>

remoteproc: imx_rproc: add support for Cortex-A Core

This commit adds Cortex-A remoteproc support. It uses PSCI and SIP SMC calls
to manage turning the Cortex-A cores on and off.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 0dd80e688b0ea..8a3de27c96b78 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
[ ... ]
> @@ -381,6 +392,45 @@ static int imx_rproc_sm_lmm_start(struct rproc *rpro=
c)
>  	return 0;
>  }
> =20
> +static int imx_rproc_psci_start(struct rproc *rproc)
> +{
[ ... ]
> +	cpu =3D cpumask_first(&priv->cpus);
> +	ret =3D psci_ops.cpu_on(cpu_logical_map(cpu), rproc->bootaddr);

Are the psci_ops and cpu_logical_map symbols exported for loadable modules?
If this driver is compiled as a module, will it cause linker errors due to
undefined symbols?

[ ... ]
> +err:
> +	for_each_cpu(cpu, &priv->cpus) {
> +		if (!cpu_online(cpu) && add_cpu(cpu) =3D=3D 0)
> +			cpumask_clear_cpu(cpu, &priv->offlined_cpus);
> +	}
> +
> +	return ret;
> +}

Could this rollback path inadvertently bring up CPUs that were
administratively offline before the driver started?

In the stop path, it checks cpumask_test_cpu(cpu, &priv->offlined_cpus) to
verify ownership. Should this rollback path use the same check to avoid
overriding system power policies?

[ ... ]
> @@ -456,6 +506,50 @@ static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
>  	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>  }
> =20
> +static int imx_rproc_psci_stop(struct rproc *rproc)
> +{
[ ... ]
> +	for_each_cpu(cpu, &priv->cpus) {
> +		/* Check CPU status */
> +		err =3D psci_ops.affinity_info(cpu_logical_map(cpu), 0);
> +		if (err =3D=3D PSCI_0_2_AFFINITY_LEVEL_OFF)
> +			continue;
> +
> +		/* Bring CPU to be off */
> +		arm_smccc_smc(IMX_SIP_CPU_OFF, cpu, 0,
> +			0, 0, 0, 0, 0, &res);

Does the firmware expect a logical CPU index or a hardware MPIDR here?

The adjacent psci_ops.affinity_info() call uses cpu_logical_map(cpu) to
translate it. Would passing the logical index directly cause the firmware to
shut down the wrong physical core?

> +		start =3D jiffies;
> +		end =3D start + msecs_to_jiffies(100);
> +		do {
> +			err =3D psci_ops.affinity_info(cpu_logical_map(cpu), 0);
> +			if (err =3D=3D PSCI_0_2_AFFINITY_LEVEL_OFF) {
> +				pr_info("CPU%d is killed (polled %d ms)\n", cpu,
> +					jiffies_to_msecs(jiffies - start));
> +				break;
> +			}
> +
> +			usleep_range(100, 1000);
> +		} while (time_before(jiffies, end));
> +	}
> +
> +	/* Return back freed CPU Core to Linux kernel */
> +	for_each_cpu(cpu, &priv->cpus) {
[ ... ]
> +	}
> +
> +	return 0;
> +}

If the polling loop times out after 100ms without reaching
PSCI_0_2_AFFINITY_LEVEL_OFF, does this function still return 0?

If it returns success while the remote core is still executing, will the
remoteproc core proceed to unmap the IOMMU and free the carveouts, leading =
to
a use-after-free when the still-running core accesses that memory?

Should it return an error like -ETIMEDOUT instead?

[ ... ]
> @@ -1274,6 +1383,17 @@ static int imx_rproc_probe(struct platform_device =
*pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed on imx_rproc_addr_init\n");
> =20
> +	ret =3D of_property_read_u32(dev->of_node, "fsl,cpus-bits", &cpus);
> +	if (ret) {
> +		cpumask_clear(&priv->cpus);
> +	} else {
> +		cpus_bits =3D cpus;
> +		bitmap_copy(cpumask_bits(&priv->cpus), &cpus_bits,
> +				min((unsigned int)nr_cpumask_bits,
> +				    (unsigned int)sizeof(unsigned long)));

Is the third argument to bitmap_copy intended to be a bit count rather than
a byte count?

Passing sizeof(unsigned long) requests a copy of only 4 or 8 bits. Should
this use BITS_PER_LONG to prevent logical truncation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511023928.3964=
0-1-Jiafei.Pan@nxp.com?part=3D2
