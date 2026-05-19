Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB572D249B;
	Tue, 19 May 2026 03:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161835; cv=none; b=fcuzgrf6xHfgpp7ZJHF9s6Yl1agHVEGbW1YY3JyPzWM+qgiJCl5ZsRXHp3evPbf/nd/fVzqnJErxP7q3qckBD25Zp1silqEfQ/jzldh+GjheG0GS8rD4N+XINR5elRNBFyy/7//1eIGdCL9EoXaj+asmlmJKfdSoTrdRa5SaqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161835; c=relaxed/simple;
	bh=jDpIpoeOuuZpMhAxA+QmW/ZhmfNfnugCjkKuwRo7s4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2HdoJUziOVe3MA4pKgz/TmR0UiJScSkSbYXL6zmwvdvSc22XAug5TSW9XcZ5sHdhopBrKOtply72QXyO03YaDpLuq4HDVXABJCWBfsvvnJiwOd83nwQIMzsFEju2FWM2NfWg/LUt7l9fpoDHQgO8E+TQCxEhgw3h6pFLYOwIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxWAHbGW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxWAHbGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68FFC2BCB3;
	Tue, 19 May 2026 03:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779161835;
	bh=jDpIpoeOuuZpMhAxA+QmW/ZhmfNfnugCjkKuwRo7s4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mxWAHbGWi1Ot5XAOApLONBwb/kyd8pOYB9TIQEMDtgZgm+Jr81dV77vj1MrXywx2a
	 FaBfa+hHsrc97FWZ83Ar/qGk1lYsb60jLpU8abRG4j8fYrX9YObABT/zdw6g/xpZTl
	 lw3DC19MIi+ompfGBttQzIEUQoNJdXywS3A3rMWXEHotQ0qgamyeUOnyVelOHzHqKj
	 8UgmcntFrhwTldV5BsxDiVYtkOlYTtNNrGbi7LSPkApwTdPNEVi0BZGooK0SDPfYRh
	 WHqtrxe/BM45pmi0yQ4dtbeaOq1RFZGPmYUyFMuQsVOLG4OV6ns/PxovO2l/ilPSHn
	 lP26wudtksy+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] media: synopsys: Add support for multiple
 streams
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260519-csi2_imx95-v4-3-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-3-84ea4bb78a88@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:37:14 +0000
Message-Id: <20260519033714.C68FFC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect pad arguments to `v4l2_subdev_state_xlate_streams()` sil=
ently corrupt stream masks and cause PM runtime underflows.
- [High] Propagating a remote subdevice disable error causes state desynchr=
onization and double PM runtime put on retry.
--

commit dc1fc68d798970cf70a238272f82256db2545536
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: synopsys: Add support for multiple streams

The driver is updated to support multiple concurrent streams by tracking
enabled streams with a bitmask, instead of only supporting single stream
operation. The hardware is now initialized only once for the first stream.

> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index f45466ede2bb7..92178a3dec5d5 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
[ ... ]
> @@ -539,26 +540,33 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l=
2_subdev *sd,
>  					       DW_MIPI_CSI2RX_PAD_SRC,
>  					       &streams_mask);
> =20
> -	ret =3D pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		goto err;
> +	if (!csi2->enabled_streams) {
> +		ret =3D pm_runtime_resume_and_get(dev);

Does this sequence properly handle the streams_mask translation?

The .enable_streams() and .disable_streams() operations are exclusively
invoked on source pads, meaning streams_mask represents the streams on
DW_MIPI_CSI2RX_PAD_SRC.

When calling v4l2_subdev_state_xlate_streams(), the driver passes
DW_MIPI_CSI2RX_PAD_SINK as pad0 and DW_MIPI_CSI2RX_PAD_SRC as pad1. However,
the helper expects *streams to be the mask for pad0.

Because the helper evaluates the SRC streams mask against route->sink_strea=
m,
translation will fail for any asymmetric routing where sink and source stre=
am
IDs differ.

On failure, streams_mask is mutated to 0. In enable_streams(), this results
in pm_runtime_resume_and_get() executing, but csi2->enabled_streams remaini=
ng
0.

Since the V4L2 core still marks the stream as enabled, userspace could
interleave symmetric and asymmetric stream enable/disable calls (e.g., enab=
le
symmetric -> PM get; enable asymmetric -> no PM get; disable symmetric ->
PM put; disable asymmetric -> PM put).

Could this sequence underflow the PM runtime usage counter and PHY power
count, breaking device power management?

[ ... ]
> @@ -583,10 +591,15 @@ static int dw_mipi_csi2rx_disable_streams(struct v4=
l2_subdev *sd,
>  					       &streams_mask);
> =20
>  	ret =3D v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)
> +		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
> =20
> -	dw_mipi_csi2rx_stop(csi2);
> +	csi2->enabled_streams &=3D ~streams_mask;
> =20
> -	pm_runtime_put(dev);
> +	if (!csi2->enabled_streams) {
> +		dw_mipi_csi2rx_stop(csi2);
> +		pm_runtime_put(dev);
> +	}
> =20
>  	return ret;

Could propagating the remote disable error here cause state synchronization
issues with the V4L2 core?

If v4l2_subdev_disable_streams() on the remote subdevice fails, the driver
proceeds to clear its local state (csi2->enabled_streams &=3D ~streams_mask=
),
shuts down the hardware, and calls pm_runtime_put() if the mask becomes 0.

The driver then returns the error to the V4L2 core. Because of this error,
the V4L2 core aborts and skips marking the stream as disabled, meaning the
framework still considers the stream active.

If userspace retries the disable operation, the driver will be invoked agai=
n.
Since csi2->enabled_streams was already cleared, !csi2->enabled_streams wou=
ld
evaluate to true again. This results in a redundant dw_mipi_csi2rx_stop() a=
nd
pm_runtime_put() being executed.

Could this lead to a PM usage underflow and illegal writes to powered-off
PHY registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-csi2_imx95=
-v4-0-84ea4bb78a88@oss.nxp.com?part=3D3
