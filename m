Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595156;
	b=ligRshKmlYU1ard+UwzDe+bSxp+eWVsc2PW9HdnR54eAEKSRv16/rEZEHednf3Jb84Uf
	 4Zx3va+HH0atcIEZts+thEfrClxBfC8EtEXNNPf+O6RvlYHpVY1sWexpuIBMXdVrCZFpD
	 zt4Ef5C1/0O0QJUmQnZaKjMF+sPSOvjZlxiRfHC+MfCdowe9VkMTZnB4XfRYst0HuQvQh
	 Sxje9ltURUDnRtkUOKlLFmGjOwFMMGD34qGPlKCGurx2nploJT+02USiy1KU/1KrWPQFy
	 CnRSNi7SMU5jYavbRh2ZtTnyb8OLC5eLGN8xxdgkpMB7TcdhO80IPaBv0Kj8Q7wu/ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595156;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=;
	b=b6JuV6zzEx7DAM/9B3EnbYoBYwAVEC1nOsNHs6m5s4xgXlpFtTpn+0cQfraoNbi33r/y
	 Pq2ne/yBwLjmYxlcDYU+nTdWKDQZcR/zOk7kgcVlCfAKbX7d1R3CXPtao7PG3QFuX3iL2
	 9FuCeQKE8pb1EejpNPOO5TgCRGe04dRnNfnRojRY+fv+y1XkXZa7tFsfH2m6Mjr36JL2g
	 9dh9wh1f11vfUZUtHC5qRJz4F59KRGg7lrjt1pGCTBvOeG7orMkDes/oij96CArO+2M7O
	 f0uzYCCNoAIAjzUn9U/U8pZjHZrJiTRTMLMUSO6hMefplnERddfG/06393L9qi4+mUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DK7NRn96;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAA606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DK7NRn96
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1ED82200033;
	Wed, 25 Nov 2026 09:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795595153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=;
	b=DK7NRn96Oj1tHB/4dbpzvEz4DtAw4NhD3t3OL4aWuayFHDoJOUN3GerlDRI0zcbcQKeK0M
	rCplB7PM66Y6wMOBKCxOTTIEEnyDfPCjGLROa3uoDK5NQ6d+zsROOjiBZaZzQJ6RQU/1CU
	8Lf61EDm75NTUSdRfrtQPkUtcLedoRMBHascSY2QBr7VGsPrdfcPuwVRyp+aFAtcyebl5T
	bB3eTi3A+fAXT+D6Xyo6fvSgyjkyjqmRi2HwBa5G21MT4Y0jEDeBRxQbOP0HKjjfFJvGjI
	J2TsQReQgToCpL6Pbfcabz+0595dw1nvYKl8fru9vZrsxUYjSyhwjs76lOpaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795595153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf7/fHh0NzQPgN07aJpbb1vB1DON0qR+F/6eyHLLiH4=;
	b=dH1o5gSshYaQL0r8M052ghsI9tZt1DM1lNqql6iJkrhQEr8ih/T8i5pi8STev3PGx63ono
	OiS6p2zRG3niHD/+rGyqSOx+Glc6EoCyllywde/AUm09kCsZPNUnxbrl5skdi4rmpybZrm
	J09CjQpA6eI/ppSnZBOLlNDFxbhiCRLBVDApwXRV11abj0itmhjQQmX8VOOtuG1LSusAyZ
	3DFm5Jp2jA7rJUxlCTLYIb48qkXqkktQRf0Q381yjco1eTnyEG1WM0q4D5vehb4NemJlPU
	6tLKnx5BS1llm9Euc1ThPePx/fVr0S8UCvNM247BX2rai3EYcuyVGgRiXiP9Kw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795595153; a=rsa-sha256;
	cv=none;
	b=Iwtij5vcPIjXIOS8P6aAEReqMFdBorMvASrFBM39btL8qFvmY0zi/n4UyhM5pC6Xok+Kry
	LtY+V9lrbK1VUCG9C55ZFJjkivqC8VCCbfYiO6jyw2Euy50xGaU7XsbjQGRwIycMjF6gtP
	GLsAzbY2Ecne60nomnhP9L1KRv3iZzWE7zTFdtB2FMl1wNWYLqTKpGAiPtyMOG7NciczUQ
	K0crHprErsAwZTg4HDqGHdQePTlfrxXZaaHlyvvio4OXWec/5PWQItche1SdJThMd/Avh1
	g0VW9YfMlp5KIeav5iYioF4NQCTaa+85aP2grWVhuPfLyof/dlk+w5DA4sU5Ig==
Message-ID: <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset
 framework
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Mark Brown	 <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai	 <tiwai@suse.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Wed, 25 Nov 2026 09:25:53 +0100
In-Reply-To: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-25 at 15:38 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> Replace syscon regmap-based DSP reset control with the kernel reset
> controller framework for i.MX8ULP. The syscon approach requires direct
> register access and creates tight coupling to the system controller,
> while the reset framework provides a cleaner abstraction and proper
> reset sequencing.

What do you mean by the reset framework providing reset sequencing in
this context?

regards
Philipp
