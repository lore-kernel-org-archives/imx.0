Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E4D374748;
	Fri,  6 Mar 2026 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784021; cv=none; b=K1zq14/8cDY3jUdyW/h7r186SAeRAxbGx5MPhtfn5yU/6E1A/RO95/RkaQeE9EIqD/Am70ZFQJCZA2WrYmBTCaMyChdUUuRHqrMBv3GqPbAP0ooPrEpbJ/E6bt3Gyrx9ftmGAkGSVHcS/HjcO1CSkr1spjDqRmp2DA/muUBW18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784021; c=relaxed/simple;
	bh=iD/VzlwDTwkJdaLubLGKVtxVDTiATyldptYt3Eq4+W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2TlDm5rWaz5A3UVVLL2se+SKHIKT7nEaUwhzfHGyuzW9+Aaq3WtCLisHTdq4D9+BUyb/ZsLTVtd4PYHmrX89BLkUm2ru8VnMt8+gSXFJyDomsiGGAPNXakPlp+PQjKk4VHdnGv13vrd1vyh3llu8HfgOK8nahlVdR5eXTRd+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGLxPXBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGLxPXBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA98CC4CEF7;
	Fri,  6 Mar 2026 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784021;
	bh=iD/VzlwDTwkJdaLubLGKVtxVDTiATyldptYt3Eq4+W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGLxPXBEPp4RLYM+7FzuxdhtMJt2EG85Qr6Y7+8IOyLDCQ5sdzHvaxmcZMw4zeUHq
	 O/rMnUHNJxeACFOaI7z6W5N0C6QjPjpuMt1qK03C8NVzvn1xqisygTzEP+mO/Lggm5
	 XQryoRPXV5Byzv8ON+wizR5s9ENCmsYLiWClAmL2BA/84MKyPPdo4Wlgive7/2pNMU
	 DQMbN+EL+vy2HKkGb8J2fdNaaR+qBCz5cEGfZMQ5ydBQeCYfq+m7e8ONO8636bYqd4
	 rk8fCVoteI0IPeDkQJOXw6Z74wVIWgpsroBs9lVXCAYgDk7cTd0Nl2KAFRuhBrOmON
	 bN87DPyCATJOQ==
Date: Fri, 6 Mar 2026 09:00:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-MX6UL references
Message-ID: <20260306-observant-banana-wapiti-90adef@quoll>
References: <20260305180651.1827087-1-hugo@hugovil.com>
 <20260305180651.1827087-5-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305180651.1827087-5-hugo@hugovil.com>

On Thu, Mar 05, 2026 at 01:06:19PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6

And binding does not speak about VAR-SOM-MX6UL, so I find your commit
msg extra confusing. It took me way too much time to decipher why you
are doing this and this should be just simple correction of name to
match the product expressed by compatible.

BTW, the DTSI also has wrong name.

> and also VAR-SOM-6UL, so it is confusing at first to know to which one it
> refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
> not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.
> 
> Link  https://dev.variscite.com/var-som-6ul [1]
> Link: https://dev.variscite.com/var-som-mx6 [2]
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

