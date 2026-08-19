Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A67440636;
	Wed, 19 Aug 2026 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166360; cv=none; b=Eav3U6PVRDlCsHfPiyT052QQukLW5nmFlSbeI815/Uzcy+pWfSmIZ8aa2qOG9G2nlxZX3VBnXe2vSojSeWgr9BQabq+MloxUi9vComWrkhb6mC1iQIABpWVDBUG+ZX3EXPHUVPxUH15Osxg4AGXidxG3AAV4LcpvLE2sC7O0juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166360; c=relaxed/simple;
	bh=j93O/wzY+ND2y2T5OB2ptTo2V7Qf86MbrCV2pZCYH/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r8wrJkW+ohDsTJlBiaQe0B+CAQEVZWiyf0Jk5Z5T+GK0Qfj9P9qOb6c9dHZ3HgTqYCTtEwxJsrDMWIZYfBFdcTbtz4sDc5KkJOxNxC8T0ZUrEG0uhxiXM5wEbrnpdt6tgY8lHN/Ym7y0Pegy8YHM/dEOPCNLrP7i2uHr9NQq0NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edmJxd/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edmJxd/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8E51F00A3A;
	Wed, 19 Aug 2026 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166358;
	bh=j93O/wzY+ND2y2T5OB2ptTo2V7Qf86MbrCV2pZCYH/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=edmJxd/PrdQSDvgsExrOPDvrHqncYA708mfDN3pihKtmJWIpcvsxx1SkdnyHyDoV8
	 HiewbVbHMxFdsSB4i5+70LZneATeSZZf3aWyA/e+ZCc01qETcWKQFYZBQwdEMo11hy
	 HynFnlVpEzoQSlBKWYnHPxSd+sbCGh6w/2oc2B4E/fIz7iTG56tAr2dOUgUzN/4Q5v
	 sw8Gx7oo9k6LC1xWhtTk90U4GFM2AERw0Ipwjq9zVgpSLom+bp5w1E05QKY2ib66eS
	 3NUDoBeAMO413LtTLi4f55m1bg22MoXegmAj4BcWTI15UMx71eBxYiJ/l1BcjQl+SL
	 7EOgB2u9f+Nkg==
From: Thomas Gleixner <tglx@kernel.org>
To: Julian Braha <julianbraha@gmail.com>, florian.fainelli@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, linux@armlinux.org.uk,
 Frank.Li@nxp.com, s.hauer@pengutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com, radu@rendec.net,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, Julian Braha <julianbraha@gmail.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
In-Reply-To: <20260801212235.2692694-1-julianbraha@gmail.com>
References: <20260801212235.2692694-1-julianbraha@gmail.com>
Date: Wed, 19 Aug 2026 21:05:55 +0200
Message-ID: <87lda2j5gs.ffs@fw13>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 01 2026 at 22:22, Julian Braha wrote:

> ARM_GIC_V3 selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> dependency, ARM_PSCI_FW is met. However, ARM_PSCI_FW should be
> selected by the system type, so ARM_GIC_V3 should depend on ARM_PSCI_FW.
>
> Additionally, the systems that select ARM_GIC_V3 (ARCH_BRCMSTB and
> SOC_IMX8M) need to select its dependency, ARM_PSCI_FW, too.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.

Marc?
