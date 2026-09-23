Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C353CA62;
	Wed, 23 Sep 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189446; cv=none; b=th926rfMPsFNDN7y54cDuTaPpHRSvL73W3s0RKPZ3lPJzhcyN7wgkDwoV5UpMmhDhrKBja7/uiUQN/fSaFFxWdZzuce8C1lx0QEi84z2+8qoRBloehjYoI0uxwkIyQIKd9SXWUd5tUovQs272kbrxJoLe9VDldPbdddb09uIIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189446; c=relaxed/simple;
	bh=U6/uCl87s0+Hc1ZtDiSQgiQUEDeaYtWUpfqrwvxbB0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GczC+Qgsrv286SPdv5nDy4biF5zlmFTRr1EUiwYpHFQhOUCr3xSEBpHmcx81geVOowYj/vvNkAA5aVbBh5xMNQgNviLs57VLWh8OxWrtI4z3iNE/o4B49O6JJi5t1yIU/e70XLfHJtT7rJ60T6JEwvRwmbqMCyIMNgTgpDtWVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKAUWCD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKAUWCD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE4A1F000FF;
	Wed, 23 Sep 2026 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189430;
	bh=HYPSAs/qLaRPqBCuH9oplGEk1MaNBS4IqrETrkTjyTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKAUWCD66hhfBxZYoYzGCJliy1C1mg0EZ72TnfL3KlEV0vIg6jvRv0vezNmxTxZOP
	 YWENaA4JAWFZezMnsMHpuZBp6SbD2faUlSn2X1+Fya4Nr3sYBnvCsZMco+9KF1nm+m
	 G2eoNkhcrtxbtdGoyg54vEoNaXDZwSVcdy8N/K2DuPMlYa4fnCm2PVbAgtQK1B4YwS
	 MXYlU22QLgQZ+qVXVXzpECCqe1E6UWsExr8U9sUAuejERxfNZ12GWtdbyU8EN5pQ99
	 r6TmlTZzQl/TMTBIpt5yaZ73yzjUh289uRVhLpmmr8wGEszkjNXJWQH3MMMbpuFBRm
	 x1yL2PgJtgzXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923184255.299034-2-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-2-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:50:28 +0000
Message-Id: <20260923185029.AAE4A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio-rpmsg: lost edge interrupts due to SET_IRQ_TYPE unmasking
- [Medium] gpio-rpmsg: unaligned 16-bit line field in interrupt message
--

commit 2049dbbf3b708aaa525f92e4899cb8a65c3fd69f
Author: Shenwei Wang <shenwei.wang@nxp.com>

docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation=
/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 0000000000000..9af75cc759ba7
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst

[ ... ]

> +Interrupt Messages
> +------------------
> +
> +Interrupt messages are sent by the remote core and they have
> +**Type=3D1 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmw=
are
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.

[Severity: High]
Does this mechanism risk losing edge interrupts?

If a secondary edge interrupt occurs while the interrupt is masked during
processing on the Linux side, it will be latched by the remote hardware.

When the firmware receives the SET_IRQ_TYPE command as an unmask signal,
writing the trigger configuration to hardware will inadvertently clear this
latched edge on many platforms, such as the i.MX platforms this driver
targets.

Should the protocol separate MASK and UNMASK commands from configuration
commands to prevent clearing latched pending bits or resetting the
edge-detection state machine?

> +
> +.. code-block:: none
> +
> +   +------+------+--------+
> +   | 0x00 | 0x01 |  0x02  |
> +   |   1  |     line      |
> +   +------+------+--------+

[Severity: Medium]
Will this message layout cause hardware faults or performance penalties on
remote processors?

The layout places the 2-byte line field immediately after the 1-byte type
field, creating an unaligned multi-byte field. Without padding, this requir=
es
packed structs on Linux and could cause hardware faults or performance
penalties on remote firmware processors lacking hardware unaligned access
support (like ARM Cortex-M0 or M0+).

Should a 1-byte padding field be introduced to ensure natural alignment and
cross-architecture compatibility?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184255.2990=
34-1-shenwei.wang@oss.nxp.com?part=3D1
