Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204E1822F8;
	Sun, 27 Oct 2024 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730065504; cv=none; b=nxaX2BYILZ25Gm2A1yfNpb/oCcnKQDDiplv6+ZYZ4WMC2dkhCjfx2pKbKHgBFB46nPAExKNKwOgDBvxyqEmAaicyvFDuuIfP8nz4Ik+nrgSTXXJEoE0iSRf5R8AZnqZqFK2RYMvQDkpVxi7QImMfjbp5yJ6kAUayf+MVMXhehak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730065504; c=relaxed/simple;
	bh=fpgRds/230eeLCWo6ivzWCh6GpfyCQNYz3OOzSF1NfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnY61C5G5tJW7Zf8OF7LGWi7/9XXarvHkSiu5cUgPTxKJbVDVWZ//rnCva8Car4VLiaOHkOpwNuz9TvWE1J2WbhPoi5tTZHpOF+F6LVq+poGX/sUvbnO2WezMIZlYDCCaDQMVp+fuWb6jvdlmrcA7QdOwbpa1MPzW3582ckFgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A35g/3Bj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A35g/3Bj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03F1C4CEC3;
	Sun, 27 Oct 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730065503;
	bh=fpgRds/230eeLCWo6ivzWCh6GpfyCQNYz3OOzSF1NfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A35g/3Bjfv2TPIBKnRQShXi6sCop4TH3vC58pAjfd4BVuVqlyOmkPndAb8lJCH2YK
	 VXkqsmvECFsjyjHQW8AUjjgfxNAYtXXhSPUmENfSujwaNiuHgHgwVc0Vl9cKhPn/Bs
	 ucDnkqTOnSI+BCdGTue1sZ9NfnqGceWvkaA7WKPfz6cfo0Ualcrk6+Zsack8csIfVO
	 F5bJnoRHUi5sRk7paGy+vAeXJLFNMW3FA3ATtEPFQlKjIZ60f1Y+C+lsPGnyc1T42Q
	 Ttr489FrBcyC9+TXl3kMjeqWckGBEJeC/e12e+CXOAKOvH8mRmAjvLofDH7yGjzTlb
	 q5qRB3f5hLmEA==
Date: Sun, 27 Oct 2024 16:45:02 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: soc: imx: fsl,imx-anatop: Add
 additional regulators
Message-ID: <20241027214502.GA121756-robh@kernel.org>
References: <20241025004159.1571782-1-festevam@gmail.com>
 <20241025004159.1571782-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-2-festevam@gmail.com>

On Thu, Oct 24, 2024 at 09:41:59PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.
> 
> i.MX6SX has the following anatop regulators: vddpcie.
> 
> Add them to the allowed patternProperties.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> index ae708a658d52..f40c157908aa 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> @@ -44,7 +44,7 @@ properties:
>      $ref: /schemas/thermal/imx-thermal.yaml
>  
>  patternProperties:
> -  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
> +  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(vddpu)|(vddsoc))$":

Perhaps to shorten a bit: (vdd(1p0d|1p2|core|pcie|pu|soc))

Either way,

Acked-by: Rob Herring (Arm) <robh@kernel.org>
