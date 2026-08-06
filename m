Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F437F731
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 05:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993428; cv=none; b=aklQlRTgK9lu5+Vc2oI4VifXgLOIbDwS0xsEWMbOQnLfO5GE3OsGoGFfAg0UOjlSspvICjfqs6eo2SsHulhYwR6lt4wuSUBNR1rwDr7Q0kQqbgobKPOhpfXMV5LDBcj1cYSNNzDGks56FbCSlIou9R6JOlAx5bHDDqeVNezwm7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993428; c=relaxed/simple;
	bh=HhfuIGV28f4T/3AZ9mKA2uwno+XdrfM0IU/FUdNU29Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uaASOR6FVWcD/S/plV/yI43HhyEt86F0OC+3dZZE0MCllzLsUF0EBU3LE1tXxaKQaw+YGHR++F03OInTrsXkbUIYjA86zH5P+vM+7O8nKJnLXXdRoHq8BUfdwXpfgaEzVHTVohn+fboQCZOXqRRB7fF78qc8WOp83/sMIcD/wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osoagiAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osoagiAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01ED21F000E9;
	Thu,  6 Aug 2026 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785993427;
	bh=JBlOHYj42pCCr6F0Be5d+Yy3xzAArITPMim99qtLj5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osoagiAkjM89Zhv8R6xGHYlDS8CaD/U+6kZinmQFa2fOHoR9Y/n9lwsV7XDMYS6zW
	 bYDmIZ9OehCuKN/DggXtO2CL/BWsfiDb3MHKOSvQMwW6ZkQJuT/VSD4+OLwE+9wcLZ
	 RgKIUXiMjdfCNvEWBUEXDEQM4hygBhHeRNuo+jq7avZx1CSaGoTgxgPRhTzvxHX0zd
	 iNGbhw26LstVCD5rBntYLnMGFBTb+dspGyZWbDWTXruPVN9AoRw+vCdAh9zavyCpJb
	 CRu87dPQGyeVSy8KflEaibZuPfk3NRrvAzjs93cEzEYS7nSDHyZwIcjVz/764iGt7z
	 opn7YnGM4C3LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix devres accumulation across driver
 rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260806050902.90550-1-kmehltretter@gmail.com>
References: <20260806050902.90550-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 05:17:06 +0000
Message-Id: <20260806051707.01ED21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The file-scope static variable `soc_opp_count` is never reset to 0=
 across driver unbind/rebind or deferred probe cycles, leading to a severe =
out-of-bounds write array overflow.
--

--- Patch [1]: [PATCH] cpufreq: imx6q: fix devres accumulation across drive=
r rebind ---
commit d8bcb5a2ed1157b0b23fd4c657a9fd392c54309b
Author: Karl Mehltretter <kmehltretter@gmail.com>

cpufreq: imx6q: fix devres accumulation across driver rebind

This commit fixes a memory leak caused by devres accumulation during driver
unbind and rebind cycles. It changes the memory allocation of imx6_soc_volt
to tie its lifetime to the platform device, and clears the file-scope point=
er
in the remove and probe-failure paths.

> diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpuf=
req.c
> index e93697d3edfd9..8110c95059e0e 100644
> --- a/drivers/cpufreq/imx6q-cpufreq.c
> +++ b/drivers/cpufreq/imx6q-cpufreq.c

[ ... ]

> @@ -506,6 +507,7 @@ static int imx6q_cpufreq_probe(struct platform_device=
 *pdev)
>  static void imx6q_cpufreq_remove(struct platform_device *pdev)
>  {
>  	cpufreq_unregister_driver(&imx6q_cpufreq_driver);
> +	imx6_soc_volt =3D NULL;

[Severity: High]
This is a pre-existing issue, but since this patch explicitly tests and=20
fixes rebind behavior, should soc_opp_count also be reset to 0 here?

The file-scope static variable soc_opp_count is never reset to 0 across=20
driver unbind/rebind or deferred probe cycles.=20

In imx6q_cpufreq_probe(), the loop increments soc_opp_count:

	for (j =3D 0; j < num; j++) {
		val =3D prop->value;
		for (i =3D 0; i < nr / 2; i++) {
			unsigned long freq =3D be32_to_cpup(val++);
			unsigned long volt =3D be32_to_cpup(val++);
			if (freq_table[j].frequency =3D=3D freq) {
				imx6_soc_volt[soc_opp_count++] =3D volt;
				break;
			}
		}
	}

On subsequent probes (e.g. after the unbind/rebind cycle you tested), it=20
resumes counting from its previous value instead of 0. Since imx6_soc_volt=
=20
is newly allocated with size 'num', this will write beyond the bounds of=20
the array, causing memory corruption.

Does the driver need to reset soc_opp_count to 0 during removal and on the=
=20
error paths in probe?

>  	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
>  	dev_pm_opp_of_remove_table(cpu_dev);
>  	regulator_put(arm_reg);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806050902.9055=
0-1-kmehltretter@gmail.com?part=3D1
