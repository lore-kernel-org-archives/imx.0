Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36CC415F38;
	Thu, 24 Sep 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255629; cv=none; b=QsL+XSnJ5ymcpRh3WLqzCXHKH9vrUud3sxxMuDFNkw5AVEX6owjlpaQZ3ogAJMVlMjRm9H01aZ7QBVnJu3XBgy8c+ET/ZUfhgTfp3a+33/RzTdG3vIaIFOI7K6CE4NW0DghUyTM+LJYNCV0B+vbjxlcVFYwPfT4JdyxRfm1A1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255629; c=relaxed/simple;
	bh=0PyHIiHapy8eEOpPBoKZ/PFe+AWtlk5JxVz8iHE0mEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=axTalGDHJ0PeGsx8nKqA1joxnv9DJPntN8j5l4D0y9p2MWcTiMKE27X/eU0HJnIC2+Vji1A+0uv6f0pFu3mdg5guDQtXfWpnyRYSiWzwuxL1xKVFpetv0UhnIzoue2QP5Rdl+xEMsCfwy2IxGIElZ9jbpZWBOhrxpfOfWF/gCys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR7CAzVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR7CAzVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A991F000FF;
	Thu, 24 Sep 2026 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255627;
	bh=Scgj7owt4gKr9GvMdaVndcYaiwCjOn+tHLUBZsHr6OA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TR7CAzVLw4zNv2MfHnHjEZ5PIHZqu+qVD+A+UotN5E4oer4biw757MS1iyn3lt99c
	 f9RMBNlcunOy26ygR4y1tz2QazrZV6HqdN5KDDc7b3euf8zWPOdZxBmCdjKHJ9peKb
	 /B+BLos3iTHt71J3ROU7QEz0gOW07JCJBUGtwgdmqYttDYyvAL4uUVpIxIZ21dOwzl
	 TFhsHvZevMh+Lfh71QnTXj9USlYSEgqYthlGWHpOuh/6UPgMNAc+ROfl2RAjUXeD8L
	 XHU80KHtas1qd0+vbt5cueFFuJHtw4LX9e9usCGNscNb3Vds4zNpaaxDYOQLTMceFr
	 8GY/I3FkIFlRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] media: verisilicon: Remove useless internal
 fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924130453.196299-4-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:13:46 +0000
Message-Id: <20260924131347.33A991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: verisilicon: Leftover kernel-doc for removed ctrl_base
--

commit b8008458c58918377e3aa39a0a58310073146cb2
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove useless internal fields

This commit removes unused fields from struct hantro_variant and struct
hantro_dev because no variants are using multiple registers regions.
This simplifies the driver code.

> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
[ ... ]
> @@ -184,7 +180,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   *			dev_ macros.
>   * @clocks:		Array of clock handles.
>   * @resets:		Array of reset handles.
> - * @reg_bases:		Mapped addresses of VPU registers.
> + * @reg_base:		Mapped address of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:		Mapped address of VPU control block.

[Severity: Low]
Should the @ctrl_base kernel-doc be removed as well? The ctrl_base field is
removed from struct hantro_dev below, which leaves this documentation stale
and causes a kernel-doc warning.

> @@ -204,10 +200,9 @@ struct hantro_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	struct reset_control *resets;
> -	void __iomem **reg_bases;
> +	void __iomem *reg_base;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
> =20
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924130453.1962=
99-1-benjamin.gaignard@collabora.com?part=3D3
