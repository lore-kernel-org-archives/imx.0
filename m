Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DDD3876AF;
	Wed, 13 May 2026 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714516; cv=none; b=qN+dwTXdl/9tGIm+Q0HkEAHKT7x9GC6GtKjdblog5FP4ZDk7faJX9xwZ9tmpOjc5ZkqTKLk0s5bhBTfyuPgQQuI5uEd/FJdbsK/fVEii4StIY8wLoUqux0dauEJNkNYAmksa9hhysBrpbADVQgCQ0spiEipW6YuZCNNyXCRIBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714516; c=relaxed/simple;
	bh=ll5Eobp7inAVZ69eRLBCF4V+h4LoqBc/5CUIOgWoCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdpEcBIJJI+IgSD4nkGeL3mD/FB1X/DclobMOsCNojqGoUiyMI2zmXkN9hjl42b5SCi0ELneXCW/3Iw6AjMZ1Pylub6fAM79SApv/XaVDsp87fctkg24HTHA4fzfVhYxR5nRiwp3nwml9ACvpedAkIP/0Qe5GjGECBbd9XIIzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ND0YnUaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND0YnUaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD7C19425;
	Wed, 13 May 2026 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714516;
	bh=ll5Eobp7inAVZ69eRLBCF4V+h4LoqBc/5CUIOgWoCSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ND0YnUaO14pMN8SMpuyphae5nfJMuisjOGeeLLsawE15whYkXNLfE+Z2RjNUB4Vv5
	 dd+rV6P0mom6X149j4Eo6UCSvcr3rTngnYUtwScuLnGMniqYpPCJ2Eo7mfqeRkihVH
	 quU/ViyYOaAg6L7LfvxnYd4zBTiBS3oEQQmub4fYjbwMABFzsZHajCC4s30oT/EvKL
	 aSlIPfgnOpNeTdQFH65DoaY5NlIAgX8IH6wfd+JQzIz+OTnyHePpidETY1nN5YoSYm
	 agi+nU6E3ozWy9cRxDBDv7uTUOpA9+c1tNPbeUlSnX6DRvdUZIlJToKlUBKfUzKrWu
	 2+2FhJ/UOuWNQ==
Date: Wed, 13 May 2026 18:21:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	imx@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: media: qcom: x1e80100-camss: drop
 src clock
Message-ID: <177871451261.2293485.3028106268219428837.robh@kernel.org>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-hamoa_evk-v2-2-3ebdca3e4ae2@oss.qualcomm.com>


On Fri, 08 May 2026 19:39:58 +0800, Wenmeng Liu wrote:
> The src clocks are always-on parent clocks and do not need to be
> explicitly listed for CAMSS consumers. Drop cphy rx src clk.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

