Received: from mxc.seznam.cz (mxc.seznam.cz [77.75.79.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7F46425
	for <imx@lists.linux.dev>; Sat, 14 Sep 2024 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.79.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726317725; cv=none; b=toyvC5HwftBktAtI6ghoDGDBFxHfNKsBVw99a2CYdtPg/4Zx+yx1108Bk66Y4U6i5bvbI6lcOfVNiksRERYU6YMNOjqkbj5sJkGoZ1G0sGY8wGFov6FCdsa1gk7f6d1ZynAMbCYF95iq0lGkXrCGAgkuIAi2p9o5ny1xCmBo1qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726317725; c=relaxed/simple;
	bh=8gDdLYHG/bPQhFBekHGZlHMBrkBrj2F7insIxZX006A=;
	h=From:To:Cc:Subject:Date:Message-Id:References:In-Reply-To:
	 Mime-Version:Content-Type; b=Yhl0tdlsMGE4k+O95JeUZaCmeTuez1dPBVHM1K64eYxbXACtTPwhBe/HLc9eBFrXOe8Nk/9u7LYPPFHYsgYX62dZpZhXu5ZJXPwjGOgQR1NU4LRzLcEAieba0R3fKaXcD90VBJcV04T5qJBc5U5b6j9f9fKNITEtR0Rrigc92HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz; spf=pass smtp.mailfrom=email.cz; dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b=oXe3+xjL; arc=none smtp.client-ip=77.75.79.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b="oXe3+xjL"
Received: from email.seznam.cz
	by smtpc-mxc-846b4f87f5-jv7x6
	(smtpc-mxc-846b4f87f5-jv7x6 [2a02:598:128:8a00::1000:42e])
	id 4e36e6fbb0c254514eb868e3;
	Sat, 14 Sep 2024 14:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1726317685;
	bh=8gDdLYHG/bPQhFBekHGZlHMBrkBrj2F7insIxZX006A=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=oXe3+xjLwVIGNDd2MyNtWl+MG4Ppe5ew33iQKKcJNVOenzlevGI5EQLTnVyHWzzR1
	 YjuV9nFr352vxlrsFuNbq0dCl6XiiGXXdSQycxN+5cMkMrObQbnuFFpkfxOvkk8jx/
	 gJR0Xecz3fmtbN8XHbcs5F+361KVaF0aJzENnQbq2AaYRFtqbhKUthlgHSgzP0C3Sn
	 WkfHXtcsm+KAqb0mhVkPfPq6xDZAPhFBlcWm4eeBQFynDXvmVQyCkx08BHMixoy2IB
	 aM/ulR/mv5t53zzAydTOKQZc+H9oKcmQV5PmYs6PJLd1CWtJlcns2T5op2GRwm3APA
	 GlwIbmLMy4cCA==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-ebox-5.0.189) with HTTP;
	Sat, 14 Sep 2024 14:41:23 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: <linux-crypto@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	<imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_crypto=3A_mxs-dcp=3A_Enable_user-spac?=
	=?utf-8?q?e_access_to_AES_with_hardware-bound_keys?=
Date: Sat, 14 Sep 2024 14:41:23 +0200 (CEST)
Message-Id: <26J.ZcYd.2XLMv9N98Uy.1cvOHp@seznam.cz>
References: <1di.ZclR.6M4clePpGuH.1cv1hD@seznam.cz>
	<ZuVKtuMqiCu67hn2@gondor.apana.org.au>
	<24h.ZcXr.7FvRaSxxibG.1cvNHL@seznam.cz>
	<ZuV1zguLBsBZnGB5@gondor.apana.org.au>
In-Reply-To: <ZuV1zguLBsBZnGB5@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-ebox-5.0.189
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> In that case I would suggest introducing a flag so that the key
> can only be accessed through the keyring subsystem.

Do you mean CRYPTO_ALG_KERN_DRIVER_ONLY instead of CRYPTO_ALG_INTERNAL or =
something else?
