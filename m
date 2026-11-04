Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816438;
	b=olSf4FRUa6TOPjdM9raD9wjuvl5cDHd9XnU3Mu0VG8CEl+I4o8D6QQ0aDTTPWmP2rLLE
	 OG6MppTKtwZThoxnsD4pSzMvoFIgqmI7gWS5CFlRGCXPSgAev3z44fZ6zCuaFFVI25HAt
	 WwdUsomcmpanFIPtkZrOHJ0cW4hmETYGlkcn/kZoP/+GpMV0RkQw8kP3YDN5QRKREANEu
	 bmpUKE3lSy4T/G95FMWVFugU8fdZXOpO1NlgxH2NZh25P8Pj/wEA7NTKgKbXmbi8dbk55
	 Y58NcEuDHNLJWl4jZMBQTW/77PXo3H/+qWOuf5usCagGKUhT/e4HAyjYz88HDbI2Xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816438;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cunjgbridz0HQX/g4meLlXFITCROzNjLIFnstKfzcMs=;
	b=SRExlBDM7DEMbCN0jtgztYdt24xxy/lJ5XrrT2z2ivxUpcXvoEw8KnsY/Xm5S2Vt+rKn
	 UxZ/mzTDI5+42tOGs63M+jCiN6ZbiUZCw9YNlUmaSmjywNnwcj6NmqYVCgqnUNpFatFen
	 jOUZqhS4B5s5otJCpaTnxyDVydaOzIJ4Pg697fGcBci2U/2w8wROE9MWuYfVohUhw/Mg4
	 DPhN+Pr/kZwBFIIk1CZQx4aKsx5yJoWWMSjWQdf2WvhaeRf3gOA/VywIer7Rop3CLMsLb
	 YFNUK0CCFJ4KhgPKRcb91DghN20SVG+IdC86kLivWoe6XKhsPEwRUjSmgcJ3UkEB0sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lbByIN/t";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC5A606A31B;
	Wed,  4 Nov 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbByIN/t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492111F00919;
	Wed,  4 Nov 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816437;
	bh=cunjgbridz0HQX/g4meLlXFITCROzNjLIFnstKfzcMs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lbByIN/tBhKOZ+yDF1hnj5LKgvWdRsNSLns3C6d+peSaGCr0JRqWklGGkGUjVHn+2
	 n+/9Gu/1YDPSlAyOpjAJ4ugxIadtBNiCGxEDKdc0U5YawxuXeanWWp96w0LfLjFFJ1
	 U2tjY+CkkAzWntIRJsTBHOhZuwVCxhr26j7Vj+7gd1biXFN5epk+mfuLKnGVndOD9n
	 k0ZQG8awfVIz9Z441Ohj8Sul3jCslkwNFcxBbGKfnfQ720n+VOFuMN3zUfgFGnsVX8
	 TFLQucX8AW9ZVgtQQM/OC0fiucYE+lBiM0CM7bH/t9TUCaVnEY6Ry0rPjIZHxWx8u6
	 e/0l4XPDtC7RQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D1BFA26107F2;
	Wed, 04 Nov 2026 18:20:34 +0000 (GMT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: mxs-saif: unregister the mclk if adding the
 provider fails
From: Mark Brown <broonie@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104024048.1508618-1-vulab@iscas.ac.cn>
References: <20261104024048.1508618-1-vulab@iscas.ac.cn>
Date: Wed, 04 Nov 2026 18:20:25 +0000
Message-Id: <179381642564.2456854.18418832543641508866.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b6GgQKO53UD7V0ZZNWbS/aJZRzL+2qawICrArLxJPkY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJelxe9PsXoyaX/bOGTmUFH2AP+SfK+5Tmi+3lyzrYlB
 qwXUjwNOkpYGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR0iuMDCdv/pqjLzCv57BB
 gMePt13s9pppmi1f42SnT+d+qbaStYzhx+qmGvdp8+K+ckk/mPrprcQJ1Y1/5XZ7dNqJcK5PDfv
 IBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> clk_register_divider() registers the mclk, while of_clk_add_provider() only
> stores it as the provider data. If of_clk_add_provider() fails, the clock
> stays registered but no provider refers to it, and the driver has no remove
> callback to release it, so the clock is leaked.
> 
> Unregister the clock on this error path before returning.

>  	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
> -	if (ret)
> +	if (ret) {
> +		clk_unregister(clk);

We registered with clk_register_divider(), we should unregister with
clk_unregister_divider().

-- 
Mark Brown <broonie@kernel.org>
