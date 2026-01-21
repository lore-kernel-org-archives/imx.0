Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FD44B67D;
	Wed, 21 Jan 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982390; cv=none; b=tt1OGJWN3jSKayTH05Ol+bkPD57nu6CnMy45ZMvx8L6eQBAFCkYqlFsPlYON16Y34rmwrYavpRICJT7WC2s8sM9WlqSZzDXHBTC3sFgguFdkTQJqFYluYpmJIZwiY3aVM3CCbrhz1XPos0un/XhUzwNslMTJQ73GSSS7m5LDv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982390; c=relaxed/simple;
	bh=lVIWh4J9elC8/GQ5p9OTBhZ3dYWROl05hspT5Eh9jUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBvanmNZCvCDeEz3miJYXBdpWhTO7urAupdq2xJEat6/SHkdbIzmkUGknukyK2gxaspjG06FyiqJTDzdgn1owxpS1oa0AxpQoeAVJ3eMtj3VtqyG9rjFlX/4GwlifCsPfepR1er3Vv+GbQk8382QPfEdTMotdh4NkmUM1CPeOEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgM8GGSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgM8GGSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19E6C16AAE;
	Wed, 21 Jan 2026 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982390;
	bh=lVIWh4J9elC8/GQ5p9OTBhZ3dYWROl05hspT5Eh9jUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgM8GGSmTqWHJFpegeG2+oUmnmm6z5KRc+iEZY7EKuqzS9jjDWkkIEYjBS59bJ0G9
	 AZBf017wyEGE6D9Cm8xLFOKDs/GvRvujbc2udpU/OVaNGTlzpaTvrc4OCU5QAysSHB
	 T96kur/kbzI5zLzcVl6JzarBgfDhxrbNO83tEbsqCHDgt8m9OJ97NHry0ZwM2G/O9g
	 iCpDPG3XS385yk5vQEZJADykqyaQfqnHggcm3tdYaCs7TCjuwMr2qc6VWyH5tG62f8
	 dwfSCnAVCmh9FgPf+EmOiiH0CUkz0C924vXyOrm4QaHBbYPGUZZCBFqHOciluZizDO
	 d4BQ6AS6TkHIQ==
Date: Wed, 21 Jan 2026 08:59:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260121-magpie-of-wondrous-tenacity-6cf6fb@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-2-shengjiu.wang@nxp.com>

On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> There is no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>

With changes to commit msg:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

