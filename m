Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFEF40B6F9;
	Fri, 14 Aug 2026 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692344; cv=none; b=BNkg7KsFkZGZ0DTPfdIQtMHZzfE7s7UK8s4vLewWoPsOUwVR6SiI3wigSOZsrryBOS1vcUuFDXv+6zAVVqyebe5A6M065twXwoOotMWm8HNoGBQgxWWtY05IalHrXbwmHmr+6Hy1k6zaeCXvHsGlXf3A0ZQEhWO0fyRnAjYeoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692344; c=relaxed/simple;
	bh=tNYJ2eWxwWvEE362MGFf/Mrb4qNC3D5AtCyhgqAjtb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXsZ0J1g/SczUOQcCy7AnqHIkmwBFp98ftAntVtPRJC2kfnE3g3ZdtI805lradbJdNH/InBSMFPj6Tu+daSJonf52kMfbmDYxViW2C4KpR1BEsrL0HUAW1h2AodC1J4/hYl05p360EmSkAVix4BKPdjgETsKfmZFgv+aJhc/oJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhwsSZJx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhwsSZJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A561F000E9;
	Fri, 14 Aug 2026 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692342;
	bh=Hdl9rrAdXNWCw5d2q0AKYUQBWJKl/0rkGZZe7p4rSzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhwsSZJxnx9ISsXprAZbl28KzDibDsmlOm/c0FD19Ul7XyJwEvcxiVg66nsJkXkgP
	 dt1yleTWqE4S0AFtkCAM5ZCGMfDrGbMgOAsP9GegEB5BDmLwlhlZde301oztBkcdwg
	 lz5Bj84YX72rXnmqWrV2fl4XEnbZZuwPWtGmcAH9coJ0nnL/ejI91SwxRe1gl1bfgV
	 sTTZepONsp91rNQVJ0cJmF400Z+PlMSsQDYZ3nrr1/XEMPVkUxjeDC1bvCEuIJKUwx
	 e0KWBrCb+aDS+Q07IpwUeVsZ6/PrPYXq2INRHHqBaJt5wI7z7wPh6mriAg9isPurNu
	 kjb5XL1gx0RUQ==
Date: Fri, 14 Aug 2026 09:25:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and
 VF61 on Iris
Message-ID: <20260814-slick-brilliant-termite-72c754@quoll>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
 <20260813161101.2274327-4-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813161101.2274327-4-mehmet.fide@gmail.com>

On Thu, Aug 13, 2026 at 06:11:00PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Iris is a small off-the-shelf carrier board for the Colibri
> family. Extend the evaluation board entries with the compatibles for
> a Colibri VF50 or VF61 sitting on it.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

