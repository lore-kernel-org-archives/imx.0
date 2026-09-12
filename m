Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC314746B8;
	Sat, 12 Sep 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213572; cv=none; b=hpYBJgKBW2ZwqOD74ZldCcAVYZROVbZSNDbWoPjJZKE7gHL9odSKPJ6IF+xS1fG/CpTaA0kEyK6P1YcCpGiKCTf74r5p9WPbSfQOigYVVE4/kVY5J8sCePikKNifFi1nr4ljXkU8fQnFvak1fMwV2fqHQ0ho0ayPiVPds3mWyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213572; c=relaxed/simple;
	bh=Cxkw6T1BkcuVg0olYkWU9508hC4PU7vHafZ/RqOItRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQRGKhTl1PncOFV46JwD5H2LGlKDFYaIiVEJ1VOxY7q/gbkvYwlODPXw9UUEH8wLtPd1OvsA2RG2EaVLx++faIsPxg3HNkbduQnFXdGB7NHh8f+mizpTfz9Am3HkjUzCMqvUH20kwaqmT9sIoPnS8xeCg6IGMgGuaC/8OVVV3ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRuwQLI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRuwQLI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB9C1F00893;
	Sat, 12 Sep 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789213571;
	bh=O88S8l6R+j2urQ64+eHrke/qthP/tOpu/uAUYl84knM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GRuwQLI8AmhAGB2NJRyoGn3BW113WdWO9Tdi0eEWR2QmLjgz89Xqxei3Tk3EucCP3
	 XwQElGhSkPcs8KmmMyjO30U9MYm457lgjUrvbLT2leP4pMgO5Eh7Ei5fDNwVGRa/bx
	 xdRHtg0kOmXx4C/XizkoHc5cQBIaBNGMXDn+cKOb0TyHUjwoBG28UGqvzFOgzA2o0G
	 sP5yAFNjFmtj/22bzRcFxrwkmGn6K/tXGsMXL683fD6Ohq/K/5sIX/gshFtAoodKvq
	 SQltAoet+h3rxr1X2fm7+VeTeca5+OF0iJr5Jp1c4mX7w8I5RSYLSnv/yyWi7umaq5
	 5OHpC8+qcai5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v50 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 11:46:10 +0000
Message-Id: <20260912114610.DAB9C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Failing with `-ENOMEM` when `of_gen_pool_get` returns NULL break=
s probe ordering and prevents the driver from binding if the SRAM pool prob=
es later.
--

commit 88805176a44f81db2011a6e6ac5791578da01f8f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds an MU-based communication interface for the secure enclave.
The NXP hardware IP for secure-enclaves, like Edgelock Enclave (ELE), is
embedded in the SoC to support features like HSM, SHE & V2X.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> new file mode 100644
> index 0000000000000..0013c960ec43d
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static int se_if_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	if (if_node->pool_name) {
> +		priv->mem_pool =3D of_gen_pool_get(dev->of_node, if_node->pool_name, 0=
);
> +		if (!priv->mem_pool)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "Unable to get sram pool =3D %s.\n",
> +					     if_node->pool_name);
> +	}

[Severity: Medium]
Could this prevent the driver from binding if the SRAM pool probes later?

During system boot, if the SRAM driver defers its probe (for example, due to
pending clock or regulator dependencies), of_gen_pool_get() will return NUL=
L.

By unconditionally returning -ENOMEM here, does the secure enclave driver
permanently abort its initialization in se_if_probe() instead of returning
-EPROBE_DEFER to try again later? This would break all dependent functional=
ity
like HSM, SHE, and V2X on configurations where the SRAM pool probes later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-imx-se-if-=
v50-0-80834ef510d3@nxp.com?part=3D3
