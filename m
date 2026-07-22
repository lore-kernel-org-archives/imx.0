Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC74934BA5A;
	Wed, 22 Jul 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733562; cv=none; b=X9yPQ7NEFvCWOoMgczNtOizdxkDOKTfBvA+XzSPL9cRiUsle8AN0/FmHw+LUm+a0rmJb70AIQMRtwHwt4dnLp/ncOaa4Otzcfh4+EXoNcXKdvkth+i0WMLxIYZpypqKO85nJXH6CJXXBZX47jlU1fahUrYz2LyPfvktBHDRRbcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733562; c=relaxed/simple;
	bh=1Ses62nHSrwMXeb+BGxs8O/Iw6ThnkaD/ksfXtL3yN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyWulo5GLRhEddhePQPepQ2XmRS5Begro7VjEVfUr15Xm0xJQAZuSymCVS0EpTB68GX9+GyZcAFO17/VJbv99bckoH+cT61EO0bUfW9RJvrHvmWs2xfpGvcWRsQK7BSc3rUSSH2reWUsHeYMSHU8fAU9aLL69Nz3xy3Ir0hqHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZCjs+yc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZCjs+yc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEB21F000E9;
	Wed, 22 Jul 2026 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733561;
	bh=oWrtwNEs2VPgPgKGmLYu2Co32wif3lZ/DlUHbPr9kwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZCjs+ycxUN3xWGhLmlSI2g0/IgkrQE8EQPdai87W+kCUKN8uy4Qb+WWSsiFPwybE
	 kc/LIT0hxVGwddFmEE8fAH60L45+5GI18rd/X2HbpCLwE3pxXhH35gSmDe3/MBR2DY
	 MiCAMH4L03ZiTCE08Oy6yhFR++mKRwK51r0AHbrNhdeG6TZ4scJ+WymoN66FBAeWVk
	 K2PSSzeKINCb3zbfB08d5++54DuWBsKMNKBYbWSiOlxChy25Qh6pTojqM+UF0B5tSG
	 C9hE6Bu0zZFGmZxejfPcH+eCUuMQ5J51nZZZoDG5jxIJX75D0mOvvy0yFIq4iOC+R9
	 eiVSoinMsejLg==
Date: Wed, 22 Jul 2026 10:19:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: st,stmpe: let interrupt property
 optional
Message-ID: <178473165049.888880.17043933154310201822.robh@kernel.org>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-2-1f51d15bb358@nxp.com>


On Wed, 08 Jul 2026 15:48:57 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Not all boards connect irq lines. So mark interrupt property optional.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
>         'interrupts' is a required property
>         'interrupts-extended' is a required property
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

