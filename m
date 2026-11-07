Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070854;
	b=VMGUlbx3xhi33dqYE+/qACxWqo1Kt2AUkpxqmFdJ11Fwho3yCdrJ3NYw8JAwFXO+RUMr
	 P5JEzzoSVxgWqluDHWzCNnnC/EFUyh/4/Uj9b4nSfJ7UHyJKDylpRv7x3W2ewIqSynv+f
	 jVmN0dbqfrzjmVZFr63FRbemIvA3el3YIYJHyFoNt01QOW3MxSp/VQgSc31+ttz54n8q+
	 Cwd/2yN/YRLHslETMGm38dJH/vuXhyevtN7qQEKmaD/emHyyBN6dnTFvWK6jrHs07PSOU
	 O3defiIde3BgGAmr5HS668s7TuYMFicMmsP02m8dH9Zdrxh1DO3NXw/yUZhOgoQY/Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070854;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=69YlIhpcdRp84o4ABpJJqYwv378wcIs9fm+ouT0CtWw=;
	b=1OGUWB/rxUo+w8t5yHTiMIlFFK7/5jnyW+Ox+S/WBVU/wlj/2tzIqLXJ42kMkk7ZcdKG
	 Al3gLUV5MlewLu1iAaDNvHJ3vlGWcYnQQeep8XxsiSh27/LkAoxqDTHKLOLpU+IkouIoX
	 M+khcZhcvB6QSI48ZMsFsSSmuW5osZMxoylYVOZTY2X3xpmRqVRYLfYQDxKFn3UfNy/0a
	 tLUvwB45G5Mp9ftlbhCkSeI5ZhFUo7Vtd2uP0wIrPuV8gOpGCpnv40kim04M0amL+DJS2
	 OVfDsiKZ5u4DdeAw/PJotGZgPWtd7p7UUFasIST3RyWuWWoo27Jq9UpC3ZDJOP7pISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=udgMF85L;
	arc=none smtp.remote-ip=212.27.42.4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7E606A326
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 17:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD7E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=udgMF85L
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 763DE19F59C;
	Sat,  7 Nov 2026 18:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070850;
	bh=syJyVGNndyaT76xcg3TviaWZJbrAimIaATWckjraIYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udgMF85LazaNU0ZXoRcnJhuQA21gmX/PlbKegAK+KxJJ1+kt3COSyM4r3yyBlo2SB
	 joV2E0iybcwLRKiZcjGbvmlrcGxsmWSkcK2v5/e3MIhT5YCjV5e7ZldqYPSaac9n9a
	 xDGJv45X/pXl86eCC/AxwhHdynJkl5q/tN3nuuWtCWd89D7XzGQadqvNz1rQU4IIzx
	 7oFSepoRUUNROi/gKYXlhpl+FV/iEPGc2KDIJuBNR1uwt3vJ3451smaTQYDYSEU2NN
	 ji35jqiD+doB8aTdWL2ARgfPqfFI/dNsp/9F49p4yxGEP/N5dm5LIH/1zxtb/bT6kR
	 4lz15iEri2+Yg==
Date: Sat, 7 Nov 2026 18:00:28 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <au9ZLBSJ_nTuMaVc@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
 <20261106-smiling-infrared-dugong-48ee5c@quoll>
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
In-Reply-To: <20261106-smiling-infrared-dugong-48ee5c@quoll>

Hi,

> > @@ -32,6 +32,7 @@ properties:
> >        - items:
> >            - enum:
> >                - fsl,ls1028a-dcfg
> > +              - fsl,lx2160a-dcfg
> >            - const: syscon
> >            - const: simple-mfd
> >  
> > @@ -62,6 +63,12 @@ properties:
> >  
> >    ranges: true
> >  
> > +  pinctrl:
> > +    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
> 
> Why other children are bus-addressed and this one not? Such mixing is
> messy. Either this is a subdevice with its own addressing or not. Keep
> bindings consistent.

ok, I'll provide a v3 accordingly.

thanks for this comment,
  Vincent
