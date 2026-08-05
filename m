Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CB481644
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945679; cv=none; b=QeLn5xssM6eUYIZW96We00AVBa2cQRllv2YSLPR4lvZHMqlKyEqAwN2Zl1IfrzAWeq5dVjF87ZjHxdsQMS56XBjP99iiaVTv3ogV2sLX4I0cQshVrKvozYXjAb0/KI2AafJei9/S7AIQrULP/LVT120okBzSZStLe4tltx2F86s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945679; c=relaxed/simple;
	bh=Ubi3+nowkLINSO+PcGCjm5kierYoispSBiInEJhyHdw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urKOlgk3Uc4eUyjNoIacmeK5YIn4FLChmxxwSNlO6ncIs22FrDVy0mbliOqPjfjknZEzRswurlvZvo8FbVQ61k9NN/gKnNXsbVRK6frK1RLsc4kwAeQu46q9BPJSOeoMcZUIfBi4zMlF7ipuBMi1m3fvtRae6eevn6u5pgimTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=PNi6bp/O; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="PNi6bp/O"
Received: from bat.kanata.rendec.net (unknown [24.114.108.137])
	by mail.mindbit.ro (Postfix) with ESMTPSA id ECEAFC22CD;
	Wed,  5 Aug 2026 19:01:02 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro ECEAFC22CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785945664;
	bh=Z8FoKNUn7FgUz4HllsNiRKbAjVhDOXT7yBiHRpX9yP8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PNi6bp/Obrs1c+OIL9w1zpfcN34c4v5jE1Q+wRZDBWvCMpPWRNDqXdmgNYwzz93gg
	 QsNqiy+AEo/lZT9idrtuIdfidYrbAbT16suL2pMYa5K61XKrBUrf4AEIvsar2jnm5Y
	 OVD6AXM4HitWzqQmHwi7kojRnTmGt94U+xoEj1S26HssEH+cWACIi1ISzZzAp2ouDJ
	 Ihdx/RcgkHtb42lXn12MCg46vA5pHIHDLvIXKlisFSZIHBKpwe3UGTpms847fu4OpS
	 vmukHbRAOia0n2SvCsYNVyY3KL1B8ZJ3Maudl1JNrQC/4OKbDZ1SbTKp7joYoUyoaY
	 3BPIliqcVm9qw==
Message-ID: <227049e031807e27863b3d6ae950de10cb2c3187.camel@rendec.net>
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
From: Radu Rendec <radu@rendec.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@kernel.org, Frank.Li@nxp.com, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 05 Aug 2026 12:00:59 -0400
In-Reply-To: <CAOMZO5CFe6P3UvnhrhZqO=ALGHUaBbQyP2qFeP6qfkU_69Q6WQ@mail.gmail.com>
References: <20260729221416.499781-1-festevam@gmail.com>
	 <5ee0c572d017ca3ee3503c4e1901b8ac5d4f5966.camel@rendec.net>
	 <f124515c087a5e7259c2ecc90a0f6e47a7619f4c.camel@rendec.net>
	 <CAOMZO5CFe6P3UvnhrhZqO=ALGHUaBbQyP2qFeP6qfkU_69Q6WQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-08-04 at 08:09 -0300, Fabio Estevam wrote:
> On Sat, Aug 1, 2026 at 3:54=E2=80=AFPM Radu Rendec <radu@rendec.net> wrot=
e:
>=20
> > I take that back. At a closer look, I think both issues identified by
> > Sashiko are valid. While the second issue is marked as "pre-existing",
> > the proposed patch introduces a new path where the issue can occur
> > (leaking the irq domain).
>=20
> Would the first version of the patch be acceptable?

It certainly avoids the problem of the extra error path that
devm_pm_runtime_enable() introduces.

But Sashiko had a comment on the first version too, and I think at
least the first issue - about the double-disable of the clock (if the
device is suspended when it's removed) - is real.

In my (very limited) understanding of the runtime_pm framework, there
are two ways to handle this cleanly:
 * Manage the activation and deactivation of the clock indirectly
   through suspend/resume requests. The driver already enables the
   clock in its resume callback and disables the clock in its suspend
   callback. Instead of enabling/disabling the clock explicitly in the
   probe/remove function, use pm_runtime_get_sync() and
   pm_runtime_put(), which indirectly resume and respectively suspend
   the device. This is what drivers/irqchip/irq-renesas-intc-irqpin.c
   does (except it doesn't manage a clock).
 * Call pm_runtime_get_sync() at the beginning of the remove function
   (which requires a matching pm_runtime_put() in the probe function).
   That will indirectly resume the device first, then it's safe to
   disable the clock.

At a high level, the second option above would like this:

static int imx_irqsteer_probe(struct platform_device *pdev)
{
 /* Initial setup / clock enablement */

 pm_runtime_set_active(&pdev->dev);
 pm_runtime_enable(&pdev->dev);
 /* Mark device idle so it can autosuspend when unused */
 pm_runtime_put_autosuspend(&pdev->dev);

 return 0;
}

static void imx_irqsteer_remove(struct platform_device *pdev)
{
    pm_runtime_get_sync(&pdev->dev);
    pm_runtime_disable(&pdev->dev);

    /* Final clean up and disable clock */
}

That's closer to what the driver already does. But the part that I
don't like is that the pm_runtime_put_autosuspend() call may suspend
the device immediately, and I don't fully understand the implications
of that.

