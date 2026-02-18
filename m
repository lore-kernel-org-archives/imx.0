Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F032DFA3A
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433752; cv=pass; b=oO/avyWxEB+nlH8skHkvOX8nFT32MQFNNqQ9MYOV6y57i0oHM9AvQ2LVRGi46yE9g/4L5UzBIxRzCKuMPZuCNfXFv6EqdEwST2dqRmHadExd9+6OfMKSrHRsbqWcTb7sGpFANtJnHAsZ963prqBXV84g5PBcPqR8Nrrxn1Gqi4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433752; c=relaxed/simple;
	bh=LIA1iPf8eu3eUq9e0LC3p3qbdK1v2xt89TX/NApYVd8=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=akzOiCyTt5PDNuIWTuejpbsYyp5Vf/mQ1cbAhOq/SxqMwmugt8uQl5DKZbQZ6MQwtyi+tvHsmN5bNPvNT/+YVXvmoXfALWYJMu6qfrmMiCP78MYYSMxzauEhnz7h7gfHCVlmEP9rJK9/XsLKp3tlwYoajIoPc5ThxSyXasUesEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qTe/RnY5; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qTe/RnY5"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=P50MVxpm4pNCgyiT7F46O0s8JVX58z0BCx7mjjXCMvc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771433727;
 b=gp7Kr0pvZ7peB0wbRf3GgcEoIfLwVRLLZK9FlBrwS8agQ5o7UiM61kz/u4jBYTPjEIR/qcwA
 kythYUtz0oVbvci4eXp8PkRdY18Sr6XKmjrL7u6Fn+p7yW5rJ7L3EWad6DTJJs285uZRGxToHpm
 y8bgh1Y6D6aQgP1MmGuzErBDFn0jUFQwRhSB86zGbfBM/Zftw4CiLtIZgXUePsDYV5iDmONVTmI
 1rvX4xpb3kY5nO89nqwLe2SdWTS7c7qUyyKsSvxvpFwegr5FWxCyA8dEeVGMzAW6UqQtchoSbnF
 vlSCXrk9mJBVRYR2plFEI9dF/y3Y+LwlfqDZ7dS/DQrkQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771433727;
 b=FkLnFeuh5eYgV15KorHJNLJryfyzPfXZ23IsRBAekOQwM/BSkUf9joQc6zMEzx49TGSPx73T
 9HPB2T/FACoqyVf69VEdLQDTkWUKGehQHqYVVUIAaQPxu0OtjwAV2XBXJFiPeIE3SvU7Ijn5nqK
 NNBDzKo6GNGkU2sfPdg0XXvNWNszNEsrMTRz2ZOyt53GtbCFbudH+D+A7wgK1W9u5IcJtA2b/Ro
 yEEivAMcKl1k6rGMNRxohkxEw5J5WhM7sTC8kqhuP/LUxUTDnAI7/bkhG8kZKmqh8pHvTxRpLL5
 HUm3jxecdXARAjcOcSSwDCi71JCgCTguNXDWOUvF6tT/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 18 Feb 2026 17:55:27 +0100
Received: from 10.1.31.92 (unknown [10.1.31.92])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 793C9A403D9;
	Wed, 18 Feb 2026 17:55:14 +0100 (CET)
From: =?utf-8?q?alexander=2Efeilke=40ew=2Etq-group=2Ecom?= <alexander.feilke@ew.tq-group.com>
In-Reply-To: <aZXr_r1VEx5kcl7g@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
 <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com> <aZXr_r1VEx5kcl7g@lizhi-Precision-Tower-5810>
Date: Wed, 18 Feb 2026 17:55:14 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Frank Li" <Frank.li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <19f328-6995ef00-67-b89a9f0@203920772>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/3] =?utf-8?q?ARM=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_imx7-mba7=3A?= disable =?utf-8?q?boot=5Fcfg?= pins after boot
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fGN0y6h0Cz4MQYG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6f2a51003bcaff58264e8b6e95e66ea6
X-cloud-security:scantime:2.494
DKIM-Signature: a=rsa-sha256;
 bh=P50MVxpm4pNCgyiT7F46O0s8JVX58z0BCx7mjjXCMvc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771433727; v=1;
 b=qTe/RnY5opgescxjkh+nvxinWcRsn+bJwl9jU6bSUhzYpnhQmCb4Tqnonsc2balFr4x9DH/w
 R7YYMCgRTWhm+uSLHVvBbbXJnTCYORHlAMwcgI/xFsmsZMF6wrNnU7P1JtHwY1PMD0xxY0d7Fvu
 b8LCawLY3IGIE9Q6HQ9+BedeesxVdLKHEclUSMvMB4S8IKp8gbVlnbqwBiC7uy7DAQvU5B9iB/I
 NWbb3nqV77kl0/FCTRCvSco+gU2S0i80TD1mvEwn55UaCNCZJr9muKrQpdgyMjq2ljstHlxo6II
 n5oacJ7O2yDuNHa683EcqhC5GAy4OdwRweXo3cybHVJEA==

On Wednesday, February 18, 2026 17:42 CET, Frank Li <Frank.li@nxp.com> =
wrote:

> On Wed, Feb 18, 2026 at 02:54:14PM +0100, Alexander Feilke wrote:
> > The BOOT=5FCFG pins are located on the LCD bus on our starterkit.
> > Disable them after boot to separate those signals.
>=20
> Your comments is more clear.  Is below commit massage better?
>=20
> ARM: dts: imx7-mba7: Deassert BOOT=5FEN to separate BOOT=5FCFG circui=
ts after boot
>=20
> Deassert BOOT=5FEN after boot to separate BOOT=5FCFG circuits from LC=
D signals.
>=20
> Frank

Agreed. I can send an updated patch if the rest seems ok

