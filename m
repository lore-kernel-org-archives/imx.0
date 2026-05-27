Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2564544CF3E
	for <imx@lists.linux.dev>; Wed, 27 May 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902577; cv=none; b=sqt41NzL/QRSlTEhvmBPrmpoVSK+ERceQzqHdXOm6H62iIHHfqtDXP0Hmf5TNGUm8iT7xGXdSv4zcnSkw9M82/rhmTvZ42Tau2spZYDEctsHoqIEniIwgcq8zGI3PGKJ9Ohz6bDSHt3U7WJX2jidkB16acJjE1V6HKClumYIoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902577; c=relaxed/simple;
	bh=2Nr2Xxt8Oy0fc9JvztohlvFYnp6ba4XuH1Xyai10AVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MRZki2pwD9NShck5d2ykQLYY/tBE2JGtOhhZ8OOEfYl1ntrvVnzw8Ro4OtgEC6uBtwdnXmC5sZxLB+lIeW8MahEN5JSMe/y5qFgec8Ta18XI/O4ndPLz0u1QMc8hhY5HnumRKseEBECj8oxm3v0msaRkBoAlaIDcXBRccPjTB8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJm3dk/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJm3dk/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443CE1F000E9;
	Wed, 27 May 2026 17:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779902575;
	bh=2Nr2Xxt8Oy0fc9JvztohlvFYnp6ba4XuH1Xyai10AVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MJm3dk/GnGaS4JYJ4QvkrzD5OwmTd9ysjigFp9L2NzRDSGIsW1gvWYBxWmiRIrMMn
	 nfXkKbkEH9fSrae4YNndLe0P0n1aiD/RElOcXKzOWTFm8u3Z3ghVyZINjjEuTuQx0S
	 5G1dHT2b7BE4LSgo9Gs/+YtJgaa/7/Y8BRDIIt9CwSKmb/NhyAmStkm8Js+FK5NQTE
	 mTCPCd3pg1qO7NumcD1iJipOFiEUKiLolVSOk79uakmjUNya3JAJR+4hv3znftAHSW
	 7tI3yLR6AlW6U2/A0JPu+UO6aqN98XMHv6Qr0dGJw48j6+64f+/9HSzY4X4cwsfaND
	 +MFm1o6zV6FCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: Switch to new reg_target/unreg_target
 callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: Liem <liem16213@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260527171016.67020-1-liem16213@gmail.com>
References: <20260527171016.67020-1-liem16213@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 17:22:54 +0000
Message-Id: <20260527172255.443CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] i2c_imx_reg_target leaves a dangling pointer on pm_runtime_resume_=
and_get failure, leading to state inconsistency and potential UAF/NULL poin=
ter dereference.
- [High] Missing lock acquisition and timer cancellation in i2c_imx_unreg_t=
arget causes data races and guaranteed NULL pointer dereference during conc=
urrent slave transactions.
--

(Due to recitation policy restrictions, this report does not quote the orig=
inal
patch code inline and instead provides a free-form summary of the findings.)

commit e5a765606d0417cc96ddfca98fce10ada4405f48
Author: Liem <liem16213@gmail.com>
i2c: imx: Switch to new reg_target/unreg_target callbacks

This commit updates the i.MX I2C driver to use the new reg_target and
unreg_target callbacks instead of the deprecated reg_slave and unreg_slave
names.

[Severity: High]

This isn't a bug introduced by this patch, but while reviewing the changes
to the newly renamed i2c_imx_reg_target function, I noticed a potential
pre-existing issue.

If pm_runtime_resume_and_get() fails, the function returns immediately
without resetting i2c_imx->slave back to NULL. Does this leave a dangling
pointer in the state structure?

If so, future slave registration attempts might permanently fail with
-EBUSY. Furthermore, since the I2C core sets client->slave_cb to NULL on
error, if a shared interrupt fires, could i2c_imx_slave_handle() dereference
the dangling i2c_imx->slave and invoke i2c_slave_event() with a NULL
callback, potentially causing a panic?

[Severity: High]

This is a pre-existing issue, but I also spotted a potential synchronization
flaw in the newly renamed i2c_imx_unreg_target function.

The function sets i2c_imx->slave =3D NULL without taking i2c_imx->slave_lock
and without cancelling i2c_imx->slave_timer. If unregistration happens
during an active slave transaction (for example, during a driver unbind),
could this lead to a race condition with the timer?

Specifically, unreg_target disables the module and clears i2c_imx->slave. If
the concurrent slave_timer fires and runs i2c_imx_slave_timeout(), reading
the disabled I2SR yields 0 (meaning the bus is no longer busy). This leads
i2c_imx_slave_handle() to invoke i2c_imx_slave_finish_op(). Since the
transaction was abruptly interrupted, it will then call
i2c_imx_slave_event(). Will this pass the now-NULL i2c_imx->slave to
i2c_slave_event(), resulting in a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527171016.6702=
0-1-liem16213@gmail.com?part=3D1
