Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070689;
	b=wgdlXmy767WNhsNgsOe5L6X60vFCCgpm7vAGRfRfzq4cYGHF38PXOMbFzfPlMm6SJRU1
	 9MzpIMK3frfyakTNIf/j97D+ZcWhLbVardgCDHBgmFmMBxBzHdV89w3UD9e6c1id2WZ57
	 JPKlSpfGHtV9m4sGhI7wTKxHZxUXNQkQo+ZFKILQ9h9aFQyYTHjX8tGrM/NAe1BlCcl5U
	 6k8BjqOD7wznnWhgOtC5j1t9YBT6V1vAdvJ3bABqrYXlQB9Vjh9TcnaHLVgtCfySCjkfa
	 7iGqNJavvcWeiPM29T/rGe6WkkLyOgVUlMdQsOqf9JcCZwOZK4YVkBbMiuO1wLJ5OhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070689;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=J3tz+cSiafPLwvvRm44v5Y4E466QIE4boG9uIUbrsH8=;
	b=EMz1JZ8R0vfoaC/CAF+EDDYs37swx4A/YaSuZyJ/CASGDcImusOjZsNIskGYyoq1bgoZ
	 7m9lgGdRL7pB4ttng4oAi6nQPN+aI0SKRBekc5Ue45OJvUesqOzYQQEF5HLB8do+KtiMy
	 V1Epo95y+b28IyNLbtsFeqzsrRE01JtQi3CPcC6huKTU40teTC5CUYTDoKkjtl8cnI4TB
	 YUdBS7Es6E9D21zUja40JS00gn0XmGJHwgLRZvcDVThIFeK7suR+paw6xjanYyUmFPtzy
	 goRyL3uf3y3Ewi4OzWIo/RB1xIXkiOIW+pkPGuJQuLXn/5ETkTy3ar4BjQ6umu5mYkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6io2DjS;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7101606A32C
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7101606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6io2DjS
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7AF7219F5C3;
	Sat,  7 Nov 2026 17:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070680;
	bh=O13tiZdfp/UEGvWDyX95aSMMi3lIWkI/aVlJE/2wuXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6io2DjSWYhFOZfsmOqsqU363wQkYaCYKDCLPsn1jo9U0yhsl/la94ukFdngDKeIg
	 CAswLnqCHWtAa+HWFrndk6DAUroYhIlRxK23ZEXOctOVb5LYKFtNqDkSBEPKvu/O5H
	 Rov12EgGF3LzvNgi8GwTlYCwSQ2CPRI9XBi1TkCzgyTImZMC2VUqeMtdGgN6b9GcDN
	 AXAVW5zFL1UBb06ZpBUsdUCBActaakISAv+M3SzoD23oIwniPG5CKbGDTEafInSNrY
	 2bHpKVrIyC2uDI+zmRR1KraZ8Uv8xPMk1AfFmMPs0dVYJd85cExToldBNf6uMu+LgF
	 JPjANULTh01Rw==
Date: Sat, 7 Nov 2026 17:57:39 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <au9YgytCc4TKfETI@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>

Hi Linus,

> Can this be applied separately once reviewed?

I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
few other fsl_guts_*() which are from the patch 3.

There are the following cross tree dependencies / maintainer depencies:
 patch 1, 2: DT bindings -> to reviewed by Rob/Krzysztof/Conor, but bindings travel with the driver that uses them
 patch 3   : drivers/soc/fsl/guts.c -> soc/fsl, Christophe Leroy (via arm-soc)
 patch 4   : drivers/pinctrl/ -> pinctrl, (you) Linus Walleij
 patch 5   : fsl-lx216x.dtsi -> i.MX DTS, Shawn Guo or Frank Li (via arm-soc)

Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
Then, patch 5 could be managed apart.

best regards,
  Vincent
