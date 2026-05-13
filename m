Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C2367297
	for <imx@lists.linux.dev>; Wed, 13 May 2026 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636549; cv=none; b=T4HWcg6MLMzqDQRpxjUEYGUWW+kkCgqfXTNe3HYGw0C2xJiS4L6KU3Wn8uiZ5Rwemz0V/IMB8/2ZeS5XOit63iqfGq87VLgNJZjzmpvkn3cGb2m5IHyuXgyC1aE8Ep+sS3KSkGjYyjzPh4M0bk3EjNykgWJE546/jlLk8f0fp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636549; c=relaxed/simple;
	bh=sim48wC2Skx5NvWDMmvX5TGN/SP8OEJ/ytmN7gb79AU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UJulsjrpLvEma1SlmrKYlpxbHCqDWtoTRP8MYv7N79Qzl6ZwGLtwwCVbjuqwB+DY8JOVuRYo2+Lv0+GdfLa18cy/wfCp3Eq9yTV/RF05GIoTWawO0ee7oFHtxyjn2wn1XAxf4U6oWWv3upGgSn6G3g//alHgwz3as/e5f+qf03Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGYqcxke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGYqcxke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B51BC2BCB0;
	Wed, 13 May 2026 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636548;
	bh=sim48wC2Skx5NvWDMmvX5TGN/SP8OEJ/ytmN7gb79AU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iGYqcxke+1KUqVEeLQ67/L0YS9Sk+Nh8TNnwFxU/icewZePuA+/RWdBvQp5/5Gmwx
	 EFCYYOJwjCv6MVpqcws/pi7kM9EcJx45Bw5ze/ZllN61mM2p4485f2WTSIK2x3J7gj
	 g81w5o1ThOpeoZryXy8ejjejQXjY8AQ+CQhxSSfsLMbKmD08vcCjTgwJyRH6bsBsSu
	 8OXnXvUjTx8pFxYjVROv4QSC3nYxWR2cQdO/GkwUVgZpYrMllchTn/RHGJQJyYlqfO
	 Xaaq9TYFZN4ZJUD63q4vHAFTrXaWxmuECPJjlUGr6462RB4RNgEoAvEc0sOESr83UJ
	 TZs+5k0ypUU/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260511211841.284809-4-ben.levinsky@amd.com>
References: <20260511211841.284809-4-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 01:42:27 +0000
Message-Id: <20260513014228.4B51BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The helper rproc_elf_load_rsc_table_optional() silently ignores =
firmware corruption errors by incorrectly assuming all -EINVAL returns mean=
 a missing table.
--

commit 0067d38d8bcda280b1137f92af4ffd133bfa24fe
Author: Ben Levinsky <ben.levinsky@amd.com>
remoteproc: add helper for optional ELF resource tables

This commit adds a wrapper around rproc_elf_load_rsc_table() to treat a
missing ELF resource table as optional. It does this by converting an
-EINVAL return code into a success code.

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remotepro=
c/remoteproc_internal.h
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
[ ... ]
> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rpr=
oc *rproc,
>  	return 0;
>  }
> =20
> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
> +						    const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret =3D rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret =3D=3D -EINVAL)
> +		dev_dbg(&rproc->dev, "no resource table found\n");
> +
> +	return ret =3D=3D -EINVAL ? 0 : ret;

Does this inadvertently mask actual firmware corruption?

Looking at rproc_elf_load_rsc_table(), it returns -EINVAL when find_table()
fails:

drivers/remoteproc/remoteproc_elf_loader.c:rproc_elf_load_rsc_table() {
	...
	shdr =3D find_table(dev, fw);
	if (!shdr)
		return -EINVAL;
	...
}

However, find_table() returns NULL not only when the .resource_table section
is missing, but also when it is explicitly malformed (e.g., truncated,
missing header, unsupported version, or non-zero reserved bytes).

Since this helper converts all -EINVAL returns to success, will it allow
driver initialization to proceed with an invalid or corrupted resource tabl=
e?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211841.2848=
09-1-ben.levinsky@amd.com?part=3D3
