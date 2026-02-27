Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D650176ADE;
	Fri, 27 Feb 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185611; cv=none; b=P7zGqxH+0O+4KCY9v6FZcTxevNlQxRUsuKnEI457cVpZxPRp5nCjivGdYAxGCO2OwepJ4a9/hkLsc1z12Fg6OSkRegYqicxCI6Bd4TcXesS8Q7DPX+Dj5DSl1ImQmuGBadF15LY66K3BA3AU0wRGh0Gu3WbL1bzqXONSkFrAgbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185611; c=relaxed/simple;
	bh=MXPjEpEh5UIbHP8Pg4xiJO2M6gANbtTNoBWbrqKGywY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEzQusdUE8ZfPHINvJsECpvCS0pjIR1oEuhftTiOGIfT1q0V4/10kia0r1h+oodxy8Ewiwq90QAi08CMWtpGQYoutyf7sWEzIMKkUXnEG4qL8DcU3xXdPG/mLDDGNikvMQbcDunp8q3guv4UOeO2PYN7ubNtWle0lNFamKXvu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh2J4es+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh2J4es+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6DFC116C6;
	Fri, 27 Feb 2026 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772185611;
	bh=MXPjEpEh5UIbHP8Pg4xiJO2M6gANbtTNoBWbrqKGywY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh2J4es+wFxTo0g/cKTZ8V31uJv2RgkdA4NPxBatp/A3MsitaWlWDS+B6W0FcEhDq
	 ugm1iBzrlPSfcNmLHo8e0tYig3ijePY+Qfw5NN8oyS6Kr57NOik8wuaBGdNNFIhW3g
	 tX8wxkkaUN26KnBI8ZZGSwobG8z/As1nfoUrWbmkf+waj792hrbYuS4gYoQRzt0MNy
	 4u0LT2+eopOeP8lHvOJTmvCPZSld0o3hGkGyDV8X2oVix6v36ozbyFceMFSFh3Jlgi
	 0QQ1cgSXMiCnry0sqmIP3ytOXATCFevjAIMQA7nctMLTabMG1RmJ0hU+MoI8nMxNz3
	 yEsJAa5mJI6hA==
Date: Fri, 27 Feb 2026 10:46:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells
 property
Message-ID: <20260227-incredible-eggplant-lionfish-b3a5bf@quoll>
References: <20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com>
 <20260227-imx7ulp-v2-1-1c7fa8862ebc@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260227-imx7ulp-v2-1-1c7fa8862ebc@nxp.com>

On Fri, Feb 27, 2026 at 02:30:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The SMC1 block on i.MX7ULP is already used as a clock provider in
> imx7ulp.dtsi, but the corresponding dt-binding schema does not define
> the required '#clock-cells' property. This results in CHECK_DTBS schema
> validation errors.
> 
> Functionally, SMC1 controls the CPU run mode configuration:
>   - 00b: Normal Run (RUN)
>   - 10b: Very-Low-Power Run (VLPR)
>   - 11b: High-Speed Run (HSRUN)
> 
> These run modes determine the effective CPU operating point, and their
> programming is tied to the OPP table.
> 
> Add the missing `#clock-cells` definition so the dt-binding schema is
> consistent with the DTS and validates correctly.
> 

This looks like a fix, especially that you make the cells required, so
missing Fixes tag.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

