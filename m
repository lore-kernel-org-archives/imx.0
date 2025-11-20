Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDB1DDA18;
	Thu, 20 Nov 2025 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658940; cv=none; b=bZg/aHpBK7pzXQeU0Bi7WmsPlD9gx1SgHAw31o9ROWoHEq+N3oupPMmf3eG3VKP8X1/4AHzO5t8NDU09vo8MFA2JFh8ruwj6PDATSw9d64XKvOE5BKl9AsReAZmzCr0NlWrGYpHIr/HJ1X+xTpBINSkaq3Y/caDbpon6wQDSHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658940; c=relaxed/simple;
	bh=kVEUku+jmD7IM9oXhsKRMaGSp3Jgrbk1cacSxT7VSrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwdYnRo6Tns3QegDhs26+GG7KIhrA+ww6VZ9upT3bQR44eIUXoCAmY3a0dkXI/dr2oK+lJxP48lxqwzZd1xAMRaxY29PEMKiJfjhUCU+Cu8ZD49Pvl2CZ6v36krik7ASG1AlCXR/5j+3v0ExiICzkwLaJQ32syg8dj/0rMXWqKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkQvZtHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkQvZtHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A19BC4CEF1;
	Thu, 20 Nov 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658939;
	bh=kVEUku+jmD7IM9oXhsKRMaGSp3Jgrbk1cacSxT7VSrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkQvZtHKcc7JsvaHTAdolGvLLHJRVpvSN2ohS8/bx54z2lf0hO/KqE9ebfnOUEqb8
	 MAyAKqDYWamfY2m5KJ5qpjzOKVNqdtXkl7KgjxAN01b/EvHFANtO0y8nj4xgw/4HbB
	 A3kyj9PS597tYkpLzDznRZN6ZqRRkkZ3AwZlmjK/KrKDgBHRlrWiPHWWYnSuEbmTVg
	 RrouGOs+LYPRDGqtTFYmkvMxVpSThqYq+AAWpwDaYwaQNx3wZu9jDBmNZpiMp+xapN
	 4foh92JIcaNu2Y8Cqq3equ+z07aAKUYiqIuU290cM1Fiib17tEg+6C3pyhlkakH+bN
	 CAXa0Qme8MxSA==
Date: Thu, 20 Nov 2025 11:15:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: imx@lists.linux.dev, Christian Eggers <ceggers@arri.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Document ifm
 electronic gmbh
Message-ID: <176365893738.1563102.3354522525163832099.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
 <20251118121513.88352-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-2-marex@nabladev.com>


On Tue, 18 Nov 2025 13:13:11 +0100, Marek Vasut wrote:
> ifm is a manufacturer of industrial sensors, control technology and
> automation solutions. Document their vendor prefix, which is already
> used for ifm,ac14xx and other powerpc devices.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

