Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F01F1304
	for <imx@lists.linux.dev>; Sun, 28 Jun 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782635141; cv=pass; b=kFgO6UVjMsKWE6Imz/0wsdM7MOFByGSbFlZOquPfNdmgmmk9DON0/SyT/i4StScFYeaqyb9ncLRD5StC4wp/ZTNNPFQ/Ll2fHpKjnF8tUyWWF1KQA7vNuwVay9GrdfWZlLe7AYnqLJKw273jpXs9jpvUBCRebLgsGElO87HNuMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782635141; c=relaxed/simple;
	bh=izF/1YMWroRLJtj5Po4k6OBi9HGf0KaYkAyMC7egpEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvnzFJDue5YlJg+iEb+GD2xRiSihVz0EuiDNBT5qISt4ZHRIM6Utzi8IfZOgLWy1bO1lrV/K3g8S+vSM0b1q8MD4crYahlBLSJTBkwLze42s2I15YdClg69n+aRaJZqZfQbNjuKvrBwBSDbo5X+4MsWaZ+QTlraB0cN3gyvbPc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpHcn/SX; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpHcn/SX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6bb8a5980so18691795ad.2
        for <imx@lists.linux.dev>; Sun, 28 Jun 2026 01:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782635139; cv=none;
        d=google.com; s=arc-20260327;
        b=IYNFMm9v3XOnZslci0DjyzZMkJqZY7YGeJQmsTX5XxAs01HOGzMuZpvhc5HMiqsxG2
         zmCu8sHPS8+HgF5LBxwE9N7GUGAVukN8A2AXP/oD7lsM1F6Y1DTiwZGG90E2O3yploWQ
         fGitpl5VOsD5c7ZCyPnRq6RO6K3vSxq5mJUSes2UwW7AZM6jPGcl+7yGOoE/mnmgFdDD
         YoOi6rlQLzmy4Ev7dkhdGFWf/SMPyGKxSye2K7YqujuQP29WW0ZzWPI0+Y0St45rbckQ
         UGbI+G9nRMa2bS4qlrw3QTzZ5J2EjnMEnj6l570yQrUSNIoynrEtz11m+TcNFn8dk2U1
         SR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        fh=I5Bw5rdSx0m7mf8sq78E5J+PQHlvhZ6MIDnK07iVX7c=;
        b=c73JX9Vk0IzARvCpHpIpOTeCFOPPWR+5MffYysddMUUNyJmpC3o2YfmJI8GXUSB6Yy
         OVTXw2n3mXIzWR/kcT4J6/O0ibmdT7w6hn/LWFKSzaKoWsX9TiFxpdOQQo9M7NR6QbaP
         zz25uwflZmhATYmD7rfcid+QsCpg/UgPbEaSohF1UffFdGDLXSOwEhx9Dq5oOOYVEMiF
         5Fw6mrj0kxr/eiareaKhMWXPqmwuMoRk7h8cDmOOBaBThv5QYHPtoK0K2lo4xUMU3Nqy
         VVxgtE+CStWmTeorhgj7GI2pBwBp2vGU9xKAeMWBE3SP15ASwkWdHzCKgtC66ZSRvDU/
         Y7Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782635139; x=1783239939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        b=QpHcn/SXVWaZfqDlJXcufKTgSsWrQ+DUyMLeJu9Wrygpms7+4UNOqMbIS+4szWeHAz
         i+VE1y1hGJKYI+QPcUIyzd7rKdlxn3GmKopw6RQBGaBouqeSkEy0O2JfR/f+Vftv5dMk
         WwxrUDS2124Ac2JV76BcSuYd1Qj5JxH8Y1tqOiOWJaL0zoAKGhE3o7jZPaHyJZnRpw7j
         r3aV7pHLd8voWBBoKfOarFGvVR3mNL1aoMAorURd73w3q2cBDD1PKG/pyH5dwa3g1G8U
         fWS4eU6Hqtg7t74qslD/2KinlckJFkKGS326tSm97Bk6di4stNHVVZwNKqCdQ36IfnXd
         1YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782635139; x=1783239939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        b=OJoogvqiJI/cIikNi00vXXGruTCkphwdBBWKCJUd68+1Dv19Q0okG5TSVmzCeiDgyf
         1iNSpr2NPYMQCardpAVKk4i9ZP3TB66NrVgDI9HCMidxoQ9mounn2/xjl/gVH7hSi+9O
         zD9IfJOq6LH3YQVWMBIrLCGh0n1zpqXFHH5mZLhurfC/7SQvnW7aI2tnMrhZG4habHb3
         HDlgDCYjXQg3K7ypk+mH8j27q8AaKfdk38+Oj/NAWQ5C+/ouYdSvxSIb43ksamD6RpQ8
         C3f46RZM6BprqbODmTmmdnadkUuN5LBSUaDLCYPHCd0gBBAMKwv5gRtFq81WQBGlt+Ap
         MIYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JXlSyzSJy7jg4XotD7mTL0ymdoYN6CGTmqfqdECTdGQWjGkC+yLDv5PRBueTQ6/T1hlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZdvfaSO3AAuInUfGuz5wXLUeUqmLLck7LuS64cZjSpf9NZmcL
	siCMA08JSLPleC5gDh0AMM8/S6O3uxne0ckvHRGhgRvh39cBCAKOhAkdrFEmSS5KMvF2Hcw/NY0
	w8bWcrMrvgy4RAzmR2+WLEITtqfTS5fo=
X-Gm-Gg: AfdE7ck2xCVhHlcHaBlgpH8kR4ELSlnb5wNW1Dw6T8zbcH1BWO6lvGRemMBilb+E+e8
	/1JSYIwobksdq10hL4XsYd+hy152f5UoH2i2TwUWzuE1i1hRfbnSbTNHfATlrtDxAtfG7pO9RRp
	7eXcqVEFpI68mbTWoGrJkOPME1jP3CQXXPkPsVTqKr0DOfLdp0MgSnwOnqTZDgkn+QCnXDk3hrG
	Kr74ZgE77LyDiv0ZbAYR7Bz+lkk4rgA2BmoApWItMu0Fm/mF6iPG4d/omufel0rfmGph/BPHg29
	M4KXSN9Abci1JJO8h8fkfnx58H4YwZn0Yy0jF4M3PkrH4nG7yHX6
X-Received: by 2002:a05:6a20:d530:b0:3bf:90ba:52cd with SMTP id
 adf61e73a8af0-3bf90ba55e7mr772607637.11.1782635139074; Sun, 28 Jun 2026
 01:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com> <aj6l_eMFLvQVq2md@SMW015318>
In-Reply-To: <aj6l_eMFLvQVq2md@SMW015318>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 28 Jun 2026 16:25:28 +0800
X-Gm-Features: AVVi8CfsyW0fJ7FrAIo4YFoZKQX_l9mugHxBLeemo8-ZqsMdLUudTpptA2bn4QE
Message-ID: <CAN4SLj2eStTLmu=vbN2ekAV3n0D8E5HUFwh31AjqYz=0GVsFeg@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,
On Sat, Jun 27, 2026 at 12:17=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> > ---
>
> Thanks for your fix
>
>
> imx8m_soc_prepare() call be from probe(), can your use
> devm_clk_get_enabled() to combine clk get and enable together.
>
> And use new patch change ioremap() to devm_ioremap().
>
Those resources are only used in the probe time, it may not necessary
to use devm here.

Best regards,
Felix
> Frank
> >
> >       return 0;
> >
