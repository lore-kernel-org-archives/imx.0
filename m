Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB146D086;
	Wed, 19 Aug 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146428; cv=none; b=XnO7dovQk5Lpu1Eri2lnZNLBD9MOlc6iNFzH9ce0rl4pVW9aVOFD3meij+V8ofqwMHPk9pKkjY93GPM9J6wj0zWsHmqC8dt6C13INCQP1tLdzywsFKIdjrXaIMY7qyVz/Pdgfojr68GMC3u9xoJEpkqikBwyXwBDc8CHZOxJ200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146428; c=relaxed/simple;
	bh=F0O8tswZnJZ1cgHZUGoeaB2ZKSV4ZqULotochqGsP8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Czhg936Vdjlj8iK5G3a5fDjdd/6Qudy8utcH3B5F7az7OTpePu0YxAkPqVrXS+m5+rwxFOxiwqGqUcWCCbRly26tQYiYPFEr5gEZkHAFFvzDh/yqvAR8JJYJjcmZpvmAQLxwW86BFQSBIrGd+c8MBPfc+786ANOfeqKGLddMJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7f8Q/qv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7f8Q/qv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93521F000E9;
	Wed, 19 Aug 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787146427;
	bh=fNpL6V4gm2ay5UoWRYJd8vXBJPfwBHLeYmJMEyGVCC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S7f8Q/qvKomAhJ/lTmHaiir5G2Mwh5lhME/K6exAxka+8pccJe0ZQTUv7WF7tYDKH
	 oOOmJvHy+hEJXhvyL9QyM9cJHlXdDOkbKxb8LM1m3tZf30I0B/ky6cqYUcqCu8a+0Q
	 v1J2kvpjX2w1cjOWtHi75HoMEPvfzLqVTxzyUeDWFC8D7HHj117E0NDondFRBEzqsz
	 Ijw0kr3aPHQYbej3a4ynv/iarwPOOeLGAWVTkzXbWTXrMkvG7QmnxyFlmEToMprFvm
	 Y5mMiWD3fJp6ITxpooySdwfgCp8J91EVALhip0kx3GyGk964FrzanUfSLlkwtCpG3d
	 CUUrDs7t0nNKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v38 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-imx-se-if-v38-7-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
 <20260820-imx-se-if-v38-7-5df4a4cff736@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:33:46 +0000
Message-Id: <20260819133346.C93521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The dynamically allocated `ele-reserved` `no-map` node lacks an `a=
lignment` property, leading to unaligned `no-map` memory boundaries that ca=
use driver initialization failure via `memremap()`/`ioremap()` restrictions.
--

--- Patch [7]: [PATCH v38 7/7] arm64: dts: imx8ulp: add reserved memory for=
 EdgeLock Enclave ---
commit 823a1957195d7807067b0fe5d633790925b23c7b
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add reserved memory for EdgeLock Enclave

This commit reserves 1MB of DDR for the EdgeLock Enclave in a new shared
imx8ulp-firmware.dtsi file. The allocation is constrained to a specific
address window to allow dynamic placement by the kernel.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8ulp-firmware.dtsi
> new file mode 100644
> index 0000000000000..e4bc352f68afb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
[ ... ]
> @@ -0,0 +1,31 @@
[ ... ]
> +/ {
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		ele_reserved: ele-reserved {
> +			compatible =3D "shared-dma-pool";
> +			alloc-ranges =3D <0 0x80000000 0 0x30000000>;
> +			size =3D <0 0x100000>;
> +			no-map;
> +		};

[Severity: High]
Should this dynamically allocated no-map region include an alignment proper=
ty?

Without an explicit alignment, early_init_dt_alloc_reserved_memory_arch()
defaults to SMP_CACHE_BYTES (128 bytes). If the memblock allocator places
the region at a non-page-aligned physical address, the no-map region can
split a physical page.

During driver initialization, dma_init_coherent_memory() calls memremap()
to map this reserved pool. On arm64, this invokes ioremap(), which strictly
verifies that the target PFN does not overlap linearly mapped System RAM.

Because the physical page starts before the unaligned no-map region, it
evaluates as regular mapped RAM. This triggers the architectural safety che=
ck
prohibiting the mapping of RAM as I/O memory, causing ioremap() to warn and
return NULL, preventing the driver from initializing.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-imx-se-if-=
v38-0-5df4a4cff736@nxp.com?part=3D7
