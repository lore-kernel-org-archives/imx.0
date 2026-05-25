Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68433998BE
	for <imx@lists.linux.dev>; Mon, 25 May 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690184; cv=none; b=Tuw7ESRtwndRNQpXrbYKSSn0VOREHurRHaV/zszAjgFGnUYnDynDChP3KLjN4qPU07V1m+hQQM9k99HZUmFKQzgzC27/SFxD0SFCVvAdNhIa+2Nu/0Cz6vWSJGRvHDUHRwymiVAHYPl3Sr+ahb2rJ/wSFJaMf1vh99DismLZXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690184; c=relaxed/simple;
	bh=V6/krKIRwnyk/MjAvekDwfufJEsTskelhC1CWjaoHgo=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FxCFnx7K8L+U4lmxhacvhrx4BRylKY5xNWQwfkQ0TL/oyKb1HIagUyeHvHCY74VjBym0hR7MyRMhjXJMQZUWUHQldDvqA4pUGZ0DLZwNvorA//YJiXlS23lUCBjRfEQ99qw1R5PKjRww3ZIQHQJGBatfUpYywzbZXlzr2Bl0ObI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAckGDZk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAckGDZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416671F000E9;
	Mon, 25 May 2026 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779690183;
	bh=mE+A8MoFbAYJqhWELRjpt4tkz6cW9KOmyHxWiW9Lbck=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=aAckGDZkLj2Fmd2GUe597Z9a6KJWP1nYXMlXmC2CCtO1Fj4vWwD0/OBoZqX3MvRNS
	 d8XWzmqIylb1ynB/Yz6AIl15hW1oogwgz4XIZj2xJT8/x6vaChQEgSecLbhRyP0Hn1
	 CFGExw+o051CuzDGtNgRGpabMBK/8s1XwZGS+SAcjntVBRgpLCQ6PMO1+zU+Fy/m8c
	 tMnzBp36xRM8SU4DlKk5U/9a4gKdaX90e3YtVWaQoCvHZ3jY/izaU/yxFzQyDQRU0e
	 ROSQcI7Hh0ohNiqLGKjG5Njue2XjfFaHVzpW85ELLCJi/57/586R2n/qf7r1ocSQ0f
	 8twS1UKD6NALQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] firmware: imx: ele: Correct check condition in
 se_if_rx_callback
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260525-ele-v1-v1-1-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-1-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:23:02 +0000
Message-Id: <20260525062303.416671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] The patch alters the condition for size mismatch handling by n=
egating `check_hdr_exception_for_sz()`, inadvertently skipping the essentia=
l size truncation for exception commands and causing an out-of-bounds read =
and information leak.
- [Medium] The commit message indicates that the patch should return a fail=
ure when the size does not match for non-exception APIs, but the code only =
logs the error and proceeds.

Pre-existing issues:
- [Critical] Asynchronous mailbox callbacks can trigger a Null Pointer Dere=
ference or cross-thread data corruption if the completion wait times out, i=
s interrupted, or if unsolicited messages arrive.
- [Critical] The IOCTL handler directly dereferences a user-space pointer d=
uring header validation, causing memory safety violations and exposing a TO=
CTOU vulnerability.
- [High] In NVM command handling, the received message size is unconditiona=
lly overwritten after being clamped, leading to a heap buffer overflow.
--

commit dbd468c11e8d6f15f1dbfe05daf128166c6de3a4
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: Correct check condition in se_if_rx_callback

This commit updates the response validation logic in the EdgeLock Enclave
driver to reverse the condition checking whether a command is in the
exception list for variable length responses.

>     Reverse logic should be used when checking whether response is correc=
t.
>     The logic should be when size not match and API is not listed in
>     exception list, return failure.

[Severity: Medium]
The commit message states this should return a failure, but does the code
actually do that?

Looking at the modified code, it only logs a warning with dev_err() and
clamps the size. Execution then continues to memcpy() and complete(),
returning a positive size value to the caller, which the IOCTL treats as a
success. The failure state is never properly propagated.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index e5117a1f19959..8daf32eded43c 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -219,7 +219,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, v=
oid *msg)
>  			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
> =20
>  		if (rx_msg_sz !=3D se_clbk_hdl->rx_msg_sz &&
> -		    check_hdr_exception_for_sz(priv, header)) {
> +		    !check_hdr_exception_for_sz(priv, header)) {

[Severity: Critical]
By negating this condition, does this inadvertently skip the size clamping
logic for exception commands?

If check_hdr_exception_for_sz() returns true, this block is skipped, which
means se_clbk_hdl->rx_msg_sz retains its potentially large user-controlled
value instead of being truncated to the actual message size.

The subsequent memcpy() at the end of this function will then read past the
valid 1024-byte hardware mailbox buffer (msg) into the kernel heap, copying
out-of-bounds kernel data into rx_msg. This data is eventually returned to
userspace, resulting in an information disclosure.

[Severity: High]
This isn't a bug introduced by this patch, but does the NVM command handling
unconditionally overwrite the clamped size?

Looking earlier in se_if_rx_callback():

		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
			dev_err(dev,
				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
				rx_msg_sz, se_clbk_hdl->rx_msg_sz);

			se_clbk_hdl->rx_msg_sz =3D MAX_NVM_MSG_LEN;
		}
		se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;

Because there is no else clause, se_clbk_hdl->rx_msg_sz is immediately
overwritten with the oversized rx_msg_sz. The subsequent memcpy() could then
write the oversized payload into the pre-allocated NVM buffer, which is
strictly sized at MAX_NVM_MSG_LEN, overflowing the kernel heap.

[Severity: Critical]
This is a pre-existing issue, but can this function experience a NULL point=
er
dereference if a delayed response arrives after a timeout?

In ele_msg_send_rcv(), if ele_msg_rcv() times out or is interrupted, the
function returns and clears priv->waiting_rsp_clbk_hdl.dev_ctx to NULL,
while the rx_msg buffer is freed by the __free(kfree) attribute in the
ioctl handler.

When a delayed or unsolicited firmware response eventually arrives,
se_if_rx_callback() accesses se_clbk_hdl->dev_ctx->devname, directly
dereferencing the NULL dev_ctx. Could this cause a kernel panic, or lead to
cross-thread data corruption and a Use-After-Free if another thread is
currently waiting?

[Severity: Critical]
This is a pre-existing issue, but does the IOCTL handler directly
dereference a user-space pointer during header validation?

In se_ioctl_cmd_snd_rcv_rsp_handler(), cmd_snd_rcv_rsp_info.tx_buf is a u64
representing a user-space memory address. It is passed directly to
se_chk_tx_msg_hdr(), which casts it to a struct se_msg_hdr * and dereferenc=
es
it without a prior copy_from_user().

Wouldn't this cause an immediate kernel panic on systems with SMAP or PAN
enabled? Additionally, it allows a time-of-check to time-of-use (TOCTOU)
attack where a malicious thread can alter the command ID after the validati=
on
check but before memdup_user(), bypassing validation.

>  			dev_err(dev,
>  				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
>  				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D1
