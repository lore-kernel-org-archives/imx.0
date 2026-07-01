Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77F383328;
	Wed,  1 Jul 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891016; cv=none; b=IXPdXTwOGdEX64NTXqcx0W2U4yY0GAuDLcOlDF/kZGcuZF3UbzEnZ1OavT3mHifN7ckJLDst15sx7nqPUlAQ1GSfy/5HGHvcrUpWArwx1KKjPctvU/IlUHN+ormjNzuNDIiCAyXy2M3o7nRO6a8+sCDvPGPUFftBJBI3MWiezcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891016; c=relaxed/simple;
	bh=K6qzXUTV9TsyrffIyXIg1wZS03qLu1C1oqDgIt/8NTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBkfRRc6jHdrzE9buGhKFG3Ntgx1ppkF/iHYKSNQWyCSFPROaoofkxr3iN41rop7psTo5gaeXTNbx3GaXSPQVnevm3qVDXgo8Y9efu+iahyDZdrpz6KbDz+P6pv2qficrbcpRgK0PnvwEB9CoF/Hx3++PpJ2ePaVByjb3NUwhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGk7AI7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGk7AI7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D831F000E9;
	Wed,  1 Jul 2026 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891015;
	bh=4wbgSGMzk51jWa7D5Al9GIHHUrhtP24S99njJMENiMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cGk7AI7olGcpxuJLbo1Q/3ImofMK81M1vwbCLh3Fehm2SP3iebK9OtDHlrjLSgWN5
	 8KRcgoIHuL+CCOeSw83MwUxcNJsVWi1cimBI/l7Z5mmm1aCDFEgkloyyFbnRBRtAZ7
	 cFvofc6kf7rbaVruhqtwIZe0CgBu/JAechpcPK7HYD8OMAiXEjjNtZSk/B3+u0UmNP
	 bmBdJr25U59Q0hdoSmBol8MbHqgIMyVLbvrj6ZfM0rCmGtM+9jGzk0/Ws1jw30nJgT
	 i5KbsLUsGuoYnbxKN1GqUhn9XglryEfYw7ewFfEkcyRTrn1FO40wOXICz9AQcXM7Sm
	 4HHOMJIwGFGEg==
Date: Wed, 1 Jul 2026 09:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Josua Mayer <josua@solid-run.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8
 QuadMax Boards
Message-ID: <20260701-smart-grinning-seriema-846d1d@quoll>
References: <cover.1782812572.git.stefano.r@variscite.com>
 <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>

On Tue, Jun 30, 2026 at 11:46:54AM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
> Variscite Symphony development carrier Board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

