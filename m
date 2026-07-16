Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E193B7B76
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212613; cv=none; b=Q4ei3E4DuhhtE06/2KJ1G2dTguy03ao0bV03a4l8n/KHtMh5988SXy0XmyRa38afN3nzqNFzQpfF/pQ8qDgOGDycpyi/dldJKJcFK1KVoshTyDVGzX7MBYNZkys+YTzTpjq45lt3xDnOvx9Ho65SXa3nrlBT34yYHuH26XhHLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212613; c=relaxed/simple;
	bh=7PDQnVRz0xMvuNKzbSF900t2BnPCrRevWccLbmBb3/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OqDjL+IT/GmsfG1CkkwWOrg8WSNwzPrwd+xHaXglj3tj+5OQ9HCb3WByhxb8YdngYea02jslINvo0a7+yxK75/R75ZEDiuF4JE5WknmDSDOxf1mQXC8I0cE5Md/6trAccxCzUStPsNukkrkEnOMTG6vEcI3WniwubZjz6+ZM7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TojUgrUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TojUgrUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5741F000E9;
	Thu, 16 Jul 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212611;
	bh=cc/rUnB2f0Hj2xStKlqesGJ5W+XViSIpkOWjpFEnuzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TojUgrUmMMLlz8B5jvLBTSRtycWn5bZw4r5cx+Rc/j/nrp4fXHA/jZSuoyVGitBT/
	 QlkHcc+4MmmGJlqWdoawZ/QlY35mNrfekvM5w/bSFXMUCNoG9tNkZdtCQ0JdzuRMD3
	 kRGQbo2heD/o5VavCU46V0bXlb8YauCkyeZzPZ7O16FlmTXGydftou75DhOajh88Df
	 sODuxn5wN5wuxiSNFozG/8+VIjPf81XRHMfbehVK5B0BKZhS66oBmezI6/z8dDbMvL
	 qlNkVXp6JywAIqmQtjZJeKmGhSio3hVH3ohH94VrtlxLybDHY3hC8X2FWocgttC/Jg
	 pnRw9ydx8VRXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] firmware: meson: pass a const buffer to
 meson_sm_call_write()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: neil.armstrong@linaro.org, Frank.Li@kernel.org, imx@lists.linux.dev, ojeda@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260716142415.28718-5-linkmauve@linkmauve.fr>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-5-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:36:51 +0000
Message-Id: <20260716143651.6A5741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `meson_sm_call()` propagates SMC failures via its output parameter=
 `*ret` but unconditionally returns 0 on success. Callers incorrectly check=
 the return value instead of validating the output parameter, leading to si=
lently ignored errors and state corruption.
- [High] Missing mutual exclusion in `meson_sm_call_read` and `meson_sm_cal=
l_write` when accessing the shared IO memory buffers `fw->sm_shmem_in_base`=
 and `fw->sm_shmem_out_base`.
--

--- Patch [4]: [PATCH v3 4/4] firmware: meson: pass a const buffer to meson=
_sm_call_write() ---
commit dafeddcc00e60d8baf4fc20e8f8f2f6286a33db3
Author: Link Mauve <linkmauve@linkmauve.fr>

firmware: meson: pass a const buffer to meson_sm_call_write()

This commit updates the meson_sm_call_write() signature to accept a
const void *buffer instead of void *buffer. It also removes unnecessary
casts to (u8 *) in meson_efuse_read() and meson_efuse_write() when
passing the buffer to the SMC call functions.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..5d4da2e3c3a94 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -196,7 +196,7 @@ EXPORT_SYMBOL(meson_sm_call_read);
>   *
>   * Return:	size of sent data on success, a negative value on error
>   */
> -int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
> +int meson_sm_call_write(struct meson_sm_firmware *fw, const void *buffer,
>  			unsigned int size, unsigned int cmd_index, u32 arg0,
>  			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {

[Severity: High]
This is a pre-existing issue, but while reviewing this function, is there a
missing lock when accessing shared IO memory?

In meson_sm_call_write(), we copy data to shared IO memory and execute
an SMC call:

	memcpy(fw->sm_shmem_in_base, buffer, size);

	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) <=
 0)

If multiple threads call meson_sm_call_write() or meson_sm_call_read()
concurrently, could they clobber the shared IO memory buffers before the
Secure Monitor executes the command? Access to fw->sm_shmem_in_base and
fw->sm_shmem_out_base does not appear to be serialized with a mutex.

[Severity: High]
This isn't a bug introduced by this patch, but does meson_sm_call() mask
SMC execution failures?

Looking at meson_sm_call_write(), it checks the return value:

	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) <=
 0)
		return -EINVAL;

However, meson_sm_call() unconditionally returns 0:

drivers/firmware/meson/meson_sm.c:meson_sm_call()
	lret =3D __meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);

	if (ret)
		*ret =3D lret;

	return 0;

Because it always returns 0, callers checking the return value instead of
the output parameter will silently ignore errors. Could this cause drivers
like meson-efuse or amlogic_thermal to treat error codes as valid data and
corrupt state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142415.2871=
8-1-linkmauve@linkmauve.fr?part=3D4
