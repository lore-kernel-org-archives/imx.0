Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F9374183
	for <imx@lists.linux.dev>; Fri, 29 May 2026 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029728; cv=none; b=K0iEMYjLAl0kNLnvbttChYlJLjEEUg3L79ia5nC+XMznZDUElwdx4h//1BXSOAYw+V3YxiFulGpoLKpsxqwUjZZFmM13nRr6orJYyj6Wp9p549W0e/GSODleBmiJXisxoCh1ulkm9GZxXjinwgJomgc1epqa0Q+3kRLlsp76+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029728; c=relaxed/simple;
	bh=DawQdVmAAkELWRz50ZS7g84M5WlHa0hbVufaIO+qKHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C9UtclNqODv3QAPfkpWFp0VY1Dl0o7P4Id1bNDX5yAnSgG/fm3+Io3255J3N2wP2viygt4A6RHq70QVPl4wmEC+3/SlaRaPDDlhP4qloe3dITyKnv2c1vUur0rpSmDzHOC/PQ558yXQIzEmafWvz3ZUbRKgimuqnIKylDWd3r/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMocvYq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMocvYq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A7F1F00893;
	Fri, 29 May 2026 04:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780029727;
	bh=kKBwlvoy6cHMzTMarDaavIpencGlIqL4LJp3yE/clZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMocvYq1Nl8yIP/GeOR9A5JIAjEpl2QiF3ZtMLuqG/wACQS7N0RdkCOcQ3AfgbUEh
	 fTcjla2Xiq2RUqHl3gGPjzXV46hTo35Y3rlXignGX+ZLfwT/xfodD3OXclEpnWZk0P
	 hkOwvi3knlSs5aFuJSrE8eRh+T5t7F1FLGTAwsIZWPoUaRVlUP++GgFvr/cZDogNa+
	 T6d3sZMmkqltusDgrzll9gZf7C9V1WDcX6pobga1HlwMYzvKJl4ba718XIQR9aebuW
	 nIDwPweU6d1qdw22keL1LAwKsNbqjqi9IwFfiBQH6/bgl6xq5kiFedcw7K70seKDLZ
	 ZuNWA0fm3nIeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] remoteproc: switch drivers to optional
 resource-table helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260529021637.2077602-6-ben.levinsky@amd.com>
References: <20260529021637.2077602-6-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:42:06 +0000
Message-Id: <20260529044206.C4A7F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `rproc_elf_load_rsc_table_optional` macro hides unconditiona=
l function returns, making the trailing `return 0;` in all calling function=
s unreachable.
- [Medium] Undocumented change in error propagation for multiple drivers wh=
ich previously ignored non-EINVAL errors.
--

commit 9602dbc4d243a49c62f52f899683404a0f547124
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch drivers to optional resource-table helper

This commit updates several remoteproc drivers to use the new shared
rproc_elf_load_rsc_table_optional() helper for handling optional resource
tables.

> Keep thin local parse_fw() wrappers in each driver so the helper only
> centralizes the return-value handling while each platform retains
> control over whether the missing-table case is logged and at
> what severity.

[Severity: Medium]
Is this description entirely accurate? Prior to this patch, drivers like
imx_dsp_rproc and rcar_rproc completely ignored all errors from
rproc_elf_load_rsc_table() and unconditionally returned 0.

The new rproc_elf_load_rsc_table_optional() macro propagates non--EINVAL
errors (such as -ENOMEM). While this propagation is likely a functional
improvement, it is a behavior change for these drivers rather than just
centralizing the return-value handling. Should this change in error
propagation be explicitly documented in the commit message?

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 2d9f14fbef1da..fd60c67ba8a9f 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -956,9 +956,8 @@ static int imx_dsp_rproc_elf_load_segments(struct rpr=
oc *rproc, const struct fir
> =20
>  static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firm=
ware *fw)
>  {
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> +	rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
> +					  "no resource table found for this firmware\n");
>  	return 0;

[Severity: Medium]
Does this leave the trailing 'return 0;' unreachable?

Looking at the definition of rproc_elf_load_rsc_table_optional() in
drivers/remoteproc/remoteproc_internal.h:

#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...) \
    ({                                                                   \
        int ret =3D rproc_elf_load_rsc_table(rproc, fw);                   \
        if (ret =3D=3D -EINVAL) {                                          =
  \
            dev_func(&rproc->dev, fmt, ##__VA_ARGS__);                   \
            return 0;                                                    \
        } else {                                                         \
            return ret;                                                  \
        }                                                                \
    })

Because the macro uses explicit return statements within the statement
expression, it exits the enclosing function entirely. This hides the control
flow and renders the trailing 'return 0;' dead code in every driver modified
by this patch.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529021637.2077=
602-1-ben.levinsky@amd.com?part=3D5
