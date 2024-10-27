Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED531E535;
	Sun, 27 Oct 2024 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730065383; cv=none; b=OhY0xxKuF2o6KifJObB+etfmBpZ8fZq0Cl1WpxsrYwz8zPIqTcAyBfimeh6BI0pvDxpk0llEmfe0vYDSO1b//7yx390r0wHutvr20IUJXs/0mT3ElMccsJ9XCH9jiUyrhuOv7xVoKkQZOxF91Dr17wBxJ2nMuoP49m6t6M4vom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730065383; c=relaxed/simple;
	bh=95sirABf7ucaPkTuGsjWtpLdOArUZGImNoaA5WncnR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+MgFa7bVDSRoLgEeMyyRgJPmd6VWK6jztvl77S8lbHgCEp8AYXCq+yVvT4YxgmzAYXqtguL2GlVu4QgBGDTFBPGSV5qIQD+/osYc3pMUL8FpVWb+Cbd5liTo4DVXt2fVp7Zj7Yu8h6HSdT1K4eyw0HMMdo1pIDeLNUvppQnNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGdct4LP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGdct4LP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7FAC4CEC3;
	Sun, 27 Oct 2024 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730065383;
	bh=95sirABf7ucaPkTuGsjWtpLdOArUZGImNoaA5WncnR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGdct4LP6gtvYb/DAXYbq79Xua4YsVMkYPDKqy08AdyR0DiYxgiAgxvCqyFRLlvpV
	 qjiZmYsinCu/J+nnG3RLuPaEZVQ2YZEVLRbYIGBkn+5tmUQt/Ce2ExRcjP8R4BSUKf
	 Xb6XGURv7PvH9Dmo1JSUFaH5vLHWSG4oU5QMFlaGXVgO3b+XUC/UE5JhwADh4qXSSc
	 57X/mRi2kiDgEScx0NyNs/GngJjvX3cc38We/RC6I9vflYPtaYKch9M/xcQwJnDPPT
	 f/sL3/fawIoUb9+a7Kae2dZvLNuXUoGJ3bTTSn2SGqCBlP9PSBDND1WmeV5/zNO8CP
	 Wj1QJwvlOsSUQ==
Date: Sun, 27 Oct 2024 16:43:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7
 irq number
Message-ID: <173006538122.121456.17477548569074643577.robh@kernel.org>
References: <20241025004159.1571782-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>


On Thu, 24 Oct 2024 21:41:58 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.
> 
> Add logic that contemplates such case to fix the following
> dt-schema warning:
> 
> anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../bindings/soc/imx/fsl,imx-anatop.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

