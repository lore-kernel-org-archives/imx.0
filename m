Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850230214B;
	Wed, 29 Jul 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331232; cv=none; b=t+BdCN86NFCFuk61ZEplLehD0TxT8R3Hy01yJNfMMYunZCyHXT7zc7Vij/mHw2XeJxzDvl8OXl6kc3V0EKiT5decni78pLSIECK7+x69dd0wo7tpRXHn9aSDGTTx88aqA/RdT7nf+Qvbdb6oXPvg+RMj5xQWYfH8Ux0bqZ5KFRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331232; c=relaxed/simple;
	bh=U/NMDFTCpnuyg54N8wD3GdJRAVFigtmYJZzpfI8QEZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nvzQ7xvEMUTA/Cl1CSBn6Z3EEfqcZwXOpNAlkzI7p0HTmpJAdp1t7DczXDivpP2WD5lLzoyfY21HGbYDhCU30oMn16fNjiTFcIadd8KFaTgc5IyaQIX6W2D+8f8iTcaHeFM2PGdTpS0ZvDKoNuaMPmuXbXyo/KH7q2HfxAMyc8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRuPUJg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRuPUJg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF8F1F00A3A;
	Wed, 29 Jul 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331231;
	bh=wGQodtaTXTxH+/RhzI6Faf01MAGNfuuMdQ1Qj/IFWlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cRuPUJg8HnKvbSwVSKMR6ftr3BCZEvR5W2McHacBZKd67OiMSlhUoYK4cf2zcCmUO
	 9loRqsin884kfqV9uYuCxkG/4KwXmDLLxI1CBYe++lj54Q0pUgA702hdA9eVbaDi+c
	 ldcIk69SJruCVR2gRceqI0Cja+I/b6SE9kmP2c5DSD8pMX2ud+vfmBbWrlTdnC1QD+
	 VPduFFUTEhEuWHIvG7CAUD324pIR0PSsf+xmsJ0I0gSNq9+dHmVSZlhA7e7vtPyuGo
	 Xkv2Vz3qbvuE5t+PuyhTNCj2iLacyKwyTWFS8kVg7x4NUZOpOmHc67elHAdCtRIARz
	 GRaguW/1NQPKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] arm64: dts: imx8qm-mek: fix dsp reserved
 memory node names for remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-rproc-dts-v2-3-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <20260729-rproc-dts-v2-3-debbe0816202@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:20:30 +0000
Message-Id: <20260729132030.AFF8F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of `rproc_work` leads to Use-After-Free on dr=
iver unbind.
--

--- Patch [3]: [PATCH v2 03/12] arm64: dts: imx8qm-mek: fix dsp reserved me=
mory node names for remoteproc ---
commit ccca82516c9f0cb91d5a0dd4d02b6d18ce2a6c7e
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8qm-mek: fix dsp reserved memory node names for remoteproc

The imx_dsp_rproc driver checks for the name "vdev0buffer" to skip
mapping the vdev buffer region, as it is handled by
rproc_add_virtio_dev. With the node named "memory", the check fails
and the region gets unnecessarily mapped.

Rename the DSP reserved memory nodes to use proper names for
consistency with other remoteproc reserved memory regions and to
ensure the vdev0buffer check works correctly.

Rename the DSP reserved memory nodes to use the expected names so
the driver can correctly identify and handle each region.

Fixes: d0ee7ae8ce26 ("arm64: dts: imx8qm-mek: enable dsp node for rproc usa=
ge")
Signed-off-by: Peng Fan <peng.fan@nxp.com>

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/bo=
ot/dts/freescale/imx8qm-mek.dts
> index 8b67fb5d670da..1afa65bd955ec 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
[ ... ]
> -		dsp_vdev0buffer: memory@94300000 {
> +		dsp_vdev0buffer: vdev0buffer@94300000 {
>  			compatible =3D "shared-dma-pool";
>  			reg =3D <0 0x94300000 0 0x100000>;
>  			no-map;

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing cancellat=
ion
of rproc_work in the imx_dsp_rproc driver that could lead to a use-after-fr=
ee
on driver unbind?

In drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_probe():

	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);

And later in imx_dsp_rproc_rx_tx_callback(), the work is scheduled:

	default:
		schedule_work(&priv->rproc_work);
		break;

Because the driver does not define a remove callback and relies entirely on
devres cleanup, the work is never explicitly cancelled (e.g., via
cancel_work_sync()).

During driver unbind, devm_rproc_alloc teardown will free the rproc structu=
re,
along with its embedded priv. If the scheduled work executes concurrently o=
r is
pending on the system workqueue, it will access the freed priv->rproc, lead=
ing
to a use-after-free.

Could a devres action be added to properly flush and destroy this workqueue
before the rproc is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v2-0-debbe0816202@nxp.com?part=3D3
