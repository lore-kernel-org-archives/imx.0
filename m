Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2944154BEB;
	Wed, 28 Aug 2024 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825437; cv=none; b=V0fSLoJe56CQFwTX9L/JVg+Y7Uz//xKLOaWW9odQ6hfcwM2Rbhs/0HIPb7m/I+0Jx8l9ady6iduT3w8dOTMRvbPhHL+i1mYhX1qL8ebk1UlyxphDIJBP4ytXkiLne4xwA1SaL+wwwWu2EnHy2FfrVJq7sgz7pmnansIkFoXnlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825437; c=relaxed/simple;
	bh=xHoDsiwlXv3u19OOqWpN2NWa+iTlBrIoUnqU28yV7xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwiYR06e/LerSnJ73dsY5fKZ2aQQDW1GzqvRqJsDd7gcngsvK/7HNm9Rjlc3P5xJIooyGaruuwOR4xiaZn4XKHJuCM5ZIvtAetFzO7tTqgKZq3XTfwymHe/luaTB71WAX2WMmPKzRZg+8Ct0IAvkXB5t+vGuRQFHh4X8mJdi44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stgk8XDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stgk8XDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E723C32786;
	Wed, 28 Aug 2024 06:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724825436;
	bh=xHoDsiwlXv3u19OOqWpN2NWa+iTlBrIoUnqU28yV7xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stgk8XDC8B3SIoQUIRzqQivCuuwFpcl68pY9bPTe/SgOVpcTpfYB8jbe1pqLIvMDi
	 if5KzQoNibL3hdhyk3lYr84lfkLAtPNBm5KUfWUbKGOWcsl0FMdDQct/np61Qzh+VH
	 fZZzGk45HNm/2nBKCfh4gbBzOUOjTziqqV821Fcx/2j2mzS0WQjAYvX2EQvCY8RMXR
	 3AGvhXzqIMXHkeWp1rbUJU/WyN2oPe8IoDtjBEtkcJ/z+ZX8WK3Wq4JtBkASnYCt0o
	 nBKqq3hhWqynJVigmti6Uwe0nzYcQLd0jk0o0oFcQotYlTG5mbZrLHoKgBRgjMrRza
	 DnLLAmeJZt/Rw==
Date: Wed, 28 Aug 2024 08:10:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: misc: fsl,qoriq-mc: remove ref for
 msi-parent
Message-ID: <gpq556m4k4x5qfnnoxgazjvqc4pxcsexnlq6quakfezuup3w2k@waz2swdiwigd>
References: <20240827180028.1009902-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827180028.1009902-1-Frank.Li@nxp.com>

On Tue, Aug 27, 2024 at 02:00:25PM -0400, Frank Li wrote:
> msi-parent is standard property. Needn't ref to phandle.
> Fix below warning:
>   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: msi-parent:0: [16, 0] is too long
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> index 01b00d89a9921..8c64e2f7bc3c3 100644
> --- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
> @@ -113,7 +113,6 @@ properties:
>  
>    msi-parent:
>      deprecated: true
> -    $ref: /schemas/types.yaml#/definitions/phandle

Instead:
maxItems: 1

... or anything else with proper explanation in commit msg.

Best regards,
Krzysztof

