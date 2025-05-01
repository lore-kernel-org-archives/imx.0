Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D034545;
	Thu,  1 May 2025 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100888; cv=none; b=H5XVjdeeSzJozXZeqLoo38ITudlK2gEeKLQvVuEipCASEKLrpx/VhjaWgyTB/zV0341cv7NEvupl37mhABFTMFQPKtudPVPFXkzQPtlPcEF3N0llJ57ph+jdgJSwSI3gl0MeHZgk/bogAoWlsRbO/3HnEQlVxgxd4Aw5LC5tkrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100888; c=relaxed/simple;
	bh=wO38hj0kH5wwFVV788X9fXlS0WBLehhmfHhlpKQsYvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWTE+riubIBy8XNBwuWAI1NyJxfrlkHW/HLOCBetQiXKxXLU4PYHZ381dR3ysSF1etuuiRRJucsCqSHg7XlYbHqef5fCaFtTB90zaDEMKmRnkwaGiaCPGotKYjF3bdgpjzRgLDW/IXl0U5VX31iNV6SWHgyUZ0XP1RBprxx55Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r91DJqwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r91DJqwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CC3C4CEE3;
	Thu,  1 May 2025 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100888;
	bh=wO38hj0kH5wwFVV788X9fXlS0WBLehhmfHhlpKQsYvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r91DJqwzqLwYugfxG2pb0c35WvYMJaYiQSAzcjSB9ovMk/EnuGFWt2MzM/ytGRGdC
	 wAZKGYA+vz/s77fg7aQPZpAlRKcIT/igILGZ14jGoQZRtnvMqHOqkLkJwPy7JSpIpu
	 XDcukosA/Y5OgnMQVJEm1UnxIJQM61jiR71p9iyLgVv43hbMZ2gAbN2M6b5oOH8MEX
	 eADFKDx06fKC+QJCJEL2g+i88z65RYvJRGtPFmWl9dLMhjXRqk6a3+1YKebnYI0UTa
	 HUNw7+7h0Z7T1NnKcVsO1ulcz0ucQy6ZlItp/CCK3/P4KLZaEHM+QCaMeinOSEse5R
	 h5ur5t/0ba74w==
Date: Thu, 1 May 2025 14:01:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: imx8mq-usb: add imx95 tuning
 support
Message-ID: <20250501-incredible-skylark-of-awe-e0c2cc@kuoka>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
 <20250430094502.2723983-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430094502.2723983-2-xu.yang_2@nxp.com>

On Wed, Apr 30, 2025 at 05:45:00PM GMT, Xu Yang wrote:
> The parameter value of below 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. This will enlarge parameters
> value and add constraints for them.
> 
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - keep original unchanged
>  - enlarge value for some properties of i.MX95
> Changes in v2:
>  - keep widest constraints

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

