Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB32314D35;
	Fri, 17 Jul 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313840; cv=none; b=r/jzoNKXS7It+Fi8zBnlI3hEQ2eThhyzrfACTauaDBfmNmrNaKYsNKoFtKwO9X/1nK/2fwCR9RBUUnziL6RSnVP4N1oSzhHezEWx0c6E+zXgGW142OFgbtfcA2nUJYl+D00O0fLOSC1pZt/29615lNnaggPi6wYKnM+8rgzNziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313840; c=relaxed/simple;
	bh=TGMFu4c3VcpXs7vuvyQyBW5BiVDYt7TNCx4cPiM4E6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVJR5rYkgeYrVRISZLMykicsBqwF547+JSAUHj/G3xW+Jp1w/W+7bOpk1MwvDfuKyIi7po/kE5CLzR7E2JFbRLD8m8U+SZrhB0liAOax4NTQoIX+uW7xc3T/FBNT4eyfxWXCm66GbAWPvXMdXiSrEYepziAporkH9XHcolIAqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbJV9CL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbJV9CL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B051F000E9;
	Fri, 17 Jul 2026 18:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784313839;
	bh=P1b9DeYrFDNJXSmhHkvkSVwxA9oSUUdj93hOLCrfhtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MbJV9CL39vRQMy2v/CN3jcpLY6clKVcc/kJEtuwRWFP5I6XZWtmd0F374u+m0u0LP
	 Z8aSfnF6sBxzl9bNULI/oiKqnkmBZVMxLhQjV72/+84dDvvUAw+1eHq/LN5OqR1EOV
	 EOnDSqwZytgo1rXC2lnnrfPKOralZwgqYCb3jVbR40l2nfZWFPpri/Oc6CQqMay2Im
	 Ub6NfcUc0ehh9cqiA2a41ayCfi0/61486Qik2KE+VcxaKX4RGW3rc+u+2Z9FTCNUT3
	 tQqJZDgP7wS0kMUizFUS8PhNnhNo5vLFmSq+Mc3Ox45WkgQuOmKIA6rqXB08WBP7gz
	 tx4OqaF8o+u8Q==
Date: Fri, 17 Jul 2026 13:43:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: Add fsl,eim-bus
Message-ID: <178431383816.1803857.6272472582726116965.robh@kernel.org>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
 <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>


On Wed, 08 Jul 2026 16:00:44 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add the fsl,eim-bus compatible strings for i.MX51 variants.
> 
> These compatibles are only intended for existing legacy chips (more than 15
> years old) and will not be used for new device trees.
> 
> Fix below CHECK_DTBS warnings
> arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /eim-cs1@f4000000: failed to match any schema with compatible: ['fsl,eim-bus', 'simple-bus']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

