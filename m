Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65448408623;
	Fri, 14 Aug 2026 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692080; cv=none; b=X/ukWJRLl15HCyGLFg8582x0yNZVmkLJLmjejx4UpvPYTPk6ancwbxRiiJWUVLyZiVlVzOWedkie4Fij2grNrwPmTLFbhNm4ZSQsAJzFQEuUliRsMr+gWMw4vC2DNeI6acF+12FJwoxTG57Knap/C/fLkmq3pTyg5o+KeYUieKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692080; c=relaxed/simple;
	bh=OfqhvcNa8hS7mM5Kzs8nizEZiVJ7EqKBz6uOfw2Nuc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnZRuQvGRILKQPa+6DrLa8XFvLQkNQmn4dj7e3p8wkkQXaBwS01s3HzpMsVdwnJP/2JYe5x2AjhLQPegcDqPUmsI+cslcWNFsrMJFSga+wAiRsFqXdvlz5G9ofHpE6bp1Xwc0Im3vS0CV/cnTvVdAFyWSe5hzAZ90r15gcYSBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hx1lDAS6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hx1lDAS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9CB1F00A3A;
	Fri, 14 Aug 2026 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692079;
	bh=8yoJKjaYZwT3kC7Z+BcMIAXUq6iz8NORS15vjre6gIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hx1lDAS615F21oEJLRKd/1lm1N/2JFVEQZaTxSBYxSiIli44zw5NBm4GCXg3f3o5H
	 fqZdNxeTjJ3wGSwDGJzM/zzbUgydnaK0qs+ScQU7j/8jc72hbT6vrH5zFmVaUZd+i2
	 BnZi/izwsueYRVq8cheOLfhaMR9gkwFSPq72CKe4eguJOR/bo7OXoQ3LHycqAuF2xY
	 yl66dizcw2yrWZxlXPoKoMlWxy678+kX38OcITVc2LEOL9wVwwWv9qOFRzh3Pp5rdf
	 P17BkykcZWcWQIx7pLahv+Zxuj7/3u/5byqZmStYZHMdaKJ9BlL4JBN2OXe6hrvE2T
	 eNnjrTgVcxuoA==
Date: Fri, 14 Aug 2026 09:21:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260814-lean-classy-hyrax-60aab2@quoll>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813070020.719810-2-shengjiu.wang@oss.nxp.com>

On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).

Each one or only the newest? You will be getting the same questions.

> The existing binding exposed only a single generic audio-graph port,
> which cannot represent independent conversion paths when multiple pairs
> are in use simultaneously.

Best regards,
Krzysztof

