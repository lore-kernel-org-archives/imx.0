Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A25B3E171F
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719804; cv=none; b=t0GDgvmg0WZHDq7FyaAcU8y8VjOaWLzKUlJnrJVjCQo67O5YcSNxkGDq3wcDWB3oF2DQ7TsK/b+SOqPTwJ8HRHHoSRO1UkRVcU5pEsLOHE0oKa1HKiJIqBs/5Cen26R+2Kula1/vmdLIxFaqXD5j6w+uhFgJ0bXRMwOdkey587c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719804; c=relaxed/simple;
	bh=O054CY/T/Q+1F+UaMK3hsiZeVaUk/LR0GWoHXFVtXVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NV2eC15RbarKZu9chltv5hQ5LoXc43k/OocQDXp5dBKtsInl8sjnBSaYdBo68UY/RyUiugvdbdnrFm1r3G+gWnYkw28eZK8q3lncICd7MGe8jUVUASuLNJcTuQDr3+Eav+Z907uPHWWmL7BH5aTQrVouyTtM5E2MqKSrZ2SbmYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kStn6XxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kStn6XxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338621F000E9;
	Mon, 29 Jun 2026 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782719801;
	bh=A2EUs4VBtgsTArqvBiEEPAKRyG6GGvy2cuMsxX6Nk4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kStn6XxLS7qCbFozzho4LhdCZln7zpcZ4d71kfDUsKNMeGY4DuA2vdFdca05WwywJ
	 1W7d14fQ9CuwFI55hlW+rNKb1v1j3bSKJnXaVhGubo0O02U0LfQipOJIeHiM6YJp7y
	 u3bLgfa4/CQbwysxzd6bztqFucvWVLY7e+Rx5sRogFgwPsdV88y5rQPmhAiD68BsUj
	 1H8rTC06r6WU2ssyjeJnRIYZ39zvB/1ZKaLmlIFOqxmc6VWRaI6fgibOq+2yWblWB0
	 SCB8kbt5sT2A/oA/JeXnRidrCZu3SxA0BzFxMnVZjIPxd4jHU5QQA82P8vi+wFyq/s
	 TpYMtdqXF+dOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-3-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:56:40 +0000
Message-Id: <20260629075641.338621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Crossbar routing artificially restricts sink_stream IDs to the num=
ber of available pipelines, breaking valid CSI-2 Virtual Channel routing.
--

commit 7b27c9929d91d2f4cfef36db9983af8a9df1006d
Author: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

media: nxp: imx8-isi: Add 16-bit raw Bayer format support
   =20
Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are commonly used by high-end image sensors that output
16-bit raw data, enabling the ISI to process and capture full dynamic
range from such sensors.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 2d0843c86534c..e58925d71164d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c

[ ... ]

While reviewing this series, I noticed an issue in
drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c. This wasn't
introduced by this specific patch, but earlier in the series by the commits
"media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing"
and "media: nxp: imx8-isi: Fix per-stream reference counting for multiplexed
streams".

drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:__mxc_isi_crossbar_=
set_routing() {
        ...
		if (route->sink_stream >=3D xbar->num_sources) {
			dev_dbg(xbar->isi->dev,
				"sink_stream %u exceeds hardware limit %u\n",
				route->sink_stream, xbar->num_sources - 1);
			return -ENXIO;
		}
        ...
}

[Severity: High]
Does this validation artificially restrict sink_stream IDs to the number of
available pipelines?  On SoCs with a single pipeline (like i.MX8MN where
num_sources=3D1), this appears to reject valid CSI-2 Virtual Channel routing
for any stream ID other than 0 (e.g. VC1) with -ENXIO.

Additionally, this logic seems to carry over into the stream tracking array=
s:

drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:mxc_isi_crossbar_en=
able_streams() {
        ...
	/* Increment reference count for all requested streams */
	for (stream =3D 0; stream < xbar->num_sources; stream++) {
		if (!(sink_streams & BIT(stream)))
			continue;

		input->enabled_count[stream]++;
	}
        ...
}

[Severity: High]
Since this loop is bounded by xbar->num_sources, does it fail to track valid
streams that are >=3D num_sources?

drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:mxc_isi_stream_coun=
ters_alloc() {
        ...
	for (i =3D 0; i < xbar->num_sinks; ++i) {
		struct mxc_isi_input *input =3D &xbar->inputs[i];

		input->enabled_count =3D kcalloc(xbar->num_sources,
					       sizeof(*input->enabled_count),
					       GFP_KERNEL);
        ...
}

[Severity: High]
Is the enabled_count array incorrectly sized here? It allocates based on
xbar->num_sources instead of the maximum supported stream ID. If validation
were bypassed, would this lead to out-of-bounds tracking for streams
>=3D num_sources, given that the u64 bitmask implies support for up to 64
streams?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-isi-v1-0-d=
eebfdb1b07b@oss.nxp.com?part=3D3
