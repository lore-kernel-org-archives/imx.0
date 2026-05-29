Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B5330EF7B
	for <imx@lists.linux.dev>; Fri, 29 May 2026 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029085; cv=none; b=f0mY6wwLRdCSDtAkfUDLN7EoUA7N753tYlgx1K8Gixv3nRoOwWGd2NxlgRQmIkr15MeP48jxUdoDk5qmusWo5a3QTDwwoT3znXzIoPaLcSKSeQ4mLrIAjAALCSTTC/b8L4Bz2ybEaI5h2byBbL3PQVxBY++1m/fLfXEBnjOFVmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029085; c=relaxed/simple;
	bh=/ryWFwKX4lgE0DfeZ32Zhb+kmZ/WwtZGrlCWRMLcieY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qY+mWkGJhnSFbx/fusVpnuyzh064F6iBm+BnpLpzsxuJHzoo0zaGwQveoDeH+X0A/sEyWyYyAcjDHdjHeIOadA4n+3ULDI3AjALgdWRJUfttzdx8Ltu1e3bu4emo7kgssr704eZLvRLZHIrJ2dfmGD3AEzGj1C+vxNLupi5tRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfPCVjVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfPCVjVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CA71F00893;
	Fri, 29 May 2026 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780029084;
	bh=2l1lEuuMioW/xy9WX+MvFX+qNeZ80vxCWnOtKSfzEW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfPCVjVVwwwT7p3TfWjaGUcsTO5yQ/AFcDzZpvIg4Dy238jokSl0keKve6VMxVFUh
	 qZIepye73b1E84965X/4/sbycOarCtJogdw+C3SqY0F0yj+QK7AyFOyjNtwfNZvRaa
	 +fC5wO5QmDTP8G1mhblL04N7bYM74Y4WiesvNV0hh1SKLI8PGqVqZqWXluUdjpToAI
	 0GagZS439MQkm+DoBgtt/tbtYVR0tejvVMbjT3xlVcDQud0zoFLzDARtfuSoES+DaP
	 ZJ/jEL9KD/k8P/ZgC3hJE2taHH+ORV6X112THVm6CzrZ/QJNjBwoLxN2PcetaF7saa
	 B1B0R6gCYeoSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] remoteproc: add helper for optional ELF resource
 tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260529021637.2077602-5-ben.levinsky@amd.com>
References: <20260529021637.2077602-5-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:31:23 +0000
Message-Id: <20260529043124.30CA71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The macro `rproc_elf_load_rsc_table_optional` hides `return` sta=
tements inside a GNU C statement expression, forcing the caller to return i=
mmediately and creating dead code.
--

commit 97ca173b9ba2ed2c419cbe1a3f62d02db6f033c0
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: add helper for optional ELF resource tables

This commit introduces a helper macro around rproc_elf_load_rsc_table. It is
designed for drivers that treat a missing ELF resource table as optional wh=
ile
allowing the caller to maintain local logging control.

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remotepro=
c/remoteproc_internal.h
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -149,6 +149,17 @@ static inline int rproc_mem_entry_iounmap(struct rpr=
oc *rproc,
>  	return 0;
>  }
> =20
> +#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)=
	\
> +	({									\
> +		int ret =3D rproc_elf_load_rsc_table(rproc, fw);			\
> +		if (ret =3D=3D -EINVAL) {						\
> +			dev_func(&rproc->dev, fmt, ##__VA_ARGS__);		\
> +			return 0;						\

[Severity: Medium]
Does this macro hide control flow in a way that forces the caller to return
unexpectedly?

Using explicit return statements inside a GNU C statement expression does n=
ot
yield a value to the expression itself. Instead, it forces the function
invoking the macro to return immediately.

If callers use this macro as though it evaluates to a return code, any trai=
ling
statements in the caller will become unreachable dead code. Additionally, i=
f a
calling function acquires a lock or allocates memory before using this macr=
o,
the hidden return would skip the cleanup path and cause a resource leak.

Would it be safer to replace this macro with a standard inline function, or
change the statement expression to evaluate to the integer value rather than
forcing an explicit return?

> +		} else {							\
> +			return ret;						\
> +		}								\
> +	})

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529021637.2077=
602-1-ben.levinsky@amd.com?part=3D4
