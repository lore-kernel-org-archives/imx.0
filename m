Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F232727FE;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755637569; cv=none; b=lwZwyYX+zkms09e9QFSgMXFK7lXo92GB3N3b/Wu7eUxgSvVtPsRPaVs6bam/qsjoVy31+jUEYYLxf3IaEWTMm/tKzVSLf0Je7duTjUerTMvucf+3Y4nme2eURjkuZCwhJvNj0OfZP+0awDbsVwqqx4A+drmeyzOk/ia9FcnFLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755637569; c=relaxed/simple;
	bh=JFybjif0PA4bThPHFS5Y8/tz+/sdsAZ8BMw48NI4TXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW4onSCyWFtJ1vspb8aQKQlAzP2xBTeuD6P6FHzfcNh4rciveHRyWJO9UxvhLZol6alm0MnWj8RyywmoHxeId2lVwRZDswWIR5/SzeS+q8EFswIvFqmpDtZ7a2nFSh9dFpW/6TYlVNXAfgEXZm7mr3o+tAcrQsuDsNUa5MDrasc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlq1Np7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlq1Np7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAF0C4CEF1;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755637568;
	bh=JFybjif0PA4bThPHFS5Y8/tz+/sdsAZ8BMw48NI4TXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlq1Np7Ye4pkVq+DvkC30NXf0evlSCoY07mDs0nXTxFZKxgu6ll6ry6C2tIS89ziF
	 hGFXPz4yDKRzwO+rQz3NiKuhPMDqv7mwsXOIHst8SEqyAnIYhPw7M0wSBfpZOQEASV
	 U6NXQbcbfXWUJL+pLy+QrC2pUeaLGWJaJA1rmMTu+gJm9tSNVETspHVxmkY4yRRA2n
	 ICuq08mzgcUFeLzleLmusbO7kKv+eo7ryG+oKIuu/e+waow+7nLTG8LVrWEsgbKhY8
	 sjx5apfhxFzP8e0K1+BX/mWOuFmYQMLV6gqbwsBcabW6DFBHAKqf83iukI+at43ICI
	 jiVyp+B4fLPIg==
Date: Tue, 19 Aug 2025 16:06:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <175563756689.1312101.13704825031197649543.robh@kernel.org>
References: <20250819165317.3739366-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165317.3739366-1-Frank.Li@nxp.com>


On Tue, 19 Aug 2025 12:53:16 -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual calls it as system reset controller(SRC), but it is not
> module as reset controller, which used to reset individual device. SRC
> works as reboot controller, which reboots whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add missed 's' at description
> - remove duplicate / at path
> 
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 

Applied, thanks!

