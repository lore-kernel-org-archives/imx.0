Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A363033DE;
	Mon,  9 Feb 2026 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681083; cv=none; b=A2nLNThYbgPTGTLcgHhP7+iq0uLXYv+2PyYZ2kCsiJFZjG2E8FjCnDkxhnJRNLXEiJUVDDpd/LQXnnTa0y0LyJVP02unVg+ZOE7mKI8Qx0CmwePrCFg2thEVrD4GBK7Lob6SW155zF+SOoy4VnC98ZSv8jU1MfBiUAKJOgIO3oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681083; c=relaxed/simple;
	bh=bsixGke1hf8jsC2lbY+jfdw5/Z3wiHssdbSANJKDnYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5rdCsjDeOz2U3evuBmdJevCpDwEUc1W+DL6YvB/nBo62ZTPMbk15bZdN2L1c+KovaOdnRIUYlc6C/8vxkKJlcZEyoGFk7b3/2oNIqYGRdNFyCssaxg8+XpVbMaMFJ71vN3E7MShpD3xQMgIs/PtZUZFa/5EhOvQ7hrS1VcUsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJA8qXSp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJA8qXSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B48C116C6;
	Mon,  9 Feb 2026 23:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770681083;
	bh=bsixGke1hf8jsC2lbY+jfdw5/Z3wiHssdbSANJKDnYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJA8qXSpN7cMYVlKDK673OujyjWo9NC6xvM//l4Ci6azdb0sCRdCHy4M3gdHQTFHL
	 keht2yaCDEM8iIPHW53Piyz6Haz1ObZVX9RPZsgg1jpnIn9Ij0/WNpozm5hfoyiWS0
	 uBquyTxoCjw1KRvTxUUnNsUZL3yjrOPHXzroayoZirl4v6cJbh2Iw5IkloEjLQNYDC
	 cFuqy61Yf1I+0uVols2edkPe6xLy7MUV9kuOGguLqmqNUN7jClvPHBzBysB58ZCNEc
	 +6tJfN0IjTUl2QCOVfMi2d6Cr893EzzjqIpND43cBnGl4cRuB7NSXUuUI39scPsRhz
	 SaW/4P8R1OBeQ==
Date: Mon, 9 Feb 2026 17:51:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: soc: imx: add fsl,aips and fsl,emi
 compatible strings
Message-ID: <177068108180.2136981.14673421457748646497.robh@kernel.org>
References: <20260201011913.2419626-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201011913.2419626-1-Frank.Li@nxp.com>


On Sat, 31 Jan 2026 20:19:13 -0500, Frank Li wrote:
> Add the fsl,aips and fsl,emi compatible strings for legacy i.MX3 SoCs
> (over 15 years old).
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/bus/fsl,spba-bus.yaml      | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Applied, thanks!

