Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162183EBF34;
	Sat, 14 Feb 2026 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771059535; cv=none; b=l6OAoN3ofOCTX5CKZvnzzkWY+kqQG7BMGHeFirGZ5x3PwXwV4z6p7WLaKCqZAUaxQbeybwX4WRpLDWZ5C43nu2/APB8VxA3qhyQqVKQtrYUVqmxBlSjUTcxXp+FBRfM133pOzx+qokxnVqhUBBUeBbhpJt25zTBOY+Ur/8WsdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771059535; c=relaxed/simple;
	bh=Ds4S7fd8XNfAj8PGgvL6EQDe51qiArtjbejqOxsgBnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGjuUAl7aUD2IXeQyIq9s7fSUobywfe9nG8oP3IfmZd093OXlnP3YEpQn5f9iPj4ASm6g9x+6du+QB5WUn/EI4nD3cVcJODgDO+FYdM5kWYambbucKhnqCMShWhrA+ORuGEp3ut1RHWIZ9gMyvnGL1L+S/DALV1q8iqeRSYFOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTc8JPmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTc8JPmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E5EC19421;
	Sat, 14 Feb 2026 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771059534;
	bh=Ds4S7fd8XNfAj8PGgvL6EQDe51qiArtjbejqOxsgBnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTc8JPmu/oefqWBmKO3nOF7OOeCunaM6D5Mw6/CnyvYbcN30/T7sWZ2g/jN4QpAOc
	 kmE4pjrg2ouD+AUzJanit5icjTPOhEQI2V67bUlH9KrhxrUKGJVLTIpPMFq/NkQ89t
	 557RG3XSGstnVCKmveAr1IBCL/D/PuI4AA6q1WNBvrNx2BQqU+ufO5JzKolmh6OE2Y
	 cduTPwO/dkHUBB2AeGdpk488besWV+NqgzdE/RWOdHmlpTlCf4BBwnvxNll19i8Isd
	 XESkMu9Prs43yehaBd+/ECOUHtLUJPg/kEZG+S3dNknB+6QvtdHAFqOvQQPlsihuKa
	 nKWgrN5BLzAHg==
Date: Sat, 14 Feb 2026 09:58:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: imx: Add fsl,aipi-bus and
 fsl,emi-bus
Message-ID: <20260214-liberal-ibis-of-spirit-b4b766@quoll>
References: <20260213171715.3465064-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213171715.3465064-1-Frank.Li@nxp.com>

On Fri, Feb 13, 2026 at 12:17:11PM -0500, Frank Li wrote:
> Add the fsl,aipi-bus and fsl,emi-bus compatible strings for i.MX1 and
> i.MX2 variants.
> 
> These compatibles are only intended for existing legacy chips (more than 15
> years old) and will not be used for new device trees.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2:
> - update commit message to show only for legacy chips
> ---
>  Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

