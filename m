Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159B84746A9;
	Sat, 12 Sep 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213456; cv=none; b=f9HkrrsZLRFDS0/KCWz5oXxn6uh3RJpYa+7PeWDNOG5gSzF/Q1LGJWHv0a2FHjfaoTwVq2QArLC7JkkbcSI6cDvBoC+iU1mcw/rJuNaW8T2lopygQ479wo2zK2PeLED4DQ6+lwQOOiH9GtM5HwzRd0WWuiYftnCK9iHJOHABddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213456; c=relaxed/simple;
	bh=F4ifACABzT+ldoGIxrbQkNdUoxTM641otPczDJPqHvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HAH0bB9eHC2Ii3f/w2PmtPtpLHUEFXEMllu+yLM2vj/OAq1Kotpzbu/151PyvTfrvP28z+ebcde73zQ1BSguQssAjAuu74+1PYXWQ0R1ywB9cXhClQubdgXsINVqQDHDf3fqCAdj/2AHzDWUMEqKwHDzWwSZqK1x1lMTk8b3nQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epBz1+xx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epBz1+xx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D130C1F000FF;
	Sat, 12 Sep 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789213453;
	bh=mdJy32ogPg3obq1vBcOeTI2xDZdT+88XVi3sYSuizrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=epBz1+xxfWvGvzIjES7Lhc+iu808KmND7CEJqwCuNPsG5UBE3yyul3Rfblw53GKYI
	 mF+H4T2/9gHJfJi/D7y8MYKCo+MQTiWN5GrB5GaqrOYqXNoTHX6WkZrIJa8LOD2MUk
	 Is4rnwNpgoQ7Jb049KH1PhT7TwL9F+L8x587qVDPXIiYMMW0BmPwCucRY9lsbJC/VK
	 48icbwtyVn8bh/ZBXFBHOW+ULnCQtjSfPQ3DgAlq3VoWczu2LeeKzcHx17Ej+euvE9
	 w+VehfJyKQtfuz06hiBLvN+PzmbEZ6qJcYFG4sRkf41T/EDgmEYOcGg3iNWLDbPjgC
	 TWiuDYNm9VqWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v50 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260912-imx-se-if-v50-1-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-1-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 11:44:12 +0000
Message-Id: <20260912114412.D130C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The documented signal handling design drops successful responses f=
or completed hardware commands, breaking non-idempotent operations.
- [Low] The ASCII sequence diagram for concurrent ELE_STORAGE_OPEN_REQ ioct=
ls uses confusing and incorrectly directed arrows, misrepresenting the flow=
 of operations.
--

commit c9bb0d9967cd15b4acd5ef648fe93b131b0a638a
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and C_DEV driver for=20
secure enclaves like the NXP EdgeLock Enclave. It details MU=20
communication, character device usage, and synchronization protocols.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..984ee3ecc8dc2 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst

[ ... ]

> +      |                    |                      |  [B gets lock]   |
> +      |                    |                      |--STORAGE_OPEN_REQ->
> +      |                    |                      |  [FW rejects:    |
> +      |                    |                      |   one storage    |
> +      |                    |                      |   at a time]     |
> +      |                    |                      |<--ERROR_RSP------|

[Severity: Low]
Is this diagram accurate? The arrows seem to originate from FW and point
directly to Userspace B, bypassing the Kernel column. Does this misrepresent
the flow of operations by implying firmware directly interacts with userspa=
ce?

> +      |                    |  se_val_rsp_hdr_n_status: -EPERM        |
> +      |                    |  fw_api_specific_ops not called         |
> +      |                    |<--ioctl -EPERM-to B------------------->|

[ ... ]

> +      |                    |<--CMD_RSP------------|
> +      |  wait_for_completion_interruptible()      |
> +      |  wakes: signal seen -> -ERESTARTSYS       |
> +      |                    |                      |
> +      |            [response is in rx_msg:        |
> +      |             validate with                 |
> +      |             se_val_rsp_hdr_n_status()]    |
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

[Severity: High]
Could returning an error (-EINTR) to userspace for a hardware command that
successfully completed cause userspace to incorrectly assume the operation
was aborted?

For non-idempotent operations (like incrementing a monotonic counter or
generating a key), could this lead to userspace erroneously retrying and
double-executing the operation in hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-imx-se-if-=
v50-0-80834ef510d3@nxp.com?part=3D1
