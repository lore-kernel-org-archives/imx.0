Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C138AC65
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 05:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993084; cv=none; b=IDbOPUBuZiZ7h+d1A4BnCakR2SI3lHa9ZkDMTk9Ao9/PAQLo3VI27SPAj83TuVsMvtbX84OSd8JPJwWFVT0tunzoA4IwLzB9++rlP7mJywLUJg+NEuwteg5h7BCs1TDB9aJUdwTF9n3OFBJ9tDdEY0Q7tZRCvuaCcVUqsT2N5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993084; c=relaxed/simple;
	bh=zKh5XXhjWimtm9RNw9A/OOoWI9qqXlx7h6xUBbfdFEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBjFGR79Mo1DqQoSES2SJSHyWXFfCa0lEiwvFY/D9EvSfA3FnIR4fYZFSFrlO5htw/Lgo/lgmUh74tMEdMcXL2kb2iqVJ51gozeEPrEeye2MXFYgdmViAYVOnqxNSJK95qowHiZjHYrE1VG2y8tbdtPaLJ5LJNboZMmWk1Cc9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpizJCBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpizJCBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2BB1F000E9;
	Thu,  6 Aug 2026 05:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785993083;
	bh=szd8QgdcOaV0w6uY9EwHcGD+/6r788v5goUgUl4qiYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpizJCBlj2huS6JhYajp8leiNHp/WHjftLQL/3cst2wx5wYKxb69ek3NSvfbarrb+
	 /syLqemiOOo5RpHjBvLlxlCG+zv/K3s0Kq8rh2Eb40jdwYAtXrhRcAa78dNmfjIwQd
	 0JxONGJC0ZvovdxpcpGENCVNJoYYE8DR1Iu13/z2rz5UfZNd675Tm+D08LiLPSkqzo
	 0jcqnkzgh3yP/vPOM7M+ZAT9o//RW12ZRN2K3l1DgEWiAp91mUbJqadudO/e2X4Cgu
	 8ai82ycbIeaqVZlOkk+YONZiZMJLMaPOFsKHku6iJ1FHpFsaTpmQrClPB9dJuaeY55
	 b+8PyiTQDxczw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed
 more than once
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260806050239.90188-1-kmehltretter@gmail.com>
References: <20260806050239.90188-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 05:11:22 +0000
Message-Id: <20260806051122.BD2BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware clock state desynchronization and unhandled clock referen=
ce leak on error path in `imx6q_set_target`.
--

--- Patch [1]: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed =
more than once ---
commit eaf7ff016f231691af46156c1e76ffcc234120eb
Author: Karl Mehltretter <kmehltretter@gmail.com>

cpufreq: imx6q: fix out-of-bounds write when probed more than once

This commit fixes an out-of-bounds array write during probe caused by
soc_opp_count retaining state across driver unbinds and rebinds. Moving
soc_opp_count to a local variable ensures the array index resets properly
on every initialization.

> diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpuf=
req.c
> index e93697d3edfd9..fe0453c9623fb 100644
> --- a/drivers/cpufreq/imx6q-cpufreq.c
> +++ b/drivers/cpufreq/imx6q-cpufreq.c
> @@ -55,7 +55,6 @@ static unsigned int max_freq;
>  static unsigned int transition_latency;
> =20
>  static u32 *imx6_soc_volt;
> -static u32 soc_opp_count;
> =20
>  static int imx6q_set_target(struct cpufreq_policy *policy, unsigned int =
index)
>  {

[Severity: High]
This is a pre-existing issue, but does the error handling in
imx6q_set_target() leave the hardware in an inconsistent state?

When the cpufreq core calls imx6q_set_target(), it sets
pll1_sys_temp_enabled and calls clk_prepare_enable() without checking
its return value:

	/* pll1_sys needs to be enabled for divider rate change to work. */
	pll1_sys_temp_enabled =3D true;
	clk_prepare_enable(clks[PLL1_SYS].clk);

Then, if setting the new arm clock rate fails, it restores the old voltage:

	/* Ensure the arm clock divider is what we expect */
	ret =3D clk_set_rate(clks[ARM].clk, new_freq * 1000);
	if (ret) {
		int ret1;

		dev_err(cpu_dev, "failed to set clock rate: %d\n", ret);
		ret1 =3D regulator_set_voltage_tol(arm_reg, volt_old, 0);
...
		return ret;
	}

If scaling up to a higher frequency, volt_old is lower than the required
voltage. Since the hardware clock tree (e.g. PLL1_SW) has already been
reprogrammed and reparented to the new higher frequency earlier in the
function, does restoring volt_old without rolling back the clock mux state
cause a CPU undervolt and subsequent system crash?

Also, does returning early from this error path leak the clk_prepare_enable=
()
reference since the clk_disable_unprepare() cleanup is skipped?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806050239.9018=
8-1-kmehltretter@gmail.com?part=3D1
