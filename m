Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A0393DF1;
	Thu,  2 Jul 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009692; cv=none; b=kvXch6Vt9fp2n9eVndz8e+M2qiadXi4G4nWe5zcVw1cSWJaXrD3CN+7ub0P9J/TYgghCwdPSvHJlRiOXAh+0GYBJv499OKvC9M2607FqPXW3DEXWv0JXf7X2s4HGD1mL1ea13X9GUpoGfr+XLbhXmY8aEbjQxOwT2XtfUuhSqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009692; c=relaxed/simple;
	bh=mVo1G00c3l88BwKZi+ZTPsqMNj/YA1nT5ZjRuIV4KuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WfcG2GD0uLmCpq2rxGlcM7kI2ecxAmuCefAdeaWqkDX5+GC8DqxBs02whmUorhtVvrmGlP3HvJvZclMOocnEgltQ5qpacw2SaF1XLeSoxtqD+TbDaJu/sXvf2oWZR9yO+xEiPhMi6/1yORrgFEiJjq7Ue6ZPcGMdJcWVQTK6OJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJY5E+m7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJY5E+m7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6171F00A3A;
	Thu,  2 Jul 2026 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009690;
	bh=uurK9LU/RZdJVqbkKWXI/XhMYuQjKnFrt/vaLcGOcN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJY5E+m7g7IeheLK6oKduFyi1uzCemalGrFIudKv9DGQaDfY90l31B0IYkmKmuk0M
	 1wSykzNTf+h5AHqiBUZZcb5Ygoa7U0pLm72FUQbOuqPqxZ3LZI+OwnBva1Y5HtOMfU
	 SpWas8iWMGofWZwquFDGRmfIVJ/HjhzKyX3BmSTv0lPH1lAFzdmK0h/wniMsM/EaSj
	 vDFur14i90tbAHsPsw/O86Wk+IZ5e6jX/dPx7CNn98zScWvHG3INZ5HP9vSm1OKY5n
	 9Lj6bO+L7mtGTkswNa70WA/FBVCbLOaUmxfxogGszXZQokZgUrjI1+oVl7Q1k90jrm
	 panQXthCHxWPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] media: synopsys: Use
 media_async_register_subdev() to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260702-imx8qxp_pcam-v7-4-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-4-b47d9e363400@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:28:09 +0000
Message-Id: <20260702162809.AC6171F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The code uses an undefined macro `fwnode_graph_for_each_endpoi=
nt_scoped`.
- [High] The `vep` variable is used without initialization in `v4l2_async_n=
f_parse_fwnode`, leading to non-deterministic parsing failures.
- [High] `v4l2_async_nf_parse_fwnode` incorrectly bounds array checks by `e=
p_count` but indexes by `port`, causing array out-of-bounds access and over=
writes.
--

Note: The format of this review is altered due to recitation restrictions. =
I am providing a free-form summary of the findings rather than using inline=
 quotes from the patch.

commit a062c04404605739dc18e1d269233cd3c55f2e65
Author: Frank Li <Frank.Li@nxp.com>

media: synopsys: Use media_async_register_subdev() to simplify code

This commit simplifies the driver by replacing local subdev registration
and pad setup with media_async_register_subdev().

[Severity: Critical]
This isn't a bug introduced by this patch, but by a previous patch in the
series that added v4l2_async_nf_parse_fwnode().

In drivers/media/v4l2-core/v4l2-fwnode.c:v4l2_async_nf_parse_fwnode(), is
the macro fwnode_graph_for_each_endpoint_scoped() defined anywhere in the
kernel?

It appears this macro is invoked but undefined, which results in an
immediate compilation failure.


[Severity: High]
This is a pre-existing issue from a previous patch in the series, but
looking at v4l2_async_nf_parse_fwnode(), does the uninitialized stack
variable vep cause parsing failures?

The struct v4l2_fwnode_endpoint vep is allocated on the stack but not
zero-initialized before being passed to v4l2_fwnode_endpoint_parse().

The parser relies on vep.bus_type being V4L2_MBUS_UNKNOWN (0) to correctly
guess the bus type:

drivers/media/v4l2-core/v4l2-fwnode.c:__v4l2_fwnode_endpoint_parse() {
    if (vep->bus_type !=3D V4L2_MBUS_UNKNOWN) {
        ...
}

Since vep contains random stack garbage, vep.bus_type will likely be
non-zero, causing the parser to incorrectly assume a specific bus type
was requested. Will this result in a spurious -ENXIO error and break driver
initialization?


[Severity: High]
This is also a pre-existing issue from the previous patch adding
v4l2_async_nf_parse_fwnode(), but does the pad allocation logic
safely handle non-contiguous port numbers or multiple endpoints per port?

The wrapper dynamically allocates exactly ep_count pads based on the total
number of device tree endpoints. However, it indexes the array directly by
the endpoint's port number:

    pad =3D pads + vep.base.port;

If a port number is skipped in the device tree (for example, port 1 is
present but port 0 is not, making ep_count=3D1), will vep.base.port (1)
trigger a false-positive vep.base.port >=3D pads_count bounds check, return=
ing
-EINVAL and failing probe?

Conversely, if a port contains multiple endpoints (e.g., two endpoints under
port 0), won't they both overwrite pads[0], leaving subsequent array elemen=
ts
completely uninitialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-imx8qxp_pc=
am-v7-0-b47d9e363400@nxp.com?part=3D4
