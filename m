Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44978349CE8;
	Mon, 14 Sep 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396076; cv=none; b=c0VpY+qWqsaiEv7Kp967JhJfDUFWrdh8r4kVeHr37hZff1y6ysNBc2JoCLQ4hcd6JtTbMtdfY7nRM644TGVHGtACcf/vYgqojIGV7WZIWNbfx4LD5UcIs3DKARlPUZ0zSP409Y72BI3e011cdCaTfvGCBeS2p8RoysEaqQG7m3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396076; c=relaxed/simple;
	bh=r8GTcOelbzVWJFV3Xw+ifezc3vD3zBO+VljqNAyHObM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=THTkYyeE/GWntNiR3YFTrPlZtE5oRlM1Pz+h7ZPa57EvIlnMaU5Yb8sKWTa3MIK8AqMsjt2C9cfldrk1UMwewzhkH8m3MyLmpzk4a9v7gxu9o/yrnS8flXMJwWxECFV65G0AN1ryu1q5hai9woaohtDhV5EpDh2XOKfufmYwnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/yCLLej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/yCLLej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A2B1F00893;
	Mon, 14 Sep 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396074;
	bh=9tVltqO5XQ389CmZ/BgGraZUiUQF9A9MYg6b84H/Ivw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J/yCLLejH/JUuKJIjp9NbpdV8DiIGbGpkh5Q6hsURYmdxiLDsfE3zJg3arJX7OvvQ
	 iMAfF7tpPXfxVr71zg2FEnYtIx+MUZzRfDRjgszP0d8AJIi4t1fZYHNQHcN46xBfVm
	 /gP9uXKACWa058qGl9vmWl8bj4JPqI3PHrVj96ki7OVM5sZQCPL/ANgx94sZSjP/+d
	 CfDDRcBd2BiY8w4WfxgG5OqCuscEF1ob6AGVGjbC1xYvBxg7ezm4lUKGdBSRVYa5a1
	 dntsCslxHkYoPqx0Kbt1j9DHuuSj3aWa6exmy6QsoUJFPEXGajcgVCfdE8K67BqFeQ
	 vfOgKrB6QnQSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v51 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260915-imx-se-if-v51-1-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-1-4a7dac612cb5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:27:53 +0000
Message-Id: <20260914142754.70A2B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Artificially intercepting a successfully completed firmware comman=
d to return `-EINTR` leads to firmware resource leaks and violates standard=
 syscall semantics.
--

commit 08f44ced154dcd881139680cedb3ca1074757a26
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

    Documentation/firmware: add imx/se to other_interfaces
   =20
    Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
    that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
    - NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..984ee3ecc8dc2 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst

[ ... ]

> +      |            [fw_api_specific_ops()         |
> +      |             (is_cmd_interrupted=3Dtrue):    |
> +      |             for SESSION_OPEN: record      |
> +      |             handle, close session via     |
> +      |             se_close_session(), clear;    |
> +      |             for STORAGE_OPEN: record      |
> +      |             handle, close storage via     |
> +      |             se_close_storage(), return 0] |
> +      |            err =3D -EINTR                   |
> +      |            (not -ERESTARTSYS:             |
> +      |             prevents VFS auto-restart)    |
> +      |<--ioctl -EINTR-----|                      |
> +      |                    |                      |
> +      | [signal handler runs; userspace decides   |
> +      |  whether to re-issue; FW handle tracked   |
> +      |  or cleaned up; no firmware resource leak]|

[Severity: High]
Does this behavior leak firmware resources for commands other than SESSION_=
OPEN
and STORAGE_OPEN?

If a non-fatal signal is delivered during the ioctl wait for operations like
ELE_MAC_OPEN_REQ, ele_msg_send_rcv() overrides the successful result with
-ERESTARTSYS.

Then se_ioctl_cmd_snd_rcv_rsp_handler() catches this, calls
fw_api_specific_ops(is_cmd_interrupted=3Dtrue), and returns -EINTR.

However, fw_api_specific_ops() only implements rollback for session and
storage handles:

ele_fw_api.c:fw_api_specific_ops() {
    ...
    switch (header->command) {
    case ELE_SESSION_OPEN_REQ:
        ...
    case ELE_STORAGE_OPEN_REQ:
        ...
    }
}

This silently ignores and leaks all other handle-creating operations.

Because -EINTR is returned, the response containing the handle is not copied
to userspace. This permanently leaks the resource in the secure enclave, and
could allow unprivileged users to cause a denial of service by sending
signals to their own process during ioctls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-imx-se-if-=
v51-0-4a7dac612cb5@nxp.com?part=3D1
