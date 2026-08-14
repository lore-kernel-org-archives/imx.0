Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE640B363;
	Fri, 14 Aug 2026 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692249; cv=none; b=KOR79NtSjxFmNyUda8xU01zWsSINE79G0LhaGfT60IILe1Wg/2ev7bTAExiaiTMRw5wPCDM3TiuHtC5E5h9qCTRlwdfifGBStMoMhFCfkT2SL7It3EtJ8tHC4QY+3unEFoRJLa2mmhTxm2Lb/97jM6zLRU3qFt9NX40fh9tmtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692249; c=relaxed/simple;
	bh=0ud3Fhh8QpXuD+rWafjvRHSMcCjbiDLtJdgUWL3yBOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8IBvToNsPaEAjt/6EeNmJgNv+7pDsmEN0zN49ciaer7nr5e2k+T/X2qjqtW1282LWEPGiT18MfuIU90G2WYPUQJmzrk8vxXpEFkgNmplZ1CsHhkgIsPtTJC6yhp+f5LFm3+fyA3m1emrdSH0WhzjxcXDdTSnZWNe1PC7Av+mNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OW2UT+ez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OW2UT+ez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CFB1F000E9;
	Fri, 14 Aug 2026 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692247;
	bh=GconpR1MA/GTVdeRlXQuN3B3FW4f1/Edi66aRXMV/js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OW2UT+ezX/SXADFrkSMBWH0MqfiiBO2hMH387sHpi5iyuWtskdx1+aT9ftnn2CuBn
	 4lvmd7GV3lErJX1ONGq6X92PfwexHdjS1MvjBBYcnhteFynBJULmQpzGf6wUQRf4x5
	 KYgVdaqNi97cp/Y8VGLHdsaN4sor0FnTp/bh2K0GRGCovZDoCt8/Bpm+FAsEO2Ytsr
	 /cAEY2pmYnnf87wXTDykVvybhpOJUhU8e3j9FCDH/OaxyGXFW3RYZUNKVsIH8i2auU
	 pnKvzOuDmFwAKVtUE9ih9mOVHDUl5MdSGWXEYb7K7CJxTWyA8dW8ncL9wJ6+XZB5cD
	 G30hHC4c5xmgg==
Date: Fri, 14 Aug 2026 09:23:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260814-astute-polite-binturong-1abfe9@quoll>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813092836.38367-2-francesco@dolcini.it>

On Thu, Aug 13, 2026 at 11:28:31AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v4: use /schemas/graph.yaml#/$defs/port-base
> v3: use video-interfaces.yaml
> v2: use the common bus-width property instead of the legacy interface-pix-fmt
> ---
>  .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

