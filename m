Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599065;
	b=3P90aniOeVxvqGPB6JTxsQ6YMhsZYg5vt23oC6LEQZVYTGjrpXCuaooq2bZ3H48kwVIF
	 DmaVfFJ8OQJqg410udRPFT5MsPrkrtjwiX5CoMxXDeKk5uhe0/5jmtPIUbZUAy8veeGqO
	 JoRrMmW76bl8LmF8f4dUJmhMouDt+0uhpmT6418Bcv5gqQl2i+l95+Im4yDSVB/RRrPi/
	 7uKzDwOzBMxLdyBf2ubuf82E42l2Rge6n0cDYE1GlS4FyC6L88kq8yLbtwOMxmNWRlRLo
	 Fx3tYVr3CuhVZ2i1q8d1rLa0yNVf6pdMlQRasVILyKS+3UAgfXgjgcI+BVJTLUVeexA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
	b=pMsMP6L2JMD0FdRxnPMrwWCQyxkb1S8cP7dI0kmpnlmz5UQPbnC/0I3+lcGJWvapSYYv
	 Bra4h6+UFiupI9ITeugQTrFEBJAnjMx9v5iBGhYMQPWGuVB8zdCWAYd6FKvLhn/e8wEsa
	 EVgpZTvzwRcpzOGRGenlu2cVJL7k962auP2nZTxWlfXQxmG2Zwz/oNuJOBtrI8MGilMm3
	 5Wb8I7V5rPxHTN++FyYVaJWgnC9tiHD4tDkIHWzHc0uYU5L/k817I9Yu8Zw/rr1DkHXEQ
	 LIs1+4JZcAnEX6Xu4i1E+Cl5ga8opsxytFmKKMGZdK8lHmsugGSSrMG9rPJgxlcxPlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIeaR7vO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021A606A68E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6021A606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIeaR7vO
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3346484a91.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 01:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599065; cv=none;
        d=google.com; s=arc-20260327;
        b=L4EmvFSMQ6XPVzdR+Ytd1cgkPrognuGz6yFT/ItiqpZ0CgnktR/4eHaNcaGhIdPzIw
         6Ax0kyRAJ263sRFTxKGweicZ4YvcALAlkMvZLyVaag84nXA0JdIx3BZs2iVW3yoLu9R1
         6PmimrTCpX3/OMqaeAPZvAgUSn5yUfJ5Ur2wsZsr2PgPkzKWL0OMuYKjV5KGJ/gwul1U
         RZdP8lFZLTARBDfyfoFVF5nAye2IZ/59KjUcRT6DYC9B9kowIqPQofoduubYfNe+HtPg
         z0YHJQmp73z1AXNPol+3sgWtGybIXL2ytLjpzYbR4VM70dHNx9J7pcb0tS7c4P867XGd
         TQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        fh=madYx+wfuePEa2rlb3NeVQ/TfOXmhlfjUcM8PN6Hvsk=;
        b=j572yW7/y9vht88YZZ2KiResCAH4gdpoYirkz0pxAoRB9gq43ih1quMR89qBqg0gzC
         61DyXFRe3eqFbYJTrK43+TeVEorOqkLMmLNy9Pdi6vkplaCZSbIFPdn4mI7nIAplZklz
         DD12/b5s+nBc3mLEIQ9aZlYQx+x+1/iKVgjwzeVa7jgyg+4SzrXmK81XVvYCMKlY1NR5
         B9ojqMPKwAStcSif+de2tMMJLoBhhElF+Q2jlZkL1HMtXJPNrSY8mkt0k2ifYQdf9bjJ
         wCF5o9JjxoSaZQO4dvVhlQ3I3zqyppZQf4PeT4SWak5+KDMTqYsfW4mSaAtXx//zEZMv
         ByWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599065; x=1796203865; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=nIeaR7vOz+uAQa1Ca3mWZw8Ls/yOpBW1XnOfYX4ZDRipbbYsYQNniYhtlytaS7U0OL
         j0faaP81ZtGidajwkb7iubxCql0I8Ch+VeZZ4Q6uv4ZlfItN5y51dL/AJunhGNAH0gup
         kbWSzm3BHq53kf7ZTveM9HXgz364XakS9Z38W0zUW6xPIIAedxXVhG+UDjAVS0k/ICWa
         cY7HvfwuNCyWOSP2fvECQ0nTAO1GoHoV7L/uWYeOyc/b63fE/8scxWDSH30JtsE+lf1z
         E55xkvtzdEIfStq+R67s0dmO/0OvWD5l/13UdJwYx7Lr9S1Yj/539+6qEMm4mwZcfnFL
         tjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599065; x=1796203865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=VnX17Kh9swvKSolimfp2cMOWyoIScLzfs2DciEtslg+w3IlUWkyTAaR0u4Sg4KDz2Z
         h6Jk5tbAnE3wZo2Mtn0Viu9EXYRewWIsXIQele9Jm1Ejx8uUrZMcdvb+0gp3K3ayJ7Hf
         M8ImNQaBaoSQUjIHUYJoN/IGzE+VXGi7dJSBZXcVSGxjsrLxEZC4ZbvgGzRyK2gORA2A
         PDGc7nBKiWEnqgoTMBXcNXGpECpXkNex2dGjUI7xo2h03PjYPB+woUNZnQiHpyuiJZ7o
         4m9nQp2G8oQaN/s1xHZuqQcs9uPe4zbH42+XMxeb2XfBrUMnHbHRQ1MljCqcjqh63kxT
         gEPw==
X-Forwarded-Encrypted: i=1; AL+hErGulJg/QgV3tUcKMDJwvoM9yRGNm7YEFtZAMad+ahdIdzL2N/TRo4s48tTp04t0mY2dubs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+XasgrAKSg89cPLo2GruDLRO4Rx9s9nBn4NgvkyKMp/YlJq495
	UIlF2dHAaAZoWMrE4TzFZ7o7lFIA6SXzhrUqXoMyjICOIT2kcoCDKMOivYmprwfTw50ugMAZigY
	NFCIIYbXQKh77ZwHaMZ9o+7Hg4k3tcYU=
X-Gm-Gg: AZFdTZcGAdCsrMPipK2hi98A86nbTRTphqXE8rKVI4jaLAbvgMqZ3Y8T8BPVWLe2yf1
	4A0xMWYdM9eIpNDbyFOmaAslcyowodt7BqnEmauTF+vQAVghdNVN9d41DyQ73S+9LxC/mJeRLP/
	Ptn1au0cFoOJuLotu2p8P3MCA4L/hnIaLJnU2NLcP3Iw35/1iQLmwCVHVOKMtdFiRWY/q9EkwJW
	HkIDnYK4WiGfs+AD0zOsIW+VkePtbb508GcXMxvMBN8YD46yQnkDGUaoWnzoBQ0x/bMvouFiG3e
	nbWRiRb/YvgvstzEqXUT70Ai3w+ECa70mPz454W28bWzINY7cvGLuVKxk7AvTKEPzk1xgn1NXV+
	HSZy+30X3i3TAaREeb2b9w6ohnpF4x+gHKFPl
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b41c7b60b5mr15460985a91.6.1795599064574; Wed, 25 Nov 2026
 01:31:04 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com> <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
In-Reply-To: <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Nov 2026 17:30:52 +0800
X-Gm-Features: Aa3M54p5bORiV9mV6RZmN9_zoMbjiqg8A4INJOiWefrA-5NYyURqcEaFKCpWRUE
Message-ID: <CAA+D8ANRJT6Q+-sB0KCN-CEsPRQ2pX-9CVWoTNX33aSKjvAwVw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 4:26=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2026-11-25 at 15:38 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Replace syscon regmap-based DSP reset control with the kernel reset
> > controller framework for i.MX8ULP. The syscon approach requires direct
> > register access and creates tight coupling to the system controller,
> > while the reset framework provides a cleaner abstraction and proper
> > reset sequencing.
>
> What do you mean by the reset framework providing reset sequencing in
> this context?

It is to use the reset_control_deassert() and reset_control_assert()
these functions.
'reset sequencing' is not accurate here, this commit doesn't touch the
requencing
Should remove these words.


Best regards
Shengjiu Wang
